package vn.iotstar.Config;

import java.io.UnsupportedEncodingException;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import net.bytebuddy.utility.RandomString;
import vn.iotstar.Utils.Utility;
import vn.iotstar.entity.User;
import vn.iotstar.service.IUserService;
import vn.iotstar.service.Impl.UserNotFoundException;

@Controller
public class ForgotPasswordController {
	@Autowired
	private JavaMailSender mailSender;

	@Autowired
	private IUserService userService;

	@GetMapping("/forgot_password")
	public String showForgotPasswordForm() {
		return "common/forgot_password_form";

	}

	@PostMapping("/forgot_password")
	public String processForgotPassword(HttpServletRequest request, Model model) {
		String email = request.getParameter("email");

		// System.out.print(email);

		String token = RandomString.make(30);

		try {
			userService.updateResetPasswordToken(token, email);
			String resetPasswordLink = Utility.getSiteURL(request) + "/reset_password?token=" + token;
			sendEmail(email, resetPasswordLink);
			model.addAttribute("message", "We have sent a reset password link to your email. Please check.");

		} catch (UserNotFoundException ex) {
			model.addAttribute("error", ex.getMessage());
		} catch (UnsupportedEncodingException | MessagingException e) {
			model.addAttribute("error", "Error while sending email");
		}

		return "common/forgot_password_form";
	}

	public void sendEmail(String recipientEmail, String link) throws MessagingException, UnsupportedEncodingException {
		MimeMessage message = mailSender.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(message);

		helper.setFrom("toannguyen7202@gmail.com", "Coza Support");
		helper.setTo(recipientEmail);

		String subject = "Thư xác nhận thay đổi mật khẩu";

		String content = "<p>Chào Bạn,</p>" + "<p>Bạn có một yêu cầu thay đổi mậ khẩu mới.</p>"
				+ "<p>Nhấn vào link bên dưới để thay đổi mật khẩu:</p>" + "<p><a href=\"" + link
				+ "\">Thay đổi mật khẩu.</a></p>" + "<br>" + "<p>Bỏ qua email này nếu như bạn nhớ mật khẩu của mình, "
				+ "hoặc bạn chưa yêu cầu thực hiện.</p>";

		helper.setSubject(subject);

		helper.setText(content, true);

		mailSender.send(message);
	}

	@GetMapping("/reset_password")
	public String showResetPasswordForm(@Param(value = "token") String token, Model model) {
		User customer = userService.getByResetPasswordToken(token);
		model.addAttribute("token", token);

		if (customer == null) {
			model.addAttribute("message", "Invalid Token");
			return "message";
		}

		return "/common/reset_password_form";
	}

	@PostMapping("/reset_password")
	public String processResetPassword(HttpServletRequest request, Model model) {
		String token = request.getParameter("token");
		String password = request.getParameter("password");

		User customer = userService.getByResetPasswordToken(token);
		model.addAttribute("title", "Reset your password");

		if (customer == null) {
			model.addAttribute("message", "Invalid Token");
			return "common/login";
		} else {
			userService.updatePassword(customer, password);
			model.addAttribute("message", "Thay đổi mật khẩu thảnh công.");
		}
		return "common/login";
	}
}