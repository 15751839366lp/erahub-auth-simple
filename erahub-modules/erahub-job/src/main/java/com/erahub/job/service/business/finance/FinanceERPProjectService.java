package com.erahub.job.service.business.finance;

import com.erahub.biz.finance.api.RemoteFinanceERPProjectService;
import com.xxl.job.core.context.XxlJobHelper;
import com.xxl.job.core.handler.annotation.XxlJob;
import lombok.extern.slf4j.Slf4j;
import org.apache.dubbo.config.annotation.DubboReference;
import org.springframework.stereotype.Service;

@Slf4j
@Service
public class FinanceERPProjectService {

    @DubboReference
    private RemoteFinanceERPProjectService remoteFinanceERPService;

    /**
     * 1、临时文件清理任务
     */
    @XxlJob("clearFinanceERPTempFileJobHandler")
    public void clearTempFileJobHandler() throws Exception {
        XxlJobHelper.log("ERP临时文件清理任务开始");
        remoteFinanceERPService.clearTempFiles();
        XxlJobHelper.log("ERP临时文件清理任务结束");
    }
}
