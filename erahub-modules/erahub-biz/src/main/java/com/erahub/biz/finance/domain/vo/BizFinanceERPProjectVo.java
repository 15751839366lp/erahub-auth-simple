package com.erahub.biz.finance.domain.vo;

import java.math.BigDecimal;
import com.alibaba.excel.annotation.ExcelIgnoreUnannotated;
import com.alibaba.excel.annotation.ExcelProperty;
import com.erahub.common.excel.annotation.ExcelDictFormat;
import com.erahub.common.excel.convert.ExcelDictConvert;
import lombok.Data;
import java.util.Date;



/**
 * ERP工程明细视图对象
 *
 * @author erahub
 * @date 2023-01-01
 */
@Data
@ExcelIgnoreUnannotated
public class BizFinanceERPProjectVo {

    private static final long serialVersionUID = 1L;

    /**
     * ERP工程ID
     */
    @ExcelProperty(value = "工程ID")
    private Long projectId;

    /**
     * ERP工单号
     */
    @ExcelProperty(value = "工单号")
    private String projectNumber;

    /**
     * ERP请购单号
     */
    @ExcelProperty(value = "请购单号")
    private String requisitionNumber;

    /**
     * ERP装置名称
     */
    @ExcelProperty(value = "装置名称")
    private String deviceName;

    /**
     * ERP工程名称
     */
    @ExcelProperty(value = "工程名称")
    private String projectName;

    /**
     * 计划类别
     */
    @ExcelProperty(value = "计划类别")
    private String planType;

    /**
     * 单位
     */
    @ExcelProperty(value = "单位")
    private String department;

    /**
     * 结算审核额
     */
    @ExcelProperty(value = "结算审核额")
    private BigDecimal settlementReviewAmount;

    /**
     * 合同编号
     */
    @ExcelProperty(value = "合同编号")
    private String contractNumber;

    /**
     * 工程类别
     */
    @ExcelProperty(value = "工程类别")
    private String projectType;

    /**
     * 备注
     */
    @ExcelProperty(value = "备注")
    private String remark;


}
