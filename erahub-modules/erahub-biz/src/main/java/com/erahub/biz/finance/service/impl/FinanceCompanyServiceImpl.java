package com.erahub.biz.finance.service.impl;

import cn.hutool.core.bean.BeanUtil;
import com.erahub.biz.finance.domain.FinanceReceivable;
import com.erahub.biz.finance.mapper.FinanceReceivableMapper;
import com.erahub.common.core.exception.ServiceException;
import com.erahub.common.core.utils.StringUtils;
import com.erahub.common.mybatis.core.page.PageQuery;
import com.erahub.common.mybatis.core.page.TableDataInfo;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import com.erahub.biz.finance.domain.bo.FinanceCompanyBo;
import com.erahub.biz.finance.domain.vo.FinanceCompanyVo;
import com.erahub.biz.finance.domain.FinanceCompany;
import com.erahub.biz.finance.mapper.FinanceCompanyMapper;
import com.erahub.biz.finance.service.IFinanceCompanyService;

import java.util.List;
import java.util.Map;
import java.util.Collection;

/**
 * 单位管理Service业务层处理
 *
 * @author erahub
 * @date 2023-02-11
 */
@RequiredArgsConstructor
@Service
public class FinanceCompanyServiceImpl implements IFinanceCompanyService {

    private final FinanceCompanyMapper financeCompanyMapper;
    private final FinanceReceivableMapper financeReceivableMapper;

    /**
     * 查询单位管理
     */
    @Override
    public FinanceCompanyVo queryById(Long companyId) {
        return financeCompanyMapper.selectVoById(companyId);
    }

    /**
     * 查询单位管理列表
     */
    @Override
    public TableDataInfo<FinanceCompanyVo> queryPageList(FinanceCompanyBo bo, PageQuery pageQuery) {
        LambdaQueryWrapper<FinanceCompany> lqw = buildQueryWrapper(bo);
        Page<FinanceCompanyVo> result = financeCompanyMapper.selectVoPage(pageQuery.build(), lqw);
        return TableDataInfo.build(result);
    }

    /**
     * 查询单位管理列表
     */
    @Override
    public List<FinanceCompanyVo> queryList(FinanceCompanyBo bo) {
        LambdaQueryWrapper<FinanceCompany> lqw = buildQueryWrapper(bo);
        return financeCompanyMapper.selectVoList(lqw);
    }

    private LambdaQueryWrapper<FinanceCompany> buildQueryWrapper(FinanceCompanyBo bo) {
        Map<String, Object> params = bo.getParams();
        LambdaQueryWrapper<FinanceCompany> lqw = Wrappers.lambdaQuery();
        lqw.eq(bo.getCompanyNumber() != null, FinanceCompany::getCompanyNumber, bo.getCompanyNumber());
        lqw.like(StringUtils.isNotBlank(bo.getCompanyName()), FinanceCompany::getCompanyName, bo.getCompanyName());
        lqw.eq(StringUtils.isNotBlank(bo.getStatus()), FinanceCompany::getStatus, bo.getStatus());
        lqw.like(StringUtils.isNotBlank(bo.getCreateBy()), FinanceCompany::getCreateBy, bo.getCreateBy());
        return lqw;
    }

    /**
     * 新增单位管理
     */
    @Override
    public Boolean insertByBo(FinanceCompanyBo bo) {
        FinanceCompany add = BeanUtil.toBean(bo, FinanceCompany.class);
        validEntityBeforeSave(add);
        boolean flag = financeCompanyMapper.insert(add) > 0;
        if (flag) {
            bo.setCompanyId(add.getCompanyId());
        }
        return flag;
    }

    /**
     * 修改单位管理
     */
    @Override
    public Boolean updateByBo(FinanceCompanyBo bo) {
        FinanceCompany update = BeanUtil.toBean(bo, FinanceCompany.class);
        validEntityBeforeSave(update);
        return financeCompanyMapper.updateById(update) > 0;
    }

    /**
     * 保存前的数据校验
     */
    private void validEntityBeforeSave(FinanceCompany entity) {
        List<FinanceCompany> financeCompanies = financeCompanyMapper.selectList(new LambdaQueryWrapper<FinanceCompany>()
            .eq(entity.getCompanyNumber() != null, FinanceCompany::getCompanyNumber, entity.getCompanyNumber())
            .or()
            .eq(StringUtils.isNotBlank(entity.getCompanyName()), FinanceCompany::getCompanyName, entity.getCompanyName()));

        if(entity.getCompanyId() == null && !financeCompanies.isEmpty()){
            throw new ServiceException("单位信息重复！");
        }
        if(entity.getCompanyId() != null && !financeCompanies.isEmpty()){
            if(financeCompanies.size() == 1 && !financeCompanies.get(0).getCompanyId().equals(entity.getCompanyId())){
                throw new ServiceException("单位信息已存在！");
            }
            if(financeCompanies.size() >= 2){
                throw new ServiceException("单位信息已存在！");
            }
        }
    }

    /**
     * 批量删除单位管理
     */
    @Override
    public Boolean deleteWithValidByIds(Collection<Long> ids, Boolean isValid) {
        if (isValid) {
            if(financeReceivableMapper.exists(new LambdaQueryWrapper<FinanceReceivable>()
                .in(!ids.isEmpty(), FinanceReceivable::getCompanyId, ids))){
                throw new ServiceException("单位存在关联数据，无法删除！");
            }
        }
        return financeCompanyMapper.deleteBatchIds(ids) > 0;
    }
}
