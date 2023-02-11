package com.erahub.biz.finance.domain.bo;

import com.erahub.common.core.validate.AddGroup;
import com.erahub.common.core.validate.EditGroup;
import lombok.Data;
import lombok.EqualsAndHashCode;
import javax.validation.constraints.*;

import java.util.Date;

import com.erahub.common.core.web.domain.BaseEntity;

/**
 * 单位管理业务对象
 *
 * @author erahub
 * @date 2023-02-11
 */

@Data
@EqualsAndHashCode(callSuper = true)
public class FinanceCompanyBo extends BaseEntity {

    /**
     * 单位ID
     */
    private Long companyId;

    /**
     * 单位编号
     */
    private Long companyNumber;

    /**
     * 单位名称（甲方）
     */
    @NotBlank(message = "单位名称（甲方）不能为空", groups = { AddGroup.class, EditGroup.class })
    private String companyName;

    /**
     * 单位状态（0正常 1停用）
     */
    @NotBlank(message = "单位状态（0正常 1停用）不能为空", groups = { AddGroup.class, EditGroup.class })
    private String status;

    /**
     * 备注
     */
    private String remark;


}
