package com.erahub.base.basicservice.dubbo;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.util.ArrayUtil;
import com.erahub.base.basicservice.api.domain.BSMailAccount;
import com.erahub.base.basicservice.api.model.MailData;
import com.erahub.base.basicservice.domain.BSMailRecord;
import com.erahub.base.basicservice.mapper.BSMailAccountMapper;
import com.erahub.base.basicservice.mapper.BSMailRecordMapper;
import com.erahub.common.core.exception.ServiceException;
import com.erahub.common.mail.utils.MailUtils;
import com.erahub.base.basicservice.api.RemoteMailService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.dubbo.config.annotation.DubboService;
import org.springframework.stereotype.Service;

import java.io.File;
import java.util.List;

/**
 * 邮件服务
 *
 * @author erahub
 */
@Slf4j
@RequiredArgsConstructor
@Service
@DubboService
public class RemoteMailServiceImpl implements RemoteMailService {

    private final BSMailRecordMapper baseMapper;

    private final BSMailAccountMapper bsMailAccountMapper;

    /**
     * 发送邮件
     *
     * @param to      接收人
     * @param subject 标题
     * @param text    内容
     */
    public void send(String to, String subject, String text) throws ServiceException {
        MailUtils.sendText(to, subject, text);
    }

    /**
     * 发送邮件带附件
     *
     * @param to       接收人
     * @param subject  标题
     * @param text     内容
     * @param fileList 附件
     */
    public void sendWithAttachment(String to, String subject, String text, List<File> fileList) throws ServiceException {
        MailUtils.sendText(to, subject, text, ArrayUtil.toArray(fileList, File.class));
    }

    /**
     * 发送邮件
     *
     * @param mailData      邮件记录信息
     */
    public MailData send(MailData mailData) throws ServiceException {
        BSMailAccount bsMailAccount = mailData.getBsMailAccount();
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
            messageId = MailUtils.sendText(mailData.getMailTo(), mailData.getSubject(), mailData.getText());
        } catch (Exception e) {
            throw new ServiceException("邮件发送失败：" + e.getMessage());
        }

        BSMailRecord add = BeanUtil.toBean(mailData, BSMailRecord.class);
        add.setMailAccountId(0l);
        add.setMessageId(messageId);
        boolean flag = baseMapper.insert(add) > 0;
        if (flag) {
            mailData.setMessageId(messageId);
            mailData.setMailRecordId(add.getMailRecordId());
        }
        return mailData;
    }

    /**
     * 发送邮件
     *
     * @param mailAccountId   发件账号ID
     * @param mailData        邮件信息
     */
    public MailData send(Long mailAccountId, MailData mailData) throws ServiceException {
        BSMailAccount bsMailAccount = bsMailAccountMapper.selectById(mailAccountId);
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
            messageId = MailUtils.sendText(mailData.getMailTo(), mailData.getSubject(), mailData.getText());
        } catch (Exception e) {
            throw new ServiceException("邮件发送失败：" + e.getMessage());
        }

        BSMailRecord add = BeanUtil.toBean(mailData, BSMailRecord.class);
        add.setMessageId(messageId);
        boolean flag = baseMapper.insert(add) > 0;
        if (flag) {
            mailData.setMessageId(messageId);
            mailData.setMailRecordId(add.getMailRecordId());
            mailData.setBsMailAccount(bsMailAccount);
        }
        return mailData;
    }

}
