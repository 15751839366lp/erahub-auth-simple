package com.erahub.blog.api;

import com.erahub.common.core.exception.ServiceException;

public interface RemoteBlogArticleService {
    /**
     * 清理临时文件
     *
     * @return 结果
     */
    void clearTempFiles() throws ServiceException;
}
