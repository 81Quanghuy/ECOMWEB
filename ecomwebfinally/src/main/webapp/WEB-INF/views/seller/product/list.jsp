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
							<th>#</th>
							<th>Tên sản phẩm</th>
							<th>Ảnh sản phẩm</th>
							<th>Giá sản phẩm</th>
							<th>Giá Khuyến Mãi</th>
							<th>Số lượng</th>
							<th>Số lượng bán ra</th>
							<!-- <th>Ngày tạo</th> -->
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

									<%-- <a href="/admin/categories/delete/${category.categoryId}"
										class="btn btn-outline-danger"><i class="fa fa-trash"></i></a>
										 --%>
									<button type="button" class="btn btn-primary"
										data-bs-toggle="modal"
										data-bs-target="#exampleModal${product.id}">
										<i class="fa fa-trash"></i>
									</button>
								</td>
							</tr>
							<!-- Modal -->
							<div class="modal fade" id="exampleModal${product.id}"
								tabindex="-1" aria-labelledby="exampleModalLabel${product.id}"
								aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title" id="exampleModalLabel${product.id}">Delete</h5>
											<button type="button" class="btn-close"
												data-bs-dismiss="modal" aria-label="Close"></button>
										</div>
										<div class="modal-body">Bạn có chắc chắn muốn xóa?</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-secondary"
												data-bs-dismiss="modal">Close</button>
											<!-- <button type="button" class="btn btn-primary" >Yes</button> -->
											<a class="btn btn-primary"
												href="/seller/product/delete/${product.id}"
												class="btn btn-outline-danger">Yes</a>
										</div>
									</div>
								</div>
							</div>
						</c:forEach>
					</tbody>
				</table>

				<a href="/seller/product/add" type="button"
					class="btn btn-outline-secondary">Thêm Sản Phẩm</a>
			</div>
		</div>
	</div>
</div>
