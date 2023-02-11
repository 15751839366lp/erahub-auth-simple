package com.erahub.biz.finance.controller;

import cn.dev33.satoken.annotation.SaCheckPermission;
import com.erahub.biz.finance.domain.excel.FinanceReceivableExport;
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
import com.erahub.biz.finance.domain.vo.FinanceReceivableVo;
import com.erahub.biz.finance.domain.bo.FinanceReceivableBo;
import com.erahub.biz.finance.service.IFinanceReceivableService;
import com.erahub.common.mybatis.core.page.TableDataInfo;

import java.math.BigDecimal;
import java.util.List;
import java.util.Arrays;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.servlet.http.HttpServletResponse;

/**
 * 应收管理控制器
 * 前端访问路由地址为:/biz/financeReceivable
 *
 * @author erahub
 * @date 2023-02-11
 */
@Validated
@RequiredArgsConstructor
@RestController
@RequestMapping("/finance/receivable")
public class FinanceReceivableController extends BaseController {

    private final IFinanceReceivableService iFinanceReceivableService;

    /**
     * 查询应收管理列表
     */
    @SaCheckPermission("biz:finance:receivable:list")
    @GetMapping("/list")
    public TableDataInfo<FinanceReceivableVo> list(FinanceReceivableBo bo, PageQuery pageQuery) {
        return iFinanceReceivableService.queryPageList(bo, pageQuery);
    }

    /**
     * 导出应收管理列表
     */
    @SaCheckPermission("biz:finance:receivable:export")
    @Log(title = "应收管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(FinanceReceivableBo bo, HttpServletResponse response) {
        List<FinanceReceivableExport> list = iFinanceReceivableService.queryList(bo);
        ExcelUtil.exportExcel(list, "应收管理", FinanceReceivableExport.class, response);
    }

    /**
     * 获取应收管理详细信息
     *
     * @param receivableId 主键
     */
    @SaCheckPermission("biz:finance:receivable:query")
    @GetMapping("/{receivableId}")
    public R<FinanceReceivableVo> getInfo(@NotNull(message = "主键不能为空") @PathVariable Long receivableId) {
        return R.ok(iFinanceReceivableService.queryById(receivableId));
    }

    /**
     * 新增应收管理
     */
    @SaCheckPermission("biz:finance:receivable:add")
    @Log(title = "应收管理", businessType = BusinessType.INSERT)
    @PostMapping()
    public R<Void> add(@Validated(AddGroup.class) @RequestBody FinanceReceivableBo bo) {
        return toAjax(iFinanceReceivableService.insertByBo(bo));
    }

    /**
     * 修改应收管理
     */
    @SaCheckPermission("biz:finance:receivable:edit")
    @Log(title = "应收管理", businessType = BusinessType.UPDATE)
    @PutMapping()
    public R<Void> edit(@Validated(EditGroup.class) @RequestBody FinanceReceivableBo bo) {
        return toAjax(iFinanceReceivableService.updateByBo(bo));
    }

    /**
     * 删除应收管理
     *
     * @param receivableIds 主键串
     */
    @SaCheckPermission("biz:finance:receivable:remove")
    @Log(title = "应收管理", businessType = BusinessType.DELETE)
    @DeleteMapping("/{receivableIds}")
    public R<Void> remove(@NotEmpty(message = "主键不能为空") @PathVariable Long[] receivableIds) {
        return toAjax(iFinanceReceivableService.deleteWithValidByIds(Arrays.asList(receivableIds), true));
    }

    /**
     * 获取所有税率
     *
     */
    @SaCheckPermission("biz:finance:receivable:list")
    @GetMapping("/selectAllTaxRate")
    public R<List<BigDecimal>> selectAllTaxRate() {
        return R.ok((iFinanceReceivableService.selectAllTaxRate()));
    }

    /**
     * 获取所有财务部项目负责人
     *
     */
    @SaCheckPermission("biz:finance:receivable:list")
    @GetMapping("/selectAllFinanceProjectResponsiblePerson")
    public R<List<String>> selectAllFinanceProjectResponsiblePerson() {
        return R.ok((iFinanceReceivableService.selectAllFinanceProjectResponsiblePerson()));
    }

    /**
     * 获取所有经营部项目负责人
     *
     */
    @SaCheckPermission("biz:finance:receivable:list")
    @GetMapping("/selectAllOperationProjectResponsiblePerson")
    public R<List<String>> selectAllOperationProjectResponsiblePerson() {
        return R.ok((iFinanceReceivableService.selectAllOperationProjectResponsiblePerson()));
    }
}
