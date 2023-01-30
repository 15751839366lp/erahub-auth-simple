package com.erahub.base.basicservice.service.impl;

import cn.hutool.core.bean.BeanUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.erahub.base.basicservice.api.domain.BSMailAccount;
import com.erahub.base.basicservice.mapper.BSMailAccountMapper;
import com.erahub.common.core.exception.ServiceException;
import com.erahub.common.core.utils.StringUtils;
import com.erahub.common.mail.utils.MailUtils;
import com.erahub.common.mybatis.core.page.PageQuery;
import com.erahub.common.mybatis.core.page.TableDataInfo;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import com.erahub.base.basicservice.domain.bo.BSMailRecordBo;
import com.erahub.base.basicservice.domain.vo.BSMailRecordVo;
import com.erahub.base.basicservice.domain.BSMailRecord;
import com.erahub.base.basicservice.mapper.BSMailRecordMapper;
import com.erahub.base.basicservice.service.IBSMailRecordService;

import java.util.List;
import java.util.Map;
import java.util.Collection;

/**
 * 邮件记录Service业务层处理
 *
 * @author erahub
 * @date 2023-01-23
 */
@RequiredArgsConstructor
@Service
public class BSMailRecordServiceImpl implements IBSMailRecordService {

    private final BSMailRecordMapper baseMapper;

    private final BSMailAccountMapper bsMailAccountMapper;

    /**
     * 查询邮件记录
     */
    @Override
    public BSMailRecordVo queryById(Long mailRecordId) {
        return BeanUtil.copyProperties(baseMapper.queryById(mailRecordId), BSMailRecordVo.class);
    }

    /**
     * 查询邮件记录列表
     */
    @Override
    public TableDataInfo<BSMailRecordVo> queryPageList(BSMailRecordBo bo, PageQuery pageQuery) {
        QueryWrapper<BSMailRecord> wrapper = buildQueryWrapper(bo);
        Page<BSMailRecord> result = baseMapper.selectPageBSMailRecordList(pageQuery.build(), wrapper);
        return TableDataInfo.build(BeanUtil.copyToList(result.getRecords(), BSMailRecordVo.class));
    }

    /**
     * 查询邮件记录列表
     */
    @Override
    public List<BSMailRecordVo> queryList(BSMailRecordBo bo) {
        QueryWrapper<BSMailRecord> wrapper = buildQueryWrapper(bo);
        return BeanUtil.copyToList(baseMapper.queryList(wrapper), BSMailRecordVo.class);
    }

    private QueryWrapper<BSMailRecord> buildQueryWrapper(BSMailRecordBo bo) {
        Map<String, Object> params = bo.getParams();
        QueryWrapper<BSMailRecord> wrapper = Wrappers.query();
        wrapper.like(StringUtils.isNotBlank(bo.getMessageId()), "bmr.message_id", bo.getMessageId());
        wrapper.eq(bo.getMailAccountId() != null, "bmr.mail_account_id", bo.getMailAccountId());
        wrapper.like(StringUtils.isNotBlank(bo.getMailTo()), "bmr.mail_to", bo.getMailTo());
        wrapper.like(StringUtils.isNotBlank(bo.getSubject()), "bmr.subject", bo.getSubject());
        return wrapper;
    }

    /**
     * 发送邮件，新增邮件记录
     */
    @Override
    public Boolean send(BSMailRecordBo bo) {

        BSMailAccount bsMailAccount = bsMailAccountMapper.selectById(bo.getMailAccountId());
        String messageId = "";

        try {
            if (bsMailAccount != null) {
                // 添加发件人数据
                MailUtils.getMailAccount(
                    bsMailAccount.getMailFrom(),
                    bsMailAccount.getUser(),
                    bsMailAccount.getPass(),
                    bsMailAccount.getAuth() != "0" ? true : false,
                    bsMailAccount.getHost(),
                    bsMailAccount.getPort(),
                    bsMailAccount.getSocketFactoryPort(),
                    bsMailAccount.getStarttlsEnable() != "0" ? true : false,
                    bsMailAccount.getSslEnable() != "0" ? true : false,
                    bsMailAccount.getTimeout(),
                    bsMailAccount.getConnectionTimeout());
            }
            messageId = MailUtils.sendText(bo.getMailTo(), bo.getSubject(), bo.getText());
        } catch (Exception e) {
            throw new ServiceException("邮件发送失败：" + e.getMessage());
        }

        BSMailRecord add = BeanUtil.toBean(bo, BSMailRecord.class);
        add.setMessageId(messageId);
        validEntityBeforeSave(add);
        boolean flag = baseMapper.insert(add) > 0;
        if (flag) {
            bo.setMailRecordId(add.getMailRecordId());
        }
        return flag;
    }

    /**
     * 保存前的数据校验
     */
    private void validEntityBeforeSave(BSMailRecord entity) {
        //TODO 做一些数据校验,如唯一约束
    }

    /**
     * 批量删除邮件记录
     */
    @Override
    public Boolean deleteWithValidByIds(Collection<Long> ids, Boolean isValid) {
        if (isValid) {
            //TODO 做一些业务上的校验,判断是否需要校验
        }
        return baseMapper.deleteBatchIds(ids) > 0;
    }
}
