package com.erahub.biz.finance.service.impl;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.util.ObjectUtil;
import cn.hutool.core.util.ReflectUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.erahub.biz.finance.domain.FinanceCompany;
import com.erahub.biz.finance.domain.excel.FinanceReceivableExport;
import com.erahub.biz.finance.mapper.FinanceCompanyMapper;
import com.erahub.common.core.exception.ServiceException;
import com.erahub.common.core.utils.StringUtils;
import com.erahub.common.mybatis.core.page.PageQuery;
import com.erahub.common.mybatis.core.page.TableDataInfo;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import com.erahub.biz.finance.domain.bo.FinanceReceivableBo;
import com.erahub.biz.finance.domain.vo.FinanceReceivableVo;
import com.erahub.biz.finance.domain.FinanceReceivable;
import com.erahub.biz.finance.mapper.FinanceReceivableMapper;
import com.erahub.biz.finance.service.IFinanceReceivableService;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;
import java.util.Collection;
import java.util.stream.Collectors;

/**
 * 应收管理Service业务层处理
 *
 * @author erahub
 * @date 2023-02-11
 */
@RequiredArgsConstructor
@Service
public class FinanceReceivableServiceImpl implements IFinanceReceivableService {

    private final FinanceReceivableMapper financeReceivableMapper;
    private final FinanceCompanyMapper financeCompanyMapper;

    /**
     * 查询应收管理
     */
    @Override
    public FinanceReceivableVo queryById(Long receivableId) {
        return BeanUtil.copyProperties(financeReceivableMapper.queryById(receivableId), FinanceReceivableVo.class);
    }

    /**
     * 查询应收管理列表
     */
    @Override
    public TableDataInfo<FinanceReceivable> queryPageList(FinanceReceivableBo bo, PageQuery pageQuery) {
        QueryWrapper<FinanceReceivable> wrapper = buildQueryWrapper(bo);
        if (StringUtils.isBlank(pageQuery.getOrderByColumn())) {
            pageQuery.setOrderByColumn("invoicing_date,create_time");
            pageQuery.setIsAsc("desc,desc");
        }
        Page<FinanceReceivable> result = financeReceivableMapper.selectPageFinanceReceivableList(pageQuery.build(), wrapper);
        return TableDataInfo.build(result);
    }

    /**
     * 查询应收管理列表
     */
    @Override
    public List<FinanceReceivableExport> queryList(FinanceReceivableBo bo) {
        QueryWrapper<FinanceReceivable> wrapper = buildQueryWrapper(bo);
        //重写复制集合对象方法
        return financeReceivableMapper.queryList(wrapper).stream().map((FinanceReceivable) -> {
            FinanceReceivableExport export = ReflectUtil.newInstanceIfPossible(FinanceReceivableExport.class);
            BeanUtil.copyProperties(FinanceReceivable, export);
            if (ObjectUtil.isNotEmpty(FinanceReceivable.getCompany())) {
                export.setCompanyName(FinanceReceivable.getCompany().getCompanyName());
                export.setCompanyNumber(FinanceReceivable.getCompany().getCompanyNumber());
            }
            return export;
        }).collect(Collectors.toList());
    }

    private QueryWrapper<FinanceReceivable> buildQueryWrapper(FinanceReceivableBo bo) {
        Map<String, Object> params = bo.getParams();
        QueryWrapper<FinanceReceivable> wrapper = Wrappers.query();
        wrapper.eq(bo.getInvoicingDate() != null, "bfr.invoicing_date", bo.getInvoicingDate());
        wrapper.eq(bo.getCompanyNumber() != null, "bfc.company_number", bo.getCompanyNumber());
        wrapper.like(bo.getCompanyName() != null, "bfc.company_name", bo.getCompanyName());
        wrapper.like(StringUtils.isNotBlank(bo.getProjectNumber()), "bfr.project_number", bo.getProjectNumber());
        wrapper.eq(bo.getIncludingTaxPrice() != null, "bfr.including_tax_price", bo.getIncludingTaxPrice());
        wrapper.eq(bo.getTaxRate() != null, "bfr.tax_rate", bo.getTaxRate());
        wrapper.eq(StringUtils.isNotBlank(bo.getUploadId()), "bfr.upload_id", bo.getUploadId());
        wrapper.eq(StringUtils.isNotBlank(bo.getFinanceProjectResponsiblePerson()), "bfr.finance_project_responsible_person", bo.getFinanceProjectResponsiblePerson());
        wrapper.eq(StringUtils.isNotBlank(bo.getOperationProjectResponsiblePerson()), "bfr.operation_project_responsible_person", bo.getOperationProjectResponsiblePerson());
        wrapper.eq(StringUtils.isNotBlank(bo.getStatus()), "bfr.status", bo.getStatus());
        wrapper.between(params.get("beginTime") != null && params.get("endTime") != null,
            "bfr.invoicing_date", params.get("beginTime"), params.get("endTime"));
        return wrapper;
    }

