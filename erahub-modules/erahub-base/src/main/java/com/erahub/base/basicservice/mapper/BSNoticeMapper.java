package com.erahub.base.basicservice.mapper;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.toolkit.Constants;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.erahub.base.system.api.domain.SysUser;
import com.erahub.common.mybatis.core.mapper.BaseMapperPlus;
import com.erahub.base.basicservice.domain.BSNotice;
import org.apache.ibatis.annotations.Param;

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

    Page<BSNotice> selectPageNoticeListByIndex(@Param("page") Page<BSNotice> page, @Param(Constants.WRAPPER) Wrapper<BSNotice> queryWrapper);
}
