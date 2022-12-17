package com.erahub.auth.util;

import cn.dev33.satoken.context.SaHolder;
import cn.hutool.core.util.ArrayUtil;
import cn.hutool.core.util.ObjectUtil;
import com.erahub.blog.api.domain.BlogUser;
import com.erahub.blog.api.model.LoginBlogUser;
import com.erahub.common.core.constant.UserConstants;
import com.erahub.common.core.enums.DeviceType;
import com.erahub.common.core.enums.UserType;
import com.erahub.common.core.exception.UtilException;
import com.erahub.common.core.utils.StringUtils;
import lombok.AccessLevel;
import lombok.NoArgsConstructor;

/**
 * 登录鉴权助手
 *
 * user_type 为 用户类型 同一个用户表 可以有多种用户类型 例如 pc,app
 * deivce 为 设备类型 同一个用户类型 可以有 多种设备类型 例如 web,ios
 * 可以组成 用户类型与设备类型多对多的 权限灵活控制
 *
 * 多用户体系 针对 多种用户类型 但权限控制不一致
 * 可以组成 多用户类型表与多设备类型 分别控制权限
 *
 * @author erahub
 */
@NoArgsConstructor(access = AccessLevel.PRIVATE)
public class LoginBlogHelper {

    public static final String JOIN_CODE = ":";
    public static final String LOGIN_USER_KEY = "loginBlogUser";

    /**
     * 登录系统
     *
     * @param loginBlogUser 登录用户信息
     */
    public static void login(LoginBlogUser loginBlogUser) {
        SaHolder.getStorage().set(LOGIN_USER_KEY, loginBlogUser);
        StpBlogUserUtil.login(loginBlogUser.getUserId());
        setLoginUser(loginBlogUser);
    }

    /**
     * 登录系统 基于 设备类型
     * 针对相同用户体系不同设备
     *
     * @param loginBlogUser 登录用户信息
     */
    public static void loginByDevice(LoginBlogUser loginBlogUser, DeviceType deviceType) {
        SaHolder.getStorage().set(LOGIN_USER_KEY, loginBlogUser);
        StpBlogUserUtil.login(loginBlogUser.getUserId(), deviceType.getDevice());
        setLoginUser(loginBlogUser);
    }

    /**
     * 设置用户数据(多级缓存)
     */
    public static void setLoginUser(LoginBlogUser loginBlogUser) {
        StpBlogUserUtil.getTokenSession().set(LOGIN_USER_KEY, loginBlogUser);
    }

    /**
     * 获取用户(多级缓存)
     */
    public static LoginBlogUser getLoginUser() {
        LoginBlogUser loginBlogUser = (LoginBlogUser) SaHolder.getStorage().get(LOGIN_USER_KEY);
        if (loginBlogUser != null) {
            return loginBlogUser;
        }
        loginBlogUser = (LoginBlogUser) StpBlogUserUtil.getTokenSession().get(LOGIN_USER_KEY);
        SaHolder.getStorage().set(LOGIN_USER_KEY, loginBlogUser);
        return loginBlogUser;
    }

    /**
     * 获取用户id
     */
    public static Long getUserId() {
        LoginBlogUser loginBlogUser = getLoginUser();
        if (ObjectUtil.isNull(loginBlogUser)) {
            String loginId = StpBlogUserUtil.getLoginIdAsString();
            String[] strs = StringUtils.split(loginId, JOIN_CODE);
            if (!ArrayUtil.containsAny(strs, UserType.values())) {
                throw new UtilException("登录用户: LoginId异常 => " + loginId);
            }
            // 用户id在总是在最后
            return Long.parseLong(strs[strs.length - 1]);
        }
        return loginBlogUser.getUserId();
    }

    /**
     * 获取用户账户
     */
    public static String getUsername() {
        return getLoginUser().getUsername();
    }

}
