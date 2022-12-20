package com.erahub.blog.service.impl;

import cn.dev33.satoken.stp.StpUtil;
import cn.hutool.core.bean.BeanUtil;
import com.erahub.blog.domain.BlogCategory;
import com.erahub.common.core.utils.StringUtils;
import com.erahub.common.mybatis.core.page.PageQuery;
import com.erahub.common.mybatis.core.page.TableDataInfo;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.erahub.common.satoken.utils.LoginHelper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import com.erahub.blog.domain.bo.BlogArticleBo;
import com.erahub.blog.domain.vo.BlogArticleVo;
import com.erahub.blog.domain.BlogArticle;
import com.erahub.blog.mapper.BlogArticleMapper;
import com.erahub.blog.service.IBlogArticleService;

import java.util.List;
import java.util.Map;
import java.util.Collection;

/**
 * 博客文章Service业务层处理
 *
 * @author erahub
 * @date 2022-12-17
 */
@RequiredArgsConstructor
@Service
public class BlogArticleServiceImpl implements IBlogArticleService {

    private final BlogArticleMapper baseMapper;

    /**
     * 查询博客文章
     */
    @Override
    public BlogArticleVo queryById(Long id){
        return baseMapper.selectVoById(id);
    }

    /**
     * 查询博客文章列表
     */
    @Override
    public TableDataInfo<BlogArticleVo> queryPageList(BlogArticleBo bo, PageQuery pageQuery) {
        LambdaQueryWrapper<BlogArticle> lqw = buildQueryWrapper(bo);
        Page<BlogArticleVo> result = baseMapper.selectVoPage(pageQuery.build(), lqw);
        return TableDataInfo.build(result);
    }

    /**
     * 查询博客文章列表
     */
    @Override
    public List<BlogArticleVo> queryList(BlogArticleBo bo) {
        LambdaQueryWrapper<BlogArticle> lqw = buildQueryWrapper(bo);
        return baseMapper.selectVoList(lqw);
    }

    private LambdaQueryWrapper<BlogArticle> buildQueryWrapper(BlogArticleBo bo) {
        Map<String, Object> params = bo.getParams();
        LambdaQueryWrapper<BlogArticle> lqw = Wrappers.lambdaQuery();
        lqw.like(bo.getCreateBy() != null, BlogArticle::getCreateBy, bo.getCreateBy());
        lqw.like(bo.getCategoryId() != null, BlogArticle::getCategoryId, bo.getCategoryId());
        lqw.like(StringUtils.isNotBlank(bo.getArticleTitle()), BlogArticle::getArticleTitle, bo.getArticleTitle());
        lqw.eq(bo.getIsTop() != null, BlogArticle::getIsTop, bo.getIsTop());
        lqw.eq(bo.getIsFeatured() != null, BlogArticle::getIsFeatured, bo.getIsFeatured());
        lqw.eq(bo.getIsDelete() != null, BlogArticle::getIsDelete, bo.getIsDelete());
        lqw.eq(bo.getStatus() != null, BlogArticle::getStatus, bo.getStatus());
        lqw.eq(bo.getType() != null, BlogArticle::getType, bo.getType());
        lqw.between(params.get("beginTime") != null && params.get("endTime") != null,
            BlogArticle::getCreateTime, params.get("beginTime"), params.get("endTime"));
        return lqw;
    }

    /**
     * 新增博客文章
     */
    @Override
    public Boolean insertByBo(BlogArticleBo bo) {
        BlogArticle add = BeanUtil.toBean(bo, BlogArticle.class);
        validEntityBeforeSave(add);
        boolean flag = baseMapper.insert(add) > 0;
        if (flag) {
            bo.setArticleId(add.getArticleId());
        }
        return flag;
    }

    /**
     * 修改博客文章
     */
    @Override
    public Boolean updateByBo(BlogArticleBo bo) {
        BlogArticle update = BeanUtil.toBean(bo, BlogArticle.class);
        validEntityBeforeSave(update);
        return baseMapper.updateById(update) > 0;
    }

    /**
     * 保存前的数据校验
     */
    private void validEntityBeforeSave(BlogArticle entity){
        //TODO 做一些数据校验,如唯一约束
    }

    /**
     * 批量删除博客文章
     */
    @Override
    public Boolean deleteWithValidByIds(Collection<Long> ids, Boolean isValid) {
        if(isValid){
            //TODO 做一些业务上的校验,判断是否需要校验
        }
        return baseMapper.deleteBatchIds(ids) > 0;
    }
}
