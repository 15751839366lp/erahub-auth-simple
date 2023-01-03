package com.erahub.biz.finance.controller;

import cn.dev33.satoken.annotation.SaCheckPermission;
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
import com.erahub.biz.finance.domain.vo.BizFinanceERPProjectVo;
import com.erahub.biz.finance.domain.bo.BizFinanceERPProjectBo;
import com.erahub.biz.finance.service.IBizFinanceERPProjectService;
import com.erahub.common.mybatis.core.page.TableDataInfo;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;
import java.util.Arrays;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.servlet.http.HttpServletResponse;

/**
 * ERP工程明细控制器
 * 前端访问路由地址为:/biz/financeERPProject
 *
 * @author erahub
 * @date 2023-01-01
 */
@Validated
@RequiredArgsConstructor
@RestController
@RequestMapping("/financeERPProject")
public class BizFinanceERPProjectController extends BaseController {

    private final IBizFinanceERPProjectService iBizFinanceERPProjectService;

    /**
     * 查询ERP工程明细列表
     */
    @SaCheckPermission("biz:financeERPProject:list")
    @GetMapping("/list")
    public TableDataInfo<BizFinanceERPProjectVo> list(BizFinanceERPProjectBo bo, PageQuery pageQuery) {
        return iBizFinanceERPProjectService.queryPageList(bo, pageQuery);
    }

    /**
     * 导入ERP工程明细列表列表
     *
     * @param file 导入文件
     */
    @Log(title = "ERP工程", businessType = BusinessType.IMPORT)
    @SaCheckPermission("biz:financeERPProject:import")
    @PostMapping(value = "/importData", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public R<List<BizFinanceERPProjectVo>> importData(MultipartFile file) throws Exception {
        return R.ok(iBizFinanceERPProjectService.importData(file));
    }

    /**
     * 导出ERP工程明细列表
     */
    @SaCheckPermission("biz:financeERPProject:export")
    @Log(title = "ERP工程", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(@RequestBody List<BizFinanceERPProjectBo> bos, HttpServletResponse response) {
        iBizFinanceERPProjectService.export(bos, response);
    }

    /**
     * 获取ERP工程明细详细信息
     *
     * @param projectId 主键
     */
    @SaCheckPermission("biz:financeERPProject:query")
    @GetMapping("/{projectId}")
    public R<BizFinanceERPProjectVo> getInfo(@NotNull(message = "主键不能为空") @PathVariable Long projectId) {
        return R.ok(iBizFinanceERPProjectService.queryById(projectId));
    }

    /**
     * 新增ERP工程明细
     */
    @SaCheckPermission("biz:financeERPProject:add")
    @Log(title = "ERP工程", businessType = BusinessType.INSERT)
    @PostMapping()
    public R<Void> add(@Validated(AddGroup.class) @RequestBody BizFinanceERPProjectBo bo) {
        return toAjax(iBizFinanceERPProjectService.insertByBo(bo));
    }

    /**
     * 修改ERP工程明细
     */
    @SaCheckPermission("biz:financeERPProject:edit")
    @Log(title = "ERP工程", businessType = BusinessType.UPDATE)
    @PutMapping()
    public R<Void> edit(@Validated(EditGroup.class) @RequestBody BizFinanceERPProjectBo bo) {
        return toAjax(iBizFinanceERPProjectService.updateByBo(bo));
    }

    /**
     * 删除ERP工程明细
     *
     * @param projectIds 主键串
     */
    @SaCheckPermission("biz:financeERPProject:remove")
    @Log(title = "ERP工程", businessType = BusinessType.DELETE)
    @DeleteMapping("/{projectIds}")
    public R<Void> remove(@NotEmpty(message = "主键不能为空") @PathVariable Long[] projectIds) {
        return toAjax(iBizFinanceERPProjectService.deleteWithValidByIds(Arrays.asList(projectIds), true));
    }
}
