package com.erahub.base.tool.service.impl;

import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.io.IoUtil;
import cn.hutool.core.lang.Dict;
import cn.hutool.core.lang.Snowflake;
import cn.hutool.core.util.IdUtil;
import cn.hutool.core.util.ObjectUtil;
import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.erahub.base.tool.domain.ToGenTable;
import com.erahub.base.tool.domain.ToGenTableColumn;
import com.erahub.base.tool.mapper.ToGenTableColumnMapper;
import com.erahub.base.tool.mapper.ToGenTableMapper;
import com.erahub.base.tool.service.IToGenTableService;
import com.erahub.base.tool.util.GenUtils;
import com.erahub.base.tool.util.VelocityInitializer;
import com.erahub.base.tool.util.VelocityUtils;
import com.erahub.common.core.constant.Constants;
import com.erahub.common.core.constant.GenConstants;
import com.erahub.common.core.exception.ServiceException;
import com.erahub.common.core.utils.JsonUtils;
import com.erahub.common.core.utils.StreamUtils;
import com.erahub.common.core.utils.StringUtils;
import com.erahub.common.core.utils.file.FileUtils;
import com.erahub.common.mybatis.core.page.PageQuery;
import com.erahub.common.mybatis.core.page.TableDataInfo;
import com.erahub.common.satoken.utils.LoginHelper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.velocity.Template;
import org.apache.velocity.VelocityContext;
import org.apache.velocity.app.Velocity;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.StringWriter;
import java.nio.charset.StandardCharsets;
import java.util.*;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

/**
 * ?????? ???????????????
 *
 * @author erahub
 */
@Slf4j
@RequiredArgsConstructor
@Service
public class ToToGenTableServiceImpl implements IToGenTableService {

    private final ToGenTableMapper baseMapper;
    private final ToGenTableColumnMapper toGenTableColumnMapper;

    /**
     * ????????????????????????
     *
     * @param tableId ??????????????????
     * @return ??????????????????
     */
    @Override
    public List<ToGenTableColumn> selectGenTableColumnListByTableId(Long tableId) {
        return toGenTableColumnMapper.selectList(new LambdaQueryWrapper<ToGenTableColumn>()
            .eq(ToGenTableColumn::getTableId, tableId)
            .orderByAsc(ToGenTableColumn::getSort));
    }

    /**
     * ??????????????????
     *
     * @param id ??????ID
     * @return ????????????
     */
    @Override
    public ToGenTable selectGenTableById(Long id) {
        ToGenTable toGenTable = baseMapper.selectGenTableById(id);
        setTableFromOptions(toGenTable);
        return toGenTable;
    }

    @Override
    public TableDataInfo<ToGenTable> selectPageGenTableList(ToGenTable toGenTable, PageQuery pageQuery) {
        Page<ToGenTable> page = baseMapper.selectPage(pageQuery.build(), this.buildGenTableQueryWrapper(toGenTable));
        return TableDataInfo.build(page);
    }

    /**
     * ??????????????????
     *
     * @param toGenTable ????????????
     * @return ????????????
     */
    @Override
    public List<ToGenTable> selectGenTableList(ToGenTable toGenTable) {
        return baseMapper.selectList(this.buildGenTableQueryWrapper(toGenTable));
    }

    private QueryWrapper<ToGenTable> buildGenTableQueryWrapper(ToGenTable toGenTable) {
        Map<String, Object> params = toGenTable.getParams();
        QueryWrapper<ToGenTable> wrapper = Wrappers.query();
        wrapper.like(StringUtils.isNotBlank(toGenTable.getTableName()), "lower(table_name)", StringUtils.lowerCase(toGenTable.getTableName()))
            .like(StringUtils.isNotBlank(toGenTable.getTableComment()), "lower(table_comment)", StringUtils.lowerCase(toGenTable.getTableComment()))
            .between(params.get("beginTime") != null && params.get("endTime") != null,
                "create_time", params.get("beginTime"), params.get("endTime"));
        return wrapper;
    }


