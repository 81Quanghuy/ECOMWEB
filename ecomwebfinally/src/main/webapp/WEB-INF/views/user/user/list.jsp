

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/common/taglib.jsp"%>

<div id="main">
	<!-- Recent Sales -->
	<div class="col-12">
		<div class="card recent-sales overflow-auto">


			<!--  Sử dụng vòng lặp lấy order -->
			<div class="card-body">
				<h5 class="card-title">Danh Sách Loại Sản Phẩm</h5>
				<table class="table table-borderless datatable">
					<thead>
						<tr>
							<th scope="col">#</th>
							<th>Họ tên</th>
							<th>Ảnh đại diện</th>
							<th>Số điện thoại</th>
							<th>Email</th>
							<th>Trạng thái</th>
							<th>Hành động</th>
						</tr>
					</thead>
					<tbody>

						<c:forEach var="item" items="${users}" varStatus="STT">
							<tr class="odd gradeX">
								<th scope="row"><a href="#">${STT.index+1}</a></th>
								<td>${item.firstName}${item.lastName}</td>
								<td><c:url value="/resources/images/user/${item.avatar}" var="imgUrl"></c:url>
									<img width="100px" height="100px" src="${imgUrl}"></td>
								<td>${item.phone}</td>
								<td>${item.email}</td>
								<td><c:if test="${item.isActive == true}">
										<span class="label label-sm label-success"> Hoạt động </span>
									</c:if> <c:if test="${item.isActive ==false}">
										<span class="label label-sm label-warning"> Khóa</span>
									</c:if></td>
								<td><a href="<c:url value='/admin/user/edit/${item.id}'/>"
									class="center">Edit</a> | <a
									href="<c:url value='/user/delete/${item.id}'/>" class="center">Delete</a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>

				<a href="/admin/orders/add" type="button"
					class="btn btn-outline-secondary">Thêm Loại Sản Phẩm</a>

			</div>

		</div>
	</div>
	<!-- End Recent Sales -->
</div>
