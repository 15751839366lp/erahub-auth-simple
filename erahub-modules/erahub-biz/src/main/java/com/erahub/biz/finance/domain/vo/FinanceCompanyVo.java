package com.erahub.biz.finance.domain.vo;

import com.alibaba.excel.annotation.ExcelIgnoreUnannotated;
import com.alibaba.excel.annotation.ExcelProperty;
import com.erahub.common.excel.annotation.ExcelDictFormat;
import com.erahub.common.excel.convert.ExcelDictConvert;
import lombok.Data;
import java.util.Date;



/**
 * 单位管理视图对象
 *
 * @author erahub
 * @date 2023-02-11
 */
@Data
@ExcelIgnoreUnannotated
public class FinanceCompanyVo {

    private static final long serialVersionUID = 1L;

    /**
     * 单位ID
     */
    @ExcelProperty(value = "单位ID")
    private Long companyId;

    /**
     * 单位编号
     */
    @ExcelProperty(value = "单位编号")
    private Long companyNumber;

    /**
     * 单位名称（甲方）
     */
    @ExcelProperty(value = "单位名称", converter = ExcelDictConvert.class)
    @ExcelDictFormat(readConverterExp = "甲=方")
    private String companyName;

    /**
     * 单位状态（0正常 1停用）
     */
    @ExcelProperty(value = "单位状态", converter = ExcelDictConvert.class)
    @ExcelDictFormat(dictType = "status")
    private String status;

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
     * 备注
     */
    @ExcelProperty(value = "备注")
    private String remark;


}
