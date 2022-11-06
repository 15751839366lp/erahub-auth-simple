package com.erahub.base.basicservice.runner;

import com.erahub.base.basicservice.service.IBSOssConfigService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.ApplicationArguments;
import org.springframework.boot.ApplicationRunner;
import org.springframework.stereotype.Component;

/**
 * 初始化 system 模块对应业务数据
 *
 * @author erahub
 */
@Slf4j
@RequiredArgsConstructor
@Component
public class ResourceApplicationRunner implements ApplicationRunner {

    private final IBSOssConfigService ossConfigService;

    @Override
    public void run(ApplicationArguments args) throws Exception {
        ossConfigService.init();
        log.info("初始化OSS配置成功");
    }

}
