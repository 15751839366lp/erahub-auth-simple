package com.erahub.base.tool.mapper;

import com.baomidou.mybatisplus.annotation.InterceptorIgnore;
import com.erahub.common.mybatis.core.mapper.BaseMapperPlus;
import com.erahub.base.tool.domain.ToGenTableColumn;

import java.util.List;

/**
 * 业务字段 数据层
 *
 * @author erahub
 */
@InterceptorIgnore(dataPermission = "true")
public interface ToGenTableColumnMapper extends BaseMapperPlus<ToGenTableColumnMapper, ToGenTableColumn, ToGenTableColumn> {
    /**
     * 根据表名称查询列信息
     *
     * @param tableName 表名称
     * @return 列信息
     */
    List<ToGenTableColumn> selectDbTableColumnsByName(String tableName);

}
