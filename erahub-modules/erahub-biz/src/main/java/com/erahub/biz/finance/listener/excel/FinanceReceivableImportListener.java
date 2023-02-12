package com.erahub.biz.finance.listener.excel;

import cn.dev33.satoken.secure.BCrypt;
import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.collection.CollectionUtil;
import cn.hutool.core.util.ObjectUtil;
import com.alibaba.excel.context.AnalysisContext;
import com.alibaba.excel.event.AnalysisEventListener;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.erahub.base.system.api.domain.SysUser;
import com.erahub.biz.finance.domain.FinanceCompany;
import com.erahub.biz.finance.domain.FinanceReceivable;
import com.erahub.biz.finance.domain.excel.FinanceReceivableImport;
import com.erahub.biz.finance.mapper.FinanceCompanyMapper;
import com.erahub.biz.finance.mapper.FinanceReceivableMapper;
import com.erahub.biz.finance.service.IFinanceCompanyService;
import com.erahub.biz.finance.service.IFinanceReceivableService;
import com.erahub.common.core.exception.ServiceException;
import com.erahub.common.core.utils.SpringUtils;
import com.erahub.common.core.utils.StringUtils;
import com.erahub.common.core.utils.ValidatorUtils;
import com.erahub.common.excel.core.ExcelListener;
import com.erahub.common.excel.core.ExcelResult;
import com.erahub.common.satoken.utils.LoginHelper;
import lombok.extern.slf4j.Slf4j;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import static net.sf.jsqlparser.util.validation.metadata.NamedObject.user;

@Slf4j
public class FinanceReceivableImportListener extends AnalysisEventListener<FinanceReceivableImport> implements ExcelListener<FinanceReceivableImport> {
    private final FinanceReceivableMapper financeReceivableMapper;
    private final FinanceCompanyMapper financeCompanyMapper;

    private final Boolean isUpdateSupport;

    private final Map<Integer, FinanceReceivableImport> financeReceivableImportMap = new HashMap();

    private final List<FinanceCompany> financeCompanyList = new ArrayList<>();

    private final String operName;

    private int successNum = 0;
    private int failureNum = 0;
    private final StringBuilder successMsg = new StringBuilder();
    private final StringBuilder failureMsg = new StringBuilder();

    public FinanceReceivableImportListener(Boolean isUpdateSupport) {
        this.financeReceivableMapper = SpringUtils.getBean(FinanceReceivableMapper.class);
        this.financeCompanyMapper = SpringUtils.getBean(FinanceCompanyMapper.class);
        this.isUpdateSupport = isUpdateSupport;
        this.operName = LoginHelper.getUsername();
    }

    @Override
    public void invoke(FinanceReceivableImport financeReceivableImport, AnalysisContext context) {
        Integer rowIndex = context.readRowHolder().getRowIndex();
        try {
            //校验单位
            Long companyNumber = financeReceivableImport.getCompanyNumber();
            String companyName = financeReceivableImport.getCompanyName();
            if (companyNumber == null && StringUtils.isEmpty(companyName)) {
                throw new ServiceException("单位信息不能为空！");
            }

            //校验金额
            BigDecimal includingTaxPrice = financeReceivableImport.getIncludingTaxPrice().setScale(2,BigDecimal.ROUND_HALF_UP);
            BigDecimal taxRate = financeReceivableImport.getTaxRate().setScale(3,BigDecimal.ROUND_HALF_UP);
            BigDecimal excludingTaxPrice = financeReceivableImport.getExcludingTaxPrice().setScale(2,BigDecimal.ROUND_HALF_UP);
            BigDecimal accountPaid = financeReceivableImport.getAccountPaid().setScale(2,BigDecimal.ROUND_HALF_UP);
            BigDecimal arrearage = financeReceivableImport.getArrearage().setScale(2,BigDecimal.ROUND_HALF_UP);
            BigDecimal warrantyDeposit = financeReceivableImport.getWarrantyDeposit().setScale(2,BigDecimal.ROUND_HALF_UP);
            //计税金额校验
            if (includingTaxPrice.divide(new BigDecimal(1).add(taxRate),
                2, BigDecimal.ROUND_HALF_UP).compareTo(excludingTaxPrice) != 0) {
                throw new ServiceException("税额计算有误！");
            }
            //todo

            if (financeReceivableImport.getReceivableId() != null && !isUpdateSupport) {
                throw new ServiceException("未勾选更新数据，无法更新！");
            } else {
                FinanceCompany financeCompany = new FinanceCompany();
                financeCompany.setCompanyNumber(companyNumber);
                financeCompany.setCompanyName(companyName);
                financeCompanyList.add(financeCompany);
                financeReceivableImportMap.put(rowIndex, financeReceivableImport);
            }

        } catch (Exception e) {
            failureNum++;
            failureMsg.append("<br/>第").append(rowIndex).append("条，")
                .append("数据存在异常：").append(e.getMessage());
            log.error(failureMsg.toString(), e);
        }
    }

