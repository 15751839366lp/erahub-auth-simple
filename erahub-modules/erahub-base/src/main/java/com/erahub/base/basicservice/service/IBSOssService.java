package com.erahub.base.basicservice.service;

import com.erahub.common.mybatis.core.page.PageQuery;
import com.erahub.common.mybatis.core.page.TableDataInfo;
import com.erahub.base.basicservice.domain.BSOss;
import com.erahub.base.basicservice.domain.bo.BSOssBo;
import com.erahub.base.basicservice.domain.vo.BSOssVo;
import org.springframework.web.multipart.MultipartFile;

import java.util.Collection;
import java.util.List;

/**
 * 文件上传 服务层
 *
 * @author erahub
 */
public interface IBSOssService {

    TableDataInfo<BSOssVo> queryPageList(BSOssBo sysOss, PageQuery pageQuery);

    List<BSOssVo> listByIds(Collection<Long> ossIds);

    BSOssVo getById(Long ossId);

    BSOss upload(MultipartFile file);

    Boolean deleteWithValidByIds(Collection<Long> ids, Boolean isValid);

}
