package com.erahub.blog.mapper;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Constants;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.erahub.base.system.api.domain.SysUser;
import com.erahub.common.mybatis.annotation.DataColumn;
import com.erahub.common.mybatis.annotation.DataPermission;
import com.erahub.common.mybatis.core.mapper.BaseMapperPlus;
import com.erahub.blog.domain.BlogArticle;
import com.erahub.blog.domain.vo.BlogArticleVo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 博客文章Mapper接口
 *
 * @author erahub
 * @date 2022-12-17
 */
public interface BlogArticleMapper extends BaseMapperPlus<BlogArticleMapper, BlogArticle, BlogArticleVo> {

    Page<BlogArticle> selectPageBlogArticleList(@Param("page") Page<BlogArticle> page, @Param(Constants.WRAPPER) Wrapper<BlogArticle> queryWrapper);

    List<BlogArticle> queryList( @Param(Constants.WRAPPER)QueryWrapper<BlogArticle> wrapper);

    BlogArticle queryById(Long id);

//    /**
//     * 根据条件分页查询用户列表
//     *
//     * @param queryWrapper 查询条件
//     * @return 用户信息集合信息
//     */
//    List<SysUser> selectUserList(@Param(Constants.WRAPPER) Wrapper<SysUser> queryWrapper);
//
//    /**
//     * 根据条件分页查询已配用户角色列表
//     *
//     * @param queryWrapper 查询条件
//     * @return 用户信息集合信息
//     */
//    Page<SysUser> selectAllocatedList(@Param("page") Page<SysUser> page, @Param(Constants.WRAPPER) Wrapper<SysUser> queryWrapper);
//
//    /**
//     * 根据条件分页查询未分配用户角色列表
//     *
//     * @param queryWrapper 查询条件
//     * @return 用户信息集合信息
//     */
//    Page<SysUser> selectUnallocatedList(@Param("page") Page<SysUser> page, @Param(Constants.WRAPPER) Wrapper<SysUser> queryWrapper);
//
//
//    /**
//     * 通过用户名查询用户
//     *
//     * @param userName 用户名
//     * @return 用户对象信息
//     */
//    SysUser selectUserByUserName(String userName);
//
//    /**
//     * 通过手机号查询用户
//     *
//     * @param phonenumber 手机号
//     * @return 用户对象信息
//     */
//    SysUser selectUserByPhonenumber(String phonenumber);
//
//    /**
//     * 通过用户ID查询用户
//     *
//     * @param userId 用户ID
//     * @return 用户对象信息
//     */
//    SysUser selectUserById(Long userId);
}
