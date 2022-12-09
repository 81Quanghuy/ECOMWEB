<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/common/taglib.jsp"%>


<section id="main" class="row">

	<div class="col mt-4">

		<div class="card">

			<div class="card-header">List Store</div>

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
							<th>Store name</th>
							<th>Ảnh đại diện</th>
							<th>Anh bia</th>
							<th>Store bio</th>
							<th>Status</th>
							<th>Action</th>
						</tr>

					</thead>

					<tbody>

						<c:forEach var="store" items="${stores}">

							<tr>
								<td>${store.name}</td>
								<td><c:url value="/images/seller/${store.avatar}"
										var="imgUrl"></c:url> <img width="100px" height="100px"
									src="${imgUrl}"></td>
								<td><c:url value="/images/seller/${store.featuredimages}"
										var="imgUrl"></c:url> <img width="100px" height="100px"
									src="${imgUrl}"></td>
								<td>${store.bio}</td>
								<td>${store.isactive ? 'Còn' : 'Hết'}</td>

								<td><a href="/admin/store/edit/${store.id}"
									class="btn btn-outline-warning"><i class="fa fa-edit"></i></a>

									<a href="/admin/store/delete/${store.id}"
									class="btn btn-outline-danger"><i class="fa fa-trash"></i></a></td>

							</tr>

						</c:forEach>

					</tbody>

				</table>

			</div>

		</div>

	</div>

</section>
