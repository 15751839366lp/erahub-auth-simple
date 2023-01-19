package com.erahub.base.tool.service;

import com.erahub.base.tool.domain.ToGenTable;
import com.erahub.base.tool.domain.ToGenTableColumn;
import com.erahub.common.mybatis.core.page.PageQuery;
import com.erahub.common.mybatis.core.page.TableDataInfo;

import java.util.List;
import java.util.Map;

/**
 * 业务 服务层
 *
 * @author erahub
 */
public interface IToGenTableService {

    /**
     * 查询业务字段列表
     *
     * @param tableId 业务字段编号
     * @return 业务字段集合
     */
    List<ToGenTableColumn> selectGenTableColumnListByTableId(Long tableId);

    TableDataInfo<ToGenTable> selectPageGenTableList(ToGenTable toGenTable, PageQuery pageQuery);

    TableDataInfo<ToGenTable> selectPageDbTableList(ToGenTable toGenTable, PageQuery pageQuery);

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
     * 查询业务信息
     *
     * @param id 业务ID
     * @return 业务信息
     */
    ToGenTable selectGenTableById(Long id);

    /**
     * 修改业务
     *
     * @param toGenTable 业务信息
     * @return 结果
     */
    void updateGenTable(ToGenTable toGenTable);

    /**
     * 删除业务信息
     *
     * @param tableIds 需要删除的表数据ID
     * @return 结果
     */
    void deleteGenTableByIds(Long[] tableIds);

    /**
     * 导入表结构
     *
     * @param tableList 导入表列表
     */
    void importGenTable(List<ToGenTable> tableList);

    /**
     * 预览代码
     *
     * @param tableId 表编号
     * @return 预览数据列表
     */
    Map<String, String> previewCode(Long tableId);

    /**
     * 生成代码（下载方式）
     *
     * @param tableName 表名称
     * @return 数据
     */
    byte[] downloadCode(String tableName);

    /**
     * 生成代码（自定义路径）
     *
     * @param tableName 表名称
     * @return 数据
     */
    void generatorCode(String tableName);

    /**
     * 同步数据库
     *
     * @param tableName 表名称
     */
    void synchDb(String tableName);

    /**
     * 批量生成代码（下载方式）
     *
     * @param tableNames 表数组
     * @return 数据
     */
    byte[] downloadCode(String[] tableNames);

    /**
     * 修改保存参数校验
     *
     * @param toGenTable 业务信息
     */
    void validateEdit(ToGenTable toGenTable);
}
