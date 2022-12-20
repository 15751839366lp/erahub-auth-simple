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
import com.erahub.blog.domain.bo.BlogCategoryBo;
import com.erahub.blog.domain.vo.BlogCategoryVo;
import com.erahub.blog.domain.BlogCategory;
import com.erahub.blog.mapper.BlogCategoryMapper;
import com.erahub.blog.service.IBlogCategoryService;

import java.util.List;
import java.util.Map;
import java.util.Collection;

/**
 * 博客分类Service业务层处理
 *
 * @author erahub
 * @date 2022-12-20
 */
@RequiredArgsConstructor
@Service
public class BlogCategoryServiceImpl implements IBlogCategoryService {

    private final BlogCategoryMapper baseMapper;

    /**
     * 查询博客分类
     */
    @Override
    public BlogCategoryVo queryById(Long categoryId){
        return baseMapper.selectVoById(categoryId);
    }

    /**
     * 查询博客分类列表
     */
    @Override
    public TableDataInfo<BlogCategoryVo> queryPageList(BlogCategoryBo bo, PageQuery pageQuery) {
        LambdaQueryWrapper<BlogCategory> lqw = buildQueryWrapper(bo);
        Page<BlogCategoryVo> result = baseMapper.selectVoPage(pageQuery.build(), lqw);
        return TableDataInfo.build(result);
    }

    /**
     * 查询博客分类列表
     */
    @Override
    public List<BlogCategoryVo> queryList(BlogCategoryBo bo) {
        LambdaQueryWrapper<BlogCategory> lqw = buildQueryWrapper(bo);
        return baseMapper.selectVoList(lqw);
    }

    private LambdaQueryWrapper<BlogCategory> buildQueryWrapper(BlogCategoryBo bo) {
        Map<String, Object> params = bo.getParams();
        LambdaQueryWrapper<BlogCategory> lqw = Wrappers.lambdaQuery();
        lqw.eq(bo.getCategoryId() != null, BlogCategory::getCategoryId, bo.getCategoryId());
        lqw.like(StringUtils.isNotBlank(bo.getCategoryName()), BlogCategory::getCategoryName, bo.getCategoryName());
        lqw.eq(StringUtils.isNotBlank(bo.getStatus()), BlogCategory::getStatus, bo.getStatus());
        lqw.between(params.get("beginTime") != null && params.get("endTime") != null,
            BlogCategory::getCreateTime, params.get("beginTime"), params.get("endTime"));
        return lqw;
    }

    /**
     * 新增博客分类
     */
    @Override
    public Boolean insertByBo(BlogCategoryBo bo) {
        BlogCategory add = BeanUtil.toBean(bo, BlogCategory.class);
        validEntityBeforeSave(add);
        boolean flag = baseMapper.insert(add) > 0;
        if (flag) {
            bo.setCategoryId(add.getCategoryId());
        }
        return flag;
    }

    /**
     * 修改博客分类
     */
    @Override
    public Boolean updateByBo(BlogCategoryBo bo) {
        BlogCategory update = BeanUtil.toBean(bo, BlogCategory.class);
        validEntityBeforeSave(update);
        return baseMapper.updateById(update) > 0;
    }

    /**
     * 保存前的数据校验
     */
    private void validEntityBeforeSave(BlogCategory entity){
        //TODO 做一些数据校验,如唯一约束
    }

    /**
     * 批量删除博客分类
     */
    @Override
    public Boolean deleteWithValidByIds(Collection<Long> ids, Boolean isValid) {
        if(isValid){
            //TODO 做一些业务上的校验,判断是否需要校验
        }
        return baseMapper.deleteBatchIds(ids) > 0;
    }
}
