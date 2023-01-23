package com.erahub.base.basicservice.domain.bo;

import com.erahub.base.basicservice.domain.BSMailAccount;
import com.erahub.common.core.validate.AddGroup;
import com.erahub.common.core.validate.EditGroup;
import lombok.Data;
import lombok.EqualsAndHashCode;
import javax.validation.constraints.*;

import java.util.Date;

import com.erahub.common.core.web.domain.BaseEntity;

/**
 * 邮件记录业务对象
 *
 * @author erahub
 * @date 2023-01-23
 */

@Data
@EqualsAndHashCode(callSuper = true)
public class BSMailRecordBo extends BaseEntity {

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
    @NotNull(message = "邮件账号ID不能为空", groups = { AddGroup.class, EditGroup.class })
    private Long mailAccountId;

    /**
     * 接收人
     */
    @NotBlank(message = "接收人不能为空", groups = { AddGroup.class, EditGroup.class })
    private String mailTo;

    /**
     * 标题
     */
    @NotBlank(message = "标题不能为空", groups = { AddGroup.class, EditGroup.class })
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
