package com;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.condition.ConditionalOnBean;
import org.springframework.boot.context.embedded.FilterRegistrationBean;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ImportResource;
import org.springframework.context.annotation.PropertySource;
import org.springframework.context.annotation.PropertySources;
import org.springframework.web.filter.DelegatingFilterProxy;

import java.util.HashMap;
import java.util.Map;

@SpringBootApplication
@EnableConfigurationProperties
@PropertySources({
        @PropertySource("classpath:freemarker.properties"),
        @PropertySource("classpath:config.properties"),
        @PropertySource("classpath:database.properties")
})
@ImportResource("classpath*:spring/applicationContext.xml")
public class Bootstrap {
    public static void main(String[] args) {

        SpringApplication.run(Bootstrap.class, args);
    }

//
//    @Bean
//    @ConditionalOnBean(name = "adminMtFilter")
//    public FilterRegistrationBean securityFilterChainRegistration( ) {
//        DelegatingFilterProxy delegatingFilterProxy = new DelegatingFilterProxy();
//        delegatingFilterProxy.setTargetBeanName("adminMtFilter");
//        FilterRegistrationBean registrationBean = new FilterRegistrationBean(delegatingFilterProxy);
//        Map<String, String> initParameters = new HashMap<>();
//        initParameters.put("targetFilterLifecycle","true");
//        registrationBean.setInitParameters(initParameters);
//        registrationBean.addUrlPatterns("/*");
//        return registrationBean;
//    }

//    @Bean
//    public RemoteIpFilter remoteIpFilter() {
//        return new RemoteIpFilter();
//    }
}
