package com.erahub.base.basicservice.dubbo;

import cn.hutool.core.io.FileUtil;
import com.erahub.base.basicservice.domain.BSOss;
import com.erahub.base.basicservice.mapper.BSOssMapper;
import com.erahub.common.core.exception.ServiceException;
import com.erahub.common.core.utils.StringUtils;
import com.erahub.common.oss.core.OssClient;
import com.erahub.common.oss.entity.UploadResult;
import com.erahub.common.oss.factory.OssFactory;
import com.erahub.base.basicservice.api.RemoteFileService;
import com.erahub.base.basicservice.api.domain.BSFile;
import lombok.extern.slf4j.Slf4j;
import org.apache.dubbo.config.annotation.DubboService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.io.File;

/**
 * 文件请求处理
 *
 * @author erahub
 */
@Slf4j
@Service
@DubboService
public class RemoteFileServiceImpl implements RemoteFileService {

    @Autowired
    private BSOssMapper bSOssMapper;

    /**
     * 文件上传请求
     */
    @Transactional(rollbackFor = Exception.class)
    @Override
    public BSFile upload(String name, String originalFilename, String contentType, byte[] file) throws ServiceException {
        try {
            String suffix = StringUtils.substring(originalFilename, originalFilename.lastIndexOf("."), originalFilename.length());
            OssClient storage = OssFactory.instance();
            UploadResult uploadResult = storage.uploadSuffix(file, suffix, contentType);
            // 保存文件信息
            BSOss oss = new BSOss();
            oss.setUrl(uploadResult.getUrl());
            oss.setFileSuffix(suffix);
            oss.setFileName(uploadResult.getFilename());
            oss.setOriginalName(originalFilename);
            oss.setService(storage.getConfigKey());
            bSOssMapper.insert(oss);
            BSFile BSFile = new BSFile();
            BSFile.setName(uploadResult.getFilename());
            BSFile.setUrl(uploadResult.getUrl());
            return BSFile;
        } catch (Exception e) {
            log.error("上传文件失败", e);
            throw new ServiceException("上传文件失败");
        }
    }

    @Override
    public void clearTempFiles() throws ServiceException {
        try {
            String dir = System.getProperty("user.dir") + File.separator + "temp_files";
            if(FileUtil.isDirectory(dir)){
                FileUtil.del(dir);
            }
        } catch (Exception e) {
            log.error("临时文件清理失败", e);
            throw new ServiceException("临时文件清理失败");
        }
    }
}
