<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<div id="main">
	<!-- Hiển thị thông báo -->
	<%@include file="/common/info.jsp"%>
	<!-- Kết thúc hiển thị thông báo -->
	<table class="table table-striped table-bordered table-hover"
		id="sample_2">
		<thead>
			<tr>
				<th>Tên sản phẩm</th>
				<th>Ảnh sản phẩm</th>
				<th>Chi tiết</th>
				<th>Số lượng</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="item" items="${orderItems}">
				<tr class="odd gradeX">
					<td>${item.product.name}</td>
					<td><c:url
							value="/resources/images/admin/product/${item.product.listimage}"
							var="imgUrl"></c:url> <img width="100px" height="100px"
						src="${imgUrl}"></td>
					<td>${item.product.desciption}</td>
					<td>${item.count}</td>
			</c:forEach>
		</tbody>
	</table>
</div>