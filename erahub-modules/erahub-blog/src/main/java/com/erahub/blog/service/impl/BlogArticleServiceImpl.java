package com.erahub.blog.service.impl;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.collection.CollectionUtil;
import cn.hutool.core.io.FileUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.erahub.base.basicservice.api.RemoteFileService;
import com.erahub.base.basicservice.api.domain.BSFile;
import com.erahub.blog.domain.BlogArticleTag;
import com.erahub.blog.domain.vo.BlogArticleImageVo;
import com.erahub.blog.mapper.BlogArticleTagMapper;
import com.erahub.common.core.exception.ServiceException;
import com.erahub.common.core.utils.StringUtils;
import com.erahub.common.mybatis.core.page.PageQuery;
import com.erahub.common.mybatis.core.page.TableDataInfo;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import lombok.RequiredArgsConstructor;
import org.apache.dubbo.config.annotation.DubboReference;
import org.springframework.stereotype.Service;
import com.erahub.blog.domain.bo.BlogArticleBo;
import com.erahub.blog.domain.vo.BlogArticleVo;
import com.erahub.blog.domain.BlogArticle;
import com.erahub.blog.mapper.BlogArticleMapper;
import com.erahub.blog.service.IBlogArticleService;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.*;
import java.util.stream.Collectors;

/**
 * 博客文章Service业务层处理
 *
 * @author erahub
 * @date 2022-12-17
 */
@RequiredArgsConstructor
@Service
public class BlogArticleServiceImpl implements IBlogArticleService {

    private final BlogArticleMapper blogArticleMapper;

    private final BlogArticleTagMapper blogArticleTagMapper;

    @DubboReference
    private final RemoteFileService remoteFileService;

    /**
     * 查询博客文章
     */
    @Override
    public BlogArticleVo queryById(Long id){
        return BeanUtil.copyProperties(blogArticleMapper.queryById(id),BlogArticleVo.class);
    }

    /**
     * 查询博客文章列表
     */
    @Override
    public TableDataInfo<BlogArticleVo> queryPageList(BlogArticleBo bo, PageQuery pageQuery) {
        QueryWrapper<BlogArticle> wrapper = buildQueryWrapper(bo);
        Page<BlogArticle> result = blogArticleMapper.selectPageBlogArticleList(pageQuery.build(), wrapper);
        return TableDataInfo.build(BeanUtil.copyToList(result.getRecords(), BlogArticleVo.class));
    }

    /**
     * 查询博客文章列表
     */
    @Override
    public List<BlogArticleVo> queryList(BlogArticleBo bo) {
        QueryWrapper<BlogArticle> wrapper = buildQueryWrapper(bo);
        return BeanUtil.copyToList(blogArticleMapper.queryList(wrapper), BlogArticleVo.class);
    }

    private QueryWrapper<BlogArticle> buildQueryWrapper(BlogArticleBo bo) {
        Map<String, Object> params = bo.getParams();
        QueryWrapper<BlogArticle> wrapper = Wrappers.query();
        wrapper.like(bo.getCreateBy() != null, "ba.create_by", bo.getCreateBy());
        wrapper.like(bo.getCategoryId() != null, "bc.category_id", bo.getCategoryId());
        wrapper.like(bo.getTagId() != null, "bt.tag_id", bo.getTagId());
        wrapper.like(StringUtils.isNotBlank(bo.getArticleTitle()), "ba.article_title", bo.getArticleTitle());
        wrapper.eq(bo.getIsTop() != null, "ba.is_top", bo.getIsTop());
        wrapper.eq(bo.getIsFeatured() != null, "ba.is_featured", bo.getIsFeatured());
        wrapper.eq(bo.getIsDelete() != null, "ba.is_delete", bo.getIsDelete());
        wrapper.eq(bo.getStatus() != null, "ba.status", bo.getStatus());
        wrapper.eq(bo.getType() != null, "ba.type", bo.getType());
        wrapper.between(params.get("beginTime") != null && params.get("endTime") != null,
            "ba.create_time", params.get("beginTime"), params.get("endTime"));
        return wrapper;
    }

