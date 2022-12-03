package com.erahub.base.basicservice.api;

import com.erahub.common.core.exception.ServiceException;
import com.erahub.base.basicservice.api.domain.BSFile;

import java.util.List;

/**
 * 文件服务
 *
 * @author erahub
 */
public interface RemoteFileService {

    /**
     * 上传文件
     *
     * @param file 文件信息
     * @return 结果
     */
    BSFile upload(String name, String originalFilename, String contentType, byte[] file) throws ServiceException;

    /**
     * 删除上传文件
     */
    Boolean deleteByUrls(List<String> urls) throws ServiceException;

    /**
     * 删除上传文件
     */
    Boolean deleteByIds(List<Long> ids) throws ServiceException;

    /**
     * 清理临时文件
     *
     * @return 结果
     */
    void clearTempFiles() throws ServiceException;
}
