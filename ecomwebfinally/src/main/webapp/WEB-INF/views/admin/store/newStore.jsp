<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/common/taglib.jsp"%>

<div id="main">
	<!-- Recent Sales -->
	<div class="col-12">
		<div class="card recent-sales overflow-auto">
			<c:if test="${message != null}">

				<div class="alert alert-primary" role="alert">

					<i>${message}</i>

				</div>

			</c:if>


			<!--  Sử dụng vòng lặp lấy order -->
			<div class="card-body">
				<h5 class="card-title">Danh Sách Cửa Hàng</h5>
				<span class="badge bg-success">Cửa Hàng Mới : ${cnewstore}</span>
				<table class="table table-borderless datatable">
					<thead>
						<tr>
							<th scope="col">#</th>
							<th>Tên Cửa Hàng</th>
							<th>Ảnh Cửa Hàng</th>
							<th>Ảnh Bìa</th>
							<th>Bio</th>
							<th>Trạng Thái</th>
							<th>Hành Động</th>
						</tr>
					</thead>
					<tbody>

						<c:forEach var="store" items="${stores}" varStatus="STT">

							<tr>
								<th scope="row"><a href="#">${STT.index+1}</a></th>
								<td>${store.name}</td>
								<td>
									<c:if
										test="${!store.featuredimages.substring(0,4).equals('http')}">
										<img width="100px" height="100px"
											src="/resources/images/seller/${store.featuredimages}">
									</c:if> <c:if
										test="${store.featuredimages.substring(0,4).equals('http')}">
										<img width="100px" height="100px"
											src="${store.featuredimages}">
									</c:if></td>
								<td>${store.bio}</td>

								<td><c:if test="${store.isactive == true}">
										<span class="badge bg-success">Đang Hoạt Động</span>
									</c:if> <c:if test="${store.isactive == false}">
										<span class="badge bg-danger">Ngừng Kinh Doanh</span>
									</c:if></td>

								<td><a href="/admin/store/edit/${store.id}"
									class="btn btn-outline-warning"><i class="fa fa-edit"></i></a>

									<a href="/admin/store/delete/${store.id}"
									class="btn btn-outline-danger"><i class="fa fa-trash"></i></a></td>
							</tr>

						</c:forEach>
					</tbody>
				</table>

				<a href="/admin/store/add" type="button"
					class="btn btn-outline-secondary">Tạo Cửa Hàng</a>

			</div>

		</div>
	</div>
	<!-- End Recent Sales -->
</div>