    /**
     * 新增应收管理
     */
    @Override
    public Boolean insertByBo(FinanceReceivableBo bo) {
        //校验单位
        if (bo.getCompanyNumber() == null && StringUtils.isEmpty(bo.getCompanyName())) {
            throw new ServiceException("请输入单位！");
        }
        FinanceCompany financeCompany = financeCompanyMapper.selectOne(new LambdaQueryWrapper<FinanceCompany>()
            .eq(bo.getCompanyNumber() != null, FinanceCompany::getCompanyNumber, bo.getCompanyNumber())
            .eq(StringUtils.isNotEmpty(bo.getCompanyName()), FinanceCompany::getCompanyName, bo.getCompanyName()));
        FinanceReceivable add = BeanUtil.toBean(bo, FinanceReceivable.class);

        add.setCompany(financeCompany);

        validEntityBeforeSave(add);
        boolean flag = financeReceivableMapper.insert(add) > 0;
        if (flag) {
            bo.setReceivableId(add.getReceivableId());
        }
        return flag;
    }

    /**
     * 修改应收管理
     */
    @Override
    public Boolean updateByBo(FinanceReceivableBo bo) {
        //校验单位
        if (bo.getCompanyNumber() == null && StringUtils.isEmpty(bo.getCompanyName())) {
            throw new ServiceException("请输入单位！");
        }
        FinanceCompany financeCompany = financeCompanyMapper.selectOne(new LambdaQueryWrapper<FinanceCompany>()
            .eq(bo.getCompanyNumber() != null, FinanceCompany::getCompanyNumber, bo.getCompanyNumber())
            .eq(StringUtils.isNotEmpty(bo.getCompanyName()), FinanceCompany::getCompanyName, bo.getCompanyName()));
        FinanceReceivable update = BeanUtil.toBean(bo, FinanceReceivable.class);

        update.setCompany(financeCompany);
        validEntityBeforeSave(update);

        return financeReceivableMapper.updateById(update) > 0;
    }

    /**
     * 保存前的数据校验
     */
    private void validEntityBeforeSave(FinanceReceivable entity) {
        // 单位校验
        FinanceCompany financeCompany = entity.getCompany();
        if (ObjectUtil.isEmpty(financeCompany)) {
            throw new ServiceException("单位不存在！");
        }
        if ("1".equals(financeCompany.getStatus())) {
            throw new ServiceException("单位已禁用！");
        }
        entity.setCompanyId(financeCompany.getCompanyId());

        //校验金额
        BigDecimal includingTaxPrice = entity.getIncludingTaxPrice().setScale(2, BigDecimal.ROUND_HALF_UP);
        BigDecimal taxRate = entity.getTaxRate().setScale(3, BigDecimal.ROUND_HALF_UP);
        BigDecimal excludingTaxPrice = entity.getExcludingTaxPrice().setScale(2, BigDecimal.ROUND_HALF_UP);
        BigDecimal accountPaid =
            entity.getAccountPaid() == null ? BigDecimal.ZERO : entity.getAccountPaid().setScale(2, BigDecimal.ROUND_HALF_UP);
        BigDecimal arrearage =
            entity.getArrearage() == null ? BigDecimal.ZERO : entity.getArrearage().setScale(2, BigDecimal.ROUND_HALF_UP);
        BigDecimal warrantyDeposit =
            entity.getWarrantyDeposit() == null ? BigDecimal.ZERO : entity.getWarrantyDeposit().setScale(2, BigDecimal.ROUND_HALF_UP);
        //计税金额校验
        if (includingTaxPrice.divide(new BigDecimal(1)
                .add(taxRate), 2, BigDecimal.ROUND_HALF_UP)
            .compareTo(excludingTaxPrice) != 0) {
            throw new ServiceException("税额计算有误！");
        }
        //应收金额校验
        if (entity.getArrearage() != null
            && !ObjectUtil.equal(entity.getArrearage(), includingTaxPrice.subtract(accountPaid).subtract(warrantyDeposit))
        ) {
            throw new ServiceException("应收余额有误！");
        }

        arrearage = includingTaxPrice.subtract(accountPaid).subtract(warrantyDeposit);
        entity.setAccountPaid(accountPaid);
        entity.setArrearage(arrearage);
        entity.setWarrantyDeposit(warrantyDeposit);
    }

    /**
     * 批量删除应收管理
     */
    @Override
    public Boolean deleteWithValidByIds(Collection<Long> ids, Boolean isValid) {
        if (isValid) {
            //TODO 做一些业务上的校验,判断是否需要校验
        }
        return financeReceivableMapper.deleteBatchIds(ids) > 0;
    }

    @Override
    public List<BigDecimal> selectAllTaxRate() {
        return financeReceivableMapper.selectAllTaxRate();
    }

    @Override
    public List<String> selectAllFinanceProjectResponsiblePerson() {
        return financeReceivableMapper.selectAllFinanceProjectResponsiblePerson();
    }

    @Override
    public List<String> selectAllOperationProjectResponsiblePerson() {
        return financeReceivableMapper.selectAllOperationProjectResponsiblePerson();
    }

    @Override
    public Map<String,Object> selectStatisticsData(Map<String, Object> param) {
        Map<String, Object> stringObjectMap = financeReceivableMapper.selectStatisticsData(param);
        return financeReceivableMapper.selectStatisticsData(param);
    }

    @Override
    public List<Object> selectArrearageGroupByCompanyName(Map<String,Object> param) {
        return financeReceivableMapper.selectArrearageGroupByCompanyName(param);
    }


}
