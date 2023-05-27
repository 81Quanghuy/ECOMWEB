package vn.iotstar.controller;

import java.io.IOException;
import java.nio.file.AccessDeniedException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.web.access.AccessDeniedHandler;

public class CustomAccessDeniedHandler implements AccessDeniedHandler {

	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response,
			org.springframework.security.access.AccessDeniedException accessDeniedException)
			throws IOException, ServletException {
		response.sendRedirect("/access-denied");
//	    // Kiểm tra nếu người dùng có vai trò "USER" và truy cập vào đường dẫn của "ADMIN"
//        if (request.isUserInRole("USER") && request.getServletPath().startsWith("/admin")) {
//            // Định tuyến người dùng tới một trang khác
//            
//        } else {
//            // Mặc định xử lý từ chối truy cập
//            response.sendError(HttpServletResponse.SC_FORBIDDEN, "Access Denied");
//        }
		
	}

   
}