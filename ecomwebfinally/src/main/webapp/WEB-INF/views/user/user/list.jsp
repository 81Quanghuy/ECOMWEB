<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<div class="row" style="margin: 0px;">
	<!-- Hiển thị thông báo -->
	<%@include file="/common/info.jsp"%>
	<!-- Kết thúc hiển thị thông báo -->
	<table class="table table-striped table-bordered table-hover"
		id="sample_2">
		<thead>
			<tr>
				<th>Họ tên</th>
				<th>Ảnh đại diện</th>
				<th>Số điện thoại</th>
				<th>Email</th>
				<th>Trạng thái</th>
				<th>Hành động</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="item" items="${users}">
				<tr class="odd gradeX">
					<td>${item.firstName} ${item.lastName}</td>
					<td><c:url value="/images/user/${item.avatar}" var="imgUrl"></c:url>
						<img width="100px" height="100px" src="${imgUrl}"></td>
					<td>${item.phone}</td>
					<td>${item.email}</td>
					<td><c:if test="${item.isActive == true}">
							<span class="label label-sm label-success"> Hoạt động </span>
						</c:if> <c:if test="${item.isActive ==false}">
							<span class="label label-sm label-warning"> Khóa</span>
						</c:if></td>
					<td><a href="<c:url value='/user/edit/${item.id}'/>"
						class="center">Edit</a> | <a
						href="<c:url value='/user/delete/${item.id}'/>" class="center">Delete</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>