package com.erahub.base.basicservice.service.impl;

import cn.hutool.core.bean.BeanUtil;
import com.erahub.common.core.utils.StringUtils;
import com.erahub.common.mybatis.core.page.PageQuery;
import com.erahub.common.mybatis.core.page.TableDataInfo;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import com.erahub.base.basicservice.domain.bo.BSMailAccountBo;
import com.erahub.base.basicservice.domain.vo.BSMailAccountVo;
import com.erahub.base.basicservice.domain.BSMailAccount;
import com.erahub.base.basicservice.mapper.BSMailAccountMapper;
import com.erahub.base.basicservice.service.IBSMailAccountService;

import java.util.List;
import java.util.Map;
import java.util.Collection;

/**
 * 邮件账号Service业务层处理
 *
 * @author erahub
 * @date 2023-01-23
 */
@RequiredArgsConstructor
@Service
public class BSMailAccountServiceImpl implements IBSMailAccountService {

    private final BSMailAccountMapper baseMapper;

    /**
     * 查询邮件账号
     */
    @Override
    public BSMailAccountVo queryById(Long mailAccountId){
        return baseMapper.selectVoById(mailAccountId);
    }

    /**
     * 查询邮件账号列表
     */
    @Override
    public TableDataInfo<BSMailAccountVo> queryPageList(BSMailAccountBo bo, PageQuery pageQuery) {
        LambdaQueryWrapper<BSMailAccount> lqw = buildQueryWrapper(bo);
        Page<BSMailAccountVo> result = baseMapper.selectVoPage(pageQuery.build(), lqw);
        return TableDataInfo.build(result);
    }

    /**
     * 查询邮件账号列表
     */
    @Override
    public List<BSMailAccountVo> queryList(BSMailAccountBo bo) {
        LambdaQueryWrapper<BSMailAccount> lqw = buildQueryWrapper(bo);
        return baseMapper.selectVoList(lqw);
    }

    private LambdaQueryWrapper<BSMailAccount> buildQueryWrapper(BSMailAccountBo bo) {
        Map<String, Object> params = bo.getParams();
        LambdaQueryWrapper<BSMailAccount> lqw = Wrappers.lambdaQuery();
        lqw.like(StringUtils.isNotBlank(bo.getMailFrom()), BSMailAccount::getMailFrom, bo.getMailFrom());
        lqw.like(StringUtils.isNotBlank(bo.getHost()), BSMailAccount::getHost, bo.getHost());
        lqw.eq(bo.getPort() != null, BSMailAccount::getPort, bo.getPort());
        return lqw;
    }

    /**
     * 新增邮件账号
     */
    @Override
    public Boolean insertByBo(BSMailAccountBo bo) {
        BSMailAccount add = BeanUtil.toBean(bo, BSMailAccount.class);
        validEntityBeforeSave(add);
        boolean flag = baseMapper.insert(add) > 0;
        if (flag) {
            bo.setMailAccountId(add.getMailAccountId());
        }
        return flag;
    }

    /**
     * 修改邮件账号
     */
    @Override
    public Boolean updateByBo(BSMailAccountBo bo) {
        BSMailAccount update = BeanUtil.toBean(bo, BSMailAccount.class);
        validEntityBeforeSave(update);
        return baseMapper.updateById(update) > 0;
    }

    /**
     * 保存前的数据校验
     */
    private void validEntityBeforeSave(BSMailAccount entity){
        //TODO 做一些数据校验,如唯一约束
    }

    /**
     * 批量删除邮件账号
     */
    @Override
    public Boolean deleteWithValidByIds(Collection<Long> ids, Boolean isValid) {
        if(isValid){
            //TODO 做一些业务上的校验,判断是否需要校验
        }
        return baseMapper.deleteBatchIds(ids) > 0;
    }

}
