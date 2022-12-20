package com.erahub.blog.domain;

import com.baomidou.mybatisplus.annotation.*;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import java.io.Serializable;
import java.util.Date;
import java.math.BigDecimal;

import com.erahub.common.core.web.domain.BaseEntity;

/**
 * 博客标签对象 blog_tag
 *
 * @author erahub
 * @date 2022-12-20
 */
@Data
@EqualsAndHashCode(callSuper = true)
@TableName("blog_tag")
public class BlogTag extends BaseEntity {

    private static final long serialVersionUID=1L;

    /**
     * 标签ID
     */
    @TableId(value = "tag_id")
    private Long tagId;
    /**
     * 标签名
     */
    private String tagName;
    /**
     * 标签状态（0正常 1停用）
     */
    private String status;
    /**
     * 备注
     */
    private String remark;

}
