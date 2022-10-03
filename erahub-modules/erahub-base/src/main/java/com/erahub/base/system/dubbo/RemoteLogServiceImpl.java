package com.erahub.base.system.dubbo;

import com.erahub.base.system.api.RemoteLogService;
import com.erahub.base.system.api.domain.SysLogininfor;
import com.erahub.base.system.api.domain.SysOperLog;
import com.erahub.base.system.service.ISysLogininforService;
import com.erahub.base.system.service.ISysOperLogService;
import lombok.RequiredArgsConstructor;
import org.apache.dubbo.config.annotation.DubboService;
import org.springframework.stereotype.Service;

/**
 * 操作日志记录
 *
 * @author erahub
 */
@RequiredArgsConstructor
@Service
@DubboService
public class RemoteLogServiceImpl implements RemoteLogService {

    private final ISysOperLogService operLogService;
    private final ISysLogininforService logininforService;

    @Override
    public Boolean saveLog(SysOperLog sysOperLog) {
        return operLogService.insertOperlog(sysOperLog) > 0;
    }

    @Override
    public Boolean saveLogininfor(SysLogininfor sysLogininfor) {
        return logininforService.insertLogininfor(sysLogininfor) > 0;
    }
}
