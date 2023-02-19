package com.erahub.biz.finance.service;

import com.erahub.biz.finance.domain.FinanceReceivable;
import com.erahub.biz.finance.domain.excel.FinanceReceivableExport;
import com.erahub.biz.finance.domain.vo.FinanceReceivableVo;
import com.erahub.biz.finance.domain.bo.FinanceReceivableBo;
import com.erahub.common.mybatis.core.page.PageQuery;
import com.erahub.common.mybatis.core.page.TableDataInfo;

import java.math.BigDecimal;
import java.util.Collection;
import java.util.List;
import java.util.Map;

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
    TableDataInfo<FinanceReceivable> queryPageList(FinanceReceivableBo bo, PageQuery pageQuery);

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

    /**
     * 获取所有税率
     */
    List<BigDecimal> selectAllTaxRate();

    /**
     * 获取所有财务部项目负责人
     */
    List<String> selectAllFinanceProjectResponsiblePerson();

    /**
     * 获取所有经营部项目负责人
     */
    List<String> selectAllOperationProjectResponsiblePerson();

    Map<String,Object> selectStatisticsData(Map<String, Object> param);

    List<Object> selectArrearageGroupByCompanyName(Map<String,Object> param);

    List<Object> selectArrearageGroupByTaxRate(Map<String,Object> param);

    List<Object> selectArrearageGroupByInvoicingDate(Map<String,Object> param);

    TableDataInfo<FinanceReceivable> queryPageListByInvoicingMonth(FinanceReceivableBo bo, PageQuery pageQuery);

}
