package com.erahub.biz.finance.controller;

import cn.dev33.satoken.annotation.SaCheckPermission;
import com.erahub.common.core.domain.R;
import com.erahub.common.core.validate.AddGroup;
import com.erahub.common.core.validate.EditGroup;
import com.erahub.common.core.web.controller.BaseController;
import com.erahub.common.log.annotation.Log;
import com.erahub.common.log.enums.BusinessType;
import com.erahub.common.mybatis.core.page.PageQuery;
import lombok.RequiredArgsConstructor;
import org.springframework.http.MediaType;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import com.erahub.biz.finance.domain.vo.FinanceERPProjectVo;
import com.erahub.biz.finance.domain.bo.FinanceERPProjectBo;
import com.erahub.biz.finance.service.IFinanceERPProjectService;
import com.erahub.common.mybatis.core.page.TableDataInfo;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;
import java.util.Arrays;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.servlet.http.HttpServletResponse;

/**
 * ERP工程明细控制器
 * 前端访问路由地址为:/biz/finance/erpproject
 *
 * @author erahub
 * @date 2023-01-01
 */
@Validated
@RequiredArgsConstructor
@RestController
@RequestMapping("/finance/erpproject")
public class FinanceERPProjectController extends BaseController {

    private final IFinanceERPProjectService iBizFinanceERPProjectService;

    /**
     * 查询ERP工程明细列表
     */
    @SaCheckPermission("biz:finance:erpproject:list")
    @GetMapping("/list")
    public TableDataInfo<FinanceERPProjectVo> list(FinanceERPProjectBo bo, PageQuery pageQuery) {
        return iBizFinanceERPProjectService.queryPageList(bo, pageQuery);
    }

    /**
     * 导入ERP工程明细列表列表
     *
     * @param file 导入文件
     */
    @Log(title = "ERP工程", businessType = BusinessType.IMPORT)
    @SaCheckPermission("biz:finance:erpproject:import")
    @PostMapping(value = "/importData", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public R<List<FinanceERPProjectVo>> importData(MultipartFile file) throws Exception {
        return R.ok(iBizFinanceERPProjectService.importData(file));
    }

    /**
     * 导出ERP工程明细列表
     */
    @SaCheckPermission("biz:finance:erpproject:export")
    @Log(title = "ERP工程", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(@RequestBody List<FinanceERPProjectBo> bos, HttpServletResponse response) {
        iBizFinanceERPProjectService.export(bos, response);
    }

    /**
     * 获取ERP工程明细详细信息
     *
     * @param projectId 主键
     */
    @SaCheckPermission("biz:finance:erpproject:query")
    @GetMapping("/{projectId}")
    public R<FinanceERPProjectVo> getInfo(@NotNull(message = "主键不能为空") @PathVariable Long projectId) {
        return R.ok(iBizFinanceERPProjectService.queryById(projectId));
    }

    /**
     * 新增ERP工程明细
     */
    @SaCheckPermission("biz:finance:erpproject:add")
    @Log(title = "ERP工程", businessType = BusinessType.INSERT)
    @PostMapping()
    public R<Void> add(@Validated(AddGroup.class) @RequestBody FinanceERPProjectBo bo) {
        return toAjax(iBizFinanceERPProjectService.insertByBo(bo));
    }

    /**
     * 修改ERP工程明细
     */
    @SaCheckPermission("biz:finance:erpproject:edit")
    @Log(title = "ERP工程", businessType = BusinessType.UPDATE)
    @PutMapping()
    public R<Void> edit(@Validated(EditGroup.class) @RequestBody FinanceERPProjectBo bo) {
        return toAjax(iBizFinanceERPProjectService.updateByBo(bo));
    }

    /**
     * 删除ERP工程明细
     *
     * @param projectIds 主键串
     */
    @SaCheckPermission("biz:finance:erpproject:remove")
    @Log(title = "ERP工程", businessType = BusinessType.DELETE)
    @DeleteMapping("/{projectIds}")
    public R<Void> remove(@NotEmpty(message = "主键不能为空") @PathVariable Long[] projectIds) {
        return toAjax(iBizFinanceERPProjectService.deleteWithValidByIds(Arrays.asList(projectIds), true));
    }
}
