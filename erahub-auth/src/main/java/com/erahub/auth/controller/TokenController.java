package com.erahub.auth.controller;

import com.alibaba.nacos.api.common.Constants;
import com.erahub.auth.form.LoginBody;
import com.erahub.auth.form.RegisterBody;
import com.erahub.auth.form.SmsLoginBody;
import com.erahub.auth.service.impl.SysLoginServiceImpl;
import com.erahub.common.core.domain.R;
import lombok.RequiredArgsConstructor;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import javax.validation.constraints.NotBlank;
import java.util.HashMap;
import java.util.Map;

/**
 * token 控制
 *
 * @author erahub
 */
@Validated
@RequiredArgsConstructor
@RestController
public class TokenController {

    private final SysLoginServiceImpl sysLoginServiceImpl;

    /**
     * 登录方法
     */
    @PostMapping("login")
    public R<Map<String, Object>> login(@Validated @RequestBody LoginBody form) {
        // 用户登录
        String accessToken = sysLoginServiceImpl.login(form.getUsername(), form.getPassword());

        // 接口返回信息
        Map<String, Object> rspMap = new HashMap<String, Object>();
        rspMap.put("access_token", accessToken);
        return R.ok(rspMap);
    }

    /**
     * 短信登录
     *
     * @param smsLoginBody 登录信息
     * @return 结果
     */
    @PostMapping("/smsLogin")
    public R<Map<String, Object>> smsLogin(@Validated @RequestBody SmsLoginBody smsLoginBody) {
        Map<String, Object> ajax = new HashMap<>();
        // 生成令牌
        String token = sysLoginServiceImpl.smsLogin(smsLoginBody.getPhonenumber(), smsLoginBody.getSmsCode());
        ajax.put(Constants.TOKEN, token);
        return R.ok(ajax);
    }

    /**
     * 小程序登录(示例)
     *
     * @param xcxCode 小程序code
     * @return 结果
     */
    @PostMapping("/xcxLogin")
    public R<Map<String, Object>> xcxLogin(@NotBlank(message = "{xcx.code.not.blank}") String xcxCode) {
        Map<String, Object> ajax = new HashMap<>();
        // 生成令牌
        String token = sysLoginServiceImpl.xcxLogin(xcxCode);
        ajax.put(Constants.TOKEN, token);
        return R.ok(ajax);
    }

    /**
     * 登出方法
     */
    @DeleteMapping("logout")
    public R<Void> logout() {
        sysLoginServiceImpl.logout();
        return R.ok();
    }

    /**
     * 用户注册
     */
    @PostMapping("register")
    public R<Void> register(@RequestBody RegisterBody registerBody) {
        // 用户注册
        sysLoginServiceImpl.register(registerBody);
        return R.ok();
    }

}
