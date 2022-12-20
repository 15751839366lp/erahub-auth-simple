package com.erahub.blog.service;

import com.erahub.blog.domain.BlogCategory;
import com.erahub.blog.domain.vo.BlogCategoryVo;
import com.erahub.blog.domain.bo.BlogCategoryBo;
import com.erahub.common.mybatis.core.page.PageQuery;
import com.erahub.common.mybatis.core.page.TableDataInfo;

import java.util.Collection;
import java.util.List;

/**
 * 博客分类Service接口
 *
 * @author erahub
 * @date 2022-12-20
 */
public interface IBlogCategoryService {

    /**
     * 查询博客分类
     */
    BlogCategoryVo queryById(Long categoryId);

    /**
     * 查询博客分类列表
     */
    TableDataInfo<BlogCategoryVo> queryPageList(BlogCategoryBo bo, PageQuery pageQuery);

    /**
     * 查询博客分类列表
     */
    List<BlogCategoryVo> queryList(BlogCategoryBo bo);

    /**
     * 修改博客分类
     */
    Boolean insertByBo(BlogCategoryBo bo);

    /**
     * 修改博客分类
     */
    Boolean updateByBo(BlogCategoryBo bo);

    /**
     * 校验并批量删除博客分类信息
     */
    Boolean deleteWithValidByIds(Collection<Long> ids, Boolean isValid);
}
