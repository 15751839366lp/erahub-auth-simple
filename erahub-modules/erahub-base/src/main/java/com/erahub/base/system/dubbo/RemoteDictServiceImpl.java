package com.erahub.base.system.dubbo;

import com.erahub.base.system.api.RemoteDictService;
import com.erahub.base.system.api.domain.SysDictData;
import com.erahub.base.system.service.ISysDictTypeService;
import lombok.RequiredArgsConstructor;
import org.apache.dubbo.config.annotation.DubboService;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 字典服务
 *
 * @author erahub
 */
@RequiredArgsConstructor
@Service
@DubboService
public class RemoteDictServiceImpl implements RemoteDictService {

    private final ISysDictTypeService sysDictTypeService;


    @Override
    public List<SysDictData> selectDictDataByType(String dictType) {
        return sysDictTypeService.selectDictDataByType(dictType);
    }

}