    @Override
    public void doAfterAllAnalysed(AnalysisContext context) {
        try {
            if (!CollectionUtil.isEmpty(financeReceivableImportMap) && !CollectionUtil.isEmpty(financeCompanyList)) {
                List<FinanceReceivable> financeReceivableList = new ArrayList<>();
                String uploadId = System.currentTimeMillis() + operName;

                List<Long> companyNumbers = financeCompanyList.stream().map(FinanceCompany::getCompanyNumber).collect(Collectors.toList());
                List<String> companyNames = financeCompanyList.stream().map(FinanceCompany::getCompanyName).collect(Collectors.toList());
                List<FinanceCompany> financeCompanies = financeCompanyMapper.selectList(new LambdaQueryWrapper<FinanceCompany>()
                    .in(CollectionUtil.isNotEmpty(companyNumbers), FinanceCompany::getCompanyNumber, companyNumbers)
                    .or()
                    .in(CollectionUtil.isNotEmpty(companyNames), FinanceCompany::getCompanyName, companyNames));

                failureMsg.append("<br/><br/>");
                if (CollectionUtil.isEmpty(financeCompanies)) {
                    failureMsg.append("所有单位都不存在");
                } else {
                    financeReceivableImportMap.forEach((rowIndex, financeReceivableImport) -> {
                        Long companyNumber = financeReceivableImport.getCompanyNumber();
                        String companyName = financeReceivableImport.getCompanyName();

                        //先判断通过单位编号还是单位名称筛选
                        if (companyNumber != null) {
                            List<FinanceCompany> list = financeCompanies.stream().filter(financeCompany ->
                                    companyNumber.equals(financeCompany.getCompanyNumber()))
                                .collect(Collectors.toList());

                            if (CollectionUtil.isEmpty(list)) {
                                failureMsg.append("<br/>第").append(rowIndex).append("条，")
                                    .append("单位编号不存在！");
                            } else {
                                FinanceCompany financeCompany = list.get(0);
                                //判断单位编号和单位名称是否准确
                                if (StringUtils.isEmpty(companyName)) {
                                    FinanceReceivable financeReceivable = BeanUtil.toBean(financeReceivableImport, FinanceReceivable.class);
                                    financeReceivable.setCompanyId(financeCompany.getCompanyId());
                                    financeReceivable.setUploadId(uploadId);
                                    financeReceivableList.add(financeReceivable);
                                } else if(ObjectUtil.equals(financeCompany.getCompanyName(), companyName)){
                                    FinanceReceivable financeReceivable = BeanUtil.toBean(financeReceivableImport, FinanceReceivable.class);
                                    financeReceivable.setCompanyId(financeCompany.getCompanyId());
                                    financeReceivable.setUploadId(uploadId);
                                    financeReceivableList.add(financeReceivable);
                                }else{
                                    failureMsg.append("<br/>第").append(rowIndex).append("条，")
                                        .append("单位编号与单位名称填写有误！");
                                }
                            }
                        } else if (StringUtils.isNotEmpty(companyName)) {
                            List<FinanceCompany> list = financeCompanies.stream().filter(financeCompany ->
                                    companyName.equals(financeCompany.getCompanyName()))
                                .collect(Collectors.toList());
                            if (CollectionUtil.isEmpty(list)) {
                                failureMsg.append("<br/>第").append(rowIndex).append("条，")
                                    .append("单位名称不存在！");
                            } else {
                                FinanceCompany financeCompany = list.get(0);

                                FinanceReceivable financeReceivable = BeanUtil.toBean(financeReceivableImport, FinanceReceivable.class);
                                financeReceivable.setCompanyId(financeCompany.getCompanyId());
                                financeReceivable.setUploadId(uploadId);
                                financeReceivableList.add(financeReceivable);

                            }
                        }
                    });
                    if (CollectionUtil.isNotEmpty(financeReceivableList)) {
                        if (isUpdateSupport) {
                            financeReceivableMapper.insertOrUpdateBatch(financeReceivableList);
                        } else {
                            financeReceivableMapper.insertBatch(financeReceivableList);
                        }
                        successNum = financeReceivableList.size();
                    }
                }
            }
        } catch (Exception e) {
            failureMsg.append("<br/><br/>");
            failureMsg.append("数据存在异常：").append(e.getMessage());
            log.error(failureMsg.toString(), e);
        }

    }

    @Override
    public ExcelResult<FinanceReceivableImport> getExcelResult() {
        return new ExcelResult<FinanceReceivableImport>() {

            @Override
            public String getAnalysis() {
                if (failureNum > 0) {
                    failureMsg.insert(0, "很抱歉，导入失败！共 " + failureNum + " 条数据格式不正确，错误如下：");
                    throw new ServiceException(failureMsg.toString());
                } else {
                    successMsg.insert(0, "恭喜您，数据已全部导入成功！共 " + successNum + " 条，数据如下：");
                }
                return successMsg.toString();
            }

            @Override
            public List<FinanceReceivableImport> getList() {
                return null;
            }

            @Override
            public List<String> getErrorList() {
                return null;
            }
        };
    }

}
