package com.erahub.common.translation.core.impl;

import com.erahub.common.core.service.DictService;
import com.erahub.common.core.utils.StringUtils;
import com.erahub.common.translation.annotation.TranslationType;
import com.erahub.common.translation.constant.TransConstant;
import com.erahub.common.translation.core.TranslationInterface;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Component;

/**
 * 字典翻译实现
 *
 * @author Lion Li
 */
@Component
@AllArgsConstructor
@TranslationType(type = TransConstant.SYS_DICT_TYPE_TO_LABEL)
public class SysDictTypeTranslationImpl implements TranslationInterface {

    private final DictService dictService;

    public String translation(Object key, String other) {
        if (key instanceof String && StringUtils.isNotBlank(other)) {
            return dictService.getDictLabel(other, key.toString());
        }
        return null;
    }
}
