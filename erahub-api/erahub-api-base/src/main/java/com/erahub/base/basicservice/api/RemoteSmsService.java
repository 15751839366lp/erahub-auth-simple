package com.erahub.base.basicservice.api;

import com.erahub.base.basicservice.api.domain.BSSms;
import com.erahub.common.core.exception.ServiceException;

import java.util.Map;

/**
 * 短信服务
 *
 * @author erahub
 */
public interface RemoteSmsService {

    /**
     * 发送短信
     *
     * @param phones     电话号(多个逗号分割)
     * @param templateId 模板id
     * @param param      模板对应参数
     */
    BSSms send(String phones, String templateId, Map<String, String> param) throws ServiceException;

}
