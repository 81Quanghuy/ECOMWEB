<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Trang chủ</title>
</head>
<body>
	<div class="card-header py-3"></div>

	<form action=<c:url value="/user/order/item/saveOrUpdate" />
		method="POST" enctype="multipart/form-data">
		<div class="card-body mx-auto">
			<div class="mb-3">
				<input type="text" class="form-control" name="id"
					value="${orderItem.id}" readonly="readonly" hidden="true">

			</div>

			<div class="mb-3">
				<input type="text" class="form-control" name="isEdit"
					value="${orderItem.isEdit}" readonly="readonly" hidden="true">
			</div>
			<div class="mb-3">
				<label for="firstName" class="form-label">Mã giỏ hàng </label> <input
					type="text" class="form-control" id="cartid" name="cartid"
					value="${orderItem.orderid}">
			</div>
			<div class="mb-3">
				<label for="firstName" class="form-label">Mã sản phẩm </label> <input
					type="text" class="form-control" id="productid" name="productid"
					value="${orderItem.productid}">
			</div>
			<div class="mb-3">
				<label for="createat" class="form-lablel">Ngày Tạo :</label> <input
					type=date value="${orderItem.createat}" id="createat"
					name="createat">

			</div>
			<div class="mb-3">
				<label for="updateat" class="form-lablel">Ngày Cập Nhật :</label> <input
					type="date" value="${orderItem.updateat}" id="updateat"
					name="updateat">

			</div>

			<div class="mb-3">
				<label for="email" class="form-label">Số lượng</label> <input
					type="text" class="form-control" id="count" name="count"
					value="${orderItem.count}">
			</div>
			<button type="submit" class="btn btn-primary">Submit</button>
		</div>
	</form>
</body>
</html>