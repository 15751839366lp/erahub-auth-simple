package com.erahub.blog.dubbo;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.util.ObjectUtil;
import com.erahub.base.system.api.RemoteUserService;
import com.erahub.base.system.api.domain.SysUser;
import com.erahub.base.system.api.model.LoginUser;
import com.erahub.base.system.api.model.RoleDTO;
import com.erahub.base.system.api.model.XcxLoginUser;

import com.erahub.blog.api.RemoteBlogUserService;
import com.erahub.blog.api.domain.BlogUser;
import com.erahub.blog.api.model.LoginBlogUser;
import com.erahub.common.core.constant.UserConstants;
import com.erahub.common.core.enums.UserStatus;
import com.erahub.common.core.exception.ServiceException;
import com.erahub.common.core.exception.user.UserException;
import lombok.RequiredArgsConstructor;
import org.apache.dubbo.config.annotation.DubboService;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 *
 *
 * @author erahub
 */
@RequiredArgsConstructor
@Service
@DubboService
public class RemoteBlogUserServiceImpl implements RemoteBlogUserService {
//
//    private final ISysUserService userService;
//    private final ISysPermissionService permissionService;
//    private final ISysConfigService configService;

    @Override
    public LoginBlogUser getBlogUserInfo(String username) throws UserException {
//        BlogUser blogUser = userService.selectUserByUserName(username);
        BlogUser blogUser = new BlogUser();
        if (ObjectUtil.isNull(blogUser)) {
            throw new UserException("user.not.exists", username);
        }
        if (UserStatus.DELETED.getCode().equals(blogUser.getDelFlag())) {
            throw new UserException("user.password.delete", username);
        }
        if (UserStatus.DISABLE.getCode().equals(blogUser.getStatus())) {
            throw new UserException("user.blocked", username);
        }
        // 此处可根据登录用户的数据不同 自行创建 loginUser
        return buildBlogUser(blogUser);
    }

    @Override
    public LoginBlogUser getBlogUserInfoByPhonenumber(String phonenumber) throws UserException {
//        BlogUser blogUser = userService.selectUserByPhonenumber(phonenumber);
        BlogUser blogUser = new BlogUser();
        if (ObjectUtil.isNull(blogUser)) {
            throw new UserException("user.not.exists", phonenumber);
        }
        if (UserStatus.DELETED.getCode().equals(blogUser.getDelFlag())) {
            throw new UserException("user.password.delete", phonenumber);
        }
        if (UserStatus.DISABLE.getCode().equals(blogUser.getStatus())) {
            throw new UserException("user.blocked", phonenumber);
        }
        // 此处可根据登录用户的数据不同 自行创建 loginUser
        return buildBlogUser(blogUser);
    }

    @Override
    public Boolean registerBlogUserInfo(BlogUser blogUser) {
//        String username = blogUser.getUserName();
//        if (!("true".equals(configService.selectConfigByKey("sys.account.registerUser")))) {
//            throw new ServiceException("当前系统没有开启注册功能");
//        }
//        if (UserConstants.NOT_UNIQUE.equals(userService.checkUserNameUnique(blogUser))) {
//            throw new UserException("user.register.save.error", username);
//        }
//        return userService.registerUser(blogUser);
        return false;
    }

    /**
     * 构建登录用户
     */
    private LoginBlogUser buildBlogUser(BlogUser user) {
        LoginBlogUser loginBlogUser = new LoginBlogUser();
        loginBlogUser.setUserId(user.getUserId());
        loginBlogUser.setUsername(user.getUserName());
        loginBlogUser.setPassword(user.getPassword());
        return loginBlogUser;
    }

}
