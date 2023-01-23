package com.erahub.base.basicservice.domain;

import com.baomidou.mybatisplus.annotation.*;
import com.erahub.common.core.annotation.Sensitive;
import com.erahub.common.core.enums.SensitiveStrategy;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import java.io.Serializable;
import java.util.Date;
import java.math.BigDecimal;

import com.erahub.common.core.web.domain.BaseEntity;

/**
 * 邮件账号对象 bs_mail_account
 *
 * @author erahub
 * @date 2023-01-23
 */
@Data
@EqualsAndHashCode(callSuper = true)
@TableName("bs_mail_account")
public class BSMailAccount extends BaseEntity {

    private static final long serialVersionUID=1L;

    /**
     * 邮件账号ID
     */
    @TableId(value = "mail_account_id")
    private Long mailAccountId;
    /**
     * 发送方
     */
    private String mailFrom;
    /**
     * 用户名
     */
    private String user;
    /**
     * 密码
     */
    private String pass;
    /**
     * 是否需要用户名密码验证（0是 1否）
     */
    private String auth;
    /**
     * 服务器域名
     */
    private String host;
    /**
     * 服务端口
     */
    private Integer port;
    /**
     * socket端口
     */
    private Integer socketFactoryPort;
    /**
     * STARTTLS安全连接（0是 1否）
     */
    private String starttlsEnable;
    /**
     * SSL安全连接（0是 1否）
     */
    private String sslEnable;
    /**
     * SMTP超时时长，单位毫秒，缺省值不超时
     */
    private Long timeout;
    /**
     * Socket连接超时值，单位毫秒，缺省值不超时
     */
    private Long connectionTimeout;
    /**
     * 备注
     */
    private String remark;

}
