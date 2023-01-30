package com.erahub.base.basicservice.domain.vo;

import com.alibaba.excel.annotation.ExcelIgnoreUnannotated;
import com.alibaba.excel.annotation.ExcelProperty;
import com.erahub.base.basicservice.api.domain.BSMailAccount;
import lombok.Data;
import java.util.Date;



/**
 * 邮件记录视图对象
 *
 * @author erahub
 * @date 2023-01-23
 */
@Data
@ExcelIgnoreUnannotated
public class BSMailRecordVo {

    private static final long serialVersionUID = 1L;

    /**
     * 邮件ID
     */
    @ExcelProperty(value = "邮件ID")
    private Long mailRecordId;

    /**
     * 消息ID
     */
    @ExcelProperty(value = "消息ID")
    private String messageId;

    /**
     * 邮件账号ID
     */
    @ExcelProperty(value = "邮件账号ID")
    private Long mailAccountId;

    /**
     * 接收人
     */
    @ExcelProperty(value = "接收人")
    private String mailTo;

    /**
     * 标题
     */
    @ExcelProperty(value = "标题")
    private String subject;

    /**
     * 内容
     */
    @ExcelProperty(value = "内容")
    private String text;

    /**
     * 附件
     */
    @ExcelProperty(value = "附件")
    private String files;

    /**
     * 备注
     */
    @ExcelProperty(value = "备注")
    private String remark;

    /**
     * 创建者
     */
    private String createBy;

    /**
     * 创建时间
     */
    private Date createTime;

    /**
     * 更新者
     */

    private String updateBy;

    /**
     * 更新时间
     */
    private Date updateTime;

    /**
     * 邮件账号
     */
    private BSMailAccount bsMailAccount;
}
