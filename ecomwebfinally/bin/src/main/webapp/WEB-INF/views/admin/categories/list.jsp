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
							<th>Ảnh</th>
							<th>Loại Sản Phẩm</th>
							<th>Mã Loại Sản Phẩm</th>
							<th>Trạng Thái</th>
							<th>Action</th>
						</tr>
					</thead>
					<tbody>

						<c:forEach items="${categories}" var="cate" varStatus="STT">
							<tr>
								<th scope="row"><a href="#">${STT.index+1}</a></th>


								<td><c:url value="/resources/images/user/${cate.image}"
										var="imgUrl"></c:url> <img width="100px" height="100px"
									src="${imgUrl}"></td>

								<td>${cate.name}</td>

								<td><a href="#" class="text-primary">${cate.id}</a></td>

								<td><c:if test="${cate.isdeleted == true}">
										<span class="badge bg-success">Active</span>
									</c:if> <c:if test="${cate.isdeleted == false}">
										<span class="badge bg-danger">Not Active</span>
									</c:if></td>

								<td><a href="/admin/categories/view/${cate.id}"
									class="btn btn-outline-info"><i class="fa fa-info"></i></a> <a
									href="/admin/categories/edit/${cate.id}"
									class="btn btn-outline-warning"><i class="fa fa-edit"></i></a>

									<a href="/admin/categories/delete/${cate.id}"
									class="btn btn-outline-danger"><i class="fa fa-trash"></i></a></td>
							</tr>


						</c:forEach>
					</tbody>
				</table>

				<a href="/admin/categories/add" type="button"
					class="btn btn-outline-secondary">Thêm Loại Sản Phẩm</a>

			</div>

		</div>
	</div>
	<!-- End Recent Sales -->
</div>
