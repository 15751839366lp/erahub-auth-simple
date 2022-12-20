package com.erahub.blog.domain.vo;

import com.alibaba.excel.annotation.ExcelIgnoreUnannotated;
import com.alibaba.excel.annotation.ExcelProperty;
import com.erahub.common.excel.annotation.ExcelDictFormat;
import com.erahub.common.excel.convert.ExcelDictConvert;
import lombok.Data;
import java.util.Date;



/**
 * 博客标签视图对象
 *
 * @author erahub
 * @date 2022-12-20
 */
@Data
@ExcelIgnoreUnannotated
public class BlogTagVo {

    private static final long serialVersionUID = 1L;

    /**
     * 标签ID
     */
    @ExcelProperty(value = "标签ID")
    private Long tagId;

    /**
     * 标签名
     */
    @ExcelProperty(value = "标签名")
    private String tagName;

    /**
     * 标签状态（0正常 1停用）
     */
    @ExcelProperty(value = "标签状态", converter = ExcelDictConvert.class)
    @ExcelDictFormat(dictType = "blog_tag_status")
    private String status;

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
