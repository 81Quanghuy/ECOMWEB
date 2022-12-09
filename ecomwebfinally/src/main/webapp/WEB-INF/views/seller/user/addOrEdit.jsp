<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>

<div id="main">

	<form action=<c:url value="/seller/user/saveOrUpdate" /> method="POST"
		enctype="multipart/form-data">
		<div class="card-body mx-auto">
			<div class="mb-3">
				<input type="text" class="form-control" name="id" value="${user.id}"
					readonly="readonly" hidden="true">

			</div>
			<div class="mb-3">
				<label for="firstName" class="form-label">Họ </label> <input
					type="text" class="form-control" id="firstName" name="firstName"
					value="${user.firstName}">
			</div>
			<div class="mb-3">
				<label for="lastName" class="form-label">Tên </label> <input
					type="text" class="form-control" id="lastName" name="lastName"
					value="${user.lastName}">
			</div>
			<div class="mb-3">
				<label for="email" class="form-label">Email </label> <input
					type="email" class="form-control" id="email" name="email"
					value="${user.email}">
			</div>

			<div class="mb-3">
				<label for="phone" class="form-label">Số điện thoại</label> <input
					type="text" class="form-control" id="text" name="phone"
					value="${user.phone}">
			</div>
			<div class="mb-3">
				<label for="password" class="form-label">Mật khẩu</label> <input
					type="password" class="form-control" id="password" name="password"
					value="${user.password}">
			</div>
			<div class="mb-3">
				<label for="name" class="form-label">Địa chỉ</label> <input
					type="text" class="form-control" id="address" name="address"
					value="${user.address}">
			</div>
			<div class="mb-3">
				<input type="text" class="form-control" id="avatar" name="avatar"
					value="${user.avatar}" hidden="true">
			</div>
			<div class="mb-3">
				<label for="avatarFile" class="form-label">Avatar</label> <input
					type="file" class="form-control" id="avatarFile"
					aria-describedby="avatarFile" name="avatarFile"
					value="${user.avatarFile}">
			</div>
			<button type="submit" class="btn btn-primary">Submit</button>
		</div>
	</form>
</div>
