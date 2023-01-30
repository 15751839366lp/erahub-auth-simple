package com.erahub.base.basicservice.service;

import com.erahub.base.basicservice.domain.vo.BSMailRecordVo;
import com.erahub.base.basicservice.domain.bo.BSMailRecordBo;
import com.erahub.common.mybatis.core.page.PageQuery;
import com.erahub.common.mybatis.core.page.TableDataInfo;

import java.util.Collection;
import java.util.List;

/**
 * 邮件记录Service接口
 *
 * @author erahub
 * @date 2023-01-23
 */
public interface IBSMailRecordService {

    /**
     * 查询邮件记录
     */
    BSMailRecordVo queryById(Long mailRecordId);

    /**
     * 查询邮件记录列表
     */
    TableDataInfo<BSMailRecordVo> queryPageList(BSMailRecordBo bo, PageQuery pageQuery);

    /**
     * 查询邮件记录列表
     */
    List<BSMailRecordVo> queryList(BSMailRecordBo bo);

    /**
     * 修改邮件记录
     */
    Boolean send(BSMailRecordBo bo);

    /**
     * 校验并批量删除邮件记录信息
     */
    Boolean deleteWithValidByIds(Collection<Long> ids, Boolean isValid);
}
