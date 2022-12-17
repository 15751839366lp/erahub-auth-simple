package com.erahub.blog.service;

import com.erahub.blog.domain.BlogArticle;
import com.erahub.blog.domain.vo.BlogArticleVo;
import com.erahub.blog.domain.bo.BlogArticleBo;
import com.erahub.common.mybatis.core.page.PageQuery;
import com.erahub.common.mybatis.core.page.TableDataInfo;

import java.util.Collection;
import java.util.List;

/**
 * 博客文章Service接口
 *
 * @author erahub
 * @date 2022-12-17
 */
public interface IBlogArticleService {

    /**
     * 查询博客文章
     */
    BlogArticleVo queryById(Long id);

    /**
     * 查询博客文章列表
     */
    TableDataInfo<BlogArticleVo> queryPageList(BlogArticleBo bo, PageQuery pageQuery);

    /**
     * 查询博客文章列表
     */
    List<BlogArticleVo> queryList(BlogArticleBo bo);

    /**
     * 修改博客文章
     */
    Boolean insertByBo(BlogArticleBo bo);

    /**
     * 修改博客文章
     */
    Boolean updateByBo(BlogArticleBo bo);

    /**
     * 校验并批量删除博客文章信息
     */
    Boolean deleteWithValidByIds(Collection<Long> ids, Boolean isValid);
}
