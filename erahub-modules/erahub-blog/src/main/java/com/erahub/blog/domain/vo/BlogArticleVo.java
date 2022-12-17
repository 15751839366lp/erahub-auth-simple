package com.erahub.blog.domain.vo;

import com.alibaba.excel.annotation.ExcelIgnoreUnannotated;
import com.alibaba.excel.annotation.ExcelProperty;
import com.erahub.common.excel.annotation.ExcelDictFormat;
import com.erahub.common.excel.convert.ExcelDictConvert;
import lombok.Data;
import java.util.Date;



/**
 * 博客文章视图对象
 *
 * @author erahub
 * @date 2022-12-17
 */
@Data
@ExcelIgnoreUnannotated
public class BlogArticleVo {

    private static final long serialVersionUID = 1L;

    /**
     * 文章ID
     */
    @ExcelProperty(value = "文章ID")
    private Long blogArticleId;

    /**
     * 文章分类ID
     */
    @ExcelProperty(value = "文章分类ID")
    private Long categoryId;

    /**
     * 文章缩略图
     */
    @ExcelProperty(value = "文章缩略图")
    private String articleCover;

    /**
     * 标题
     */
    @ExcelProperty(value = "标题")
    private String articleTitle;

    /**
     * 内容
     */
    @ExcelProperty(value = "内容")
    private String articleContent;

    /**
     * 是否置顶 0否 1是
     */
    @ExcelProperty(value = "是否置顶 0否 1是", converter = ExcelDictConvert.class)
    @ExcelDictFormat(dictType = "blog_article_top")
    private Integer isTop;

    /**
     * 是否推荐 0否 1是
     */
    @ExcelProperty(value = "是否推荐 0否 1是", converter = ExcelDictConvert.class)
    @ExcelDictFormat(dictType = "blog_article_featured")
    private Integer isFeatured;

    /**
     * 是否删除  0否 1是
     */
    @ExcelProperty(value = "是否删除  0否 1是")
    private Integer isDelete;

    /**
     * 状态值 1公开 2私密 3草稿
     */
    @ExcelProperty(value = "状态值 1公开 2私密 3草稿", converter = ExcelDictConvert.class)
    @ExcelDictFormat(dictType = "blog_article_status")
    private Integer status;

    /**
     * 文章类型 1原创 2转载 3翻译
     */
    @ExcelProperty(value = "文章类型 1原创 2转载 3翻译", converter = ExcelDictConvert.class)
    @ExcelDictFormat(dictType = "blog_article_type")
    private Integer type;

    /**
     * 访问密码
     */
    @ExcelProperty(value = "访问密码")
    private String password;

    /**
     * 原文链接
     */
    @ExcelProperty(value = "原文链接")
    private String originalUrl;

    /**
     * 创建者
     */
    @ExcelProperty(value = "创建者")
    private String createBy;

    /**
     * 发表时间
     */
    @ExcelProperty(value = "发表时间")
    private Date createTime;

    /**
     * 更新者
     */
    @ExcelProperty(value = "更新者")
    private String updateBy;

    /**
     * 更新时间
     */
    @ExcelProperty(value = "更新时间")
    private Date updateTime;


}
