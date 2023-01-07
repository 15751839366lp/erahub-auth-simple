package com.erahub.blog.domain.bo;

import lombok.Data;

@Data
public class BlogArticleImageBo {

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
