package com.erahub.base.basicservice.domain;

import cn.hutool.extra.mail.MailAccount;
import com.baomidou.mybatisplus.annotation.*;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import java.io.Serializable;
import java.util.Date;
import java.math.BigDecimal;

import com.erahub.common.core.web.domain.BaseEntity;

/**
 * 邮件记录对象 bs_mail_record
 *
 * @author erahub
 * @date 2023-01-23
 */
@Data
@EqualsAndHashCode(callSuper = true)
@TableName("bs_mail_record")
public class BSMailRecord extends BaseEntity {

    private static final long serialVersionUID=1L;

    /**
     * 邮件ID
     */
    @TableId(value = "mail_record_id")
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
    @TableField(exist = false)
    private BSMailAccount bsMailAccount;
}
