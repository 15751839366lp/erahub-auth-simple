package com.erahub.biz.finance.domain.excel;

import com.alibaba.excel.annotation.ExcelProperty;
import com.erahub.common.excel.annotation.ExcelDictFormat;
import com.erahub.common.excel.convert.ExcelDictConvert;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class FinanceCompanyImport implements Serializable {
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
    @ExcelProperty(value = "单位名称")
    private String companyName;

    /**
     * 单位状态（0正常 1停用）
     */
    @ExcelProperty(value = "单位状态（正常/停用），默认正常", converter = ExcelDictConvert.class)
    @ExcelDictFormat(dictType = "status")
    private String status;

    /**
     * 备注
     */
    @ExcelProperty(value = "备注")
    private String remark;

}
