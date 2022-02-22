 package com.bk.tuanpm.webtoeic.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.bk.tuanpm.webtoeic.interceptor.CheckIsGroupAccessible;
import com.bk.tuanpm.webtoeic.interceptor.CheckNotificationUnseen;
import com.bk.tuanpm.webtoeic.interceptor.CheckRoleInterceptor;

@Configuration
public class WebConfig implements WebMvcConfigurer {

	@Autowired
	private CheckRoleInterceptor checkRoleInterceptor;
	
	@Autowired
	private CheckIsGroupAccessible checkIsGroupAccessible;
	
	@Autowired
	private CheckNotificationUnseen checkNotificationUnseen;

	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/img/**").addResourceLocations("/resources/images/");
		registry.addResourceHandler("/css/**").addResourceLocations("/resources/css/");
		registry.addResourceHandler("/js/**").addResourceLocations("/resources/js/");
		registry.addResourceHandler("/file/**").addResourceLocations("/resources/file/");
	}

	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(checkRoleInterceptor).addPathPatterns("/processResultPayment**");
		registry.addInterceptor(checkIsGroupAccessible).addPathPatterns("/group/**");
		registry.addInterceptor(checkNotificationUnseen).addPathPatterns("/**");
	}

}
