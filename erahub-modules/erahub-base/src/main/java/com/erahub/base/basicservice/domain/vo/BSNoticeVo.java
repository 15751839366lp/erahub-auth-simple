package com.erahub.base.basicservice.domain.vo;

import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.TableField;
import com.erahub.base.system.api.domain.SysUser;
import lombok.Data;

import java.util.Date;

@Data
public class BSNoticeVo {

    private static final long serialVersionUID = 1L;

    /**
     * 公告ID
     */
    private Long noticeId;

    /**
     * 公告标题
     */
    private String noticeTitle;

    /**
     * 公告类型（1通知 2公告）
     */
    private String noticeType;

    /**
     * 公告内容
     */
    private String noticeContent;

    /**
     * 公告状态（0正常 1关闭）
     */
    private String status;

    /**
     * 备注
     */
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
     * 创建人
     */
    private SysUser noticeCreator;
}
