<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div id="main">

	<div>
		<h2>Reset Your Password</h2>
	</div>

	<form action="/reset_password" method="post"
		style="max-width: 350px; margin: 0 auto;">
		<input type="hidden" name="token" value="${token}" />
		<div class="border border-secondary rounded p-3">
			<div>
				<p>
					<input type="password" name="password" id="password"
						class="form-control" placeholder="Enter your new password"
						required autofocus />
				</p>
				<p>
					<input type="password" class="form-control"
						placeholder="Confirm your new password" required
						oninput="checkPasswordMatch(this);" />
				</p>
				<p class="text-center">
					<input type="submit" value="Change Password"
						class="btn btn-primary" />
				</p>
			</div>
		</div>
	</form>

	<script type="text/javascript">
		function checkPasswordMatch(fieldConfirmPassword) {
			if (fieldConfirmPassword.value != $("#password").val()) {
				fieldConfirmPassword
						.setCustomValidity("Passwords do not match!");
			} else {
				fieldConfirmPassword.setCustomValidity("");
			}
		}
	</script>


</div>