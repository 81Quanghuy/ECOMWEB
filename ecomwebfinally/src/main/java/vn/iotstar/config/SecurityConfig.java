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
        		.xssProtection()
        		.and()
        		.contentSecurityPolicy("style-src 'self';"
        				+ "script-src 'self';"
        				+ "form-action 'self';"
        				+ "img-src 'self' res.cloudinary.com images.unsplash.com dummyimage.com media.istockphoto.com;"
        				+ "connect-src 'self';"
        				+ "frame-src 'self';"
        				+ "frame-ancestors 'self';"
        				+ "font-src 'self' cdn.linearicons.com;"
        				+ "media-src 'self';"
        				+ "object-src 'self';"
        				+ "manifest-src 'self';"
        				+ "prefetch-src 'self';")
        		.and()
        	.and()
            .authorizeRequests()
            	.antMatchers("/admin/**").hasRole("ADMIN")
            	.antMatchers("/user/**").hasAnyRole("ADMIN", "USER")
            	.antMatchers(HttpMethod.POST,"/user/**").hasAnyRole("ADMIN", "USER")
            	//.antMatchers(HttpMethod.POST,"/user/**").hasAnyRole("ADMIN", "USER")
            	.antMatchers("/store/**").hasAnyRole("ADMIN", "USER")
            	.antMatchers("/seller/**").hasAnyRole("ADMIN", "USER")
            	.antMatchers("/", "/login", "/register").permitAll()
            	.antMatchers("/product/**").permitAll()
            	.antMatchers("/product/review").permitAll()
            	.antMatchers("/images/**").permitAll()
            	.antMatchers("/resources/**", "/assets/**").permitAll()//cai nay là tạm @@@
            	.antMatchers("/._darcs/**", "/.bzr/**", "/.hg/**", "/BitKeeper/**").hasRole("ADMIN")
            	.antMatchers("/assets/**").permitAll()
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
		/*
		 * web .ignoring() .antMatchers("/assets/**");
		 */
    }
}
//@GetMapping("/notfound")
//public String notFoundPage() {
//    return "notfound"; // Trả về tên view tương ứng
//}