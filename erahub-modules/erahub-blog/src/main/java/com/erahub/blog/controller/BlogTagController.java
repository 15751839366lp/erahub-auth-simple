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
import com.erahub.blog.domain.vo.BlogTagVo;
import com.erahub.blog.domain.bo.BlogTagBo;
import com.erahub.blog.service.IBlogTagService;
import com.erahub.common.mybatis.core.page.TableDataInfo;

import java.util.List;
import java.util.Arrays;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.servlet.http.HttpServletResponse;

/**
 * 博客标签控制器
 * 前端访问路由地址为:/blog/tag
 *
 * @author erahub
 * @date 2022-12-20
 */
@Validated
@RequiredArgsConstructor
@RestController
@RequestMapping("/tag")
public class BlogTagController extends BaseController {

    private final IBlogTagService iBlogTagService;

    /**
     * 查询博客标签列表
     */
    @SaCheckPermission("blog:tag:list")
    @GetMapping("/list")
    public TableDataInfo<BlogTagVo> list(BlogTagBo bo, PageQuery pageQuery) {
        return iBlogTagService.queryPageList(bo, pageQuery);
    }

    /**
     * 导出博客标签列表
     */
    @SaCheckPermission("blog:tag:export")
    @Log(title = "博客标签", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(BlogTagBo bo, HttpServletResponse response) {
        List<BlogTagVo> list = iBlogTagService.queryList(bo);
        ExcelUtil.exportExcel(list, "博客标签", BlogTagVo.class, response);
    }

    /**
     * 获取博客标签详细信息
     *
     * @param tagId 主键
     */
    @SaCheckPermission("blog:tag:query")
    @GetMapping("/{tagId}")
    public R<BlogTagVo> getInfo(@NotNull(message = "主键不能为空") @PathVariable Long tagId) {
        return R.ok(iBlogTagService.queryById(tagId));
    }

    /**
     * 新增博客标签
     */
    @SaCheckPermission("blog:tag:add")
    @Log(title = "博客标签", businessType = BusinessType.INSERT)
    @PostMapping()
    public R<Void> add(@Validated(AddGroup.class) @RequestBody BlogTagBo bo) {
        return toAjax(iBlogTagService.insertByBo(bo));
    }

    /**
     * 修改博客标签
     */
    @SaCheckPermission("blog:tag:edit")
    @Log(title = "博客标签", businessType = BusinessType.UPDATE)
    @PutMapping()
    public R<Void> edit(@Validated(EditGroup.class) @RequestBody BlogTagBo bo) {
        return toAjax(iBlogTagService.updateByBo(bo));
    }

    /**
     * 删除博客标签
     *
     * @param tagIds 主键串
     */
    @SaCheckPermission("blog:tag:remove")
    @Log(title = "博客标签", businessType = BusinessType.DELETE)
    @DeleteMapping("/{tagIds}")
    public R<Void> remove(@NotEmpty(message = "主键不能为空") @PathVariable Long[] tagIds) {
        return toAjax(iBlogTagService.deleteWithValidByIds(Arrays.asList(tagIds), true));
    }
}
