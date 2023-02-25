package com.erahub.base.basicservice.service.impl;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.util.ObjectUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.LambdaUpdateWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.erahub.base.basicservice.domain.BSOss;
import com.erahub.base.basicservice.mapper.BSOssMapper;
import com.erahub.base.basicservice.service.IBSOssConfigService;
import com.erahub.common.core.constant.CacheNames;
import com.erahub.common.core.constant.UserConstants;
import com.erahub.common.core.exception.ServiceException;
import com.erahub.common.core.utils.JsonUtils;
import com.erahub.common.core.utils.StringUtils;
import com.erahub.common.mybatis.core.page.PageQuery;
import com.erahub.common.mybatis.core.page.TableDataInfo;
import com.erahub.common.oss.constant.OssConstant;
import com.erahub.common.redis.utils.CacheUtils;
import com.erahub.common.redis.utils.RedisUtils;
import com.erahub.base.basicservice.domain.BSOssConfig;
import com.erahub.base.basicservice.domain.bo.BSOssConfigBo;
import com.erahub.base.basicservice.domain.vo.BSOssConfigVo;
import com.erahub.base.basicservice.mapper.BSOssConfigMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Collection;
import java.util.List;

/**
 * 对象存储配置Service业务层处理
 *
 * @author erahub
 * @author 孤舟烟雨
 * @date 2021-08-13
 */
@Slf4j
@RequiredArgsConstructor
@Service
public class BSOssConfigServiceImpl implements IBSOssConfigService {

    private final BSOssConfigMapper bsOssConfigMapper;

    private final BSOssMapper bsOssMapper;

    /**
     * 项目启动时，初始化参数到缓存，加载配置类
     */
    @Override
    public void init() {
        List<BSOssConfig> list = bsOssConfigMapper.selectList();
        // 加载OSS初始化配置
        for (BSOssConfig config : list) {
            String configKey = config.getConfigKey();
            if ("0".equals(config.getStatus())) {
                RedisUtils.setCacheObject(OssConstant.DEFAULT_CONFIG_KEY, configKey);
            }
            CacheUtils.put(CacheNames.SYS_OSS_CONFIG, config.getConfigKey(), JsonUtils.toJsonString(config));
        }
    }

    @Override
    public BSOssConfigVo queryById(Long ossConfigId) {
        return bsOssConfigMapper.selectVoById(ossConfigId);
    }

    @Override
    public TableDataInfo<BSOssConfigVo> queryPageList(BSOssConfigBo bo, PageQuery pageQuery) {
        LambdaQueryWrapper<BSOssConfig> lqw = buildQueryWrapper(bo);
        Page<BSOssConfigVo> result = bsOssConfigMapper.selectVoPage(pageQuery.build(), lqw);
        return TableDataInfo.build(result);
    }


    private LambdaQueryWrapper<BSOssConfig> buildQueryWrapper(BSOssConfigBo bo) {
        LambdaQueryWrapper<BSOssConfig> lqw = Wrappers.lambdaQuery();
        lqw.eq(StringUtils.isNotBlank(bo.getConfigKey()), BSOssConfig::getConfigKey, bo.getConfigKey());
        lqw.like(StringUtils.isNotBlank(bo.getBucketName()), BSOssConfig::getBucketName, bo.getBucketName());
        lqw.eq(StringUtils.isNotBlank(bo.getStatus()), BSOssConfig::getStatus, bo.getStatus());
        return lqw;
    }

    @Override
    public Boolean insertByBo(BSOssConfigBo bo) {
        BSOssConfig config = BeanUtil.toBean(bo, BSOssConfig.class);
        validEntityBeforeSave(config);
        boolean flag = bsOssConfigMapper.insert(config) > 0;
        if (flag) {
            CacheUtils.put(CacheNames.SYS_OSS_CONFIG, config.getConfigKey(), JsonUtils.toJsonString(config));
        }
        return flag;
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public Boolean updateByBo(BSOssConfigBo bo) {
        BSOssConfig config = BeanUtil.toBean(bo, BSOssConfig.class);
        validEntityBeforeSave(config);

        LambdaUpdateWrapper<BSOssConfig> luw = new LambdaUpdateWrapper<>();
        luw.set(ObjectUtil.isNull(config.getPrefix()), BSOssConfig::getPrefix, "");
        luw.set(ObjectUtil.isNull(config.getRegion()), BSOssConfig::getRegion, "");
        luw.set(ObjectUtil.isNull(config.getExt1()), BSOssConfig::getExt1, "");
        luw.set(ObjectUtil.isNull(config.getRemark()), BSOssConfig::getRemark, "");
        luw.eq(BSOssConfig::getOssConfigId, config.getOssConfigId());
        boolean flag = bsOssConfigMapper.update(config, luw) > 0;
        if (flag) {
            CacheUtils.put(CacheNames.SYS_OSS_CONFIG, config.getConfigKey(), JsonUtils.toJsonString(config));
        }
        return flag;
    }

    /**
     * 保存前的数据校验
     */
    private void validEntityBeforeSave(BSOssConfig entity) {
        if (StringUtils.isNotEmpty(entity.getConfigKey())
            && UserConstants.NOT_UNIQUE.equals(checkConfigKeyUnique(entity))) {
            throw new ServiceException("操作配置'" + entity.getConfigKey() + "'失败, 配置key已存在!");
        }
    }

    @Override
    public Boolean deleteWithValidByIds(Collection<Long> ids, Boolean isValid) {
        if (isValid) {
            if (CollUtil.containsAny(ids, OssConstant.SYSTEM_DATA_IDS)) {
                throw new ServiceException("系统内置, 不可删除!");
            }
        }

        // todo 先确认桶没有文件才能删除
        List<BSOssConfig> list = CollUtil.newArrayList();
        for (Long configId : ids) {
            BSOssConfig config = bsOssConfigMapper.selectById(configId);
            list.add(config);
        }
        boolean flag = bsOssConfigMapper.deleteBatchIds(ids) > 0;
        if (flag) {
            list.forEach(BSOssConfig ->
                CacheUtils.evict(CacheNames.SYS_OSS_CONFIG, BSOssConfig.getConfigKey()));
        }
        return flag;
    }

    /**
     * 判断configKey是否唯一
     */
    private String checkConfigKeyUnique(BSOssConfig bSOssConfig) {
        long ossConfigId = ObjectUtil.isNull(bSOssConfig.getOssConfigId()) ? -1L : bSOssConfig.getOssConfigId();
        BSOssConfig info = bsOssConfigMapper.selectOne(new LambdaQueryWrapper<BSOssConfig>()
            .select(BSOssConfig::getOssConfigId, BSOssConfig::getConfigKey)
            .eq(BSOssConfig::getConfigKey, bSOssConfig.getConfigKey()));
        if (ObjectUtil.isNotNull(info) && info.getOssConfigId() != ossConfigId) {
            return UserConstants.NOT_UNIQUE;
        }
        return UserConstants.UNIQUE;
    }

    /**
     * 启用禁用状态
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public int updateOssConfigStatus(BSOssConfigBo bo) {
        BSOssConfig bSOssConfig = BeanUtil.toBean(bo, BSOssConfig.class);
        int row = bsOssConfigMapper.update(null, new LambdaUpdateWrapper<BSOssConfig>()
            .set(BSOssConfig::getStatus, "1"));
        row += bsOssConfigMapper.updateById(bSOssConfig);
        if (row > 0) {
            RedisUtils.setCacheObject(OssConstant.DEFAULT_CONFIG_KEY, bSOssConfig.getConfigKey());
        }
        return row;
    }
}