    @Override
    public TableDataInfo<ToGenTable> selectPageDbTableList(ToGenTable toGenTable, PageQuery pageQuery) {
        Page<ToGenTable> page = baseMapper.selectPageDbTableList(pageQuery.build(), this.buildDbTableQueryWrapper(toGenTable));
        return TableDataInfo.build(page);
    }

    /**
     * ??????????????????
     *
     * @param toGenTable ????????????
     * @return ??????????????????
     */
    @Override
    public List<ToGenTable> selectDbTableList(ToGenTable toGenTable) {
        return baseMapper.selectDbTableList(this.buildDbTableQueryWrapper(toGenTable));
    }

    private Wrapper<Object> buildDbTableQueryWrapper(ToGenTable toGenTable) {
        Map<String, Object> params = toGenTable.getParams();
        QueryWrapper<Object> wrapper = Wrappers.query();
        wrapper.apply("table_schema = (select database())")
            .notLike("table_name", "xxl_job_")
            .notLike("table_name", "to_gen_")
            .notLike("table_name", "to_gen_")
            .notInSql("table_name", "select table_name from to_gen_table")
            .like(StringUtils.isNotBlank(toGenTable.getTableName()), "lower(table_name)", StringUtils.lowerCase(toGenTable.getTableName()))
            .like(StringUtils.isNotBlank(toGenTable.getTableComment()), "lower(table_comment)", StringUtils.lowerCase(toGenTable.getTableComment()))
            .between(params.get("beginTime") != null && params.get("endTime") != null,
                "create_time", params.get("beginTime"), params.get("endTime"))
            .orderByDesc("create_time");
        return wrapper;
    }

    /**
     * ??????????????????
     *
     * @param tableNames ????????????
     * @return ??????????????????
     */
    @Override
    public List<ToGenTable> selectDbTableListByNames(String[] tableNames) {
        return baseMapper.selectDbTableListByNames(tableNames);
    }

    /**
     * ?????????????????????
     *
     * @return ???????????????
     */
    @Override
    public List<ToGenTable> selectGenTableAll() {
        return baseMapper.selectGenTableAll();
    }

    /**
     * ????????????
     *
     * @param toGenTable ????????????
     * @return ??????
     */
    @Transactional(rollbackFor = Exception.class)
    @Override
    public void updateGenTable(ToGenTable toGenTable) {
        String options = JsonUtils.toJsonString(toGenTable.getParams());
        toGenTable.setOptions(options);
        int row = baseMapper.updateById(toGenTable);
        if (row > 0) {
            for (ToGenTableColumn cenTableColumn : toGenTable.getColumns()) {
                toGenTableColumnMapper.updateById(cenTableColumn);
            }
        }
    }

    /**
     * ??????????????????
     *
     * @param tableIds ?????????????????????ID
     * @return ??????
     */
    @Transactional(rollbackFor = Exception.class)
    @Override
    public void deleteGenTableByIds(Long[] tableIds) {
        List<Long> ids = Arrays.asList(tableIds);
        baseMapper.deleteBatchIds(ids);
        toGenTableColumnMapper.delete(new LambdaQueryWrapper<ToGenTableColumn>().in(ToGenTableColumn::getTableId, ids));
    }

    /**
     * ???????????????
     *
     * @param tableList ???????????????
     */
    @Transactional(rollbackFor = Exception.class)
    @Override
    public void importGenTable(List<ToGenTable> tableList) {
        String operName = LoginHelper.getUsername();
        try {
            for (ToGenTable table : tableList) {
                String tableName = table.getTableName();
                GenUtils.initTable(table, operName);
                int row = baseMapper.insert(table);
                if (row > 0) {
                    // ???????????????
                    List<ToGenTableColumn> toGenTableColumns = toGenTableColumnMapper.selectDbTableColumnsByName(tableName);
                    List<ToGenTableColumn> saveColumns = new ArrayList<>();
                    for (ToGenTableColumn column : toGenTableColumns) {
                        GenUtils.initColumnField(column, table);
                        saveColumns.add(column);
                    }
                    if (CollUtil.isNotEmpty(saveColumns)) {
                        toGenTableColumnMapper.insertBatch(saveColumns);
                    }
                }
            }
        } catch (Exception e) {
            throw new ServiceException("???????????????" + e.getMessage());
        }
    }

