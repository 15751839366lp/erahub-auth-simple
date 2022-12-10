package com.erahub.base.basicservice.service.impl;

import cn.hutool.core.convert.Convert;
import cn.hutool.core.util.ObjectUtil;
import cn.hutool.http.HttpException;
import cn.hutool.http.HttpUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.erahub.common.core.constant.CacheNames;
import com.erahub.common.core.exception.ServiceException;
import com.erahub.common.core.utils.BeanCopyUtils;
import com.erahub.common.core.utils.SpringUtils;
import com.erahub.common.core.utils.StringUtils;
import com.erahub.common.core.utils.file.FileUtils;
import com.erahub.common.mybatis.core.page.PageQuery;
import com.erahub.common.mybatis.core.page.TableDataInfo;
import com.erahub.common.oss.core.OssClient;
import com.erahub.common.oss.entity.UploadResult;
import com.erahub.common.oss.enumd.AccessPolicyType;
import com.erahub.common.oss.factory.OssFactory;
import com.erahub.base.basicservice.domain.BSOss;
import com.erahub.base.basicservice.domain.bo.BSOssBo;
import com.erahub.base.basicservice.domain.vo.BSOssVo;
import com.erahub.base.basicservice.mapper.BSOssMapper;
import com.erahub.base.basicservice.service.IBSOssService;
import lombok.RequiredArgsConstructor;
import org.springframework.cache.annotation.CachePut;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.*;
import java.util.stream.Collectors;

/**
 * 文件上传 服务层实现
 *
 * @author erahub
 */
@RequiredArgsConstructor
@Service
public class BSOssServiceImpl implements IBSOssService {

    private final BSOssMapper baseMapper;

    @Override
    public TableDataInfo<BSOssVo> queryPageList(BSOssBo bo, PageQuery pageQuery) {
        LambdaQueryWrapper<BSOss> lqw = buildQueryWrapper(bo);
        if (StringUtils.isBlank(pageQuery.getOrderByColumn())) {
            pageQuery.setOrderByColumn("create_time");
            pageQuery.setIsAsc("desc");
        }
        Page<BSOssVo> result = baseMapper.selectVoPage(pageQuery.build(), lqw);
        List<BSOssVo> filterResult = result.getRecords().stream().map(this::matchingUrl).collect(Collectors.toList());
        result.setRecords(filterResult);
        return TableDataInfo.build(result);
    }

    @Override
    public List<BSOssVo> listByIds(Collection<Long> ossIds) {
        List<BSOssVo> list = new ArrayList<>();
        for (Long id : ossIds) {
            BSOssVo vo = SpringUtils.getAopProxy(this).getById(id);
            if (ObjectUtil.isNotNull(vo)) {
                list.add(this.matchingUrl(vo));
            }
        }
        return list;
    }

    private LambdaQueryWrapper<BSOss> buildQueryWrapper(BSOssBo bo) {
        Map<String, Object> params = bo.getParams();
        LambdaQueryWrapper<BSOss> lqw = Wrappers.lambdaQuery();
        lqw.like(StringUtils.isNotBlank(bo.getFileName()), BSOss::getFileName, bo.getFileName());
        lqw.like(StringUtils.isNotBlank(bo.getOriginalName()), BSOss::getOriginalName, bo.getOriginalName());
        lqw.eq(StringUtils.isNotBlank(bo.getFileSuffix()), BSOss::getFileSuffix, bo.getFileSuffix());
        lqw.eq(StringUtils.isNotBlank(bo.getUrl()), BSOss::getUrl, bo.getUrl());
        lqw.between(params.get("beginCreateTime") != null && params.get("endCreateTime") != null,
            BSOss::getCreateTime, params.get("beginCreateTime"), params.get("endCreateTime"));
        lqw.eq(StringUtils.isNotBlank(bo.getCreateBy()), BSOss::getCreateBy, bo.getCreateBy());
        lqw.eq(StringUtils.isNotBlank(bo.getService()), BSOss::getService, bo.getService());
        return lqw;
    }

    @Cacheable(cacheNames = CacheNames.SYS_OSS, key = "#ossId")
    @Override
    public BSOssVo getById(Long ossId) {
        return baseMapper.selectVoById(ossId);
    }

