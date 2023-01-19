package com.erahub.base.tool.mapper;

import com.baomidou.mybatisplus.annotation.InterceptorIgnore;
import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.toolkit.Constants;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.erahub.base.tool.domain.ToGenTable;
import com.erahub.common.mybatis.core.mapper.BaseMapperPlus;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 业务 数据层
 *
 * @author erahub
 */
@InterceptorIgnore(dataPermission = "true")
public interface ToGenTableMapper extends BaseMapperPlus<ToGenTableMapper, ToGenTable, ToGenTable> {

    Page<ToGenTable> selectPageDbTableList(@Param("page") Page<ToGenTable> page, @Param("toGenTable") ToGenTable toGenTable);

    /**
     * 查询据库列表
     *
     * @param tableNames 表名称组
     * @return 数据库表集合
     */
    List<ToGenTable> selectDbTableListByNames(String[] tableNames);

    /**
     * 查询所有表信息
     *
     * @return 表信息集合
     */
    List<ToGenTable> selectGenTableAll();

    /**
     * 查询表ID业务信息
     *
     * @param id 业务ID
     * @return 业务信息
     */
    ToGenTable selectGenTableById(Long id);

    /**
     * 查询表名称业务信息
     *
     * @param tableName 表名称
     * @return 业务信息
     */
    ToGenTable selectGenTableByName(String tableName);

}
