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
 * 博客分类对象 blog_category
 *
 * @author erahub
 * @date 2022-12-20
 */
@Data
@EqualsAndHashCode(callSuper = true)
@TableName("blog_category")
public class BlogCategory extends BaseEntity {

    private static final long serialVersionUID=1L;

    /**
     * 分类ID
     */
    @TableId(value = "category_id")
    private Long categoryId;
    /**
     * 分类名
     */
    private String categoryName;
    /**
     * 分类状态（0正常 1停用）
     */
    private String status;
    /**
     * 备注
     */
    private String remark;

}
