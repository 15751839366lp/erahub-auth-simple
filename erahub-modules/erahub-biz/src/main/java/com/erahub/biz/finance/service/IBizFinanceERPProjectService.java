package com.erahub.biz.finance.service;

import com.erahub.biz.finance.domain.BizFinanceERPProject;
import com.erahub.biz.finance.domain.vo.BizFinanceERPProjectVo;
import com.erahub.biz.finance.domain.bo.BizFinanceERPProjectBo;
import com.erahub.common.mybatis.core.page.PageQuery;
import com.erahub.common.mybatis.core.page.TableDataInfo;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Collection;
import java.util.List;

/**
 * ERP工程明细Service接口
 *
 * @author erahub
 * @date 2023-01-01
 */
public interface IBizFinanceERPProjectService {

    /**
     * 查询ERP工程明细
     */
    BizFinanceERPProjectVo queryById(Long projectId);

    /**
     * 查询ERP工程明细列表
     */
    TableDataInfo<BizFinanceERPProjectVo> queryPageList(BizFinanceERPProjectBo bo, PageQuery pageQuery);

    /**
     * 导出ERP工程明细列表
     */
    void export(List<BizFinanceERPProjectBo> bos, HttpServletResponse response);

    /**
     * 查询ERP工程明细列表
     */
    List<BizFinanceERPProjectVo> queryList(BizFinanceERPProjectBo bo);

    /**
     * 修改ERP工程明细
     */
    Boolean insertByBo(BizFinanceERPProjectBo bo);

    /**
     * 修改ERP工程明细
     */
    Boolean updateByBo(BizFinanceERPProjectBo bo);

    /**
     * 校验并批量删除ERP工程明细信息
     */
    Boolean deleteWithValidByIds(Collection<Long> ids, Boolean isValid);

    List<BizFinanceERPProjectVo> importData(MultipartFile file) throws IOException;
}
