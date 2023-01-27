package com.erahub.base.system.api.domain;

import com.alibaba.excel.annotation.ExcelIgnoreUnannotated;
import com.alibaba.excel.annotation.ExcelProperty;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableLogic;
import com.baomidou.mybatisplus.annotation.TableName;
import com.erahub.common.core.web.domain.TreeEntity;
import com.erahub.common.excel.annotation.ExcelDictFormat;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

/**
 * 部门表 sys_dept
 *
 * @author erahub
 */

@Data
@EqualsAndHashCode(callSuper = true)
@NoArgsConstructor
@TableName("sys_dept")
@ExcelIgnoreUnannotated
public class SysDept extends TreeEntity<SysDept> {
    private static final long serialVersionUID = 1L;

    /**
     * 部门ID
     */
    @ExcelProperty(value = "部门ID")
    @TableId(value = "dept_id")
    private Long deptId;

    /**
     * 部门名称
     */
    @ExcelProperty(value = "部门名称")
    @NotBlank(message = "部门名称不能为空")
    @Size(min = 0, max = 30, message = "部门名称长度不能超过30个字符")
    private String deptName;

    /**
     * 显示顺序
     */
    @ExcelProperty(value = "显示顺序")
    @NotNull(message = "显示顺序不能为空")
    private Integer orderNum;

    /**
     * 负责人
     */
    @ExcelProperty(value = "负责人")
    private String leader;

    /**
     * 联系电话
     */
    @ExcelProperty(value = "联系电话")
    @Size(min = 0, max = 11, message = "联系电话长度不能超过11个字符")
    private String phone;

    /**
     * 部门邮箱
     */
    @ExcelProperty(value = "部门邮箱")
    @Email(message = "邮箱格式不正确")
    @Size(min = 0, max = 50, message = "邮箱长度不能超过50个字符")
    private String email;

    /**
     * 部门状态:0正常,1停用
     */
    @ExcelProperty(value = "部门状态")
    @ExcelDictFormat(dictType = "sys_normal_disable")
    private String status;

    /**
     * 删除标志（0代表存在 2代表删除）
     */
    @ExcelProperty(value = "删除标志")
    @TableLogic
    private String delFlag;

    /**
     * 祖级列表
     */
    @ExcelProperty(value = "祖级列表")
    private String ancestors;

}
