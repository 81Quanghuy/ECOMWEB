package vn.iotstar.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.net.openssl.ciphers.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

public class CustomAuthenticationSuccessHandler implements AuthenticationSuccessHandler {

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			org.springframework.security.core.Authentication authentication) throws IOException, ServletException {
		// Lấy thông tin username và password từ đối tượng Authentication
        String username = authentication.getName();
        String password = request.getParameter("password");

        // Đưa thông tin username và password đến trang login sử dụng phương thức POST
        request.setAttribute("username", username);
        request.setAttribute("password", password);

        // Forward đến trang login
        request.getRequestDispatcher("/login").forward(request, response);
		
	}

}
