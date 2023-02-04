package com.erahub.biz.finance.domain.bo;

import com.erahub.common.core.validate.AddGroup;
import com.erahub.common.core.validate.EditGroup;
import lombok.Data;
import lombok.EqualsAndHashCode;
import javax.validation.constraints.*;

import java.util.Date;

import com.erahub.common.core.web.domain.BaseEntity;

/**
 * ERP合同业务对象
 *
 * @author erahub
 * @date 2023-02-04
 */

@Data
@EqualsAndHashCode(callSuper = true)
public class FinanceERPContractBo extends BaseEntity {

    /**
     * 合同ID
     */
    private Long contractId;

    /**
     * 合同编号
     */
    @NotBlank(message = "合同编号不能为空", groups = { AddGroup.class, EditGroup.class })
    private String contractNumber;

    /**
     * 合同类别（1框架协议，2单签合同）
     */
    @NotBlank(message = "合同类别不能为空", groups = { AddGroup.class, EditGroup.class })
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


}
