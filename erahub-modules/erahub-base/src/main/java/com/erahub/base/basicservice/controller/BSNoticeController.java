package com.erahub.base.basicservice.controller;

import cn.dev33.satoken.annotation.SaCheckPermission;
import com.erahub.base.basicservice.domain.bo.BSNoticeBo;
import com.erahub.base.basicservice.domain.vo.BSNoticeVo;
import com.erahub.common.core.domain.R;
import com.erahub.common.core.web.controller.BaseController;
import com.erahub.common.log.annotation.Log;
import com.erahub.common.log.enums.BusinessType;
import com.erahub.common.mybatis.core.page.PageQuery;
import com.erahub.common.mybatis.core.page.TableDataInfo;
import com.erahub.base.basicservice.domain.BSNotice;
import com.erahub.base.basicservice.service.IBSNoticeService;
import lombok.RequiredArgsConstructor;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 公告 信息操作处理
 *
 * @author erahub
 */
@Validated
@RequiredArgsConstructor
@RestController
@RequestMapping("/notice")
public class BSNoticeController extends BaseController {

    private final IBSNoticeService noticeService;

    /**
     * 获取通知公告列表
     */
    @SaCheckPermission("basicservice:notice:list")
    @GetMapping("/list")
    public TableDataInfo<BSNotice> list(BSNotice notice, PageQuery pageQuery) {
        return noticeService.selectPageNoticeList(notice, pageQuery);
    }

    /**
     * 获取最新通知公告列表
     */
    @GetMapping("/getLatestNotice/{latestNoticeNumber}")
    public List<BSNoticeVo> getLatestNotice(@PathVariable Integer latestNoticeNumber) {
        return noticeService.getLatestNotice(latestNoticeNumber);
    }

    /**
     * 根据通知公告编号获取详细信息
     *
     * @param noticeId 通知ID
     */
    @SaCheckPermission("basicservice:notice:query")
    @GetMapping(value = "/{noticeId}")
    public R<BSNotice> getInfo(@PathVariable Long noticeId) {
        return R.ok(noticeService.selectNoticeById(noticeId));
    }

    /**
     * 新增通知公告
     */
    @SaCheckPermission("basicservice:notice:add")
    @Log(title = "通知公告", businessType = BusinessType.INSERT)
    @PostMapping
    public R<Void> add(@Validated @RequestBody BSNotice notice) {
        return toAjax(noticeService.insertNotice(notice));
    }

    /**
     * 修改通知公告
     */
    @SaCheckPermission("basicservice:notice:edit")
    @Log(title = "通知公告", businessType = BusinessType.UPDATE)
    @PutMapping
    public R<Void> edit(@Validated @RequestBody BSNotice notice) {
        return toAjax(noticeService.updateNotice(notice));
    }

    /**
     * 删除通知公告
     *
     * @param noticeIds 通知ID串
     */
    @SaCheckPermission("basicservice:notice:remove")
    @Log(title = "通知公告", businessType = BusinessType.DELETE)
    @DeleteMapping("/{noticeIds}")
    public R<Void> remove(@PathVariable Long[] noticeIds) {
        return toAjax(noticeService.deleteNoticeByIds(noticeIds));
    }
}
