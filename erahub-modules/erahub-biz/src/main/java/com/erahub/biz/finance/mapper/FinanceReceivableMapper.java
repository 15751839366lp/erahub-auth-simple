package com.erahub.biz.finance.mapper;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Constants;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.erahub.biz.finance.domain.bo.FinanceReceivableBo;
import com.erahub.common.mybatis.core.mapper.BaseMapperPlus;
import com.erahub.biz.finance.domain.FinanceReceivable;
import com.erahub.biz.finance.domain.vo.FinanceReceivableVo;
import org.apache.ibatis.annotations.Param;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

/**
 * 应收管理Mapper接口
 *
 * @author erahub
 * @date 2023-02-11
 */
public interface FinanceReceivableMapper extends BaseMapperPlus<FinanceReceivableMapper, FinanceReceivable, FinanceReceivableVo> {

    Page<FinanceReceivable> selectPageFinanceReceivableList(@Param("page") Page<FinanceReceivable> page, @Param(Constants.WRAPPER) Wrapper<FinanceReceivable> queryWrapper);

    List<FinanceReceivable> queryList(@Param(Constants.WRAPPER) QueryWrapper<FinanceReceivable> wrapper);

    FinanceReceivable queryById(Long id);

    List<BigDecimal> selectAllTaxRate();

    List<String> selectAllFinanceProjectResponsiblePerson();

    List<String> selectAllOperationProjectResponsiblePerson();

    Map<String, Object> selectStatisticsData(@Param("param") Map<String, Object> param);

    List<Object> selectArrearageGroupByCompanyName(@Param("param") Map<String, Object> param);

    List<Object> selectArrearageGroupByTaxRate(@Param("param") Map<String, Object> param);

    List<Map<String,Object>> selectArrearageGroupByInvoicingDate(@Param("param") Map<String, Object> param);

    Page<FinanceReceivable> selectPageListByInvoicingMonth(@Param("page") Page<FinanceReceivable> page, @Param(Constants.WRAPPER) Wrapper<FinanceReceivable> queryWrapper, @Param("bo") FinanceReceivableBo bo);

}
