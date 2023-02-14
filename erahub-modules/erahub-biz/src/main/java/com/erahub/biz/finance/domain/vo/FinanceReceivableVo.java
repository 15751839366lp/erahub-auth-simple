package com.erahub.biz.finance.domain.vo;

import java.math.BigDecimal;
import java.util.Date;
import com.alibaba.excel.annotation.ExcelIgnoreUnannotated;
import com.alibaba.excel.annotation.ExcelProperty;
import com.alibaba.excel.annotation.format.DateTimeFormat;
import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.TableField;
import com.erahub.biz.finance.domain.FinanceCompany;
import com.erahub.common.excel.annotation.ExcelDictFormat;
import com.erahub.common.excel.convert.ExcelDictConvert;
import lombok.Data;
import java.util.Date;



/**
 * 应收管理视图对象
 *
 * @author erahub
 * @date 2023-02-11
 */
@Data
public class FinanceReceivableVo {

    private static final long serialVersionUID = 1L;

    /**
     * 应收账款ID
     */
    private Long receivableId;

    /**
     * 开票日期
     */
    private Date invoicingDate;

    /**
     * 单位ID（甲方）
     */
    private Long companyId;

    /**
     * 工程编号
     */
    private String projectNumber;

    /**
     * 工程名称
     */
    private String projectName;

    /**
     * 开票金额(含税价)
     */
    private BigDecimal includingTaxPrice;

    /**
     * 税率
     */
    private BigDecimal taxRate;

    /**
     * 不含税金额
     */
    private BigDecimal excludingTaxPrice;

    /**
     * 收款金额
     */
    private BigDecimal accountPaid;

    /**
     * 应收余额
     */
    private BigDecimal arrearage;

    /**
     * 质保金
     */
    private BigDecimal warrantyDeposit;

    /**
     * 项目经理
     */
    private String projectManager;

    /**
     * 上传编号
     */
    private String uploadId;

    /**
     * 财务部项目负责人
     */
    private String financeProjectResponsiblePerson;

    /**
     * 经营部项目负责人
     */
    private String operationProjectResponsiblePerson;

    /**
     * 应收类别
     */
    private String receivableType;

    /**
     * 状态（0 未结清，1 已结清）
     */
    private String status;

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
     * 备注
     */
    private String remark;

    /**
     * 单位（甲方）
     */
    private FinanceCompany company;
}
