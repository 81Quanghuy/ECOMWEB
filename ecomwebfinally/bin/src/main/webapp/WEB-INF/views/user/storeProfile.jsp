<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta charset="UTF-8">
<%@include file="/common/taglib.jsp"%>
<!-- Hiển thị thông báo -->
<%@include file="/common/info.jsp"%>

<section id="main" class="section profile">
	<h5>Thông Tin Cửa Hàng</h5>
	<h6>Chỗ bỏ ảnh cửa hàng</h6>
	<div class="row">
		<div class="col-xl-4">
			<div class="bd-example">
				<table class="table table-striped">
					<thead>
						<tr>
							<th scope="col">${store.name}[${store.user.firstName}
								${store.user.lastName}]</th>
							<th scope="col"></th>
						</tr>
					</thead>
					<tbody>

						<tr>
							<th scope="row">Tên Cửa Hàng</th>
							<td>${store.name}</td>
						</tr>
						<tr>
							<th scope="row">Chủ Sở Hữu</th>
							<td>${store.user.firstName}${store.user.lastName}</td>
						</tr>
						<tr>
							<th scope="row">Bio</th>
							<td>${store.bio }</td>
						</tr>
						<tr>
							<th scope="row">Rating</th>
							<td>${store.rating}</td>
						</tr>
						<tr>
							<th scope="row">Ngày Thành Lập</th>
							<td>${store.createat}</td>
						</tr>

					</tbody>

				</table>
			</div>

		</div>
	</div>
</section>