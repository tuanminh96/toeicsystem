//package com.bk.tuanpm.webtoeic.config;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.context.annotation.Bean;
//import org.springframework.context.annotation.Configuration;
//import org.springframework.core.annotation.Order;
//import org.springframework.security.authentication.AuthenticationManager;
//import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
//import org.springframework.security.config.annotation.web.builders.HttpSecurity;
//import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
//import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
//import org.springframework.security.config.http.SessionCreationPolicy;
//import org.springframework.security.core.userdetails.UserDetailsService;
//import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
//import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
//
//import com.bk.tuanpm.webtoeic.service.impl.AdminDetailsServiceImpl;
//
//
//@Configuration
//@EnableWebSecurity
//@Order(2)
//public class SecurityConfigAdmin extends WebSecurityConfigurerAdapter{
//	
//	@Autowired
//	private AuthenticationSuccessHandler successHandler;
//	
//	@Autowired
//	private AdminDetailsServiceImpl userDetailsService;
//
//	
//	@Bean
//	public BCryptPasswordEncoder passwordEncoder() {
//		return new BCryptPasswordEncoder();
//	}
//	
//
//	@Autowired
//	public void configureGlobal(AuthenticationManagerBuilder builder) throws Exception {
//		builder.userDetailsService(userDetailsService).passwordEncoder(passwordEncoder());
//	}
//	
//	
//	@Override
//	protected void configure(HttpSecurity http) throws Exception {	
//		http
//	    .csrf().disable()
//	    .antMatcher("/adminPage/**")
//		.authorizeRequests().anyRequest().authenticated()
//			.and()
//		 .formLogin()
//		 	.loginPage("/adminPage/loginAdmin")
//		    .usernameParameter("email")
//			.passwordParameter("password")
//			.successHandler(successHandler)
//			.failureUrl("/signin?error")
//		    .and()
//		   .sessionManagement()
//		   .sessionCreationPolicy(SessionCreationPolicy.IF_REQUIRED)
//		   .invalidSessionUrl("/signin?invalidSession")
//		   .and()
//		 .logout()
//		    .logoutUrl("/signout")
//		    .logoutSuccessUrl("/")
//		    .and()
//		.exceptionHandling().accessDeniedPage("/signin?accessDenied");
//		
//	}
//	
//}
//
