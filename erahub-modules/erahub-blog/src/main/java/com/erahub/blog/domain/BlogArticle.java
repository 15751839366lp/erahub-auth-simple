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
 * 博客文章对象 blog_article
 *
 * @author erahub
 * @date 2022-12-17
 */
@Data
@EqualsAndHashCode(callSuper = true)
@TableName("blog_article")
public class BlogArticle extends BaseEntity {

    private static final long serialVersionUID=1L;

    /**
     * 文章ID
     */
    @TableId(value = "blog_article_id")
    private Long blogArticleId;
    /**
     * 作者ID
     */
    private Long userId;
    /**
     * 文章分类ID
     */
    private Long categoryId;
    /**
     * 文章缩略图
     */
    private String articleCover;
    /**
     * 标题
     */
    private String articleTitle;
    /**
     * 内容
     */
    private String articleContent;
    /**
     * 是否置顶 0否 1是
     */
    private Integer isTop;
    /**
     * 是否推荐 0否 1是
     */
    private Integer isFeatured;
    /**
     * 是否删除  0否 1是
     */
    private Integer isDelete;
    /**
     * 状态值 1公开 2私密 3草稿
     */
    private Integer status;
    /**
     * 文章类型 1原创 2转载 3翻译
     */
    private Integer type;
    /**
     * 访问密码
     */
    private String password;
    /**
     * 原文链接
     */
    private String originalUrl;

}
