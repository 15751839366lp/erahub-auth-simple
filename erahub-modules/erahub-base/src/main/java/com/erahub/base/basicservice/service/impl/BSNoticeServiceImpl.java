package com.erahub.base.basicservice.service.impl;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.util.NumberUtil;
import cn.hutool.core.util.ObjectUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.erahub.base.basicservice.domain.bo.BSNoticeBo;
import com.erahub.base.basicservice.domain.vo.BSNoticeVo;
import com.erahub.base.basicservice.mapper.BSNoticeMapper;
import com.erahub.base.basicservice.service.IBSNoticeService;
import com.erahub.common.core.utils.StringUtils;
import com.erahub.common.mybatis.core.page.PageQuery;
import com.erahub.common.mybatis.core.page.TableDataInfo;
import com.erahub.base.basicservice.domain.BSNotice;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.Arrays;
import java.util.List;

/**
 * 公告 服务层实现
 *
 * @author erahub
 */
@RequiredArgsConstructor
@Service
public class BSNoticeServiceImpl implements IBSNoticeService {

    private final BSNoticeMapper baseMapper;

    @Override
    public TableDataInfo<BSNotice> selectPageNoticeList(BSNotice notice, PageQuery pageQuery) {
        LambdaQueryWrapper<BSNotice> lqw = new LambdaQueryWrapper<BSNotice>()
            .like(StringUtils.isNotBlank(notice.getNoticeTitle()), BSNotice::getNoticeTitle, notice.getNoticeTitle())
            .eq(StringUtils.isNotBlank(notice.getNoticeType()), BSNotice::getNoticeType, notice.getNoticeType())
            .like(StringUtils.isNotBlank(notice.getCreateBy()), BSNotice::getCreateBy, notice.getCreateBy());
        Page<BSNotice> page = baseMapper.selectPage(pageQuery.build(), lqw);
        return TableDataInfo.build(page);
    }

    @Override
    public TableDataInfo<BSNotice> selectPageNoticeListByIndex(BSNoticeBo bo, PageQuery pageQuery) {
        QueryWrapper<BSNotice> wrapper = Wrappers.query();
        wrapper.eq(bo.getNoticeType() != null, "bn.notice_type", bo.getNoticeType());
        wrapper.eq("bn.status","0");
        wrapper.orderByDesc("bn.create_time");
        Page<BSNotice> page = baseMapper.selectPageNoticeListByIndex(pageQuery.build(), wrapper);
        return TableDataInfo.build(page);
    }

    @Override
    public List<BSNoticeVo> getLatestNotice(Integer latestNoticeNumber) {
        if(latestNoticeNumber == null){
            latestNoticeNumber = 0;
        }
        return BeanUtil.copyToList(baseMapper.getLatestNotice(latestNoticeNumber),BSNoticeVo.class);
    }

    /**
     * 查询公告信息
     *
     * @param noticeId 公告ID
     * @return 公告信息
     */
    @Override
    public BSNotice selectNoticeById(Long noticeId) {
        return baseMapper.selectById(noticeId);
    }

    /**
     * 查询公告列表
     *
     * @param notice 公告信息
     * @return 公告集合
     */
    @Override
    public List<BSNotice> selectNoticeList(BSNotice notice) {
        return baseMapper.selectList(new LambdaQueryWrapper<BSNotice>()
            .like(StringUtils.isNotBlank(notice.getNoticeTitle()), BSNotice::getNoticeTitle, notice.getNoticeTitle())
            .eq(StringUtils.isNotBlank(notice.getNoticeType()), BSNotice::getNoticeType, notice.getNoticeType())
            .like(StringUtils.isNotBlank(notice.getCreateBy()), BSNotice::getCreateBy, notice.getCreateBy()));
    }

    /**
     * 新增公告
     *
     * @param notice 公告信息
     * @return 结果
     */
    @Override
    public int insertNotice(BSNotice notice) {
        return baseMapper.insert(notice);
    }

    /**
     * 修改公告
     *
     * @param notice 公告信息
     * @return 结果
     */
    @Override
    public int updateNotice(BSNotice notice) {
        return baseMapper.updateById(notice);
    }

    /**
     * 删除公告对象
     *
     * @param noticeId 公告ID
     * @return 结果
     */
    @Override
    public int deleteNoticeById(Long noticeId) {
        return baseMapper.deleteById(noticeId);
    }

    /**
     * 批量删除公告信息
     *
     * @param noticeIds 需要删除的公告ID
     * @return 结果
     */
    @Override
    public int deleteNoticeByIds(Long[] noticeIds) {
        return baseMapper.deleteBatchIds(Arrays.asList(noticeIds));
    }
}
