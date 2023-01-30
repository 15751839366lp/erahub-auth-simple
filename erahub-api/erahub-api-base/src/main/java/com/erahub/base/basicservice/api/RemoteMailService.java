package com.erahub.base.basicservice.api;

import com.erahub.base.basicservice.api.model.MailData;
import com.erahub.common.core.exception.ServiceException;

import java.io.File;
import java.util.List;

/**
 * 邮件服务
 *
 * @author erahub
 */
public interface RemoteMailService {

    /**
     * 发送邮件
     *
     * @param to      接收人
     * @param subject 标题
     * @param text    内容
     */
    void send(String to, String subject, String text) throws ServiceException;

    /**
     * 发送邮件带附件
     *
     * @param to       接收人
     * @param subject  标题
     * @param text     内容
     * @param fileList 附件
     */
    void sendWithAttachment(String to, String subject, String text, List<File> fileList) throws ServiceException;

    /**
     * 发送邮件
     *
     * @param mailData      邮件信息
     */
    public MailData send(MailData mailData) throws ServiceException;

    /**
     * 发送邮件
     *
     * @param mailAccountId   发件账号ID
     * @param mailData        邮件信息
     */
    public MailData send(Long mailAccountId, MailData mailData) throws ServiceException;
}