    @Override
    public void download(Long ossId, HttpServletResponse response) throws IOException {
        BSOssVo sysOss = this.matchingUrl(SpringUtils.getAopProxy(this).getById(ossId));
        if (ObjectUtil.isNull(sysOss)) {
            throw new ServiceException("文件数据不存在!");
        }
        FileUtils.setAttachmentResponseHeader(response, sysOss.getOriginalName());
        response.setContentType(MediaType.APPLICATION_OCTET_STREAM_VALUE + "; charset=UTF-8");
        long data;
        try {
            data = HttpUtil.download(sysOss.getUrl(), response.getOutputStream(), false);
        } catch (HttpException e) {
            if (e.getMessage().contains("403")) {
                throw new ServiceException("无读取权限, 请在对应的OSS开启'公有读'权限!");
            } else {
                throw new ServiceException(e.getMessage());
            }
        }
        response.setContentLength(Convert.toInt(data));
    }

    @Override
    public BSOssVo upload(MultipartFile file) {
        BSOssVo bsOssVo = new BSOssVo();
        bsOssVo.setOriginalName(file.getOriginalFilename());
        bsOssVo.setFileSuffix(StringUtils.substring(bsOssVo.getOriginalName(),
            bsOssVo.getOriginalName().lastIndexOf("."),
            bsOssVo.getOriginalName().length()));
        bsOssVo.setFileName(UUID.randomUUID().toString().replaceAll("-", "") + bsOssVo.getFileSuffix());
        bsOssVo.setContentType(file.getContentType());

        File tempFile;
        String path = System.getProperty("user.dir");
        try {
            tempFile = FileUtils.writeBytes(file.getBytes(),
                path + File.separator + "temp_files" + File.separator
                + bsOssVo.getFileName());
        } catch (IOException e) {
            throw new ServiceException(e.getMessage());
        }

        return bsOssVo;
    }

    // todo
//    @CachePut(cacheNames = CacheNames.SYS_OSS, key = "")
    @Override
    public Boolean insertByBo(List<BSOssBo> bsOssBos) {
        OssClient storage = OssFactory.instance();
        List<BSOss> osses = new ArrayList<>();

        //循环遍历插入minio
        bsOssBos.forEach(bsOssBo -> {
            String originalfileName = bsOssBo.getOriginalName();
            String suffix = bsOssBo.getFileSuffix();
            String path = System.getProperty("user.dir") + File.separator + "temp_files" + File.separator;

            File file = new File(path + bsOssBo.getFileName());
            if(!file.exists()){
                throw new ServiceException("文件" + bsOssBo.getOriginalName() + "已被清除，请重新上传！");
            }
            UploadResult uploadResult = storage.uploadSuffix(FileUtils.readBytes(file), suffix, bsOssBo.getContentType());

            BSOss oss = new BSOss();
            oss.setUrl(uploadResult.getUrl());
            oss.setFileSuffix(suffix);
            oss.setFileName(uploadResult.getFilename());
            oss.setOriginalName(originalfileName);
            oss.setService(storage.getConfigKey());
            osses.add(oss);
            file.delete();
        });

        // 保存文件信息
        Boolean r = baseMapper.insertBatch(osses);
        List<BSOssVo> bsOssVos = BeanCopyUtils.copyList(osses, BSOssVo.class);
        bsOssVos.forEach(bsOssVo -> {
            this.matchingUrl(bsOssVo);
        });
        return r;
    }

    @Override
    public Boolean deleteWithValidByIds(Collection<Long> ids, Boolean isValid) {
        if (isValid) {
            // 做一些业务上的校验,判断是否需要校验
        }
        List<BSOss> list = baseMapper.selectBatchIds(ids);
        for (BSOss bSOss : list) {
            OssClient storage = OssFactory.instance(bSOss.getService());
            storage.delete(bSOss.getUrl());
        }
        return baseMapper.deleteBatchIds(ids) > 0;
    }

    @Override
    public Boolean deleteTempFilesByFileNames(List<String> fileNames, boolean isValid) {
        if (isValid) {
            // 做一些业务上的校验,判断是否需要校验
        }
        String path = System.getProperty("user.dir") + File.separator + "temp_files" + File.separator;
        fileNames.forEach(fileName -> {
            File file = new File(path + fileName);
            if(file.exists()){
                file.delete();
            }
        });
        return true;
    }

    /**
     * 匹配Url
     *
     * @param oss OSS对象
     * @return oss 匹配Url的OSS对象
     */
    private BSOssVo matchingUrl(BSOssVo oss) {
        OssClient storage = OssFactory.instance(oss.getService());
        /**
         * 仅修改桶类型为 private 的URL，临时URL时长为100s
         */
        if (AccessPolicyType.PRIVATE == storage.getAccessPolicy()) {
            oss.setUrl(storage.getPrivateUrl(oss.getFileName(), 100));
        }
        return oss;
    }
}
