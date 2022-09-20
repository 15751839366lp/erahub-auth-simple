package com.erahub.common.core.exception;

import com.erahub.common.core.exception.user.UserException;

/**
 * 验证码错误异常类
 *
 * @author erahub
 */
public class CaptchaException extends UserException {
    private static final long serialVersionUID = 1L;

    public CaptchaException() {
        super("user.jcaptcha.error");
    }

    public CaptchaException(String msg) {
        super(msg);
    }
}
