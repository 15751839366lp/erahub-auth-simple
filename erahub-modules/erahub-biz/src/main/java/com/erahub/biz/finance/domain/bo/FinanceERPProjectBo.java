package com.erahub.biz.finance.domain.bo;

import com.alibaba.excel.annotation.ExcelProperty;
import com.erahub.common.core.validate.AddGroup;
import com.erahub.common.core.validate.EditGroup;
import lombok.Data;
import lombok.EqualsAndHashCode;
import javax.validation.constraints.*;

import java.math.BigDecimal;
import java.util.Date;

import com.erahub.common.core.web.domain.BaseEntity;

/**
 * ERP工程明细业务对象
 *
 * @author erahub
 * @date 2023-01-01
 */

@Data
@EqualsAndHashCode(callSuper = true)
public class FinanceERPProjectBo extends BaseEntity {

    /**
     * ERP工程ID
     */
    private Long projectId;

    /**
     * ERP工单号
     */
    @NotBlank(message = "ERP工单号不能为空", groups = { AddGroup.class, EditGroup.class })
    private String projectNumber;

    /**
     * ERP请购单号
     */
    @NotBlank(message = "ERP请购单号不能为空", groups = { AddGroup.class, EditGroup.class })
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
     * 部门
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

    /**
     * 下达时间
     */
    private Date releaseTime;

    /**
     * 合同类别
     */
    private String contractType;

    /**
     * ERP工单号（查询用）
     */
    private String prefixProjectNumber;

    /**
     * 公司
     */
    private String company;
}
