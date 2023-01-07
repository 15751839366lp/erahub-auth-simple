package com.erahub.blog.controller;

import cn.dev33.satoken.annotation.SaCheckPermission;
import com.erahub.blog.domain.vo.BlogArticleImageVo;
import com.erahub.common.core.domain.R;
import com.erahub.common.core.validate.AddGroup;
import com.erahub.common.core.validate.EditGroup;
import com.erahub.common.core.validate.QueryGroup;
import com.erahub.common.core.web.controller.BaseController;
import com.erahub.common.excel.utils.ExcelUtil;
import com.erahub.common.log.annotation.Log;
import com.erahub.common.log.enums.BusinessType;
import com.erahub.common.mybatis.core.page.PageQuery;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import com.erahub.blog.domain.vo.BlogArticleVo;
import com.erahub.blog.domain.bo.BlogArticleBo;
import com.erahub.blog.service.IBlogArticleService;
import com.erahub.common.mybatis.core.page.TableDataInfo;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;
import java.util.Arrays;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.servlet.http.HttpServletResponse;

/**
 * 博客文章控制器
 * 前端访问路由地址为:/blog/article
 *
 * @author erahub
 * @date 2022-12-17
 */
@Validated
@RequiredArgsConstructor
@RestController
@RequestMapping("/article")
public class BlogArticleController extends BaseController {

    private final IBlogArticleService iBlogArticleService;

    /**
     * 查询博客文章列表
     */
    @SaCheckPermission("blog:article:list")
    @GetMapping("/list")
    public TableDataInfo<BlogArticleVo> list(BlogArticleBo bo, PageQuery pageQuery) {
        return iBlogArticleService.queryPageList(bo, pageQuery);
    }

    /**
     * 导出博客文章列表
     */
    @SaCheckPermission("blog:article:export")
    @Log(title = "博客文章", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(BlogArticleBo bo, HttpServletResponse response) {
        List<BlogArticleVo> list = iBlogArticleService.queryList(bo);
        ExcelUtil.exportExcel(list, "博客文章", BlogArticleVo.class, response);
    }

    /**
     * 获取博客文章详细信息
     *
     * @param id 主键
     */
    @SaCheckPermission("blog:article:query")
    @GetMapping("/{id}")
    public R<BlogArticleVo> getInfo(@NotNull(message = "主键不能为空") @PathVariable Long id) {
        return R.ok(iBlogArticleService.queryById(id));
    }

    /**
     * 新增博客文章
     */
    @SaCheckPermission("blog:article:add")
    @Log(title = "博客文章", businessType = BusinessType.INSERT)
    @PostMapping("/uploadImage")
    public R<BlogArticleImageVo> uploadImage(MultipartFile file) {
        return R.ok(iBlogArticleService.uploadImage(file));
    }

    /**
     * 新增博客文章
     */
    @SaCheckPermission("blog:article:add")
    @Log(title = "博客文章", businessType = BusinessType.INSERT)
    @PostMapping()
    public R<Void> add(@Validated(AddGroup.class) @RequestBody BlogArticleBo bo) {
        return toAjax(iBlogArticleService.insertByBo(bo));
    }

    /**
     * 修改博客文章
     */
    @SaCheckPermission("blog:article:edit")
    @Log(title = "博客文章", businessType = BusinessType.UPDATE)
    @PutMapping()
    public R<Void> edit(@Validated(EditGroup.class) @RequestBody BlogArticleBo bo) {
        return toAjax(iBlogArticleService.updateByBo(bo));
    }

    /**
     * 删除博客文章
     *
     * @param ids 主键串
     */
    @SaCheckPermission("blog:article:remove")
    @Log(title = "博客文章", businessType = BusinessType.UPDATE)
    @DeleteMapping("/{ids}")
    public R<Void> delete(@NotEmpty(message = "主键不能为空") @PathVariable Long[] ids) {
        return toAjax(iBlogArticleService.deleteWithValidByIds(Arrays.asList(ids), true));
    }

    /**
     * 永久删除博客文章
     *
     * @param ids 主键串
     */
    @SaCheckPermission("blog:article:remove")
    @Log(title = "博客文章", businessType = BusinessType.DELETE)
    @DeleteMapping("/remove/{ids}")
    public R<Void> remove(@NotEmpty(message = "主键不能为空") @PathVariable Long[] ids) {
        return toAjax(iBlogArticleService.removeWithValidByIds(Arrays.asList(ids), true));
    }
}