    /**
     * ????????????
     *
     * @param tableId ?????????
     * @return ??????????????????
     */
    @Override
    public Map<String, String> previewCode(Long tableId) {
        Map<String, String> dataMap = new LinkedHashMap<>();
        // ???????????????
        ToGenTable table = baseMapper.selectGenTableById(tableId);
        Snowflake snowflake = IdUtil.getSnowflake();
        List<Long> menuIds = new ArrayList<>();
        for (int i = 0; i < 6; i++) {
            menuIds.add(snowflake.nextId());
        }
        table.setMenuIds(menuIds);
        // ?????????????????????
        setSubTable(table);
        // ?????????????????????
        setPkColumn(table);
        VelocityInitializer.initVelocity();

        VelocityContext context = VelocityUtils.prepareContext(table);

        // ??????????????????
        List<String> templates = VelocityUtils.getTemplateList(table.getTplCategory());
        for (String template : templates) {
            // ????????????
            StringWriter sw = new StringWriter();
            Template tpl = Velocity.getTemplate(template, Constants.UTF8);
            tpl.merge(context, sw);
            dataMap.put(template, sw.toString());
        }
        return dataMap;
    }

    /**
     * ??????????????????????????????
     *
     * @param tableName ?????????
     * @return ??????
     */
    @Override
    public byte[] downloadCode(String tableName) {
        ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
        ZipOutputStream zip = new ZipOutputStream(outputStream);
        generatorCode(tableName, zip);
        IoUtil.close(zip);
        return outputStream.toByteArray();
    }

    /**
     * ?????????????????????????????????
     *
     * @param tableName ?????????
     */
    @Override
    public void generatorCode(String tableName) {
        // ???????????????
        ToGenTable table = baseMapper.selectGenTableByName(tableName);
        Snowflake snowflake = IdUtil.getSnowflake();
        List<Long> menuIds = new ArrayList<>();
        for (int i = 0; i < 6; i++) {
            menuIds.add(snowflake.nextId());
        }
        table.setMenuIds(menuIds);
        // ?????????????????????
        setSubTable(table);
        // ?????????????????????
        setPkColumn(table);

        VelocityInitializer.initVelocity();

        VelocityContext context = VelocityUtils.prepareContext(table);

        // ??????????????????
        List<String> templates = VelocityUtils.getTemplateList(table.getTplCategory());
        for (String template : templates) {
            if (!StringUtils.containsAny(template, "sql.vm", "api.js.vm", "index.vue.vm", "index-tree.vue.vm")) {
                // ????????????
                StringWriter sw = new StringWriter();
                Template tpl = Velocity.getTemplate(template, Constants.UTF8);
                tpl.merge(context, sw);
                try {
                    String path = getGenPath(table, template);
                    FileUtils.writeUtf8String(sw.toString(), path);
                } catch (Exception e) {
                    throw new ServiceException("??????????????????????????????" + table.getTableName());
                }
            }
        }
    }

