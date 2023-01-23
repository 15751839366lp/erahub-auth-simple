package com.erahub.base.basicservice.mapper;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Constants;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.erahub.common.mybatis.core.mapper.BaseMapperPlus;
import com.erahub.base.basicservice.domain.BSMailRecord;
import com.erahub.base.basicservice.domain.vo.BSMailRecordVo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 邮件记录Mapper接口
 *
 * @author erahub
 * @date 2023-01-23
 */
public interface BSMailRecordMapper extends BaseMapperPlus<BSMailRecordMapper, BSMailRecord, BSMailRecordVo> {

    Page<BSMailRecord> selectPageBSMailRecordList(@Param("page") Page<BSMailRecord> page, @Param(Constants.WRAPPER) Wrapper<BSMailRecord> queryWrapper);

    List<BSMailRecord> queryList(@Param(Constants.WRAPPER) QueryWrapper<BSMailRecord> wrapper);

    BSMailRecord queryById(Long id);
}
