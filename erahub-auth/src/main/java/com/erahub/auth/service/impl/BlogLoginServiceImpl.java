package com.erahub.auth.service.impl;

import cn.dev33.satoken.exception.NotLoginException;
import cn.dev33.satoken.secure.BCrypt;
import cn.hutool.core.util.ObjectUtil;
import cn.hutool.http.useragent.UserAgent;
import cn.hutool.http.useragent.UserAgentUtil;
import com.erahub.auth.form.RegisterBody;
import com.erahub.auth.properties.UserPasswordProperties;
import com.erahub.auth.service.LoginService;
import com.erahub.auth.util.LoginBlogHelper;
import com.erahub.auth.util.StpBlogUserUtil;
import com.erahub.base.system.api.RemoteLogService;
import com.erahub.blog.api.RemoteBlogUserService;
import com.erahub.blog.api.domain.BlogUser;
import com.erahub.blog.api.model.LoginBlogUser;
import com.erahub.common.core.constant.CacheConstants;
import com.erahub.common.core.constant.Constants;
import com.erahub.common.core.enums.DeviceType;
import com.erahub.common.core.enums.LoginType;
import com.erahub.common.core.enums.UserType;
import com.erahub.common.core.exception.user.CaptchaExpireException;
import com.erahub.common.core.exception.user.UserException;
import com.erahub.common.core.utils.MessageUtils;
import com.erahub.common.core.utils.ServletUtils;
import com.erahub.common.core.utils.StringUtils;
import com.erahub.common.core.utils.ip.AddressUtils;
import com.erahub.common.redis.utils.RedisUtils;
import org.apache.dubbo.config.annotation.DubboReference;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.Duration;
import java.util.function.Supplier;

/**
 * 登录校验方法
 *
 * @author erahub
 */
@Service
public class BlogLoginServiceImpl implements LoginService {

    @DubboReference
    private RemoteLogService remoteLogService;

    @DubboReference
    private RemoteBlogUserService remoteBlogUserService;

    @Autowired
    private UserPasswordProperties userPasswordProperties;

    /**
     * 登录
     */
    @Override
    public String login(String username, String password) {
        LoginBlogUser userInfo = remoteBlogUserService.getBlogUserInfo(username);

        checkLogin(LoginType.PASSWORD, username, () -> !BCrypt.checkpw(password, userInfo.getPassword()));
        // 获取登录token
        LoginBlogHelper.loginByDevice(userInfo, DeviceType.PC);

        recordLogininfor(username, Constants.LOGIN_SUCCESS, MessageUtils.message("blogUser.login.success"));
        return StpBlogUserUtil.getTokenValue();
    }

    @Override
    public String smsLogin(String phonenumber, String smsCode) {
        return null;
    }

    @Override
    public String xcxLogin(String xcxCode) {
        return null;
    }

    /**
     * 退出登录
     */
    @Override
    public void logout() {
        try {
            LoginBlogUser loginBlogUser = LoginBlogHelper.getLoginUser();
            StpBlogUserUtil.logout();
            recordLogininfor(loginBlogUser.getUsername(), Constants.LOGOUT, MessageUtils.message("user.logout.success"));
        } catch (NotLoginException ignored) {
        }
    }

    /**
     * 注册
     */
    @Override
    public void register(RegisterBody registerBody) {
        String username = registerBody.getUsername();
        String password = registerBody.getPassword();
        // 校验用户类型是否存在
        String userType = UserType.getUserType(registerBody.getUserType()).getUserType();

        // 注册用户信息
        BlogUser blogUser = new BlogUser();
        blogUser.setUserName(username);
        blogUser.setNickName(username);
        blogUser.setPassword(BCrypt.hashpw(password));
        boolean regFlag = remoteBlogUserService.registerBlogUserInfo(blogUser);
        if (!regFlag) {
            throw new UserException("blogUser.register.error");
        }
        recordLogininfor(username, Constants.REGISTER, MessageUtils.message("blogUser.register.success"));
    }