    /**
     * ???????????????
     *
     * @param tableName ?????????
     */
    @Transactional(rollbackFor = Exception.class)
    @Override
    public void synchDb(String tableName) {
        ToGenTable table = baseMapper.selectGenTableByName(tableName);
        List<ToGenTableColumn> tableColumns = table.getColumns();
        Map<String, ToGenTableColumn> tableColumnMap = StreamUtils.toIdentityMap(tableColumns, ToGenTableColumn::getColumnName);

        List<ToGenTableColumn> dbTableColumns = toGenTableColumnMapper.selectDbTableColumnsByName(tableName);
        if (CollUtil.isEmpty(dbTableColumns)) {
            throw new ServiceException("??????????????????????????????????????????");
        }
        List<String> dbTableColumnNames = StreamUtils.toList(dbTableColumns, ToGenTableColumn::getColumnName);

        List<ToGenTableColumn> saveColumns = new ArrayList<>();
        dbTableColumns.forEach(column -> {
            GenUtils.initColumnField(column, table);
            if (tableColumnMap.containsKey(column.getColumnName())) {
                ToGenTableColumn prevColumn = tableColumnMap.get(column.getColumnName());
                column.setColumnId(prevColumn.getColumnId());
                if (column.isList()) {
                    // ??????????????????????????????????????????/??????????????????
                    column.setDictType(prevColumn.getDictType());
                    column.setQueryType(prevColumn.getQueryType());
                }
                if (StringUtils.isNotEmpty(prevColumn.getIsRequired()) && !column.isPk()
                    && (column.isInsert() || column.isEdit())
                    && ((column.isUsableColumn()) || (!column.isSuperColumn()))) {
                    // ?????????(??????/??????&?????????/?????????????????????)?????????????????????/??????????????????
                    column.setIsRequired(prevColumn.getIsRequired());
                    column.setHtmlType(prevColumn.getHtmlType());
                }
                toGenTableColumnMapper.updateById(column);
            } else {
                toGenTableColumnMapper.insert(column);
            }
        });
        if (CollUtil.isNotEmpty(saveColumns)) {
            toGenTableColumnMapper.insertBatch(saveColumns);
        }

        List<ToGenTableColumn> delColumns = StreamUtils.filter(tableColumns, column -> !dbTableColumnNames.contains(column.getColumnName()));
        if (CollUtil.isNotEmpty(delColumns)) {
            List<Long> ids = StreamUtils.toList(delColumns, ToGenTableColumn::getColumnId);
            toGenTableColumnMapper.deleteBatchIds(ids);
        }
    }

    /**
     * ????????????????????????????????????
     *
     * @param tableNames ?????????
     * @return ??????
     */
    @Override
    public byte[] downloadCode(String[] tableNames) {
        ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
        ZipOutputStream zip = new ZipOutputStream(outputStream);
        for (String tableName : tableNames) {
            generatorCode(tableName, zip);
        }
        IoUtil.close(zip);
        return outputStream.toByteArray();
    }

    /**
     * ??????????????????????????????
     */
    private void generatorCode(String tableName, ZipOutputStream zip) {
        // ???????????????
        ToGenTable table = baseMapper.selectGenTableByName(tableName);
        Snowflake snowflake = IdUtil.getSnowflake();
        List<Long> menuIds = new ArrayList<>();
        for (int i = 0; i < 6; i++) {
            menuIds.add(snowflake.nextId());
        }
        table.setMenuIds(menuIds);
        // ?????????????????????
        setSubTable(table);
        // ?????????????????????
        setPkColumn(table);

        VelocityInitializer.initVelocity();

        VelocityContext context = VelocityUtils.prepareContext(table);

        // ??????????????????
        List<String> templates = VelocityUtils.getTemplateList(table.getTplCategory());
        for (String template : templates) {
            // ????????????
            StringWriter sw = new StringWriter();
            Template tpl = Velocity.getTemplate(template, Constants.UTF8);
            tpl.merge(context, sw);
            try {
                // ?????????zip
                zip.putNextEntry(new ZipEntry(VelocityUtils.getFileName(template, table)));
                IoUtil.write(zip, StandardCharsets.UTF_8, false, sw.toString());
                IoUtil.close(sw);
                zip.flush();
                zip.closeEntry();
            } catch (IOException e) {
                log.error("??????????????????????????????" + table.getTableName(), e);
            }
        }
    }

