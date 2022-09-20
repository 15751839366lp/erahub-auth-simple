package com.erahub.common.sms.entity;

import lombok.Builder;
import lombok.Data;

/**
 * 上传返回体
 *
 * @author erahub
 */
@Data
@Builder
public class SmsResult {

    /**
     * 是否成功
     */
    private Boolean isSuccess;

    /**
     * 响应消息
     */
    private String message;

    /**
     * 实际响应体
     * <p>
     * 可自行转换为 SDK 对应的 SendSmsResponse
     */
    private String response;
}
