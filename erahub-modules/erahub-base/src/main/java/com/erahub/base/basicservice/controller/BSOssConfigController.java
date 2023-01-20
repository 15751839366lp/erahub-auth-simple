package com.erahub.base.basicservice.controller;

import cn.dev33.satoken.annotation.SaCheckPermission;
import com.erahub.common.core.domain.R;
import com.erahub.common.core.validate.AddGroup;
import com.erahub.common.core.validate.EditGroup;
import com.erahub.common.core.validate.QueryGroup;
import com.erahub.common.core.web.controller.BaseController;
import com.erahub.common.log.annotation.Log;
import com.erahub.common.log.enums.BusinessType;
import com.erahub.common.mybatis.core.page.PageQuery;
import com.erahub.common.mybatis.core.page.TableDataInfo;
import com.erahub.base.basicservice.domain.bo.BSOssConfigBo;
import com.erahub.base.basicservice.domain.vo.BSOssConfigVo;
import com.erahub.base.basicservice.service.IBSOssConfigService;
import lombok.RequiredArgsConstructor;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import java.util.Arrays;

/**
 * 对象存储配置Controller
 *
 * @author erahub
 * @author 孤舟烟雨
 * @date 2021-08-13
 */
@Validated
@RequiredArgsConstructor
@RestController
@RequestMapping("/oss/config")
public class BSOssConfigController extends BaseController {

    private final IBSOssConfigService iBSOssConfigService;

    /**
     * 刷新字典缓存
     */
    @SaCheckPermission("basicservice:oss:config:remove")
    @Log(title = "对象存储配置", businessType = BusinessType.CLEAN)
    @DeleteMapping("/init")
    public R<Void> init() {
        iBSOssConfigService.init();
        return R.ok();
    }

    /**
     * 查询对象存储配置列表
     */
    @SaCheckPermission("basicservice:oss:config:list")
    @GetMapping("/list")
    public TableDataInfo<BSOssConfigVo> list(@Validated(QueryGroup.class) BSOssConfigBo bo, PageQuery pageQuery) {
        return iBSOssConfigService.queryPageList(bo, pageQuery);
    }

    /**
     * 获取对象存储配置详细信息
     *
     * @param ossConfigId OSS配置ID
     */
    @SaCheckPermission("basicservice:oss:config:query")
    @GetMapping("/{ossConfigId}")
    public R<BSOssConfigVo> getInfo(@NotNull(message = "主键不能为空") @PathVariable("ossConfigId") Long ossConfigId) {
        return R.ok(iBSOssConfigService.queryById(ossConfigId));
    }

    /**
     * 新增对象存储配置
     */
    @SaCheckPermission("basicservice:oss:config:add")
    @Log(title = "对象存储配置", businessType = BusinessType.INSERT)
    @PostMapping()
    public R<Void> add(@Validated(AddGroup.class) @RequestBody BSOssConfigBo bo) {
        return toAjax(iBSOssConfigService.insertByBo(bo));
    }

    /**
     * 修改对象存储配置
     */
    @SaCheckPermission("basicservice:oss:config:edit")
    @Log(title = "对象存储配置", businessType = BusinessType.UPDATE)
    @PutMapping()
    public R<Void> edit(@Validated(EditGroup.class) @RequestBody BSOssConfigBo bo) {
        return toAjax(iBSOssConfigService.updateByBo(bo));
    }

    /**
     * 删除对象存储配置
     *
     * @param ossConfigIds OSS配置ID串
     */
    @SaCheckPermission("basicservice:oss:config:remove")
    @Log(title = "对象存储配置", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ossConfigIds}")
    public R<Void> remove(@NotEmpty(message = "主键不能为空") @PathVariable Long[] ossConfigIds) {
        return toAjax(iBSOssConfigService.deleteWithValidByIds(Arrays.asList(ossConfigIds), true));
    }

    /**
     * 状态修改
     */
    @SaCheckPermission("basicservice:oss:config:edit")
    @Log(title = "对象存储状态修改", businessType = BusinessType.UPDATE)
    @PutMapping("/changeStatus")
    public R<Void> changeStatus(@RequestBody BSOssConfigBo bo) {
        return toAjax(iBSOssConfigService.updateOssConfigStatus(bo));
    }
}
