package com.erahub.base.basicservice.controller;

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
import com.erahub.base.basicservice.domain.vo.BSMailAccountVo;
import com.erahub.base.basicservice.domain.bo.BSMailAccountBo;
import com.erahub.base.basicservice.service.IBSMailAccountService;
import com.erahub.common.mybatis.core.page.TableDataInfo;

import java.util.List;
import java.util.Arrays;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.servlet.http.HttpServletResponse;

/**
 * 邮件账号控制器
 * 前端访问路由地址为:/basicservice/mailAccount
 *
 * @author erahub
 * @date 2023-01-23
 */
@Validated
@RequiredArgsConstructor
@RestController
@RequestMapping("/mailAccount")
public class BSMailAccountController extends BaseController {

    private final IBSMailAccountService iBSMailAccountService;

    /**
     * 查询邮件账号列表
     */
    @SaCheckPermission("basicservice:mailAccount:list")
    @GetMapping("/list")
    public TableDataInfo<BSMailAccountVo> list(BSMailAccountBo bo, PageQuery pageQuery) {
        return iBSMailAccountService.queryPageList(bo, pageQuery);
    }

    /**
     * 获取所有邮件账号
     *
     */
    @SaCheckPermission("basicservice:mailRecord:list")
    @GetMapping("/getAllMailAccount")
    public R<List<BSMailAccountVo>> getAllMailAccount() {
        return R.ok(iBSMailAccountService.queryList(new BSMailAccountBo()));
    }

    /**
     * 导出邮件账号列表
     */
    @SaCheckPermission("basicservice:mailAccount:export")
    @Log(title = "邮件账号", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(BSMailAccountBo bo, HttpServletResponse response) {
        List<BSMailAccountVo> list = iBSMailAccountService.queryList(bo);
        ExcelUtil.exportExcel(list, "邮件账号", BSMailAccountVo.class, response);
    }

    /**
     * 获取邮件账号详细信息
     *
     * @param mailAccountId 主键
     */
    @SaCheckPermission("basicservice:mailAccount:query")
    @GetMapping("/{mailAccountId}")
    public R<BSMailAccountVo> getInfo(@NotNull(message = "主键不能为空") @PathVariable Long mailAccountId) {
        return R.ok(iBSMailAccountService.queryById(mailAccountId));
    }

    /**
     * 新增邮件账号
     */
    @SaCheckPermission("basicservice:mailAccount:add")
    @Log(title = "邮件账号", businessType = BusinessType.INSERT)
    @PostMapping()
    public R<Void> add(@Validated(AddGroup.class) @RequestBody BSMailAccountBo bo) {
        return toAjax(iBSMailAccountService.insertByBo(bo));
    }

    /**
     * 修改邮件账号
     */
    @SaCheckPermission("basicservice:mailAccount:edit")
    @Log(title = "邮件账号", businessType = BusinessType.UPDATE)
    @PutMapping()
    public R<Void> edit(@Validated(EditGroup.class) @RequestBody BSMailAccountBo bo) {
        return toAjax(iBSMailAccountService.updateByBo(bo));
    }

    /**
     * 删除邮件账号
     *
     * @param mailAccountIds 主键串
     */
    @SaCheckPermission("basicservice:mailAccount:remove")
    @Log(title = "邮件账号", businessType = BusinessType.DELETE)
    @DeleteMapping("/{mailAccountIds}")
    public R<Void> remove(@NotEmpty(message = "主键不能为空") @PathVariable Long[] mailAccountIds) {
        return toAjax(iBSMailAccountService.deleteWithValidByIds(Arrays.asList(mailAccountIds), true));
    }
}
