package com.erahub.job.service.base.oss;

import com.erahub.base.basicservice.api.RemoteFileService;
import com.xxl.job.core.context.XxlJobHelper;
import com.xxl.job.core.handler.annotation.XxlJob;
import lombok.extern.slf4j.Slf4j;
import org.apache.dubbo.config.annotation.DubboReference;
import org.springframework.stereotype.Service;

import java.util.concurrent.TimeUnit;

@Slf4j
@Service
public class OssService {

    @DubboReference
    private RemoteFileService remoteFileService;

    /**
     * 1、临时文件清理任务
     */
    @XxlJob("clearTempFileJobHandler")
    public void clearTempFileJobHandler() throws Exception {
        XxlJobHelper.log("临时文件清理任务开始");
        remoteFileService.clearTempFiles();
        XxlJobHelper.log("临时文件清理任务结束");
    }
}
