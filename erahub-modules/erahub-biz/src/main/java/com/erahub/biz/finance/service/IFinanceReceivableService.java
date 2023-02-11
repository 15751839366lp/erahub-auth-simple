package com.erahub.biz.finance.service;

import com.erahub.biz.finance.domain.FinanceReceivable;
import com.erahub.biz.finance.domain.excel.FinanceReceivableExport;
import com.erahub.biz.finance.domain.vo.FinanceReceivableVo;
import com.erahub.biz.finance.domain.bo.FinanceReceivableBo;
import com.erahub.common.mybatis.core.page.PageQuery;
import com.erahub.common.mybatis.core.page.TableDataInfo;

import java.util.Collection;
import java.util.List;

/**
 * 应收管理Service接口
 *
 * @author erahub
 * @date 2023-02-11
 */
public interface IFinanceReceivableService {

    /**
     * 查询应收管理
     */
    FinanceReceivableVo queryById(Long receivableId);

    /**
     * 查询应收管理列表
     */
    TableDataInfo<FinanceReceivableVo> queryPageList(FinanceReceivableBo bo, PageQuery pageQuery);

    /**
     * 查询应收管理列表
     */
    List<FinanceReceivableExport> queryList(FinanceReceivableBo bo);

    /**
     * 修改应收管理
     */
    Boolean insertByBo(FinanceReceivableBo bo);

    /**
     * 修改应收管理
     */
    Boolean updateByBo(FinanceReceivableBo bo);

    /**
     * 校验并批量删除应收管理信息
     */
    Boolean deleteWithValidByIds(Collection<Long> ids, Boolean isValid);
}