    /**
     * ????????????????????????
     *
     * @param toGenTable ????????????
     */
    @Override
    public void validateEdit(ToGenTable toGenTable) {
        if (GenConstants.TPL_TREE.equals(toGenTable.getTplCategory())) {
            String options = JsonUtils.toJsonString(toGenTable.getParams());
            Dict paramsObj = JsonUtils.parseMap(options);
            if (StringUtils.isEmpty(paramsObj.getStr(GenConstants.TREE_CODE))) {
                throw new ServiceException("???????????????????????????");
            } else if (StringUtils.isEmpty(paramsObj.getStr(GenConstants.TREE_PARENT_CODE))) {
                throw new ServiceException("??????????????????????????????");
            } else if (StringUtils.isEmpty(paramsObj.getStr(GenConstants.TREE_NAME))) {
                throw new ServiceException("???????????????????????????");
            } else if (GenConstants.TPL_SUB.equals(toGenTable.getTplCategory())) {
                if (StringUtils.isEmpty(toGenTable.getSubTableName())) {
                    throw new ServiceException("?????????????????????????????????");
                } else if (StringUtils.isEmpty(toGenTable.getSubTableFkName())) {
                    throw new ServiceException("????????????????????????????????????");
                }
            }
        }
    }

    /**
     * ?????????????????????
     *
     * @param table ???????????????
     */
    public void setPkColumn(ToGenTable table) {
        for (ToGenTableColumn column : table.getColumns()) {
            if (column.isPk()) {
                table.setPkColumn(column);
                break;
            }
        }
        if (ObjectUtil.isNull(table.getPkColumn())) {
            table.setPkColumn(table.getColumns().get(0));
        }
        if (GenConstants.TPL_SUB.equals(table.getTplCategory())) {
            for (ToGenTableColumn column : table.getSubTable().getColumns()) {
                if (column.isPk()) {
                    table.getSubTable().setPkColumn(column);
                    break;
                }
            }
            if (ObjectUtil.isNull(table.getSubTable().getPkColumn())) {
                table.getSubTable().setPkColumn(table.getSubTable().getColumns().get(0));
            }
        }
    }

    /**
     * ?????????????????????
     *
     * @param table ???????????????
     */
    public void setSubTable(ToGenTable table) {
        String subTableName = table.getSubTableName();
        if (StringUtils.isNotEmpty(subTableName)) {
            table.setSubTable(baseMapper.selectGenTableByName(subTableName));
        }
    }

    /**
     * ?????????????????????????????????
     *
     * @param toGenTable ????????????????????????
     */
    public void setTableFromOptions(ToGenTable toGenTable) {
        Dict paramsObj = JsonUtils.parseMap(toGenTable.getOptions());
        if (ObjectUtil.isNotNull(paramsObj)) {
            String treeCode = paramsObj.getStr(GenConstants.TREE_CODE);
            String treeParentCode = paramsObj.getStr(GenConstants.TREE_PARENT_CODE);
            String treeName = paramsObj.getStr(GenConstants.TREE_NAME);
            String parentMenuId = paramsObj.getStr(GenConstants.PARENT_MENU_ID);
            String parentMenuName = paramsObj.getStr(GenConstants.PARENT_MENU_NAME);

            toGenTable.setTreeCode(treeCode);
            toGenTable.setTreeParentCode(treeParentCode);
            toGenTable.setTreeName(treeName);
            toGenTable.setParentMenuId(parentMenuId);
            toGenTable.setParentMenuName(parentMenuName);
        }
    }

    /**
     * ????????????????????????
     *
     * @param table    ???????????????
     * @param template ??????????????????
     * @return ????????????
     */
    public static String getGenPath(ToGenTable table, String template) {
        String genPath = table.getGenPath();
        if (StringUtils.equals(genPath, "/")) {
            return System.getProperty("user.dir") + File.separator + "src" + File.separator + VelocityUtils.getFileName(template, table);
        }
        return genPath + File.separator + VelocityUtils.getFileName(template, table);
    }
}
