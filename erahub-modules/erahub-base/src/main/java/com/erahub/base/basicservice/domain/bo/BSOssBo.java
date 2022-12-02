package com.erahub.base.basicservice.domain.bo;

import com.erahub.common.core.web.domain.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * OSS对象存储分页查询对象 sys_oss
 *
 * @author erahub
 */
@Data
@EqualsAndHashCode(callSuper = true)
public class BSOssBo extends BaseEntity {

    /**
     * 对象存储主键
     */
    private Long ossId;
    /**
     * 文件名
     */
    private String fileName;
    /**
     * 原名
     */
    private String originalName;
    /**
     * 文件后缀名
     */
    private String fileSuffix;
    /**
     * URL地址
     */
    private String url;
    /**
     * 服务商
     */
    private String service;
    /**
     * 格式类型
     */
    private String contentType;
}
