package com.erahub.common.translation.core.impl;

import com.erahub.common.translation.annotation.TranslationType;
import com.erahub.common.translation.constant.TransConstant;
import com.erahub.common.translation.core.TranslationInterface;
import com.erahub.base.basicservice.api.RemoteFileService;
import lombok.AllArgsConstructor;
import org.apache.dubbo.config.annotation.DubboReference;
import org.springframework.stereotype.Component;

/**
 * OSS翻译实现
 *
 * @author Lion Li
 */
@Component
@AllArgsConstructor
@TranslationType(type = TransConstant.BS_OSS_ID_TO_URL)
public class BsOssUrlTranslationImpl implements TranslationInterface {

    @DubboReference
    private RemoteFileService ossService;

    public String translation(Object key, String other) {
        return ossService.selectUrlByIds(key.toString());
    }
}
