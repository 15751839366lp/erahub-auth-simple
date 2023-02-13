package com.erahub.biz.finance.listener.excel;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.collection.CollectionUtil;
import cn.hutool.core.util.ObjectUtil;
import com.alibaba.excel.context.AnalysisContext;
import com.alibaba.excel.event.AnalysisEventListener;
import com.alibaba.excel.util.ListUtils;
import com.alibaba.excel.util.MapUtils;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.erahub.biz.finance.domain.FinanceCompany;
import com.erahub.biz.finance.domain.excel.FinanceCompanyImport;
import com.erahub.biz.finance.mapper.FinanceCompanyMapper;
import com.erahub.common.core.exception.ServiceException;
import com.erahub.common.core.utils.SpringUtils;
import com.erahub.common.core.utils.StringUtils;
import com.erahub.common.excel.core.ExcelListener;
import com.erahub.common.excel.core.ExcelResult;
import com.erahub.common.satoken.utils.LoginHelper;
import lombok.extern.slf4j.Slf4j;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;


@Slf4j
public class FinanceCompanyImportListener extends AnalysisEventListener<FinanceCompanyImport> implements ExcelListener<FinanceCompanyImport> {
    private final FinanceCompanyMapper financeCompanyMapper;

    /**
     * 每隔100条存储数据库，然后清理list ，方便内存回收
     */
    private static final int BATCH_COUNT = 100;

    private final Boolean isUpdateSupport;

    private List<FinanceCompany> financeCompanyList = ListUtils.newArrayListWithExpectedSize(BATCH_COUNT);

    private final List<Long> companyNumberList = new ArrayList<>();

    private final List<String> companyNameList = new ArrayList<>();

    private final String operName;

    private int successNum = 0;
    private int failureNum = 0;
    private final StringBuilder successMsg = new StringBuilder();
    private final StringBuilder failureMsg = new StringBuilder();

    public FinanceCompanyImportListener(Boolean isUpdateSupport) {
        this.financeCompanyMapper = SpringUtils.getBean(FinanceCompanyMapper.class);
        this.isUpdateSupport = isUpdateSupport;
        this.operName = LoginHelper.getUsername();
    }

    @Override
    public void invoke(FinanceCompanyImport financeCompanyImport, AnalysisContext context) {
        Integer rowIndex = context.readRowHolder().getRowIndex();
        try {
            //校验单位
            Long companyId = financeCompanyImport.getCompanyId();
            Long companyNumber = financeCompanyImport.getCompanyNumber();
            String companyName = financeCompanyImport.getCompanyName();
            String status = financeCompanyImport.getStatus();

            if (companyNumber != null && companyNumberList.contains(companyNumber)) {
                throw new ServiceException("单位编号重复！");
            }

            if (StringUtils.isEmpty(companyName)) {
                throw new ServiceException("单位名称不能为空！");
            }
            if (StringUtils.isNotEmpty(companyName) && companyNameList.contains(companyName)) {
                throw new ServiceException("单位名称重复！");
            }

            if (StringUtils.isEmpty(status)) {
                financeCompanyImport.setStatus("0");
            }

            List<FinanceCompany> financeCompanies = financeCompanyMapper.selectList(new LambdaQueryWrapper<FinanceCompany>()
                .eq(financeCompanyImport.getCompanyId() != null, FinanceCompany::getCompanyId, financeCompanyImport.getCompanyId())
                .or()
                .eq(financeCompanyImport.getCompanyNumber() != null, FinanceCompany::getCompanyNumber, financeCompanyImport.getCompanyNumber())
                .or()
                .eq(StringUtils.isNotEmpty(financeCompanyImport.getCompanyName()), FinanceCompany::getCompanyName, financeCompanyImport.getCompanyName()));

            if (companyId == null && CollectionUtil.isNotEmpty(financeCompanies)) {
                throw new ServiceException("单位信息重复！");
            }
            if (companyId != null && !isUpdateSupport) {
                throw new ServiceException("未勾选更新框，无法更新数据！");
            }
            if (companyId != null && isUpdateSupport) {
                //根据id筛选对象，不存在则报异常
                FinanceCompany company = financeCompanies.stream().filter(
                    financeCompany -> companyId.equals(financeCompany.getCompanyId())
                ).findFirst().get();

                if(ObjectUtil.isEmpty(company)){
                    throw new ServiceException("单位ID不存在！");
                }
                if (financeCompanies.size() > 1) {
                    throw new ServiceException("单位信息重复！");
                }
            }

            //添加可以插入的数据
            financeCompanyList.add(BeanUtil.toBean(financeCompanyImport, FinanceCompany.class));
            if(companyNumber != null){
                companyNumberList.add(companyNumber);
            }
            companyNameList.add(companyName);

            if (financeCompanyList.size() >= BATCH_COUNT) {
                if (isUpdateSupport) {
                    financeCompanyMapper.insertOrUpdateBatch(financeCompanyList);
                } else {
                    financeCompanyMapper.insertBatch(financeCompanyList);
                }
                successNum = successNum + financeCompanyList.size();
                financeCompanyList = ListUtils.newArrayListWithExpectedSize(BATCH_COUNT);
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
            if (isUpdateSupport) {
                financeCompanyMapper.insertOrUpdateBatch(financeCompanyList);
            } else {
                financeCompanyMapper.insertBatch(financeCompanyList);
            }
            successNum = successNum + financeCompanyList.size();
        } catch (Exception e) {
            failureMsg.append("<br/><br/>");
            failureMsg.append("数据存在异常：").append(e.getMessage());
            log.error(failureMsg.toString(), e);
        }

    }

    @Override
    public ExcelResult<FinanceCompanyImport> getExcelResult() {
        return new ExcelResult<FinanceCompanyImport>() {

            @Override
            public String getAnalysis() {
                if (failureNum > 0) {
                    failureMsg.insert(0, "很抱歉，部分数据导入失败！共 " + failureNum + " 条数据格式不正确，错误如下：");
                    throw new ServiceException(failureMsg.toString());
                } else {
                    successMsg.insert(0, "恭喜您，数据已全部导入成功！共 " + successNum + " 条，数据如下：");
                }
                return successMsg.toString();
            }

            @Override
            public List<FinanceCompanyImport> getList() {
                return null;
            }

            @Override
            public List<String> getErrorList() {
                return null;
            }
        };
    }
}
