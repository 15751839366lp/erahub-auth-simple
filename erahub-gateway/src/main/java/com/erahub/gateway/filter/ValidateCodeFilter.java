package com.erahub.gateway.filter;

import cn.hutool.core.lang.Dict;
import com.erahub.common.core.utils.JsonUtils;
import com.erahub.common.core.utils.StringUtils;
import com.erahub.gateway.config.properties.CaptchaProperties;
import com.erahub.gateway.service.ValidateCodeService;
import com.erahub.gateway.utils.WebFluxUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cloud.gateway.filter.GatewayFilter;
import org.springframework.cloud.gateway.filter.factory.AbstractGatewayFilterFactory;
import org.springframework.core.io.buffer.DataBuffer;
import org.springframework.core.io.buffer.DataBufferUtils;
import org.springframework.http.server.reactive.ServerHttpRequest;
import org.springframework.stereotype.Component;
import reactor.core.publisher.Flux;

import java.nio.CharBuffer;
import java.nio.charset.StandardCharsets;
import java.util.concurrent.atomic.AtomicReference;

/**
 * 验证码过滤器
 *
 * @author erahub
 */
@Component
public class ValidateCodeFilter extends AbstractGatewayFilterFactory<Object> {
    private final static String[] VALIDATE_URL = new String[]{"/auth/login", "/auth/register", "/auth/smsLogin"};

    @Autowired
    private ValidateCodeService validateCodeService;

    @Autowired
    private CaptchaProperties captchaProperties;

    private static final String CODE = "code";

    private static final String UUID = "uuid";

    @Override
    public GatewayFilter apply(Object config) {
        return (exchange, chain) -> {
            ServerHttpRequest request = exchange.getRequest();

            // 非登录/注册请求或验证码关闭，不处理
            if (!StringUtils.equalsAnyIgnoreCase(request.getURI().getPath(), VALIDATE_URL) || !captchaProperties.getEnabled()) {
                return chain.filter(exchange);
            }

            try {
                String rspStr = resolveBodyFromRequest(request);
                Dict obj = JsonUtils.parseMap(rspStr);
                validateCodeService.checkCaptcha(obj.getStr(CODE), obj.getStr(UUID));
            } catch (Exception e) {
                return WebFluxUtils.webFluxResponseWriter(exchange.getResponse(), e.getMessage());
            }
            return chain.filter(exchange);
        };
    }

    private String resolveBodyFromRequest(ServerHttpRequest serverHttpRequest) {
        // 获取请求体
        Flux<DataBuffer> body = serverHttpRequest.getBody();
        AtomicReference<String> bodyRef = new AtomicReference<>();
        body.subscribe(buffer -> {
            CharBuffer charBuffer = StandardCharsets.UTF_8.decode(buffer.asByteBuffer());
            DataBufferUtils.release(buffer);
            bodyRef.set(charBuffer.toString());
        });
        return bodyRef.get();
    }
}
