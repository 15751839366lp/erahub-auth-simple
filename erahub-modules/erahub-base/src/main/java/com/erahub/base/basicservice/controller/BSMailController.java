package com.erahub.base.basicservice.controller;

import com.erahub.common.core.domain.R;
import com.erahub.common.log.annotation.Log;
import com.erahub.common.log.enums.BusinessType;
import com.erahub.common.mail.utils.MailUtils;
import lombok.RequiredArgsConstructor;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.io.File;

/**
 * 邮件发送模块
 *
 * @author erahub
 */
@Validated
@RequiredArgsConstructor
@RestController
@RequestMapping("/mail")
public class BSMailController {

    /**
     * 发送邮件
     *
     * @param to 接收人
     * @param subject 标题
     * @param text 内容
     */
    @Log(title = "邮件发送", businessType = BusinessType.OTHER)
    @GetMapping("/sendSimpleMessage")
    public R<Void> sendSimpleMessage(String to, String subject, String text) {
        MailUtils.sendText(to, subject, text);
        return R.ok();
    }

    /**
     * 发送邮件（带附件）
     *
     * @param to 接收人
     * @param subject 标题
     * @param text 内容
     * @param filePath 附件路径
     */
    @Log(title = "邮件发送", businessType = BusinessType.OTHER)
    @GetMapping("/sendMessageWithAttachment")
    public R<Void> sendMessageWithAttachment(String to, String subject, String text, String filePath) {
        MailUtils.sendText(to, subject, text, new File(filePath));
        return R.ok();
    }

}
