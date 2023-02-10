package com.erahub.base.basicservice.dubbo;

import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.collection.ListUtil;
import cn.hutool.core.io.FileUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.erahub.base.basicservice.domain.BSOss;
import com.erahub.base.basicservice.domain.bo.BSOssBo;
import com.erahub.base.basicservice.mapper.BSOssMapper;
import com.erahub.base.basicservice.service.IBSOssService;
import com.erahub.common.core.exception.ServiceException;
import com.erahub.common.core.utils.StringUtils;
import com.erahub.common.oss.core.OssClient;
import com.erahub.common.oss.entity.UploadResult;
import com.erahub.common.oss.factory.OssFactory;
import com.erahub.base.basicservice.api.RemoteFileService;
import com.erahub.base.basicservice.api.domain.BSFile;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.dubbo.config.annotation.DubboService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.io.File;
import java.util.List;
import java.util.stream.Collectors;

/**
 * 文件请求处理
 *
 * @author erahub
 */
@Slf4j
@RequiredArgsConstructor
@Service
@DubboService
public class RemoteFileServiceImpl implements RemoteFileService {

    private final IBSOssService bsOssService;
    private final BSOssMapper bsOssMapper;

    /**
     * 文件上传请求
     */
    @Transactional(rollbackFor = Exception.class)
    @Override
    public BSFile upload(String name, String originalFilename, String contentType, byte[] file, String useField) throws ServiceException {
        try {
            if(StringUtils.isEmpty(useField)){
                throw new ServiceException("请传入使用的表字段");
            }
            String suffix = StringUtils.substring(originalFilename, originalFilename.lastIndexOf("."), originalFilename.length());
            OssClient storage = OssFactory.instance();
            UploadResult uploadResult = storage.uploadSuffix(file, suffix, contentType);
            // 保存文件信息
            BSOssBo oss = new BSOssBo();
            oss.setUseField(useField);
            oss.setUrl(uploadResult.getUrl());
            oss.setFileSuffix(suffix);
            oss.setFileName(uploadResult.getFilename());
            oss.setOriginalName(originalFilename);
            oss.setService(storage.getConfigKey());
            bsOssService.insertByBo(oss);
            BSFile BSFile = new BSFile();
            BSFile.setOssId(oss.getOssId());
            BSFile.setName(uploadResult.getFilename());
            BSFile.setUrl(uploadResult.getUrl());
            return BSFile;
        } catch (Exception e) {
            log.error("上传文件失败", e);
            throw new ServiceException("上传文件失败");
        }
    }

    /**
     * 删除上传文件
     */
    @Transactional(rollbackFor = Exception.class)
    @Override
    public Boolean deleteByUrls(List<String> urls) throws ServiceException {
        try {
            if(CollUtil.isEmpty(urls)){
                return true;
            }

            List<BSOss> list = bsOssMapper.selectList(new LambdaQueryWrapper<BSOss>()
                .in(BSOss::getUrl, urls));

            if(CollUtil.isEmpty(list)){
                return true;
            }

            for (BSOss bSOss : list) {
                OssClient storage = OssFactory.instance(bSOss.getService());
                storage.delete(bSOss.getUrl());
            }

            return bsOssMapper.deleteBatchIds(list.stream()
                .map(BSOss::getOssId)
                .collect(Collectors.toList())) > 0;
        } catch (Exception e) {
            log.error("删除上传文件", e);
            throw new ServiceException("删除上传文件");
        }
    }

    /**
     * 删除上传文件
     */
    @Transactional(rollbackFor = Exception.class)
    @Override
    public Boolean deleteByIds(List<Long> ids) throws ServiceException {
        try {
            List<BSOss> list = bsOssMapper.selectBatchIds(ids);
            for (BSOss bSOss : list) {
                OssClient storage = OssFactory.instance(bSOss.getService());
                storage.delete(bSOss.getUrl());
            }
            return bsOssMapper.deleteBatchIds(ids) > 0;
        } catch (Exception e) {
            log.error("删除上传文件", e);
            throw new ServiceException("删除上传文件");
        }
    }

    @Override
    public void clearTempFiles() throws ServiceException {
        try {
            String dir = System.getProperty("user.dir") + File.separator + "temp_files";
            if (FileUtil.isDirectory(dir)) {
                FileUtil.del(dir);
            }
        } catch (Exception e) {
            log.error("临时文件清理失败", e);
            throw new ServiceException("临时文件清理失败");
        }
    }

    /**
     * 通过ossId查询对应的url
     *
     * @param ossIds ossId串逗号分隔
     * @return url串逗号分隔
     */
    @Override
    public String selectUrlByIds(String ossIds) {
        return bsOssService.selectUrlByIds(ossIds);
    }

}
