package com.erahub.blog.controller;

import cn.dev33.satoken.annotation.SaCheckPermission;
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
import com.erahub.blog.domain.vo.BlogCategoryVo;
import com.erahub.blog.domain.bo.BlogCategoryBo;
import com.erahub.blog.service.IBlogCategoryService;
import com.erahub.common.mybatis.core.page.TableDataInfo;

import java.util.List;
import java.util.Arrays;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.servlet.http.HttpServletResponse;

/**
 * 博客分类控制器
 * 前端访问路由地址为:/blog/category
 *
 * @author erahub
 * @date 2022-12-20
 */
@Validated
@RequiredArgsConstructor
@RestController
@RequestMapping("/category")
public class BlogCategoryController extends BaseController {

    private final IBlogCategoryService iBlogCategoryService;

    /**
     * 查询博客分类列表
     */
    @SaCheckPermission("blog:category:list")
    @GetMapping("/list")
    public TableDataInfo<BlogCategoryVo> list(BlogCategoryBo bo, PageQuery pageQuery) {
        return iBlogCategoryService.queryPageList(bo, pageQuery);
    }

    /**
     * 导出博客分类列表
     */
    @SaCheckPermission("blog:category:export")
    @Log(title = "博客分类", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(BlogCategoryBo bo, HttpServletResponse response) {
        List<BlogCategoryVo> list = iBlogCategoryService.queryList(bo);
        ExcelUtil.exportExcel(list, "博客分类", BlogCategoryVo.class, response);
    }

    /**
     * 获取博客分类详细信息
     *
     * @param categoryId 主键
     */
    @SaCheckPermission("blog:category:query")
    @GetMapping("/{categoryId}")
    public R<BlogCategoryVo> getInfo(@NotNull(message = "主键不能为空") @PathVariable Long categoryId) {
        return R.ok(iBlogCategoryService.queryById(categoryId));
    }

    /**
     * 新增博客分类
     */
    @SaCheckPermission("blog:category:add")
    @Log(title = "博客分类", businessType = BusinessType.INSERT)
    @PostMapping()
    public R<Void> add(@Validated(AddGroup.class) @RequestBody BlogCategoryBo bo) {
        return toAjax(iBlogCategoryService.insertByBo(bo));
    }

    /**
     * 修改博客分类
     */
    @SaCheckPermission("blog:category:edit")
    @Log(title = "博客分类", businessType = BusinessType.UPDATE)
    @PutMapping()
    public R<Void> edit(@Validated(EditGroup.class) @RequestBody BlogCategoryBo bo) {
        return toAjax(iBlogCategoryService.updateByBo(bo));
    }

    /**
     * 删除博客分类
     *
     * @param categoryIds 主键串
     */
    @SaCheckPermission("blog:category:remove")
    @Log(title = "博客分类", businessType = BusinessType.DELETE)
    @DeleteMapping("/{categoryIds}")
    public R<Void> remove(@NotEmpty(message = "主键不能为空") @PathVariable Long[] categoryIds) {
        return toAjax(iBlogCategoryService.deleteWithValidByIds(Arrays.asList(categoryIds), true));
    }
}
