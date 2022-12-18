//package vn.iotstar.Config;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.context.annotation.Configuration;
//import org.springframework.security.config.annotation.web.builders.HttpSecurity;
//import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
//import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
//import org.springframework.security.oauth2.client.userinfo.OAuth2UserRequest;
//import org.springframework.security.oauth2.client.userinfo.OAuth2UserService;
//import org.springframework.security.oauth2.core.user.OAuth2User;
//
//import vn.iotstar.service.Impl.CustomOAuth2UserService;
//
//@Configuration
//@EnableWebSecurity
//public class SecurityConfig extends WebSecurityConfigurerAdapter {
// 
//     
//    @Override
//    protected void configure(HttpSecurity http) throws Exception {
//        http.authorizeRequests()
//            .antMatchers("/", "/login", "/oauth/**").permitAll()
//            .anyRequest().authenticated()
//            .and()
//            .formLogin().permitAll()
//            .and()
//            .oauth2Login()
//                .loginPage("/login")
//                .userInfoEndpoint()
//                    .userService((OAuth2UserService<OAuth2UserRequest, OAuth2User>) oauthUserService);
//    }
//     
//    @Autowired
//    private CustomOAuth2UserService oauthUserService;
//     
// 
//}