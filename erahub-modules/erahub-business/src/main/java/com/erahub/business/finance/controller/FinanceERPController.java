package com.erahub.business.finance.controller;

import com.erahub.business.finance.service.IFinanceERPService;
import com.erahub.common.core.web.controller.BaseController;
import lombok.RequiredArgsConstructor;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 财务ERP业务控制器
 * 前端访问路由地址为:/business/finance/erp
 *
 * @author erahub
 * @date 2022-12-17
 */
@Validated
@RequiredArgsConstructor
@RestController
@RequestMapping("/finance/erp")
public class FinanceERPController extends BaseController {

    private final IFinanceERPService iFinanceERPService;


}
