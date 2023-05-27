package vn.iotstar.config;

import org.apache.http.HttpStatus;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.access.AccessDeniedHandler;
import org.springframework.security.web.authentication.HttpStatusEntryPoint;

import vn.iotstar.controller.CustomAccessDeniedHandler;
import vn.iotstar.controller.CustomAuthenticationSuccessHandler;
import vn.iotstar.service.CustomerUserDetailService;

@SuppressWarnings("deprecation")
@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {
	
	@Autowired
	CustomerUserDetailService customerUser;
	@Bean
	public PasswordEncoder passwordEncoder(){
		return new BCryptPasswordEncoder();
	}
	
	@Bean
    public AccessDeniedHandler accessDeniedHandler() {
        return new CustomAccessDeniedHandler();
    }
	@Autowired	
    public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
		auth.userDetailsService(customerUser);
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http
        	.headers()
        		.contentSecurityPolicy("default-src * ")
        		.and()
        	.and()
            .authorizeRequests()
            .antMatchers("/admin/**").hasRole("ADMIN")
            .antMatchers("/user/**").hasAnyRole("ADMIN", "USER")
            .antMatchers(HttpMethod.POST,"/user/**").hasAnyRole("ADMIN", "USER")
            //.antMatchers(HttpMethod.POST,"/user/**").hasAnyRole("ADMIN", "USER")
            .antMatchers("/store/**").hasAnyRole("ADMIN", "USER")
            .antMatchers("/seller/**").hasAnyRole("ADMIN", "USER")
            .anyRequest().authenticated()
             // Đường dẫn đến trang lỗi truy cập bị từ chối
            .and()
            .formLogin().loginPage("/login").permitAll()
            .successHandler(new CustomAuthenticationSuccessHandler()) // Sử dụng custom success handler
            .failureUrl("/login")
            .loginProcessingUrl("/login")
            .and()
            .exceptionHandling()
            .accessDeniedHandler(accessDeniedHandler())
            .and()
            .logout();
        	
        
    }
    @Override
    public void configure(WebSecurity web) throws Exception {
        web
            .ignoring()
            .antMatchers("/assets/**");
    }
}
//@GetMapping("/notfound")
//public String notFoundPage() {
//    return "notfound"; // Trả về tên view tương ứng
//}