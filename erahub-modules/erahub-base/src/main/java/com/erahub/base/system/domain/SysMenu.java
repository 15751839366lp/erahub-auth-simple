package com.erahub.base.system.domain;

import com.alibaba.excel.annotation.ExcelIgnoreUnannotated;
import com.alibaba.excel.annotation.ExcelProperty;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.erahub.common.excel.annotation.ExcelDictFormat;
import com.fasterxml.jackson.annotation.JsonInclude;
import com.erahub.common.core.web.domain.TreeEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

/**
 * 菜单权限表 sys_menu
 *
 * @author erahub
 */

@Data
@EqualsAndHashCode(callSuper = true)
@NoArgsConstructor
@TableName("sys_menu")
@ExcelIgnoreUnannotated
public class SysMenu extends TreeEntity<SysMenu> {

    /**
     * 菜单ID
     */
    @ExcelProperty(value = "菜单ID")
    @TableId(value = "menu_id")
    private Long menuId;

    /**
     * 菜单名称
     */
    @ExcelProperty(value = "菜单名称")
    @NotBlank(message = "菜单名称不能为空")
    @Size(min = 0, max = 50, message = "菜单名称长度不能超过50个字符")
    private String menuName;

    /**
     * 显示顺序
     */
    @ExcelProperty(value = "显示顺序")
    @NotNull(message = "显示顺序不能为空")
    private Integer orderNum;

    /**
     * 路由地址
     */
    @ExcelProperty(value = "路由地址")
    @Size(min = 0, max = 200, message = "路由地址不能超过200个字符")
    private String path;

    /**
     * 组件路径
     */
    @ExcelProperty(value = "组件路径")
    @Size(min = 0, max = 200, message = "组件路径不能超过255个字符")
    private String component;

    /**
     * 路由参数
     */
    @ExcelProperty(value = "路由参数")
    private String queryParam;

    /**
     * 是否为外链（0是 1否）
     */
    @ExcelProperty(value = "是否为外链")
    private String isFrame;

    /**
     * 是否缓存（0缓存 1不缓存）
     */
    @ExcelProperty(value = "是否缓存")
    private String isCache;

    /**
     * 类型（M目录 C菜单 F按钮）
     */
    @ExcelProperty(value = "类型")
    @NotBlank(message = "菜单类型不能为空")
    private String menuType;

    /**
     * 显示状态（0显示 1隐藏）
     */
    @ExcelProperty(value = "显示状态")
    @ExcelDictFormat(dictType = "sys_show_hide")
    private String visible;

    /**
     * 菜单状态（0正常 1停用）
     */
    @ExcelProperty(value = "菜单状态")
    @ExcelDictFormat(dictType = "sys_normal_disable")
    private String status;

    /**
     * 权限字符串
     */
    @ExcelProperty(value = "权限字符串")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    @Size(min = 0, max = 100, message = "权限标识长度不能超过100个字符")
    private String perms;

    /**
     * 菜单图标
     */
    @ExcelProperty(value = "菜单图标")
    private String icon;

    /**
     * 备注
     */
    @ExcelProperty(value = "备注")
    private String remark;

}
