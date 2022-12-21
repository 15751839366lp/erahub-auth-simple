package com.erahub.business;

import org.apache.dubbo.config.spring.context.annotation.EnableDubbo;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.context.metrics.buffering.BufferingApplicationStartup;

/**
 * 任务调度模块
 *
 * @author erahub
 */
@EnableDubbo
@SpringBootApplication
public class ErahubBusinessApplication {

    public static void main(String[] args) {
        SpringApplication application = new SpringApplication(ErahubBusinessApplication.class);
        application.setApplicationStartup(new BufferingApplicationStartup(2048));
        application.run(args);
        System.out.println("(♥◠‿◠)ﾉﾞ  博客系统模块启动成功   ლ(´ڡ`ლ)ﾞ  ");
    }

}
