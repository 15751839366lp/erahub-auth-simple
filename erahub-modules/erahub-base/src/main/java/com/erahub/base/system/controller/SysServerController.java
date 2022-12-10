package com.erahub.base.system.controller;

import cn.dev33.satoken.annotation.SaCheckPermission;
import com.erahub.common.core.server.domain.AjaxResult;
import com.erahub.common.core.server.domain.Server;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;


/**
 * 服务器监控
 *
 * @author erahub
 */
@Validated
@RestController
@RequestMapping("/server")
public class SysServerController
{
    @SaCheckPermission("monitor:server:list")
    @GetMapping()
    public AjaxResult getInfo() throws Exception
    {
        Server server = new Server();
        server.copyTo();
        return AjaxResult.success(server);
    }
}
