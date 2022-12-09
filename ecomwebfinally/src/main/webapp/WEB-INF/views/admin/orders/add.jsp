<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>

<section id="main" class="row">

	<div class="col mt-4">
		<div class="card-header py-3"></div>

		<form action=<c:url value="/seller/orders/saveOrUpdate" />
			method="POST" enctype="multipart/form-data">
			<div class="card-body mx-auto">
				<div class="mb-3">

					<div class="mb-3">
						<label for="id" class="form-lablel">Order ID :</label> <input
							type="text" class="form-control" readonly="readonly" name="id"
							value="${order.id}" id="id" aria-describedby="id"
							placeholder="order Id" />
					</div>

					<div class="mb-3">
						<label for="content" class="form-lablel">User ID :</label> <input
							type="text" value="${order.userid}" id="content" name="userid">
					</div>

					<div class="mb-3">
						<label for="delivereid" class="form-lablel">Delivery ID :</label>
						<input type="text" value="${order.delivereid}" id="delivereid"
							name="delivereid">
					</div>

					<div class="mb-3">
						<label for="storeid" class="form-lablel">Store ID :</label> <input
							type="text" value="${order.storeid}" id="storeid" name="storeid">
					</div>

					<div class="mb-3">
						<label for="address" class="form-lablel">Address :</label> <input
							type="text" value="${order.address}" id="address" name="address">
					</div>

					<div class="mb-3">
						<label for="phone" class="form-lablel">Phone :</label> <input
							type="text" value="${order.phone}" id="phone" name="phone">
					</div>

					<div class="mb-3">
						<label for="status" class="form-lablel">Status :</label> <input
							type="text" value="${order.status}" id="status" name="status">
					</div>

					<div class="mb-3">
						<label for="price" class="form-lablel">Price :</label> <input
							type="text" value="${order.price}" id="price" name="price">
					</div>

					<button type="submit" class="btn btn-primary">Update</button>
				</div>
		</form>
	</div>

</section>
