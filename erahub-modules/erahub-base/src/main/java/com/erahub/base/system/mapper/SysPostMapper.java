package com.erahub.base.system.mapper;

import com.erahub.common.mybatis.core.mapper.BaseMapperPlus;
import com.erahub.base.system.domain.SysPost;

import java.util.List;

/**
 * 岗位信息 数据层
 *
 * @author erahub
 */
public interface SysPostMapper extends BaseMapperPlus<SysPostMapper, SysPost, SysPost> {

    /**
     * 根据用户ID获取岗位选择框列表
     *
     * @param userId 用户ID
     * @return 选中岗位ID列表
     */
    List<Long> selectPostListByUserId(Long userId);

    /**
     * 查询用户所属岗位组
     *
     * @param userName 用户名
     * @return 结果
     */
    List<SysPost> selectPostsByUserName(String userName);

}