package com.erahub.blog.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@TableName("blog_article_tag")
public class BlogArticleTag {

    /**
     * 文章ID
     */
    @TableId(type = IdType.INPUT)
    private Long articleId;

    /**
     * 标签ID
     */
    private Long tagId;
}
