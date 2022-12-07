package com.erahub.blog.api;

import com.erahub.blog.api.model.LoginUser;
import com.erahub.blog.api.model.XcxLoginUser;
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
    LoginUser getUserInfo(String username) throws UserException;

    /**
     * 通过手机号查询用户信息
     *
     * @param phonenumber 手机号
     * @return 结果
     */
    LoginUser getUserInfoByPhonenumber(String phonenumber) throws UserException;

    /**
     * 通过openid查询用户信息
     *
     * @param openid openid
     * @return 结果
     */
    XcxLoginUser getUserInfoByOpenid(String openid) throws UserException;

    /**
     * 注册用户信息
     *
     * @param blogUser 用户信息
     * @return 结果
     */
    Boolean registerUserInfo(BlogUser blogUser);

}