    /**
     * 记录登录信息
     *
     * @param username 用户名
     * @param status   状态
     * @param message  消息内容
     * @return
     */
    public void recordLogininfor(String username, String status, String message) {
//        UserAgent userAgent = UserAgentUtil.parse(ServletUtils.getRequest().getHeader("User-Agent"));
//        SysLogininfor logininfor = new SysLogininfor();
//        logininfor.setUserName(username);
//        logininfor.setIpaddr(ServletUtils.getClientIP());
//        logininfor.setLoginLocation(AddressUtils.getRealAddressByIP(ServletUtils.getClientIP()));
//        logininfor.setBrowser(userAgent.getBrowser().getName());
//        logininfor.setOs(userAgent.getOs().getName());
//        logininfor.setMsg(message);
//        // 日志状态
//        if (StringUtils.equalsAny(status, Constants.LOGIN_SUCCESS, Constants.LOGOUT, Constants.REGISTER)) {
//            logininfor.setStatus(Constants.LOGIN_SUCCESS_STATUS);
//        } else if (Constants.LOGIN_FAIL.equals(status)) {
//            logininfor.setStatus(Constants.LOGIN_FAIL_STATUS);
//        }
//        remoteLogService.saveLogininfor(logininfor);
    }

    /**
     * 校验短信验证码
     */
    private boolean validateSmsCode(String phonenumber, String smsCode) {
        String code = RedisUtils.getCacheObject(CacheConstants.CAPTCHA_CODE_KEY + phonenumber);
        if (StringUtils.isBlank(code)) {
            recordLogininfor(phonenumber, Constants.LOGIN_FAIL, MessageUtils.message("blogUser.jcaptcha.expire"));
            throw new CaptchaExpireException();
        }
        return code.equals(smsCode);
    }

    /**
     * 登录校验
     */
    private void checkLogin(LoginType loginType, String username, Supplier<Boolean> supplier) {
        String errorKey = CacheConstants.PWD_ERR_CNT_KEY + username;
        String loginFail = Constants.LOGIN_FAIL;
        Integer maxRetryCount = userPasswordProperties.getMaxRetryCount();
        Integer lockTime = userPasswordProperties.getLockTime();

        // 获取用户登录错误次数(可自定义限制策略 例如: key + username + ip)
        Integer errorNumber = RedisUtils.getCacheObject(errorKey);
        // 锁定时间内登录 则踢出
        if (ObjectUtil.isNotNull(errorNumber) && errorNumber.equals(maxRetryCount)) {
            recordLogininfor(username, loginFail, MessageUtils.message(loginType.getRetryLimitExceed(), maxRetryCount, lockTime));
            throw new UserException(loginType.getRetryLimitExceed(), maxRetryCount, lockTime);
        }

        if (supplier.get()) {
            // 是否第一次
            errorNumber = ObjectUtil.isNull(errorNumber) ? 1 : errorNumber + 1;
            // 达到规定错误次数 则锁定登录
            if (errorNumber.equals(maxRetryCount)) {
                RedisUtils.setCacheObject(errorKey, errorNumber, Duration.ofMinutes(lockTime));
                recordLogininfor(username, loginFail, MessageUtils.message(loginType.getRetryLimitExceed(), maxRetryCount, lockTime));
                throw new UserException(loginType.getRetryLimitExceed(), maxRetryCount, lockTime);
            } else {
                // 未达到规定错误次数 则递增
                RedisUtils.setCacheObject(errorKey, errorNumber);
                recordLogininfor(username, loginFail, MessageUtils.message(loginType.getRetryLimitCount(), errorNumber));
                throw new UserException(loginType.getRetryLimitCount(), errorNumber);
            }
        }
        // 登录成功 清空错误次数
        RedisUtils.deleteObject(errorKey);
    }
}
