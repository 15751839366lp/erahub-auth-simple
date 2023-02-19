package com.erahub.biz.finance.controller;

import cn.dev33.satoken.annotation.SaCheckPermission;
import com.erahub.biz.finance.domain.FinanceReceivable;
import com.erahub.biz.finance.domain.excel.FinanceReceivableExport;
import com.erahub.biz.finance.domain.excel.FinanceReceivableImport;
import com.erahub.biz.finance.listener.excel.FinanceReceivableImportListener;
import com.erahub.common.core.domain.R;
import com.erahub.common.core.validate.AddGroup;
import com.erahub.common.core.validate.EditGroup;
import com.erahub.common.core.validate.QueryGroup;
import com.erahub.common.core.web.controller.BaseController;
import com.erahub.common.excel.core.ExcelResult;
import com.erahub.common.excel.utils.ExcelUtil;
import com.erahub.common.log.annotation.Log;
import com.erahub.common.log.enums.BusinessType;
import com.erahub.common.mybatis.core.page.PageQuery;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import com.erahub.biz.finance.domain.vo.FinanceReceivableVo;
import com.erahub.biz.finance.domain.bo.FinanceReceivableBo;
import com.erahub.biz.finance.service.IFinanceReceivableService;
import com.erahub.common.mybatis.core.page.TableDataInfo;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;
import java.util.Arrays;
import java.util.Map;
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
    public TableDataInfo<FinanceReceivable> list(FinanceReceivableBo bo, PageQuery pageQuery) {
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
     * 导入应收管理列表
     *
     * @param file          导入文件
     * @param updateSupport 更新已有数据
     */
    @Log(title = "应收管理", businessType = BusinessType.IMPORT)
    @SaCheckPermission("biz:finance:receivable:import")
    @PostMapping(value = "/importData", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public R<Void> importData(MultipartFile file, boolean updateSupport) throws Exception {
        ExcelResult<FinanceReceivableImport> result = ExcelUtil.importExcel(file.getInputStream(), FinanceReceivableImport.class, new FinanceReceivableImportListener(updateSupport));
        return R.ok(result.getAnalysis());
    }

    /**
     * 下载导入模板
     */
    @PostMapping("/importTemplate")
    public void importTemplate(HttpServletResponse response) {
        FinanceReceivableImport FinanceReceivableImportVoTemp
            = new FinanceReceivableImport(16222222L, new Date(), 10000L, "XXX有限公司", "工程编号", "工程名称",
            new BigDecimal(100),new BigDecimal("0.13"),new BigDecimal(100),
            new BigDecimal(100),new BigDecimal(100),new BigDecimal(100),
            "张三","张三","张三","0",null,null);
        ExcelUtil.exportExcel(Arrays.asList(FinanceReceivableImportVoTemp), "应收管理", FinanceReceivableImport.class, response);

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

    /**
     * 统计数据
     *
     */
    @SaCheckPermission("biz:finance:receivable:statistics")
    @PostMapping("/selectStatisticsData")
    public R<Map<String,Object>> selectStatisticsData(@RequestBody Map<String,Object> param) {
        return R.ok((iFinanceReceivableService.selectStatisticsData(param)));
    }

    /**
     * 分单位统计未收回款
     *
     */
    @SaCheckPermission("biz:finance:receivable:statistics")
    @PostMapping("/selectArrearageGroupByCompanyName")
    public R<List<Object>> selectArrearageGroupByCompanyName(@RequestBody Map<String,Object> param) {
        return R.ok((iFinanceReceivableService.selectArrearageGroupByCompanyName(param)));
    }

    /**
     * 分税率统计未收回款
     *
     */
    @SaCheckPermission("biz:finance:receivable:statistics")
    @PostMapping("/selectArrearageGroupByTaxRate")
    public R<List<Object>> selectArrearageGroupByTaxRate(@RequestBody Map<String,Object> param) {
        return R.ok((iFinanceReceivableService.selectArrearageGroupByTaxRate(param)));
    }

    /**
     * 分开票日期统计未收回款
     *
     */
    @SaCheckPermission("biz:finance:receivable:statistics")
    @PostMapping("/selectArrearageGroupByInvoicingDate")
    public R<List<Object>> selectArrearageGroupByInvoicingDate(@RequestBody Map<String,Object> param) {
        return R.ok((iFinanceReceivableService.selectArrearageGroupByInvoicingDate(param)));
    }

    /**
     * 根据开票月份查询应收管理列表
     */
    @SaCheckPermission("biz:finance:receivable:statistics")
    @GetMapping("/queryPageListByInvoicingMonth")
    public TableDataInfo<FinanceReceivable> queryPageListByInvoicingMonth(FinanceReceivableBo bo, PageQuery pageQuery) {
        return iFinanceReceivableService.queryPageListByInvoicingMonth(bo, pageQuery);
    }
}
