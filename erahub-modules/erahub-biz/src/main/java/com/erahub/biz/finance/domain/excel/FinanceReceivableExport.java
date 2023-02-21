package com.erahub.biz.finance.domain.excel;

import com.alibaba.excel.annotation.ExcelProperty;
import com.alibaba.excel.annotation.format.DateTimeFormat;
import com.erahub.biz.finance.domain.FinanceCompany;
import com.erahub.common.excel.annotation.ExcelDictFormat;
import com.erahub.common.excel.convert.ExcelDictConvert;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class FinanceReceivableExport implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 应收账款ID
     */
    @ExcelProperty(value = "应收账款ID")
    private Long receivableId;

    /**
     * 开票日期
     */
    @DateTimeFormat("yyyy-MM-dd")
    @ExcelProperty(value = "开票日期")
    private Date invoicingDate;

    /**
     * 单位编号（甲方）
     */
    @ExcelProperty(value = "单位编号（甲方）")
    private Long companyNumber;

    /**
     * 单位名称（甲方）
     */
    @ExcelProperty(value = "单位名称（甲方）")
    private String companyName;

    /**
     * 工程编号
     */
    @ExcelProperty(value = "工程编号")
    private String projectNumber;

    /**
     * 工程名称
     */
    @ExcelProperty(value = "工程名称")
    private String projectName;

    /**
     * 开票金额(含税价)
     */
    @ExcelProperty(value = "开票金额(含税价)")
    private BigDecimal includingTaxPrice;

    /**
     * 税率
     */
    @ExcelProperty(value = "税率")
    private BigDecimal taxRate;

    /**
     * 不含税金额
     */
    @ExcelProperty(value = "不含税金额")
    private BigDecimal excludingTaxPrice;

    /**
     * 收款金额
     */
    @ExcelProperty(value = "收款金额")
    private BigDecimal accountPaid;

    /**
     * 应收余额
     */
    @ExcelProperty(value = "应收余额")
    private BigDecimal arrearage;

    /**
     * 质保金
     */
    @ExcelProperty(value = "质保金")
    private BigDecimal warrantyDeposit;

    /**
     * 项目经理
     */
    @ExcelProperty(value = "项目经理")
    private String projectManager;

    /**
     * 财务部项目负责人
     */
    @ExcelProperty(value = "财务部项目负责人")
    private String financeProjectResponsiblePerson;

    /**
     * 经营部项目负责人
     */
    @ExcelProperty(value = "经营部项目负责人")
    private String operationProjectResponsiblePerson;

    /**
     * 应收类别
     */
    @ExcelProperty(value = "应收类别")
    private String receivableType;

    /**
     * 状态（0 未结清，1 已结清）
     */
    @ExcelProperty(value = "状态（未结清/已结清）", converter = ExcelDictConvert.class)
    @ExcelDictFormat(dictType = "biz_finance_receivable_status")
    private String status;

    /**
     * 备注
     */
    @ExcelProperty(value = "备注")
    private String remark;

    /**
     * 上传编号
     */
    @ExcelProperty(value = "上传编号")
    private String uploadId;

    /**
     * 创建者
     */
    @ExcelProperty(value = "创建者")
    private String createBy;

    /**
     * 创建时间
     */
    @ExcelProperty(value = "创建时间")
    private Date createTime;

    /**
     * 更新者
     */
    @ExcelProperty(value = "更新者")
    private String updateBy;

    /**
     * 更新时间
     */
    @ExcelProperty(value = "更新时间")
    private Date updateTime;

}
