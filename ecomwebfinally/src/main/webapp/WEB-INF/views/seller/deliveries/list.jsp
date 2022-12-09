<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/common/taglib.jsp"%>


<section id="main" class="row">

	<div class="col mt-4">

		<div class="card">

			<div class="card-header">List Delivery</div>

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
							<th>ID</th>
							<th>Name</th>
							<th>Price</th>
							<th>Desciption</th>
							<th>Action</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${deliveries}" var="delivery">
							<tr>
								<td scope="row">${delivery.id}</td>
								<td>${delivery.name}</td>
								<td>${delivery.price}</td>
								<td>${delivery.desciption}</td>
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
				<a href="/seller/categories/add" type="button"
					class="btn btn-outline-secondary">Đơn Vị Vận Chuyển Mới</a>



			</div>

		</div>

	</div>

</section>

