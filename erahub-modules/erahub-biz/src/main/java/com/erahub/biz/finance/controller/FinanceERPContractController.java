package com.erahub.biz.finance.controller;

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
import com.erahub.biz.finance.domain.vo.FinanceERPContractVo;
import com.erahub.biz.finance.domain.bo.FinanceERPContractBo;
import com.erahub.biz.finance.service.IFinanceERPContractService;
import com.erahub.common.mybatis.core.page.TableDataInfo;

import java.util.List;
import java.util.Arrays;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.servlet.http.HttpServletResponse;

/**
 * ERP合同控制器
 * 前端访问路由地址为:/biz/finance:erpcontract
 *
 * @author erahub
 * @date 2023-02-04
 */
@Validated
@RequiredArgsConstructor
@RestController
@RequestMapping("/finance/erpcontract")
public class FinanceERPContractController extends BaseController {

    private final IFinanceERPContractService iFinanceERPContractService;

    /**
     * 查询ERP合同列表
     */
    @SaCheckPermission("biz:finance:erpcontract:list")
    @GetMapping("/list")
    public TableDataInfo<FinanceERPContractVo> list(FinanceERPContractBo bo, PageQuery pageQuery) {
        return iFinanceERPContractService.queryPageList(bo, pageQuery);
    }

    /**
     * 导出ERP合同列表
     */
    @SaCheckPermission("biz:finance:erpcontract:export")
    @Log(title = "ERP合同", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(FinanceERPContractBo bo, HttpServletResponse response) {
        List<FinanceERPContractVo> list = iFinanceERPContractService.queryList(bo);
        ExcelUtil.exportExcel(list, "ERP合同", FinanceERPContractVo.class, response);
    }

    /**
     * 获取ERP合同详细信息
     *
     * @param contractId 主键
     */
    @SaCheckPermission("biz:finance:erpcontract:query")
    @GetMapping("/{contractId}")
    public R<FinanceERPContractVo> getInfo(@NotNull(message = "主键不能为空") @PathVariable Long contractId) {
        return R.ok(iFinanceERPContractService.queryById(contractId));
    }

    /**
     * 新增ERP合同
     */
    @SaCheckPermission("biz:finance:erpcontract:add")
    @Log(title = "ERP合同", businessType = BusinessType.INSERT)
    @PostMapping()
    public R<Void> add(@Validated(AddGroup.class) @RequestBody FinanceERPContractBo bo) {
        return toAjax(iFinanceERPContractService.insertByBo(bo));
    }

    /**
     * 修改ERP合同
     */
    @SaCheckPermission("biz:finance:erpcontract:edit")
    @Log(title = "ERP合同", businessType = BusinessType.UPDATE)
    @PutMapping()
    public R<Void> edit(@Validated(EditGroup.class) @RequestBody FinanceERPContractBo bo) {
        return toAjax(iFinanceERPContractService.updateByBo(bo));
    }

    /**
     * 删除ERP合同
     *
     * @param contractIds 主键串
     */
    @SaCheckPermission("biz:finance:erpcontract:remove")
    @Log(title = "ERP合同", businessType = BusinessType.DELETE)
    @DeleteMapping("/{contractIds}")
    public R<Void> remove(@NotEmpty(message = "主键不能为空") @PathVariable Long[] contractIds) {
        return toAjax(iFinanceERPContractService.deleteWithValidByIds(Arrays.asList(contractIds), true));
    }
}
