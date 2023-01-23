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
import com.erahub.base.basicservice.domain.vo.BSMailRecordVo;
import com.erahub.base.basicservice.domain.bo.BSMailRecordBo;
import com.erahub.base.basicservice.service.IBSMailRecordService;
import com.erahub.common.mybatis.core.page.TableDataInfo;

import java.util.List;
import java.util.Arrays;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.servlet.http.HttpServletResponse;

/**
 * 邮件记录控制器
 * 前端访问路由地址为:/basicservice/mailRecord
 *
 * @author erahub
 * @date 2023-01-23
 */
@Validated
@RequiredArgsConstructor
@RestController
@RequestMapping("/mailRecord")
public class BSMailRecordController extends BaseController {

    private final IBSMailRecordService iBSMailRecordService;

    /**
     * 查询邮件记录列表
     */
    @SaCheckPermission("basicservice:mailRecord:list")
    @GetMapping("/list")
    public TableDataInfo<BSMailRecordVo> list(BSMailRecordBo bo, PageQuery pageQuery) {
        return iBSMailRecordService.queryPageList(bo, pageQuery);
    }

    /**
     * 导出邮件记录列表
     */
    @SaCheckPermission("basicservice:mailRecord:export")
    @Log(title = "邮件记录", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(BSMailRecordBo bo, HttpServletResponse response) {
        List<BSMailRecordVo> list = iBSMailRecordService.queryList(bo);
        ExcelUtil.exportExcel(list, "邮件记录", BSMailRecordVo.class, response);
    }

    /**
     * 获取邮件记录详细信息
     *
     * @param mailRecordId 主键
     */
    @SaCheckPermission("basicservice:mailRecord:query")
    @GetMapping("/{mailRecordId}")
    public R<BSMailRecordVo> getInfo(@NotNull(message = "主键不能为空") @PathVariable Long mailRecordId) {
        return R.ok(iBSMailRecordService.queryById(mailRecordId));
    }

    /**
     * 新增邮件记录
     */
    @SaCheckPermission("basicservice:mailRecord:send")
    @Log(title = "邮件记录", businessType = BusinessType.SEND)
    @PostMapping("/send")
    public R<Void> send(@Validated(AddGroup.class) @RequestBody BSMailRecordBo bo) {
        return toAjax(iBSMailRecordService.send(bo));
    }

    /**
     * 删除邮件记录
     *
     * @param mailRecordIds 主键串
     */
    @SaCheckPermission("basicservice:mailRecord:remove")
    @Log(title = "邮件记录", businessType = BusinessType.DELETE)
    @DeleteMapping("/{mailRecordIds}")
    public R<Void> remove(@NotEmpty(message = "主键不能为空") @PathVariable Long[] mailRecordIds) {
        return toAjax(iBSMailRecordService.deleteWithValidByIds(Arrays.asList(mailRecordIds), true));
    }
}
