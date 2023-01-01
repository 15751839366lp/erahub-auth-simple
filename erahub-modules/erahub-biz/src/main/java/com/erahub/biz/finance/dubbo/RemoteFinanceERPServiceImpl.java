package com.erahub.biz.finance.dubbo;

import cn.hutool.core.io.FileUtil;
import com.erahub.biz.finance.api.RemoteFinanceERPService;
import com.erahub.common.core.exception.ServiceException;
import lombok.extern.slf4j.Slf4j;
import org.apache.dubbo.config.annotation.DubboService;
import org.springframework.stereotype.Service;

import java.io.File;

/**
 * 文件请求处理
 *
 * @author erahub
 */
@Slf4j
@Service
@DubboService
public class RemoteFinanceERPServiceImpl implements RemoteFinanceERPService {

    @Override
    public void clearTempFiles() throws ServiceException {
        try {
            String dir = System.getProperty("user.dir") + File.separator + "temp_files"
                + File.separator + "finance" + File.separator + "erp";
            if (FileUtil.isDirectory(dir)) {
                FileUtil.del(dir);
            }
        } catch (Exception e) {
            log.error("ERP临时文件清理失败", e);
            throw new ServiceException("ERP临时文件清理失败");
        }
    }
}
