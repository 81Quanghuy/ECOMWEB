<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">

<title>Trang chủ</title>
</head>
<body>
	<section class="row">

		<div class="col mt-4">
			<div class="card-header py-3"></div>

			<form action=<c:url value="/admin/orders/saveOrUpdate" />
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
							<label for="userid" class="form-lablel">User ID :</label> <input
								type="text" class="form-control" readonly="readonly"
								name="userid" value="${order.userid}" id="id"
								aria-describedby="userid" placeholder="user Id" />
						</div>

						<div class="mb-3">
							<label for="delivereid" class="form-lablel">Delivery ID :</label>
							<input type="text" class="form-control" readonly="readonly"
								name="delivereid" value="${order.delivereid}" id="id"
								aria-describedby="delivereid" placeholder="delivery Id" />
						</div>

						<div class="mb-3">
							<label for="storeid" class="form-lablel">Store ID :</label> <input
								type="text" class="form-control" readonly="readonly"
								name="storeid" value="${order.storeid}" id="id"
								aria-describedby="storeid" placeholder="store Id" />
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
								type="text" class="form-control" readonly="readonly"
								name="status" value="${order.status}" id="id"
								aria-describedby="status" placeholder="status" />
						</div>

						<div class="mb-3">
							<label for="price" class="form-lablel">Price :</label> <input
								type="text" class="form-control" readonly="readonly"
								name="price" value="${order.price}" id="id"
								aria-describedby="price" placeholder="status" />
						</div>


						<button type="submit" class="btn btn-primary">Update</button>
					</div>
				</div>
				
			</form>
		</div>

	</section>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>
</body>
</html>