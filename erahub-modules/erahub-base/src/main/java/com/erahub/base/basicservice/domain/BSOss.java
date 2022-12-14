package com.erahub.base.basicservice.domain;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.erahub.common.core.web.domain.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * OSS对象存储对象 bs_oss
 *
 * @author erahub
 */
@Data
@EqualsAndHashCode(callSuper = true)
@TableName("bs_oss")
public class BSOss extends BaseEntity {

    /**
     * 对象存储主键
     */
    @TableId(value = "oss_id")
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

}
