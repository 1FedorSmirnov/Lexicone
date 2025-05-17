package com.example.lexicone.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.access.expression.method.MethodSecurityExpressionHandler;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.method.configuration.GlobalMethodSecurityConfiguration;

/**
 * Расширяет стандартную обработку аннотаций @PreAuthorize, @PostAuthorize с учетом ACL.
 * Позволяет применять ACL на уровне методов.
 * </p>
 *
 * <p>
 * Аннотация {@code @EnableGlobalMethodSecurity(prePostEnabled = true, securedEnabled = true)}:
 * <ul>
 *   <li>Включает поддержку аннотаций {@code @PreAuthorize}, {@code @PostAuthorize}</li>
 *   <li>Позволяет использовать выражения {@code hasPermission(...)} с объектами</li>
 *   <li>Включает поддержку {@code @Secured} аннотаций</li>
 * </ul>
 * </p>
 */
@EnableGlobalMethodSecurity(prePostEnabled = true, securedEnabled = true)
public class AclMethodSecurityConfiguration extends GlobalMethodSecurityConfiguration {

    private final MethodSecurityExpressionHandler defaultMethodSecurityExpressionHandler;

    /**
     * Подключает обработчик выражений безопасности,
     * для проверки разрешений через ACL.
     *
     * @param defaultMethodSecurityExpressionHandler бин, сконфигурированный в {@code AclConfig}
     */
    @Autowired
    //нужно, чтобы Spring Security проверял разрешения через ACL
    public AclMethodSecurityConfiguration(MethodSecurityExpressionHandler defaultMethodSecurityExpressionHandler) {
        this.defaultMethodSecurityExpressionHandler = defaultMethodSecurityExpressionHandler;
    }

    /**
     * Переопределяет обработчик выражений безопасности по умолчанию,
     * чтобы использовать ACL-проверки в аннотациях {@code @PreAuthorize} и {@code @PostAuthorize}.
     *
     * @return ACL-совместимый {@link MethodSecurityExpressionHandler}
     */
    @Override
    protected MethodSecurityExpressionHandler createExpressionHandler() {
        return defaultMethodSecurityExpressionHandler;
    }

}
