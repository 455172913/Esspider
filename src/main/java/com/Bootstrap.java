package com;

import com.service.impl.CrawlerHandler;
import com.service.impl.CrawlerService;
import org.quartz.CronTrigger;
import org.quartz.JobDetail;
import org.quartz.Scheduler;
import org.quartz.SchedulerException;
import org.quartz.impl.StdSchedulerFactory;
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

import java.text.ParseException;
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
//        //定时启动
//        try {
//            topicSchedule1();
//        } catch (SchedulerException e) {
//            e.printStackTrace();
//        } catch (ParseException e) {
//            e.printStackTrace();
//        }
        //SpringBoot启动
        SpringApplication.run(Bootstrap.class, args);
    }

//    /**
//     * 定时抓取微博热门话题数据：每天1次：（0:30:01）
//     */
//    public static void topicSchedule1() throws SchedulerException, ParseException {
//        Scheduler scheduler = StdSchedulerFactory.getDefaultScheduler();
//        JobDetail jobDetail = new JobDetailImpl("fetchTopicJob1", "topicGroup1", CrawlerHandler.class);
//        CronTrigger trigger = new CronTriggerImpl("cronTrigger", "topicGroup1", "1 30 00 * * ?") {
//        };
//
//        scheduler.scheduleJob(jobDetail, trigger);
//        scheduler.start();
//    }

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
