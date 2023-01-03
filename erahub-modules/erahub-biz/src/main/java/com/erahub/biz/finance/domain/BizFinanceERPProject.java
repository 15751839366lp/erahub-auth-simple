package com.erahub.biz.finance.domain;

import com.baomidou.mybatisplus.annotation.*;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import java.io.Serializable;
import java.util.Date;
import java.math.BigDecimal;

import java.math.BigDecimal;
import com.erahub.common.core.web.domain.BaseEntity;

/**
 * ERP工程明细对象 biz_finance_erp_project
 *
 * @author erahub
 * @date 2023-01-01
 */
@Data
@EqualsAndHashCode(callSuper = true)
@TableName("biz_finance_erp_project")
public class BizFinanceERPProject extends BaseEntity {

    private static final long serialVersionUID=1L;

    /**
     * ERP工程ID
     */
    @TableId(value = "project_id")
    private Long projectId;
    /**
     * ERP工单号
     */
    private String projectNumber;
    /**
     * ERP请购单号
     */
    private String requisitionNumber;
    /**
     * ERP装置名称
     */
    private String deviceName;
    /**
     * ERP工程名称
     */
    private String projectName;
    /**
     * 计划类别
     */
    private String planType;
    /**
     * 单位
     */
    private String department;
    /**
     * 结算审核额
     */
    private BigDecimal settlementReviewAmount;
    /**
     * 合同编号
     */
    private String contractNumber;
    /**
     * 工程类别
     */
    private String projectType;
    /**
     * 备注
     */
    private String remark;

}