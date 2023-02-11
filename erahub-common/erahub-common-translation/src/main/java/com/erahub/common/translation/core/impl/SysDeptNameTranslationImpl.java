package com.erahub.common.translation.core.impl;

import com.erahub.common.translation.annotation.TranslationType;
import com.erahub.common.translation.constant.TransConstant;
import com.erahub.common.translation.core.TranslationInterface;
import com.erahub.base.system.api.RemoteDeptService;
import lombok.AllArgsConstructor;
import org.apache.dubbo.config.annotation.DubboReference;
import org.springframework.stereotype.Component;

/**
 * 部门翻译实现
 *
 * @author Lion Li
 */
@Component
@AllArgsConstructor
@TranslationType(type = TransConstant.SYS_DEPT_ID_TO_NAME)
public class SysDeptNameTranslationImpl implements TranslationInterface {

    @DubboReference
    private RemoteDeptService remoteDeptService;

    public String translation(Object key, String other) {
        return remoteDeptService.selectDeptNameByIds(key.toString());
    }
}