package com.erahub.business.finance.api;

import com.erahub.common.core.exception.ServiceException;

import java.util.List;

/**
 * 文件服务
 *
 * @author erahub
 */
public interface RemoteFinanceERPService {


    /**
     * 清理临时文件
     *
     * @return 结果
     */
    void clearTempFiles() throws ServiceException;
}
