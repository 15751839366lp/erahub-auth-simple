package com.erahub.base.basicservice.mapper;

import com.erahub.base.system.api.domain.SysUser;
import com.erahub.common.mybatis.core.mapper.BaseMapperPlus;
import com.erahub.base.basicservice.domain.BSNotice;

import java.util.List;

/**
 * 通知公告表 数据层
 *
 * @author erahub
 */
public interface BSNoticeMapper extends BaseMapperPlus<BSNoticeMapper, BSNotice, BSNotice> {

    /**
     * 获取最新通知公告列表
     */
    List<BSNotice> getLatestNotice(Integer latestNoticeNumber);
}
