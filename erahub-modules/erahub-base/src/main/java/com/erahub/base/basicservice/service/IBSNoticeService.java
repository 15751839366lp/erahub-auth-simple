package com.erahub.base.basicservice.service;

import com.erahub.base.basicservice.domain.bo.BSNoticeBo;
import com.erahub.base.basicservice.domain.vo.BSNoticeVo;
import com.erahub.common.mybatis.core.page.PageQuery;
import com.erahub.common.mybatis.core.page.TableDataInfo;
import com.erahub.base.basicservice.domain.BSNotice;

import java.util.List;

/**
 * 公告 服务层
 *
 * @author erahub
 */
public interface IBSNoticeService {
    TableDataInfo<BSNotice> selectPageNoticeList(BSNotice notice, PageQuery pageQuery);

    List<BSNoticeVo> getLatestNotice(Integer latestNoticeNumber);

    /**
     * 查询公告信息
     *
     * @param noticeId 公告ID
     * @return 公告信息
     */
    BSNotice selectNoticeById(Long noticeId);

    /**
     * 查询公告列表
     *
     * @param notice 公告信息
     * @return 公告集合
     */
    List<BSNotice> selectNoticeList(BSNotice notice);

    /**
     * 新增公告
     *
     * @param notice 公告信息
     * @return 结果
     */
    int insertNotice(BSNotice notice);

    /**
     * 修改公告
     *
     * @param notice 公告信息
     * @return 结果
     */
    int updateNotice(BSNotice notice);

    /**
     * 删除公告信息
     *
     * @param noticeId 公告ID
     * @return 结果
     */
    int deleteNoticeById(Long noticeId);

    /**
     * 批量删除公告信息
     *
     * @param noticeIds 需要删除的公告ID
     * @return 结果
     */
    int deleteNoticeByIds(Long[] noticeIds);

}
