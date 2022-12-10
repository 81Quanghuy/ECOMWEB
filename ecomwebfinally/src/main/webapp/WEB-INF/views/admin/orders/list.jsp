


<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/common/taglib.jsp"%>

<section id="main" class="row">

	<div class="col mt-4">

		<div class="card">

			<div class="card-header">Danh Sách Đơn Hàng</div>

			<div class="card-body">

				<!-- Hiển thông báo -->

				<c:if test="${message != null}">

					<div class="alert alert-primary" role="alert">

						<i>${message}</i>

					</div>

				</c:if>



				<!-- Hêt thông báo -->

				<table class="table table-striped table-responsive">

					<thead class="thead-inverse">

						<tr>
							<th>Order ID</th>
							<th>Address</th>
							<th>Date Create At</th>
							<th>Phone</th>
							<th>Price</th>
							<th>Status</th>
							<th>Date Update At</th>
							<th>Delivery Name</th>
							<th>Store Name</th>
							<th>Seller Name</th>
							<th>Action</th>
						</tr>

					</thead>

					<tbody>

						<c:forEach items="${orders}" var="order">

							<tr>

								<td>${order.id}</td>
								<td>${order.address}</td>
								<td>${order.createat}</td>
								<td>${order.phone}</td>
								<td>${order.price}</td>
								<td>${order.status ? 'Đang giao' : 'Đã giao'}</td>
								<td>${order.updateat}</td>
								<td>${order.delivery.name}</td>
								<td>${order.store.name}</td>
								<td>${order.user.lastName}</td>

								<td><a href="/seller/orders/view/${order.id}"
									class="btn btn-outline-info"><i class="fa fa-info"></i></a> <a
									href="/seller/orders/edit/${order.id}"
									class="btn btn-outline-warning"><i class="fa fa-edit"></i></a>
									<a href="/seller/orders/delete/${order.id}"
									class="btn btn-outline-warning"><i class="fa fa-trash"></i></a>
									<a data-id="${order.id}" data-name="${order.address}"
									onclick="showconfirmation(this.getAttribute('data-id'),this.getAttribute('data-name'))"
									class="btn btn-outline-danger"><i class="fa fa-trash"></i></a></td>

							</tr>

						</c:forEach>

					</tbody>



				</table>

				<script type="text/javascript">
					function showconfirmation(id, name) {
						$('#address').text(name);
						$('#yesOption').attr('href',
								'/seller/orders/delete/' + id);
						$('#confirmationId').modal('show');
					}
				</script>

				<!-- Modal -->
				<div class="modal fade" tabindex="-1" id="confirmationId"
					aria-labelledby="confirmationlabel" aria-hidden="true">
					<div class="modal-dialog" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="confirmationLabel">Confirmation</h5>
								<button type="button" class="btn-close" data-bs-dismiss="modal"
									aria-label="Close"></button>
							</div>
							<div class="modal-body">
								Bạn có muốn xóa "<span id="title"></span>"?
							</div>
							<div class="modal-footer">
								<a id="yesOption" class="btn btn-primary">Yes</a>
								<button type="button" class="btn btn-secondary"
									data-bs-dismiss="modal">Close</button>
							</div>
						</div>
					</div>
				</div>
				<!-- Modal -->

			</div>

		</div>

	</div>

</section>
 --%>
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
							<th>Trạng Thái</th>
							<th>Mã Đơn Hàng</th>
							<th>Địa Chỉ</th>
							<th>Ngày Lập Đơn</th>
							<th>Số Điện Thoại</th>
							<th>Đơn Giá</th>
							<th>Ngày Cập Nhập</th>
							<th>Đơn Vị Vận Chuyển</th>
							<th>Tên Shop</th>
							<th>Tên Người Bán</th>
							<!-- <th>Action</th> -->
						</tr>
					</thead>
					<tbody>

						<c:forEach items="${orders}" var="order">

							<tr>

								<td><c:if test="${order.status == false}">
										<span class="badge bg-success">Đã Giao</span>
									</c:if> <c:if test="${order.status == true}">
										<span class="badge bg-warning">Đang Giao</span>
									</c:if></td>
								<td>${order.id}</td>
								<td>${order.address}</td>
								<td>${order.createat}</td>
								<td>${order.phone}</td>
								<td>${order.price}</td>



								<td>${order.updateat}</td>
								<td>${order.delivery.name}</td>
								<td>${order.store.name}</td>
								<td>${order.user.lastName}</td>

								<%-- 								<td><a href="/seller/orders/view/${order.id}"
									class="btn btn-outline-info"><i class="fa fa-info"></i></a> <a
									href="/seller/orders/edit/${order.id}"
									class="btn btn-outline-warning"><i class="fa fa-edit"></i></a>
									<a href="/seller/orders/delete/${order.id}"
									class="btn btn-outline-warning"><i class="fa fa-trash"></i></a>
									<a data-id="${order.id}" data-name="${order.address}"
									onclick="showconfirmation(this.getAttribute('data-id'),this.getAttribute('data-name'))"
									class="btn btn-outline-danger"><i class="fa fa-trash"></i></a></td>
 --%>
							</tr>

						</c:forEach>
					</tbody>
				</table>

				<script type="text/javascript">
					function showconfirmation(id, name) {
						$('#address').text(name);
						$('#yesOption').attr('href',
								'/seller/orders/delete/' + id);
						$('#confirmationId').modal('show');
					}
				</script>

				<!-- Modal -->
				<div class="modal fade" tabindex="-1" id="confirmationId"
					aria-labelledby="confirmationlabel" aria-hidden="true">
					<div class="modal-dialog" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="confirmationLabel">Confirmation</h5>
								<button type="button" class="btn-close" data-bs-dismiss="modal"
									aria-label="Close"></button>
							</div>
							<div class="modal-body">
								Bạn có muốn xóa "<span id="title"></span>"?
							</div>
							<div class="modal-footer">
								<a id="yesOption" class="btn btn-primary">Yes</a>
								<button type="button" class="btn btn-secondary"
									data-bs-dismiss="modal">Close</button>
							</div>
						</div>
					</div>
				</div>
				<!-- Modal -->


				<!-- 				<a href="/admin/categories/add" type="button"
					class="btn btn-outline-secondary">Thêm Loại Sản Phẩm</a> -->

			</div>

		</div>
	</div>
	<!-- End Recent Sales -->
</div>

