package com.erahub.biz.finance.service;

import com.erahub.biz.finance.domain.FinanceCompany;
import com.erahub.biz.finance.domain.vo.FinanceCompanyVo;
import com.erahub.biz.finance.domain.bo.FinanceCompanyBo;
import com.erahub.common.mybatis.core.page.PageQuery;
import com.erahub.common.mybatis.core.page.TableDataInfo;

import java.util.Collection;
import java.util.List;

/**
 * 单位管理Service接口
 *
 * @author erahub
 * @date 2023-02-11
 */
public interface IFinanceCompanyService {

    /**
     * 查询单位管理
     */
    FinanceCompanyVo queryById(Long companyId);

    /**
     * 查询单位管理列表
     */
    TableDataInfo<FinanceCompanyVo> queryPageList(FinanceCompanyBo bo, PageQuery pageQuery);

    /**
     * 查询单位管理列表
     */
    List<FinanceCompanyVo> queryList(FinanceCompanyBo bo);

    /**
     * 修改单位管理
     */
    Boolean insertByBo(FinanceCompanyBo bo);

    /**
     * 修改单位管理
     */
    Boolean updateByBo(FinanceCompanyBo bo);

    /**
     * 校验并批量删除单位管理信息
     */
    Boolean deleteWithValidByIds(Collection<Long> ids, Boolean isValid);
}
