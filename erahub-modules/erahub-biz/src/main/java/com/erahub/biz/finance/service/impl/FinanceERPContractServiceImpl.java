package com.erahub.biz.finance.service.impl;

import cn.hutool.core.bean.BeanUtil;
import com.baomidou.mybatisplus.core.conditions.update.LambdaUpdateWrapper;
import com.erahub.common.core.exception.ServiceException;
import com.erahub.common.core.utils.StringUtils;
import com.erahub.common.mybatis.core.page.PageQuery;
import com.erahub.common.mybatis.core.page.TableDataInfo;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import com.erahub.biz.finance.domain.bo.FinanceERPContractBo;
import com.erahub.biz.finance.domain.vo.FinanceERPContractVo;
import com.erahub.biz.finance.domain.FinanceERPContract;
import com.erahub.biz.finance.mapper.FinanceERPContractMapper;
import com.erahub.biz.finance.service.IFinanceERPContractService;

import java.util.List;
import java.util.Map;
import java.util.Collection;

/**
 * ERP合同Service业务层处理
 *
 * @author erahub
 * @date 2023-02-04
 */
@RequiredArgsConstructor
@Service
public class FinanceERPContractServiceImpl implements IFinanceERPContractService {

    private final FinanceERPContractMapper baseMapper;

    /**
     * 查询ERP合同
     */
    @Override
    public FinanceERPContractVo queryById(Long contractId){
        return baseMapper.selectVoById(contractId);
    }

    /**
     * 查询ERP合同列表
     */
    @Override
    public TableDataInfo<FinanceERPContractVo> queryPageList(FinanceERPContractBo bo, PageQuery pageQuery) {
        LambdaQueryWrapper<FinanceERPContract> lqw = buildQueryWrapper(bo);
        Page<FinanceERPContractVo> result = baseMapper.selectVoPage(pageQuery.build(), lqw);
        return TableDataInfo.build(result);
    }

    /**
     * 查询ERP合同列表
     */
    @Override
    public List<FinanceERPContractVo> queryList(FinanceERPContractBo bo) {
        LambdaQueryWrapper<FinanceERPContract> lqw = buildQueryWrapper(bo);
        return baseMapper.selectVoList(lqw);
    }

    private LambdaQueryWrapper<FinanceERPContract> buildQueryWrapper(FinanceERPContractBo bo) {
        Map<String, Object> params = bo.getParams();
        LambdaQueryWrapper<FinanceERPContract> lqw = Wrappers.lambdaQuery();
        lqw.like(StringUtils.isNotBlank(bo.getContractType()), FinanceERPContract::getContractType, bo.getContractType());
        lqw.like(StringUtils.isNotBlank(bo.getContractNumber()), FinanceERPContract::getContractNumber, bo.getContractNumber());
        lqw.like(StringUtils.isNotBlank(bo.getCompany()), FinanceERPContract::getCompany, bo.getCompany());
        lqw.like(StringUtils.isNotBlank(bo.getContractRange()), FinanceERPContract::getContractRange, bo.getContractRange());
        return lqw;
    }

    /**
     * 新增ERP合同
     */
    @Override
    public Boolean insertByBo(FinanceERPContractBo bo) {
        if(baseMapper.exists(new LambdaUpdateWrapper<FinanceERPContract>()
            .eq(FinanceERPContract::getContractNumber, bo.getContractNumber()))
        ){
            throw new ServiceException("合同编号已存在！");
        }
        FinanceERPContract add = BeanUtil.toBean(bo, FinanceERPContract.class);
        validEntityBeforeSave(add);
        boolean flag = baseMapper.insert(add) > 0;
        if (flag) {
            bo.setContractId(add.getContractId());
        }
        return flag;
    }

    /**
     * 修改ERP合同
     */
    @Override
    public Boolean updateByBo(FinanceERPContractBo bo) {
        FinanceERPContract update = BeanUtil.toBean(bo, FinanceERPContract.class);
        validEntityBeforeSave(update);
        return baseMapper.updateById(update) > 0;
    }

    /**
     * 保存前的数据校验
     */
    private void validEntityBeforeSave(FinanceERPContract entity){
        //TODO 做一些数据校验,如唯一约束
    }

    /**
     * 批量删除ERP合同
     */
    @Override
    public Boolean deleteWithValidByIds(Collection<Long> ids, Boolean isValid) {
        if(isValid){
            //TODO 做一些业务上的校验,判断是否需要校验
        }
        return baseMapper.deleteBatchIds(ids) > 0;
    }
}