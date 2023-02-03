package com.erahub.biz.finance.domain.vo;

import java.math.BigDecimal;
import java.util.Date;

import com.alibaba.excel.annotation.ExcelIgnoreUnannotated;
import com.alibaba.excel.annotation.ExcelProperty;
import lombok.Data;


/**
 * ERP工程明细视图对象
 *
 * @author erahub
 * @date 2023-01-01
 */
@Data
@ExcelIgnoreUnannotated
public class FinanceERPProjectVo {

    private static final long serialVersionUID = 1L;

    /**
     * ERP工程ID
     */
    @ExcelProperty(value = "工程ID", index = 0)
    private Long projectId;

    /**
     * ERP工单号
     */
    @ExcelProperty(value = "工单号", index = 3)
    private String projectNumber;

    /**
     * ERP请购单号
     */
    @ExcelProperty(value = "请购单号", index = 14)
    private String requisitionNumber;

    /**
     * ERP装置名称
     */
    @ExcelProperty(value = "装置名称", index = 5)
    private String deviceName;

    /**
     * ERP工程名称
     */
    @ExcelProperty(value = "工程名称", index = 6)
    private String projectName;

    /**
     * 计划类别
     */
    @ExcelProperty(value = "计划类别", index = 7)
    private String planType;

    /**
     * 单位
     */
    @ExcelProperty(value = "单位", index = 13)
    private String department;

    /**
     * 结算审核额
     */
    @ExcelProperty(value = "结算审核额", index = 8)
    private BigDecimal settlementReviewAmount;

    /**
     * 合同编号
     */
    @ExcelProperty(value = "合同编号", index = 11)
    private String contractNumber;

    /**
     * 工程类别
     */
//    @ExcelProperty(value = "工程类别")
    private String projectType;

    /**
     * 备注
     */
//    @ExcelProperty(value = "备注")
    private String remark;

    /**
     * 下达时间
     */
    @ExcelProperty(value = "下达时间", index = 15)
    private Date releaseTime;

    /**
     * 合同类别
     */
    @ExcelProperty(value = "合同类别", index = 17)
    private String contractType;

    /**
     * ERP工单号（查询用）
     */
    @ExcelProperty(value = "工单号", index = 16)
    private String prefixProjectNumber;

}
