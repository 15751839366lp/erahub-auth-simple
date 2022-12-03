package com.erahub.auth.service;

import com.erahub.auth.form.RegisterBody;

/**
 * 登录校验方法
 *
 * @author erahub
 */
public interface LoginService {
    String login(String username, String password);

    String smsLogin(String phonenumber, String smsCode);

    String xcxLogin(String xcxCode);

    void logout();

    void register(RegisterBody registerBody);
}
