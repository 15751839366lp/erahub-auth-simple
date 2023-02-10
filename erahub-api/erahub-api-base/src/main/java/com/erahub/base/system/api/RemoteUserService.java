package com.erahub.base.system.api;

import com.erahub.base.system.api.model.LoginUser;
import com.erahub.base.system.api.model.XcxLoginUser;
import com.erahub.common.core.exception.user.UserException;
import com.erahub.base.system.api.domain.SysUser;

/**
 * 用户服务
 *
 * @author erahub
 */
public interface RemoteUserService {

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
     * @param sysUser 用户信息
     * @return 结果
     */
    Boolean registerUserInfo(SysUser sysUser);

    /**
     * 通过userId查询用户账户
     *
     * @param userId 用户id
     * @return 结果
     */
    String selectUserNameById(Long userId);

}
