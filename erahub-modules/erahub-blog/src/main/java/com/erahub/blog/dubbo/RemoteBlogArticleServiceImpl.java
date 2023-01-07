package com.erahub.blog.dubbo;

import cn.hutool.core.io.FileUtil;
import com.erahub.blog.api.RemoteBlogArticleService;
import com.erahub.common.core.exception.ServiceException;
import lombok.extern.slf4j.Slf4j;
import org.apache.dubbo.config.annotation.DubboService;
import org.springframework.stereotype.Service;

import java.io.File;

import static com.erahub.common.mybatis.core.mapper.BaseMapperPlus.log;

@Slf4j
@Service
@DubboService
public class RemoteBlogArticleServiceImpl implements RemoteBlogArticleService {
    @Override
    public void clearTempFiles() throws ServiceException {
        try {
            String dir = System.getProperty("user.dir") + File.separator + "temp_files";
            if (FileUtil.isDirectory(dir)) {
                FileUtil.del(dir);
            }
        } catch (Exception e) {
            log.error("临时文件清理失败", e);
            throw new ServiceException("临时文件清理失败");
        }
    }
}
