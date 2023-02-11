package com.erahub.biz.finance.service.impl;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.util.ObjectUtil;
import cn.hutool.core.util.ReflectUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.erahub.biz.finance.domain.excel.FinanceReceivableExport;
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

    private final FinanceReceivableMapper baseMapper;

    /**
     * 查询应收管理
     */
    @Override
    public FinanceReceivableVo queryById(Long receivableId){
        return BeanUtil.copyProperties(baseMapper.queryById(receivableId),FinanceReceivableVo.class);
    }

    /**
     * 查询应收管理列表
     */
    @Override
    public TableDataInfo<FinanceReceivableVo> queryPageList(FinanceReceivableBo bo, PageQuery pageQuery) {
        QueryWrapper<FinanceReceivable> wrapper = buildQueryWrapper(bo);
        Page<FinanceReceivable> result = baseMapper.selectPageFinanceReceivableList(pageQuery.build(), wrapper);
        return TableDataInfo.build(BeanUtil.copyToList(result.getRecords(), FinanceReceivableVo.class));
    }

    /**
     * 查询应收管理列表
     */
    @Override
    public List<FinanceReceivableExport> queryList(FinanceReceivableBo bo) {
        QueryWrapper<FinanceReceivable> wrapper = buildQueryWrapper(bo);
        //重写复制集合对象方法
        return baseMapper.queryList(wrapper).stream().map((FinanceReceivable) -> {
            FinanceReceivableExport export = ReflectUtil.newInstanceIfPossible(FinanceReceivableExport.class);
            BeanUtil.copyProperties(FinanceReceivable,export);
            if(ObjectUtil.isNotEmpty(FinanceReceivable.getCompany())){
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
        wrapper.between(params.get("beginTime") != null && params.get("endTime") != null,
            "bfr.invoicing_date", params.get("beginTime"), params.get("endTime"));
        return wrapper;
    }

    /**
     * 新增应收管理
     */
    @Override
    public Boolean insertByBo(FinanceReceivableBo bo) {
        FinanceReceivable add = BeanUtil.toBean(bo, FinanceReceivable.class);
        validEntityBeforeSave(add);
        boolean flag = baseMapper.insert(add) > 0;
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
        FinanceReceivable update = BeanUtil.toBean(bo, FinanceReceivable.class);
        validEntityBeforeSave(update);
        return baseMapper.updateById(update) > 0;
    }

    /**
     * 保存前的数据校验
     */
    private void validEntityBeforeSave(FinanceReceivable entity){
        //TODO 做一些数据校验,如唯一约束
    }

    /**
     * 批量删除应收管理
     */
    @Override
    public Boolean deleteWithValidByIds(Collection<Long> ids, Boolean isValid) {
        if(isValid){
            //TODO 做一些业务上的校验,判断是否需要校验
        }
        return baseMapper.deleteBatchIds(ids) > 0;
    }
}
