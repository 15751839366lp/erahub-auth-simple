package com.erahub.blog.domain.vo;

import lombok.Data;

import java.util.Date;

@Data
public class BlogArticleImageVo {

    private static final long serialVersionUID = 1L;

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
     * 格式类型
     */
    private String contentType;
}
