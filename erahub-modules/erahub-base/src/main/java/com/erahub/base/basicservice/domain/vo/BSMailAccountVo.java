package com.erahub.base.basicservice.domain.vo;

import com.alibaba.excel.annotation.ExcelIgnoreUnannotated;
import com.alibaba.excel.annotation.ExcelProperty;
import com.erahub.common.core.annotation.Sensitive;
import com.erahub.common.core.enums.SensitiveStrategy;
import com.erahub.common.excel.annotation.ExcelDictFormat;
import com.erahub.common.excel.convert.ExcelDictConvert;
import lombok.Data;
import java.util.Date;



/**
 * 邮件账号视图对象
 *
 * @author erahub
 * @date 2023-01-23
 */
@Data
@ExcelIgnoreUnannotated
public class BSMailAccountVo {

    private static final long serialVersionUID = 1L;

    /**
     * 邮件账号ID
     */
    @ExcelProperty(value = "邮件账号ID")
    private Long mailAccountId;

    /**
     * 发送方
     */
    @ExcelProperty(value = "发送方")
    private String mailFrom;

    /**
     * 用户名
     */
    @ExcelProperty(value = "用户名")
    private String user;

    /**
     * 密码
     */
    @Sensitive(strategy = SensitiveStrategy.PASSWORD)
    @ExcelProperty(value = "密码")
    private String pass;

    /**
     * 是否需要用户名密码验证（0是 1否）
     */
    @ExcelProperty(value = "密码验证", converter = ExcelDictConvert.class)
    @ExcelDictFormat(readConverterExp = "0=是,1=否")
    private String auth;

    /**
     * 服务器域名
     */
    @ExcelProperty(value = "服务器域名")
    private String host;

    /**
     * 服务端口
     */
    @ExcelProperty(value = "服务端口")
    private Integer port;

    /**
     * socket端口
     */
    @ExcelProperty(value = "socket端口")
    private Integer socketFactoryPort;

    /**
     * STARTTLS安全连接（0是 1否）
     */
    @ExcelProperty(value = "STARTTLS安全连接", converter = ExcelDictConvert.class)
    @ExcelDictFormat(readConverterExp = "0=是,1=否")
    private String starttlsEnable;

    /**
     * SSL安全连接（0是 1否）
     */
    @ExcelProperty(value = "SSL安全连接", converter = ExcelDictConvert.class)
    @ExcelDictFormat(readConverterExp = "0=是,1=否")
    private String sslEnable;

    /**
     * SMTP超时时长，单位毫秒，缺省值不超时
     */
    @ExcelProperty(value = "SMTP超时")
    private Long timeout;

    /**
     * Socket连接超时值，单位毫秒，缺省值不超时
     */
    @ExcelProperty(value = "Socket连接超时")
    private Long connectionTimeout;

    /**
     * 备注
     */
    @ExcelProperty(value = "备注")
    private String remark;


}
