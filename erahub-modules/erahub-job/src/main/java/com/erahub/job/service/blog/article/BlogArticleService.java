package com.erahub.job.service.blog.article;

import com.erahub.blog.api.RemoteBlogArticleService;
import com.xxl.job.core.context.XxlJobHelper;
import com.xxl.job.core.handler.annotation.XxlJob;
import lombok.extern.slf4j.Slf4j;
import org.apache.dubbo.config.annotation.DubboReference;
import org.springframework.stereotype.Service;

@Slf4j
@Service
public class BlogArticleService {

    @DubboReference
    private RemoteBlogArticleService remoteBlogArticleService;
    /**
     * 1、临时文件清理任务
     */
    @XxlJob("clearBlogTempFileJobHandler")
    public void clearTempFileJobHandler() throws Exception {
        XxlJobHelper.log("临时文件清理任务开始");
        remoteBlogArticleService.clearTempFiles();
        XxlJobHelper.log("临时文件清理任务结束");
    }
}
