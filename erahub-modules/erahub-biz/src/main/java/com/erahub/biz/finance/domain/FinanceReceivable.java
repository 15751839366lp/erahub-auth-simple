package com.erahub.biz.finance.domain;

import com.baomidou.mybatisplus.annotation.*;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import java.io.Serializable;
import java.util.Date;
import java.math.BigDecimal;

import java.util.Date;
import com.erahub.common.core.web.domain.BaseEntity;

/**
 * 应收管理对象 biz_finance_receivable
 *
 * @author erahub
 * @date 2023-02-11
 */
@Data
@EqualsAndHashCode(callSuper = true)
@TableName("biz_finance_receivable")
public class FinanceReceivable extends BaseEntity {

    private static final long serialVersionUID=1L;

    /**
     * 应收账款ID
     */
    @TableId(value = "receivable_id")
    private Long receivableId;
    /**
     * 开票日期
     */
    private Date invoicingDate;
    /**
     * 单位ID
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
     * 备注
     */
    private String remark;
    /**
     * 单位（甲方）
     */
    @TableField(exist = false)
    private FinanceCompany company;
}
