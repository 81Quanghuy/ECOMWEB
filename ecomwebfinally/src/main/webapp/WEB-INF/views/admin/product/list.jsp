
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>

<div id="main">
	<!-- Recent Sales -->
	<div class="col-12">
		<div class="card recent-sales overflow-auto">




			<!--  Sử dụng vòng lặp lấy order -->
			<div class="card-body">

				<c:if test="${error != null}">
					<p class="text-danger">${error}</p>
				</c:if>
				<c:if test="${message != null}">
					<p class="text-warning">${message}</p>
				</c:if>
				<h5 class="card-title">Danh Sách Loại Sản Phẩm</h5>
				<table class="table table-borderless datatable">
					<thead>
						<tr>
							<th>#</th>
							<th>Tên sản phẩm</th>
							<th>Ảnh sản phẩm</th>
							<th>Giá sản phẩm</th>
							<th>Giá Khuyến Mãi</th>
							<th>Số lượng</th>
							<th>Số lượng bán ra</th>
							<!-- <th>Mô tả</th> -->
							<th>Mở bán</th>
							<th>Xếp hạng</th>
							<th>Tên cửa hàng</th>
							<th>Loại sản phẩm</th>
							<!-- <th>Ngày chỉnh sửa gần nhất</th> -->
							<th>Hành động</th>
						</tr>
					</thead>
					<tbody>

						<c:forEach items="${product}" var="product">
							<tr>
								<td scope="row">${product.id}</td>
								<td>${product.name}</td>
								<td><c:url
										value="/resources/images/admin/product/${product.listimage}"
										var="imgUrl"></c:url> <img width="100px" height="100px"
									name="imageFile" src="${imgUrl}"></td>
								<td>${product.price}</td>
								<td>${product.promotionaprice}</td>
								<td>${product.quantity}</td>
								<td>${product.sold}</td>
								<%-- <td>${product.createat}</td> --%>
								<%-- <td>${product.desciption}</td> --%>
								<td>${product.isselling ? 'Đang Bán' : 'Sold Out'}</td>
								<td>${product.rating}</td>
								<td>${product.store.name}</td>
								<td>${product.category.name}</td>
								<%-- <td>${product.updateat}</td> --%>
								<td>
									<!-- Button trigger modal --> <a
									href="/seller/product/edit/${product.id}"
									class="btn btn-outline-warning"><i class="fa fa-edit"></i></a>


									<a data-id="${product.id}" data-name="${product.name}"
									onclick="showconfirmation(this.getAttribute('data-id'), this.getAttribute('data-name'))"
									class="btn btn-outline-danger"><i class="fa fa-trash"></i></a>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>


				<script type="text/javascript">
					function showconfirmation(id, name) {
						$('#name').text(name);
						$('#yesOption').attr('href',
								'/admin/product/delete/' + id);
						$('#confirmationId').modal('show');
					}
				</script>

				<div class="modal fade" tabindex="-1" role="dialog"
					id="confirmationId" aira-labelledby="confirmationLabel"
					aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title">Xóa Sản Phẩm Có Thể Ảnh Hưởng Đến
									Doanh Thu</h5>
							</div>
							<div class="modal-body">
								Bạn có muốn xóa <span id="name"></span> ?



							</div>
							<div class="modal-footer">
								<a id="yesOption" class="btn btn-primary">Đồng Ý</a>
								<!-- <a
									type="button" class="btn btn-secondary" href="/admin/product"
									data-dismiss="modal">Close</a> -->
							</div>
						</div>
					</div>
				</div>

				<a href="/seller/product/add" type="button"
					class="btn btn-outline-secondary">Thêm Sản Phẩm</a>
			</div>
		</div>
	</div>
</div>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
