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
import com.erahub.biz.finance.domain.vo.FinanceCompanyVo;
import com.erahub.biz.finance.domain.bo.FinanceCompanyBo;
import com.erahub.biz.finance.service.IFinanceCompanyService;
import com.erahub.common.mybatis.core.page.TableDataInfo;

import java.util.List;
import java.util.Arrays;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.servlet.http.HttpServletResponse;

/**
 * 单位管理控制器
 * 前端访问路由地址为:/biz/financeCompany
 *
 * @author erahub
 * @date 2023-02-11
 */
@Validated
@RequiredArgsConstructor
@RestController
@RequestMapping("/finance/company")
public class FinanceCompanyController extends BaseController {

    private final IFinanceCompanyService iFinanceCompanyService;

    /**
     * 查询单位管理列表
     */
    @SaCheckPermission("biz:finance:company:list")
    @GetMapping("/list")
    public TableDataInfo<FinanceCompanyVo> list(FinanceCompanyBo bo, PageQuery pageQuery) {
        return iFinanceCompanyService.queryPageList(bo, pageQuery);
    }

    /**
     * 导出单位管理列表
     */
    @SaCheckPermission("biz:finance:company:export")
    @Log(title = "单位管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(FinanceCompanyBo bo, HttpServletResponse response) {
        List<FinanceCompanyVo> list = iFinanceCompanyService.queryList(bo);
        ExcelUtil.exportExcel(list, "单位管理", FinanceCompanyVo.class, response);
    }

    /**
     * 获取单位管理详细信息
     *
     * @param companyId 主键
     */
    @SaCheckPermission("biz:finance:company:query")
    @GetMapping("/{companyId}")
    public R<FinanceCompanyVo> getInfo(@NotNull(message = "主键不能为空") @PathVariable Long companyId) {
        return R.ok(iFinanceCompanyService.queryById(companyId));
    }

    /**
     * 新增单位管理
     */
    @SaCheckPermission("biz:finance:company:add")
    @Log(title = "单位管理", businessType = BusinessType.INSERT)
    @PostMapping()
    public R<Void> add(@Validated(AddGroup.class) @RequestBody FinanceCompanyBo bo) {
        return toAjax(iFinanceCompanyService.insertByBo(bo));
    }

    /**
     * 修改单位管理
     */
    @SaCheckPermission("biz:finance:company:edit")
    @Log(title = "单位管理", businessType = BusinessType.UPDATE)
    @PutMapping()
    public R<Void> edit(@Validated(EditGroup.class) @RequestBody FinanceCompanyBo bo) {
        return toAjax(iFinanceCompanyService.updateByBo(bo));
    }

    /**
     * 删除单位管理
     *
     * @param companyIds 主键串
     */
    @SaCheckPermission("biz:finance:company:remove")
    @Log(title = "单位管理", businessType = BusinessType.DELETE)
    @DeleteMapping("/{companyIds}")
    public R<Void> remove(@NotEmpty(message = "主键不能为空") @PathVariable Long[] companyIds) {
        return toAjax(iFinanceCompanyService.deleteWithValidByIds(Arrays.asList(companyIds), true));
    }
}
