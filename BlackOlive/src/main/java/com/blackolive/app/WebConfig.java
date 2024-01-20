package com.blackolive.app;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
@EnableWebMvc
public class WebConfig implements WebMvcConfigurer{

	@Override
    public void addInterceptors(InterceptorRegistry registry) {
		
		System.out.println("WebConfig working...");
        registry.addInterceptor( new HeadInterCeptor() )
                .addPathPatterns("/**");

    } // addInterceptors
	
	
} //class
