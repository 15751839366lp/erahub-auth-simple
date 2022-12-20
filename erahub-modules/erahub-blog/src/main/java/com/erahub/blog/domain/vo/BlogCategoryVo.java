package com.erahub.blog.domain.vo;

import com.alibaba.excel.annotation.ExcelIgnoreUnannotated;
import com.alibaba.excel.annotation.ExcelProperty;
import com.erahub.common.excel.annotation.ExcelDictFormat;
import com.erahub.common.excel.convert.ExcelDictConvert;
import lombok.Data;
import java.util.Date;



/**
 * 博客分类视图对象
 *
 * @author erahub
 * @date 2022-12-20
 */
@Data
@ExcelIgnoreUnannotated
public class BlogCategoryVo {

    private static final long serialVersionUID = 1L;

    /**
     * 分类ID
     */
    @ExcelProperty(value = "分类ID")
    private Long categoryId;

    /**
     * 分类名
     */
    @ExcelProperty(value = "分类名")
    private String categoryName;

    /**
     * 分类状态（0正常 1停用）
     */
    @ExcelProperty(value = "分类状态", converter = ExcelDictConvert.class)
    @ExcelDictFormat(dictType = "blog_category_status")
    private String status;

    /**
     * 创建者
     */
    @ExcelProperty(value = "创建者")
    private String createBy;

    /**
     * 发表时间
     */
    @ExcelProperty(value = "发表时间")
    private Date createTime;

    /**
     * 备注
     */
    @ExcelProperty(value = "备注")
    private String remark;


}
