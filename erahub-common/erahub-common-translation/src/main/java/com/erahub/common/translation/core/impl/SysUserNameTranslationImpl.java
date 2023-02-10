package com.erahub.common.translation.core.impl;

import com.erahub.common.translation.annotation.TranslationType;
import com.erahub.common.translation.constant.TransConstant;
import com.erahub.common.translation.core.TranslationInterface;
import com.erahub.base.system.api.RemoteUserService;
import lombok.AllArgsConstructor;
import org.apache.dubbo.config.annotation.DubboReference;
import org.springframework.stereotype.Component;

/**
 * 用户名翻译实现
 *
 * @author Lion Li
 */
@Component
@AllArgsConstructor
@TranslationType(type = TransConstant.SYS_USER_ID_TO_NAME)
public class SysUserNameTranslationImpl implements TranslationInterface {

    @DubboReference
    private RemoteUserService remoteUserService;

    public String translation(Object key, String other) {
        return remoteUserService.selectUserNameById((Long) key);
    }
}
