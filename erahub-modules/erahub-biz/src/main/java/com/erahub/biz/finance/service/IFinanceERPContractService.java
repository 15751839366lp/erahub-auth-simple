package com.erahub.biz.finance.service;

import com.erahub.biz.finance.domain.FinanceERPContract;
import com.erahub.biz.finance.domain.vo.FinanceERPContractVo;
import com.erahub.biz.finance.domain.bo.FinanceERPContractBo;
import com.erahub.common.mybatis.core.page.PageQuery;
import com.erahub.common.mybatis.core.page.TableDataInfo;

import java.util.Collection;
import java.util.List;

/**
 * ERP合同Service接口
 *
 * @author erahub
 * @date 2023-02-04
 */
public interface IFinanceERPContractService {

    /**
     * 查询ERP合同
     */
    FinanceERPContractVo queryById(Long contractId);

    /**
     * 查询ERP合同列表
     */
    TableDataInfo<FinanceERPContractVo> queryPageList(FinanceERPContractBo bo, PageQuery pageQuery);

    /**
     * 查询ERP合同列表
     */
    List<FinanceERPContractVo> queryList(FinanceERPContractBo bo);

    /**
     * 修改ERP合同
     */
    Boolean insertByBo(FinanceERPContractBo bo);

    /**
     * 修改ERP合同
     */
    Boolean updateByBo(FinanceERPContractBo bo);

    /**
     * 校验并批量删除ERP合同信息
     */
    Boolean deleteWithValidByIds(Collection<Long> ids, Boolean isValid);
}
