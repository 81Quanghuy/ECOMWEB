
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/common/taglib.jsp"%>

<div id="main">
	<!-- Recent Sales -->
	<div class="col-12">
		<div class="card recent-sales overflow-auto">


			<!--  Sử dụng vòng lặp lấy order -->
			<div class="card-body">
				<!-- Hiển thông báo -->

				<c:if test="${message != null}">

					<div class="alert alert-primary" role="alert">

						<i>${message}</i>

					</div>

				</c:if>
				<h5 class="card-title">Danh Sách Đơn Vị Vận Chuyển</h5>
				<table class="table table-borderless datatable">
					<thead>
						<tr>
							<th scope="col">#</th>
							<th>Tên Đơn Vị Vận Chuyển</th>
							<th>Giá</th>
							<th>Trạng Thái</th>
							<th>Action</th>
						</tr>
					</thead>
					<tbody>

						<c:forEach items="${deliveries}" var="delivery" varStatus="STT">
							<tr>
								<th scope="row"><a href="#">${STT.index+1}</a></th>
								<td>${delivery.name}</td>
								<td>${delivery.price}</td>
								<td><c:if test="${delivery.isdeleted == true}">
										<span class="badge bg-success">Đang Hoạt Động</span>
									</c:if> <c:if test="${delivery.isdeleted == false}">
										<span class="badge bg-danger">Tạm Ngưng</span>
									</c:if></td>
								<td><a href="/seller/deliveries/view/${delivery.id}"
									class="btn btn-outline-info"><i class="fa fa-info"></i></a> <a
									href="/seller/deliveries/edit/${delivery.id}"
									class="btn btn-outline-warning"><i class="fa fa-edit"></i></a>
									<a href="/seller/deliveries/delete/${delivery.id}"
									class="btn btn-outline-danger"><i class="fa fa-trash"></i></a></td>
							</tr>


						</c:forEach>
					</tbody>
				</table>

				<a href="/seller/deliveries/add" type="button"
					class="btn btn-outline-secondary">Đơn Vị Vận Chuyển Mới</a>

			</div>

		</div>
	</div>
	<!-- End Recent Sales -->
</div>


