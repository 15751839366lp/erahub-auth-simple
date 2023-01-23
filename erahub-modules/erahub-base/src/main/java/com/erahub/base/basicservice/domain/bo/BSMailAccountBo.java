package com.erahub.base.basicservice.domain.bo;

import com.erahub.common.core.validate.AddGroup;
import com.erahub.common.core.validate.EditGroup;
import lombok.Data;
import lombok.EqualsAndHashCode;
import javax.validation.constraints.*;

import java.util.Date;

import com.erahub.common.core.web.domain.BaseEntity;

/**
 * 邮件账号业务对象
 *
 * @author erahub
 * @date 2023-01-23
 */

@Data
@EqualsAndHashCode(callSuper = true)
public class BSMailAccountBo extends BaseEntity {

    /**
     * 邮件账号ID
     */
    private Long mailAccountId;

    /**
     * 发送方
     */
    @NotBlank(message = "发送方不能为空", groups = { AddGroup.class, EditGroup.class })
    private String mailFrom;

    /**
     * 用户名
     */
    @NotBlank(message = "用户名不能为空", groups = { AddGroup.class, EditGroup.class })
    private String user;

    /**
     * 密码
     */
    @NotBlank(message = "密码不能为空", groups = { AddGroup.class, EditGroup.class })
    private String pass;

    /**
     * 是否需要用户名密码验证（0是 1否）
     */
    @NotNull(message = "密码验证不能为空", groups = { AddGroup.class, EditGroup.class })
    private String auth;

    /**
     * 服务器域名
     */
    @NotBlank(message = "服务器域名不能为空", groups = { AddGroup.class, EditGroup.class })
    private String host;

    /**
     * 服务端口
     */
    @NotNull(message = "服务端口不能为空", groups = { AddGroup.class, EditGroup.class })
    private Integer port;

    /**
     * socket端口
     */
    @NotNull(message = "socket端口不能为空", groups = { AddGroup.class, EditGroup.class })
    private Integer socketFactoryPort;

    /**
     * STARTTLS安全连接（0是 1否）
     */
    @NotNull(message = "STARTTLS安全连接不能为空", groups = { AddGroup.class, EditGroup.class })
    private String starttlsEnable;

    /**
     * SSL安全连接（0是 1否）
     */
    @NotNull(message = "SSL安全连接不能为空", groups = { AddGroup.class, EditGroup.class })
    private String sslEnable;

    /**
     * SMTP超时时长，单位毫秒，缺省值不超时
     */
    @NotNull(message = "SMTP超时不能为空", groups = { AddGroup.class, EditGroup.class })
    private Long timeout;

    /**
     * Socket连接超时值，单位毫秒，缺省值不超时
     */
    @NotNull(message = "Socket超时不能为空", groups = { AddGroup.class, EditGroup.class })
    private Long connectionTimeout;

    /**
     * 备注
     */
    private String remark;


}
