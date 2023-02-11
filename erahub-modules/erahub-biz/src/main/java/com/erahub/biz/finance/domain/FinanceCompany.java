package com.erahub.biz.finance.domain;

import com.baomidou.mybatisplus.annotation.*;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import java.io.Serializable;
import java.util.Date;
import java.math.BigDecimal;

import com.erahub.common.core.web.domain.BaseEntity;

/**
 * 单位管理对象 biz_finance_company
 *
 * @author erahub
 * @date 2023-02-11
 */
@Data
@EqualsAndHashCode(callSuper = true)
@TableName("biz_finance_company")
public class FinanceCompany extends BaseEntity {

    private static final long serialVersionUID=1L;

    /**
     * 单位ID
     */
    @TableId(value = "company_id")
    private Long companyId;
    /**
     * 单位编号
     */
    private Long companyNumber;
    /**
     * 单位名称（甲方）
     */
    private String companyName;
    /**
     * 单位状态（0正常 1停用）
     */
    private String status;
    /**
     * 备注
     */
    private String remark;

}
