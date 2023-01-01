package com.erahub.biz.finance.service.impl;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.util.NumberUtil;
import cn.hutool.core.util.ObjectUtil;
import com.erahub.common.core.exception.ServiceException;
import com.erahub.common.core.utils.BeanCopyUtils;
import com.erahub.common.core.utils.StringUtils;
import com.erahub.common.excel.utils.ExcelUtil;
import com.erahub.common.mybatis.core.page.PageQuery;
import com.erahub.common.mybatis.core.page.TableDataInfo;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import lombok.RequiredArgsConstructor;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.stereotype.Service;
import com.erahub.biz.finance.domain.bo.BizFinanceERPProjectBo;
import com.erahub.biz.finance.domain.vo.BizFinanceERPProjectVo;
import com.erahub.biz.finance.domain.BizFinanceERPProject;
import com.erahub.biz.finance.mapper.BizFinanceERPProjectMapper;
import com.erahub.biz.finance.service.IBizFinanceERPProjectService;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.InputStream;
import java.math.BigDecimal;
import java.util.*;

import static org.aspectj.weaver.tools.cache.SimpleCacheFactory.path;

/**
 * ERP工程明细Service业务层处理
 *
 * @author erahub
 * @date 2023-01-01
 */
@RequiredArgsConstructor
@Service
public class BizFinanceERPProjectServiceImpl implements IBizFinanceERPProjectService {

    private final BizFinanceERPProjectMapper baseMapper;

    /**
     * 查询ERP工程明细
     */
    @Override
    public BizFinanceERPProjectVo queryById(Long projectId) {
        return baseMapper.selectVoById(projectId);
    }

    /**
     * 查询ERP工程明细列表
     */
    @Override
    public TableDataInfo<BizFinanceERPProjectVo> queryPageList(BizFinanceERPProjectBo bo, PageQuery pageQuery) {
        LambdaQueryWrapper<BizFinanceERPProject> lqw = buildQueryWrapper(bo);
        Page<BizFinanceERPProjectVo> result = baseMapper.selectVoPage(pageQuery.build(), lqw);
        return TableDataInfo.build(result);
    }

    @Override
    public void export(List<BizFinanceERPProjectBo> bos, HttpServletResponse response) {
        List<BizFinanceERPProjectVo> vos = BeanCopyUtils.copyList(bos, BizFinanceERPProjectVo.class);
        ExcelUtil.exportExcel(vos, "ERP工程明细", BizFinanceERPProjectVo.class, response);
    }

    /**
     * 查询ERP工程明细列表
     */
    @Override
    public List<BizFinanceERPProjectVo> queryList(BizFinanceERPProjectBo bo) {
        LambdaQueryWrapper<BizFinanceERPProject> lqw = buildQueryWrapper(bo);
        return baseMapper.selectVoList(lqw);
    }

    private LambdaQueryWrapper<BizFinanceERPProject> buildQueryWrapper(BizFinanceERPProjectBo bo) {
        Map<String, Object> params = bo.getParams();
        LambdaQueryWrapper<BizFinanceERPProject> lqw = Wrappers.lambdaQuery();
        lqw.eq(StringUtils.isNotBlank(bo.getProjectNumber()), BizFinanceERPProject::getProjectNumber, bo.getProjectNumber());
        lqw.eq(StringUtils.isNotBlank(bo.getRequisitionNumber()), BizFinanceERPProject::getRequisitionNumber, bo.getRequisitionNumber());
        return lqw;
    }

    /**
     * 新增ERP工程明细
     */
    @Override
    public Boolean insertByBo(BizFinanceERPProjectBo bo) {
        BizFinanceERPProject add = BeanUtil.toBean(bo, BizFinanceERPProject.class);
        validEntityBeforeSave(add);
        boolean flag = baseMapper.insert(add) > 0;
        if (flag) {
            bo.setProjectId(add.getProjectId());
        }
        return flag;
    }

