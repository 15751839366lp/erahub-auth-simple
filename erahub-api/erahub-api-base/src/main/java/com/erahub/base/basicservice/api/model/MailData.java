package com.erahub.base.basicservice.api.model;

import com.erahub.base.basicservice.api.domain.BSMailAccount;
import lombok.Data;

import java.io.Serializable;

@Data
public class MailData implements Serializable {
    private static final long serialVersionUID = 1L;

    /**
     * 邮件ID
     */
    private Long mailRecordId;
    /**
     * 消息ID
     */
    private String messageId;
    /**
     * 邮件账号ID
     */
    private Long mailAccountId;
    /**
     * 接收人
     */
    private String mailTo;
    /**
     * 标题
     */
    private String subject;
    /**
     * 内容
     */
    private String text;
    /**
     * 附件
     */
    private String files;
    /**
     * 备注
     */
    private String remark;
    /**
     * 邮件账号
     */
    private BSMailAccount bsMailAccount;
}
