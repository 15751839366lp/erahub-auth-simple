package com.erahub.base.basicservice.service;

import com.erahub.base.basicservice.domain.vo.BSMailAccountVo;
import com.erahub.base.basicservice.domain.bo.BSMailAccountBo;
import com.erahub.common.mybatis.core.page.PageQuery;
import com.erahub.common.mybatis.core.page.TableDataInfo;

import java.util.Collection;
import java.util.List;

/**
 * 邮件账号Service接口
 *
 * @author erahub
 * @date 2023-01-23
 */
public interface IBSMailAccountService {

    /**
     * 查询邮件账号
     */
    BSMailAccountVo queryById(Long mailAccountId);

    /**
     * 查询邮件账号列表
     */
    TableDataInfo<BSMailAccountVo> queryPageList(BSMailAccountBo bo, PageQuery pageQuery);

    /**
     * 查询邮件账号列表
     */
    List<BSMailAccountVo> queryList(BSMailAccountBo bo);

    /**
     * 修改邮件账号
     */
    Boolean insertByBo(BSMailAccountBo bo);

    /**
     * 修改邮件账号
     */
    Boolean updateByBo(BSMailAccountBo bo);

    /**
     * 校验并批量删除邮件账号信息
     */
    Boolean deleteWithValidByIds(Collection<Long> ids, Boolean isValid);
}
