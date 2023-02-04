package com.erahub.biz.finance.domain.vo;

import com.alibaba.excel.annotation.ExcelIgnoreUnannotated;
import com.alibaba.excel.annotation.ExcelProperty;
import com.erahub.common.excel.annotation.ExcelDictFormat;
import com.erahub.common.excel.convert.ExcelDictConvert;
import lombok.Data;
import java.util.Date;



/**
 * ERP合同视图对象
 *
 * @author erahub
 * @date 2023-02-04
 */
@Data
@ExcelIgnoreUnannotated
public class FinanceERPContractVo {

    private static final long serialVersionUID = 1L;

    /**
     * 合同ID
     */
    @ExcelProperty(value = "合同ID")
    private Long contractId;

    /**
     * 合同编号
     */
    @ExcelProperty(value = "合同编号")
    private String contractNumber;

    /**
     * 合同类别（1框架协议，2单签合同）
     */
    @ExcelProperty(value = "合同类别")
    private String contractType;

    /**
     * 单位
     */
    @ExcelProperty(value = "单位")
    private String company;

    /**
     * 适用范围
     */
    @ExcelProperty(value = "适用范围")
    private String contractRange;

    /**
     * 合同总金额（含税）
     */
    @ExcelProperty(value = "合同总金额", converter = ExcelDictConvert.class)
    @ExcelDictFormat(readConverterExp = "含=税")
    private String contractAmount;

    /**
     * 合同有效期间
     */
    @ExcelProperty(value = "合同有效期间")
    private String contractDuration;

    /**
     * 让利
     */
    @ExcelProperty(value = "让利")
    private String profitAbalienation;

    /**
     * 质保期
     */
    @ExcelProperty(value = "质保期")
    private String warranty;

    /**
     * 备注
     */
    @ExcelProperty(value = "备注")
    private String remark;


}
