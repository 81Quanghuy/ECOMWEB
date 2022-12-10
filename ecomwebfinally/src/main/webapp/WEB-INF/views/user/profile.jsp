<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!-- End Page Title -->
<section id="main" class="section profile">
	<p>${message}</p>
	<div class="row">
		<div class="col-xl-4">

			<div class="card">
				<div
					class="card-body profile-card pt-4 d-flex flex-column align-items-center">
					<c:if test="${!user.avatar.substring(0,4).equals('http')}">
						<img src="/images/user/${user.avatar}" alt="Profile"
							class="rounded-circle">
					</c:if>
					<c:if test="${user.avatar.substring(0,4).equals('http')}">
						<img src="${user.avatar}" alt="Profile" class="rounded-circle">
					</c:if>
					<h2>${firstName}${user.lastName}</h2>
					<h3>Người dùng</h3>
					<div class="social-links mt-2">
						<a class="twitter"><i class="bi bi-twitter"></i></a> <a
							class="facebook"><i class="bi bi-facebook"></i></a> <a
							class="instagram"><i class="bi bi-instagram"></i></a> <a
							class="linkedin"><i class="bi bi-linkedin"></i></a>
					</div>
				</div>
			</div>

		</div>

		<div class="col-xl-8">

			<div class="card">
				<div class="card-body pt-3">
					<!-- Bordered Tabs -->
					<ul class="nav nav-tabs nav-tabs-bordered">

						<li class="nav-item">
							<button class="nav-link active" data-bs-toggle="tab"
								data-bs-target="#profile-overview">Overview</button>
						</li>

						<li class="nav-item">
							<button class="nav-link" data-bs-toggle="tab"
								data-bs-target="#profile-edit">Edit Profile</button>
						</li>

						<li class="nav-item">
							<button class="nav-link" data-bs-toggle="tab"
								data-bs-target="#profile-change-password">Change
								Password</button>
						</li>

					</ul>
					<div class="tab-content pt-2">
						<div class="tab-pane fade show active profile-overview"
							style="margin: azimuth:;" id="profile-overview">

							<div class="row">
								<div class="col-lg-3 col-md-4 label">Họ và Tên</div>
								<div class="col-lg-9 col-md-8">${user.firstName}${user.lastName}</div>
							</div>

							<div class="row">
								<div class="col-lg-3 col-md-4 label">Email</div>
								<div class="col-lg-9 col-md-8">${user.email}</div>
							</div>

							<div class="row">
								<div class="col-lg-3 col-md-4 label">Điện thoại</div>
								<div class="col-lg-9 col-md-8">${user.phone}</div>
							</div>

							<div class="row">
								<div class="col-lg-3 col-md-4 label">Địa chỉ</div>
								<div class="col-lg-9 col-md-8">${user.address}</div>
							</div>
						</div>

						<div class="tab-pane fade profile-edit pt-3" id="profile-edit">

							<!-- Profile Edit Form -->
							<form action=<c:url value="/user/Update" /> method="POST"
								enctype="multipart/form-data" style="width: 500px;">
								<div class="card-body mx-auto">
									<div class="d-flex justify-content-between">
										<input type="text" class="form-control" name="id"
											value="${user.id}" readonly="readonly" hidden="true">

									</div>
									<div class="m-2">
										<label for="firstName" class="form-label">Họ </label> <input
											type="text" class="form-control" id="firstName"
											name="firstName" value="${user.firstName}">
									</div>
									<div class="m-2">
										<label for="lastName" class="form-label">Tên </label> <input
											type="text" class="form-control" id="lastName"
											name="lastName" value="${user.lastName}">
									</div>
									<div class="m-2">
										<label for="email" class="form-label">Email </label> <input
											type="email" class="form-control" id="email" name="email"
											value="${user.email}">
									</div>
									<div class="m-2">
										<input type="text" class="form-control" id="username"
											name="username" value="${user.username}" hidden="true">
									</div>
									<div class="m-2">
										<input type="text" class="form-control" id="password"
											name="password" value="${user.password}" hidden="true">
									</div>
									<div class="m-2">
										<input type="text" class="form-control" id="role" name="role"
											value="${user.role}" hidden="true">
									</div>
									<div class="m-2">
										<label for="phone" class="form-label">Số điện thoại</label> <input
											type="text" class="form-control" id="text" name="phone"
											value="${user.phone}">
									</div>
									<div class="m-2">
										<label for="name" class="form-label">Địa chỉ</label> <input
											type="text" class="form-control" id="address" name="address"
											value="${user.address}">
									</div>
									<div class="m-2">
										<input type="text" class="form-control" id="avatar"
											name="avatar" value="${user.avatar}" hidden="true">
									</div>
									<div class="m-2">
										<label for="avatarFile" class="form-label">Avatar</label> <input
											type="file" class="form-control" id="avatarFile"
											aria-describedby="avatarFile" name="avatarFile"
											value="${user.avatarFile}">
									</div>
									<button type="submit" class="btn btn-primary">Submit</button>
								</div>
							</form>

						</div>

						<div class="tab-pane fade pt-3" id="profile-change-password">
							<!-- Change Password Form -->
							<form action="/changepassword/${user.id}" method="post"
								enctype="mutipart/form-data">

								<div class="row mb-3">
									<label for="currentPassword"
										class="col-md-4 col-lg-3 col-form-label">Current
										Password</label>
									<div class="col-md-8 col-lg-9">
										<input name="password" type="password" class="form-control"
											id="currentPassword">
									</div>
								</div>

								<div class="row mb-3">
									<label for="newPassword"
										class="col-md-4 col-lg-3 col-form-label">New Password</label>
									<div class="col-md-8 col-lg-9">
										<input name="newpassword" type="password" class="form-control"
											id="newPassword">
									</div>
								</div>

								<div class="row mb-3">
									<label for="renewPassword"
										class="col-md-4 col-lg-3 col-form-label">Re-enter New
										Password</label>
									<div class="col-md-8 col-lg-9">
										<input name="renewpassword" type="password"
											class="form-control" id="renewPassword">
									</div>
								</div>

								<div class="text-center">
									<button type="submit" class="btn btn-primary">Change
										Password</button>
								</div>
							</form>
							<!-- End Change Password Form -->

						</div>

					</div>
					<!-- End Bordered Tabs -->

				</div>
			</div>

		</div>
	</div>
</section>
