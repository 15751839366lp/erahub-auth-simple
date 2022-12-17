package com.erahub.blog.domain.bo;

import com.erahub.common.core.validate.AddGroup;
import com.erahub.common.core.validate.EditGroup;
import lombok.Data;
import lombok.EqualsAndHashCode;
import javax.validation.constraints.*;

import java.util.Date;

import com.erahub.common.core.web.domain.BaseEntity;

/**
 * 博客文章业务对象
 *
 * @author erahub
 * @date 2022-12-17
 */

@Data
@EqualsAndHashCode(callSuper = true)
public class BlogArticleBo extends BaseEntity {

    /**
     * 文章ID
     */
    @NotNull(message = "文章ID不能为空", groups = { EditGroup.class })
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
    @NotBlank(message = "标题不能为空", groups = { AddGroup.class, EditGroup.class })
    private String articleTitle;

    /**
     * 内容
     */
    private String articleContent;

    /**
     * 是否置顶 0否 1是
     */
    @NotNull(message = "是否置顶 0否 1是不能为空", groups = { AddGroup.class, EditGroup.class })
    private Integer isTop;

    /**
     * 是否推荐 0否 1是
     */
    @NotNull(message = "是否推荐 0否 1是不能为空", groups = { AddGroup.class, EditGroup.class })
    private Integer isFeatured;

    /**
     * 是否删除  0否 1是
     */
    @NotNull(message = "是否删除  0否 1是不能为空", groups = { AddGroup.class, EditGroup.class })
    private Integer isDelete;

    /**
     * 状态值 1公开 2私密 3草稿
     */
    @NotNull(message = "状态值 1公开 2私密 3草稿不能为空", groups = { AddGroup.class, EditGroup.class })
    private Integer status;

    /**
     * 文章类型 1原创 2转载 3翻译
     */
    @NotNull(message = "文章类型 1原创 2转载 3翻译不能为空", groups = { AddGroup.class, EditGroup.class })
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
