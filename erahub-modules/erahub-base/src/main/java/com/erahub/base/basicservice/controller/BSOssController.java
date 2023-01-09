package com.erahub.base.basicservice.controller;


import cn.dev33.satoken.annotation.SaCheckPermission;
import cn.hutool.core.convert.Convert;
import cn.hutool.core.util.ObjectUtil;
import cn.hutool.http.HttpException;
import cn.hutool.http.HttpUtil;
import com.erahub.base.basicservice.domain.bo.BSOssBo;
import com.erahub.base.basicservice.domain.vo.BSOssVo;
import com.erahub.base.basicservice.service.IBSOssService;
import com.erahub.common.core.domain.R;
import com.erahub.common.core.exception.ServiceException;
import com.erahub.common.core.utils.file.FileUtils;
import com.erahub.common.core.validate.QueryGroup;
import com.erahub.common.core.web.controller.BaseController;
import com.erahub.common.log.annotation.Log;
import com.erahub.common.log.enums.BusinessType;
import com.erahub.common.mybatis.core.page.PageQuery;
import com.erahub.common.mybatis.core.page.TableDataInfo;
import com.erahub.base.basicservice.domain.BSOss;
import lombok.RequiredArgsConstructor;
import org.springframework.http.MediaType;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import javax.validation.constraints.NotEmpty;
import java.io.IOException;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 文件上传 控制层
 *
 * @author erahub
 */
@Validated
@RequiredArgsConstructor
@RestController
@RequestMapping("/oss")
public class BSOssController extends BaseController {

    private final IBSOssService iBSOssService;

    /**
     * 查询OSS对象存储列表
     */
    @SaCheckPermission("basicservice:oss:list")
    @GetMapping("/list")
    public TableDataInfo<BSOssVo> list(@Validated(QueryGroup.class) BSOssBo bo, PageQuery pageQuery) {
        return iBSOssService.queryPageList(bo, pageQuery);
    }

    /**
     * 查询OSS对象基于id串
     *
     * @param ossIds OSS对象ID串
     */
    @SaCheckPermission("basicservice:oss:list")
    @GetMapping("/listByIds/{ossIds}")
    public R<List<BSOssVo>> listByIds(@NotEmpty(message = "主键不能为空") @PathVariable Long[] ossIds) {
        List<BSOssVo> list = iBSOssService.listByIds(Arrays.asList(ossIds));
        return R.ok(list);
    }

    /**
     * 上传临时文件
     *
     * @param file 文件
     */
    @SaCheckPermission("basicservice:oss:upload")
    @Log(title = "OSS对象存储", businessType = BusinessType.IMPORT)
    @PostMapping(value = "/upload", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public R<BSOssVo> upload(@RequestPart("file") MultipartFile file) throws IOException {
        if (ObjectUtil.isNull(file)) {
            throw new ServiceException("上传文件不能为空");
        }
        BSOssVo oss = iBSOssService.upload(file);
        return R.ok(oss);
    }

    /**
     * 上传OSS对象存储
     *
     * @param bsOssBos 文件数据
     */
    @SaCheckPermission("basicservice:oss:upload")
    @Log(title = "OSS对象存储", businessType = BusinessType.IMPORT)
    @PostMapping("/addOssBatch")
    public R<Void> insertBatch(@Validated @RequestBody List<BSOssBo> bsOssBos) {
        return toAjax(iBSOssService.insertByBo(bsOssBos));
    }

    /**
     * 下载OSS对象存储
     *
     * @param ossId OSS对象ID
     */
    @SaCheckPermission("basicservice:oss:download")
    @GetMapping("/download/{ossId}")
    public void download(@PathVariable Long ossId, HttpServletResponse response) throws IOException {
        iBSOssService.download(ossId, response);
    }

    /**
     * 删除OSS对象存储
     *
     * @param ossIds OSS对象ID串
     */
    @SaCheckPermission("basicservice:oss:remove")
    @Log(title = "OSS对象存储", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ossIds}")
    public R<Void> remove(@NotEmpty(message = "主键不能为空") @PathVariable Long[] ossIds) {
        return toAjax(iBSOssService.deleteWithValidByIds(Arrays.asList(ossIds), true));
    }

    /**
     * 删除临时文件
     *
     * @param fileNames 临时文件名称
     */
    @SaCheckPermission("basicservice:oss:remove")
    @Log(title = "OSS对象存储", businessType = BusinessType.DELETE)
    @DeleteMapping("/removeTempFiles/{fileNames}")
    public R<Void> removeTempFiles(@NotEmpty(message = "路径不能为空") @PathVariable String[] fileNames) {
        return toAjax(iBSOssService.deleteTempFilesByFileNames(Arrays.asList(fileNames), true));
    }

}