    @Override
    public BlogArticleImageVo uploadImage(MultipartFile file) {
        BlogArticleImageVo blogArticleImageVo = new BlogArticleImageVo();
        blogArticleImageVo.setOriginalName(file.getOriginalFilename());
        blogArticleImageVo.setFileSuffix(StringUtils.substring(blogArticleImageVo.getOriginalName(),
            blogArticleImageVo.getOriginalName().lastIndexOf("."),
            blogArticleImageVo.getOriginalName().length()));
        blogArticleImageVo.setFileName(UUID.randomUUID().toString().replaceAll("-", "") + blogArticleImageVo.getFileSuffix());
        blogArticleImageVo.setContentType(file.getContentType());

        File tempFile;
        String path = System.getProperty("user.dir");
        try {
            tempFile = FileUtil.writeBytes(file.getBytes(),
                path + File.separator + "temp_files" + File.separator
                    + blogArticleImageVo.getFileName());
        } catch (IOException e) {
            throw new ServiceException(e.getMessage());
        }

        return blogArticleImageVo;
    }

    /**
     * 新增博客文章
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public Boolean insertByBo(BlogArticleBo bo) {
        BlogArticle add = BeanUtil.toBean(bo, BlogArticle.class);
        validEntityBeforeSave(add);

        String path = System.getProperty("user.dir") + File.separator + "temp_files" + File.separator;
        File file = new File(path + bo.getBlogArticleImageBo().getFileName());
        BSFile upload = remoteFileService.upload(bo.getBlogArticleImageBo().getFileName(),
            bo.getBlogArticleImageBo().getOriginalName(), bo.getBlogArticleImageBo().getContentType(), FileUtil.readBytes(file));
        file.delete();

        add.setArticleCover(upload.getUrl());
        boolean flag = blogArticleMapper.insert(add) > 0;
        if (flag) {
            bo.setArticleId(add.getArticleId());
            if(CollectionUtil.isNotEmpty(bo.getTagIds())){
                ArrayList<BlogArticleTag> blogArticleTags = new ArrayList<>();
                bo.getTagIds().forEach((id) -> {
                    BlogArticleTag blogArticleTag = new BlogArticleTag();
                    blogArticleTag.setArticleId(add.getArticleId());
                    blogArticleTag.setTagId(id);
                    blogArticleTags.add(blogArticleTag);
                });
                blogArticleTagMapper.insertBatch(blogArticleTags);
            }
        }
        return flag;
    }

    /**
     * 修改博客文章
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public Boolean updateByBo(BlogArticleBo bo) {
        BlogArticle update = BeanUtil.toBean(bo, BlogArticle.class);
        validEntityBeforeSave(update);

        if(bo.getBlogArticleImageBo() != null){
            //删除原封面
            remoteFileService.deleteByUrls(Arrays.asList(bo.getArticleCover()));

            //导入新封面
            String path = System.getProperty("user.dir") + File.separator + "temp_files" + File.separator;
            File file = new File(path + bo.getBlogArticleImageBo().getFileName());
            BSFile upload = remoteFileService.upload(bo.getBlogArticleImageBo().getFileName(),
                bo.getBlogArticleImageBo().getOriginalName(), bo.getBlogArticleImageBo().getContentType(), FileUtil.readBytes(file));
            file.delete();
            update.setArticleCover(upload.getUrl());
        }

        Boolean flag = blogArticleMapper.updateById(update) > 0;
        if (flag) {
            blogArticleTagMapper.deleteById(bo.getArticleId());
            if(CollectionUtil.isNotEmpty(bo.getTagIds())){
                ArrayList<BlogArticleTag> blogArticleTags = new ArrayList<>();
                bo.getTagIds().forEach((id) -> {
                    BlogArticleTag blogArticleTag = new BlogArticleTag();
                    blogArticleTag.setArticleId(bo.getArticleId());
                    blogArticleTag.setTagId(id);
                    blogArticleTags.add(blogArticleTag);
                });
                blogArticleTagMapper.insertBatch(blogArticleTags);
            }
        }
        return flag;
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
        List<BlogArticle> blogArticles = blogArticleMapper.selectBatchIds(ids);
        for (BlogArticle blogArticle : blogArticles) {
            blogArticle.setIsDelete("1");
        }
        return blogArticleMapper.updateBatchById(blogArticles);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public Boolean removeWithValidByIds(Collection<Long> ids, Boolean isValid) {
        if(isValid){
            //TODO 做一些业务上的校验,判断是否需要校验
        }

        List<String> articleCovers = blogArticleMapper.selectVoBatchIds(ids).stream().map(BlogArticleVo::getArticleCover).collect(Collectors.toList());
        //删除原封面
        remoteFileService.deleteByUrls(articleCovers);


        // 删除用户与角色关联
        blogArticleTagMapper.delete(new LambdaQueryWrapper<BlogArticleTag>().in(BlogArticleTag::getArticleId, ids));
        return blogArticleMapper.deleteBatchIds(ids) > 0;
    }
}
