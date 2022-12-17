package com.erahub.blog.api;

import com.erahub.blog.api.model.LoginBlogUser;
import com.erahub.common.core.exception.user.UserException;
import com.erahub.blog.api.domain.BlogUser;

/**
 * 用户服务
 *
 * @author erahub
 */
public interface RemoteBlogUserService {

    /**
     * 通过用户名查询用户信息
     *
     * @param username 用户名
     * @return 结果
     */
    LoginBlogUser getBlogUserInfo(String username) throws UserException;

    /**
     * 通过手机号查询用户信息
     *
     * @param phonenumber 手机号
     * @return 结果
     */
    LoginBlogUser getBlogUserInfoByPhonenumber(String phonenumber) throws UserException;

    /**
     * 注册用户信息
     *
     * @param blogUser 用户信息
     * @return 结果
     */
    Boolean registerBlogUserInfo(BlogUser blogUser);

}
