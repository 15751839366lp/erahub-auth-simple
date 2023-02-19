package com.erahub.biz.finance.domain.bo;

import com.erahub.biz.finance.domain.FinanceCompany;
import com.erahub.common.core.validate.AddGroup;
import com.erahub.common.core.validate.EditGroup;
import lombok.Data;
import lombok.EqualsAndHashCode;
import javax.validation.constraints.*;

import java.math.BigDecimal;
import java.util.Date;

import java.util.Date;
import com.erahub.common.core.web.domain.BaseEntity;

/**
 * 应收管理业务对象
 *
 * @author erahub
 * @date 2023-02-11
 */

@Data
@EqualsAndHashCode(callSuper = true)
public class FinanceReceivableBo extends BaseEntity {

    /**
     * 应收账款ID
     */
    private Long receivableId;

    /**
     * 开票日期
     */
    @NotNull(message = "开票日期不能为空", groups = { AddGroup.class, EditGroup.class })
    private Date invoicingDate;

    /**
     * 开票月份
     */
    private String invoicingMonth;

    /**
     * 单位编号（甲方）
     */
    private Long companyNumber;

    /**
     * 单位名称（甲方）
     */
    private String companyName;

    /**
     * 工程编号
     */
    @NotBlank(message = "工程编号不能为空", groups = { AddGroup.class, EditGroup.class })
    private String projectNumber;

    /**
     * 工程名称
     */
    private String projectName;

    /**
     * 开票金额(含税价)
     */
    @NotNull(message = "开票金额(含税价)不能为空", groups = { AddGroup.class, EditGroup.class })
    private BigDecimal includingTaxPrice;

    /**
     * 税率
     */
    @NotNull(message = "税率不能为空", groups = { AddGroup.class, EditGroup.class })
    private BigDecimal taxRate;

    /**
     * 不含税金额
     */
    @NotNull(message = "不含税金额不能为空", groups = { AddGroup.class, EditGroup.class })
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
    @NotBlank(message = "财务部项目负责人不能为空", groups = { AddGroup.class, EditGroup.class })
    private String financeProjectResponsiblePerson;

    /**
     * 经营部项目负责人
     */
    @NotBlank(message = "经营部项目负责人不能为空", groups = { AddGroup.class, EditGroup.class })
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
     * 备注
     */
    private String remark;

    /**
     * 单位
     */
    private FinanceCompany company;
}
