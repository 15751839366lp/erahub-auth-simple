package com.erahub.common.sms.exception;

/**
 * Sms异常类
 *
 * @author erahub
 */
public class SmsException extends RuntimeException {

    private static final long serialVersionUID = 1L;

    public SmsException(String msg) {
        super(msg);
    }

}
