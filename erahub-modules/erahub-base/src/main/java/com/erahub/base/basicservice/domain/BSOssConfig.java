package com.erahub.base.basicservice.domain;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.erahub.common.core.web.domain.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 对象存储配置对象 bs_oss_config
 *
 * @author erahub
 */
@Data
@EqualsAndHashCode(callSuper = true)
@TableName("bs_oss_config")
public class BSOssConfig extends BaseEntity {

    /**
     * 主建
     */
    @TableId(value = "oss_config_id")
    private Long ossConfigId;

    /**
     * 配置key
     */
    private String configKey;

    /**
     * accessKey
     */
    private String accessKey;

    /**
     * 秘钥
     */
    private String secretKey;

    /**
     * 桶名称
     */
    private String bucketName;

    /**
     * 前缀
     */
    private String prefix;

    /**
     * 访问站点
     */
    private String endpoint;

    /**
     * 自定义域名
     */
    private String domain;


    /**
     * 是否https（0否 1是）
     */
    private String isHttps;

    /**
     * 域
     */
    private String region;

    /**
     * 状态(0正常 1停用)
     */
    private String status;

    /**
     * 扩展字段
     */
    private String ext1;

    /**
     * 备注
     */
    private String remark;

    /**
     * 桶权限类型(0private 1public 2custom)
     */
    private String accessPolicy;
}