    /**
     * 修改ERP工程明细
     */
    @Override
    public Boolean updateByBo(BizFinanceERPProjectBo bo) {
        BizFinanceERPProject update = BeanUtil.toBean(bo, BizFinanceERPProject.class);
        validEntityBeforeSave(update);
        return baseMapper.updateById(update) > 0;
    }

    /**
     * 保存前的数据校验
     */
    private void validEntityBeforeSave(BizFinanceERPProject entity) {
        //TODO 做一些数据校验,如唯一约束
    }

    /**
     * 批量删除ERP工程明细
     */
    @Override
    public Boolean deleteWithValidByIds(Collection<Long> ids, Boolean isValid) {
        if (isValid) {
            //TODO 做一些业务上的校验,判断是否需要校验
        }
        return baseMapper.deleteBatchIds(ids) > 0;
    }

    @Override
    public List<BizFinanceERPProjectVo> importData(MultipartFile file) throws IOException {
        ArrayList<BizFinanceERPProjectVo> projectList = null;
        try {

            String fileName = file.getOriginalFilename();
            InputStream inputStream = file.getInputStream();
            Workbook workbook = null;
            String suffix = fileName.substring(fileName.lastIndexOf(".") + 1).trim();
            if (suffix.equalsIgnoreCase("xls")) {
                workbook = new HSSFWorkbook(inputStream);
            } else if (suffix.equalsIgnoreCase("xlsx")) {
                workbook = new XSSFWorkbook(inputStream);
            }

            Sheet sheet0 = workbook.getSheetAt(0);
            Boolean flag = true;
            HashMap<Long, BizFinanceERPProject> projectMap = new HashMap<>();
            for (int i = 0; i < sheet0.getPhysicalNumberOfRows(); i++) {
                Row row = sheet0.getRow(i);
                if (ObjectUtil.isEmpty(row)) {
                    continue;
                }
                BizFinanceERPProject bizFinanceERPProject = new BizFinanceERPProject();
                //获取工单号
                if (ObjectUtil.isNotEmpty(row.getCell(1))
                    && StringUtils.isNotEmpty(ExcelUtil.getCellStringValue(row.getCell(1)))
                    && NumberUtil.isNumber(ExcelUtil.getCellStringValue(row.getCell(1)))
                ) {
                    bizFinanceERPProject.setProjectNumber(ExcelUtil.getCellStringValue(row.getCell(1)));
                } else {
                    flag = false;
                }

                //获取合同编号
                if (ObjectUtil.isNotEmpty(row.getCell(8))
                    && StringUtils.isNotEmpty(ExcelUtil.getCellStringValue(row.getCell(8)))
                ) {
                    bizFinanceERPProject.setContractNumber(ExcelUtil.getCellStringValue(row.getCell(8)));
                } else {
                    flag = false;
                }

                //获取请购单号
                if (ObjectUtil.isNotEmpty(row.getCell(21))
                    && StringUtils.isNotEmpty(ExcelUtil.getCellStringValue(row.getCell(21)))
                    && NumberUtil.isNumber(ExcelUtil.getCellStringValue(row.getCell(21)))
                ) {
                    bizFinanceERPProject.setRequisitionNumber(ExcelUtil.getCellStringValue(row.getCell(21)));
                } else {
                    flag = false;
                }

                //获取工单分类
                if (ObjectUtil.isNotEmpty(row.getCell(24))
                    && StringUtils.isNotEmpty(ExcelUtil.getCellStringValue(row.getCell(24)))
                ) {
                    bizFinanceERPProject.setProjectType(ExcelUtil.getCellStringValue(row.getCell(24)));
                } else {
                    flag = false;
                }

                if (flag) {
                    projectMap.put(Long.valueOf(row.getCell(1).getStringCellValue()), bizFinanceERPProject);
                }

                flag = true;
            }

            flag = true;

            Long id = 1l;
            Sheet sheet1 = workbook.getSheetAt(1);

            projectList = new ArrayList<>();
            for (int i = 0; i < sheet1.getPhysicalNumberOfRows(); i++) {
                Row row = sheet1.getRow(i);
                if (ObjectUtil.isEmpty(row)) {
                    continue;
                }
                BizFinanceERPProjectVo bizFinanceERPProjectVo = new BizFinanceERPProjectVo();
                String projectNumber = "";
                String requisitionNumber = "";
                //获取工单号
                if (ObjectUtil.isNotEmpty(row.getCell(1))
                    && StringUtils.isNotEmpty(ExcelUtil.getCellStringValue(row.getCell(1)))
                    && NumberUtil.isNumber(ExcelUtil.getCellStringValue(row.getCell(1)))
                ) {
                    projectNumber = ExcelUtil.getCellStringValue(row.getCell(1));
                    bizFinanceERPProjectVo.setProjectNumber(projectNumber);
                } else {
                    flag = false;
                }

                //获取装置名称
                if (ObjectUtil.isNotEmpty(row.getCell(2))
                    && StringUtils.isNotEmpty(ExcelUtil.getCellStringValue(row.getCell(2)))
                ) {
                    bizFinanceERPProjectVo.setDeviceName(ExcelUtil.getCellStringValue(row.getCell(2)));
                } else {
                    flag = false;
                }

                //获取工程名称
                if (ObjectUtil.isNotEmpty(row.getCell(3))
                    && StringUtils.isNotEmpty(ExcelUtil.getCellStringValue(row.getCell(3)))
                ) {
                    bizFinanceERPProjectVo.setProjectName(ExcelUtil.getCellStringValue(row.getCell(3)));
                } else {
                    flag = false;
                }

                //获取计划类别
                if (ObjectUtil.isNotEmpty(row.getCell(4))
                    && StringUtils.isNotEmpty(ExcelUtil.getCellStringValue(row.getCell(4)))
                ) {
                    bizFinanceERPProjectVo.setPlanType(ExcelUtil.getCellStringValue(row.getCell(4)));
                } else {
                    flag = false;
                }

                //获取结算审核额
                if (ObjectUtil.isNotEmpty(row.getCell(5))
                    && StringUtils.isNotEmpty(ExcelUtil.getCellStringValue(row.getCell(5), "0.00"))
                    && NumberUtil.isNumber(ExcelUtil.getCellStringValue(row.getCell(5), "0.00"))
                ) {
                    bizFinanceERPProjectVo.setSettlementReviewAmount(new BigDecimal(ExcelUtil.getCellStringValue(row.getCell(5), "0.00")));
                } else {
                    flag = false;
                }

                //获取单位
                if (ObjectUtil.isNotEmpty(row.getCell(6))
                    && StringUtils.isNotEmpty(ExcelUtil.getCellStringValue(row.getCell(6)))
                ) {
                    bizFinanceERPProjectVo.setDepartment(ExcelUtil.getCellStringValue(row.getCell(6)));
                } else {
                    flag = false;
                }

                //获取请购单号
                if (ObjectUtil.isNotEmpty(row.getCell(7))
                    && StringUtils.isNotEmpty(ExcelUtil.getCellStringValue(row.getCell(7)))
                    && NumberUtil.isNumber(ExcelUtil.getCellStringValue(row.getCell(7)))
                ) {
                    requisitionNumber = ExcelUtil.getCellStringValue(row.getCell(7));
                    bizFinanceERPProjectVo.setRequisitionNumber(requisitionNumber);
                } else {
                    flag = false;
                }

                if (flag) {
                    //效验并获取合同编号
                    BizFinanceERPProject bfe = projectMap.get(Long.valueOf(projectNumber));
                    if (bfe != null && bfe.getRequisitionNumber().equals(requisitionNumber)) {
                        bizFinanceERPProjectVo.setContractNumber(bfe.getContractNumber());
                        bizFinanceERPProjectVo.setProjectType(bfe.getProjectType());

                        bizFinanceERPProjectVo.setProjectId(id);
                        projectList.add(bizFinanceERPProjectVo);
                        id++;
                    }
                }

                flag = true;
            }
        } catch (Exception e) {
            throw new ServiceException(e.getMessage());
        }
        return projectList;
    }
}
