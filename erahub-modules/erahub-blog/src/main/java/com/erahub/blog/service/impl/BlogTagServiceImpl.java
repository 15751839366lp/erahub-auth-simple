package com.erahub.blog.service.impl;

import cn.hutool.core.bean.BeanUtil;
import com.erahub.common.core.utils.StringUtils;
import com.erahub.common.mybatis.core.page.PageQuery;
import com.erahub.common.mybatis.core.page.TableDataInfo;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import com.erahub.blog.domain.bo.BlogTagBo;
import com.erahub.blog.domain.vo.BlogTagVo;
import com.erahub.blog.domain.BlogTag;
import com.erahub.blog.mapper.BlogTagMapper;
import com.erahub.blog.service.IBlogTagService;

import java.util.List;
import java.util.Map;
import java.util.Collection;

/**
 * 博客标签Service业务层处理
 *
 * @author erahub
 * @date 2022-12-20
 */
@RequiredArgsConstructor
@Service
public class BlogTagServiceImpl implements IBlogTagService {

    private final BlogTagMapper baseMapper;

    /**
     * 查询博客标签
     */
    @Override
    public BlogTagVo queryById(Long tagId){
        return baseMapper.selectVoById(tagId);
    }

    /**
     * 查询博客标签列表
     */
    @Override
    public TableDataInfo<BlogTagVo> queryPageList(BlogTagBo bo, PageQuery pageQuery) {
        LambdaQueryWrapper<BlogTag> lqw = buildQueryWrapper(bo);
        Page<BlogTagVo> result = baseMapper.selectVoPage(pageQuery.build(), lqw);
        return TableDataInfo.build(result);
    }

    /**
     * 查询博客标签列表
     */
    @Override
    public List<BlogTagVo> queryList(BlogTagBo bo) {
        LambdaQueryWrapper<BlogTag> lqw = buildQueryWrapper(bo);
        return baseMapper.selectVoList(lqw);
    }

    private LambdaQueryWrapper<BlogTag> buildQueryWrapper(BlogTagBo bo) {
        Map<String, Object> params = bo.getParams();
        LambdaQueryWrapper<BlogTag> lqw = Wrappers.lambdaQuery();
        lqw.eq(bo.getTagId() != null, BlogTag::getTagId, bo.getTagId());
        lqw.like(StringUtils.isNotBlank(bo.getTagName()), BlogTag::getTagName, bo.getTagName());
        lqw.eq(StringUtils.isNotBlank(bo.getStatus()), BlogTag::getStatus, bo.getStatus());
        lqw.between(params.get("beginCreateTime") != null && params.get("endCreateTime") != null,
            BlogTag::getCreateTime ,params.get("beginCreateTime"), params.get("endCreateTime"));
        return lqw;
    }

    /**
     * 新增博客标签
     */
    @Override
    public Boolean insertByBo(BlogTagBo bo) {
        BlogTag add = BeanUtil.toBean(bo, BlogTag.class);
        validEntityBeforeSave(add);
        boolean flag = baseMapper.insert(add) > 0;
        if (flag) {
            bo.setTagId(add.getTagId());
        }
        return flag;
    }

    /**
     * 修改博客标签
     */
    @Override
    public Boolean updateByBo(BlogTagBo bo) {
        BlogTag update = BeanUtil.toBean(bo, BlogTag.class);
        validEntityBeforeSave(update);
        return baseMapper.updateById(update) > 0;
    }

    /**
     * 保存前的数据校验
     */
    private void validEntityBeforeSave(BlogTag entity){
        //TODO 做一些数据校验,如唯一约束
    }

    /**
     * 批量删除博客标签
     */
    @Override
    public Boolean deleteWithValidByIds(Collection<Long> ids, Boolean isValid) {
        if(isValid){
            //TODO 做一些业务上的校验,判断是否需要校验
        }
        return baseMapper.deleteBatchIds(ids) > 0;
    }
}
