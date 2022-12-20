package com.erahub.blog.service;

import com.erahub.blog.domain.BlogTag;
import com.erahub.blog.domain.vo.BlogTagVo;
import com.erahub.blog.domain.bo.BlogTagBo;
import com.erahub.common.mybatis.core.page.PageQuery;
import com.erahub.common.mybatis.core.page.TableDataInfo;

import java.util.Collection;
import java.util.List;

/**
 * 博客标签Service接口
 *
 * @author erahub
 * @date 2022-12-20
 */
public interface IBlogTagService {

    /**
     * 查询博客标签
     */
    BlogTagVo queryById(Long tagId);

    /**
     * 查询博客标签列表
     */
    TableDataInfo<BlogTagVo> queryPageList(BlogTagBo bo, PageQuery pageQuery);

    /**
     * 查询博客标签列表
     */
    List<BlogTagVo> queryList(BlogTagBo bo);

    /**
     * 修改博客标签
     */
    Boolean insertByBo(BlogTagBo bo);

    /**
     * 修改博客标签
     */
    Boolean updateByBo(BlogTagBo bo);

    /**
     * 校验并批量删除博客标签信息
     */
    Boolean deleteWithValidByIds(Collection<Long> ids, Boolean isValid);
}
