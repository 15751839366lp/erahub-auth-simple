package com.erahub.biz.finance.domain;

import com.alibaba.excel.annotation.ExcelProperty;
import com.baomidou.mybatisplus.annotation.*;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.Date;
import java.math.BigDecimal;

import com.erahub.common.core.web.domain.BaseEntity;

/**
 * ERP合同对象 biz_finance_erp_contract
 *
 * @author erahub
 * @date 2023-02-04
 */
@Data
@EqualsAndHashCode(callSuper = true)
@TableName("biz_finance_erp_contract")
public class FinanceERPContract extends BaseEntity {

    private static final long serialVersionUID = 1L;

    /**
     * 合同ID
     */
    @TableId(value = "contract_id")
    private Long contractId;
    /**
     * 合同编号
     */
    private String contractNumber;
    /**
     * 合同类别（1框架协议，2单签合同）
     */
    private String contractType;
    /**
     * 单位
     */
    private String company;
    /**
     * 适用范围
     */
    private String contractRange;
    /**
     * 合同总金额（含税）
     */
    private String contractAmount;
    /**
     * 合同有效期间
     */
    private String contractDuration;
    /**
     * 让利
     */
    private String profitAbalienation;
    /**
     * 质保期
     */
    private String warranty;
    /**
     * 备注
     */
    private String remark;

    public String getContratcTypeName() {
        if ("1".equals(contractType)) {
            return "框架协议";
        } else if ("2".equals(contractType)) {
            return "单签合同";
        }
        return "单签合同";
    }
}
