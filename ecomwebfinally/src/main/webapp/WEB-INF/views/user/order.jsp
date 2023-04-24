<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<c:url value="/resources/user/" var="URL"></c:url>
<!-- breadcrumb -->
<div class="container" style="margin-top: 40px;">
	<div class="bread-crumb flex-w p-l-25 p-r-15 p-t-30 p-lr-0-lg">
		<a href="/" class="stext-109 cl8 hov-cl1 trans-04"> Home <i
			class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i>
		</a> <span class="stext-109 cl4"> Đơn hàng </span>
	</div>
</div>


<!-- Shoping Cart -->
<form class="bg0 p-t-75 p-b-85">
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	<div class="container">

		<div class="row">
			<div class="size-208">
				<a href="/order/noactive"
					style="border: 2px solid; border-radius: 5px; padding: 10px; float: right; color: black;">Xem
					các sản phẩm đã hủy</a>
			</div>
			<c:if test="${orders.size()>0 }">

				<div class=" m-lr-auto m-b-50">

					<div class="m-l-25 m-r--38 m-lr-0-xl">

						<div class="wrap-table-shopping-cart">
							<table class="table-shopping-cart">
								<tr class="table_head">
									<th class="column-1">Ngày mua hàng</th>
									<th class="column-2">Giá trị đơn hàng</th>
									<th class="column-3">Địa chỉ nhận hàng</th>
									<th class="colunm-4">Số điện thoại nhận hàng</th>
									<th class="column-5">Tình trạng</th>
									<th class="column-6">Đơn vị vận chuyển</th>
									<th class="column-7"></th>
								</tr>

								<c:forEach items="${orders}" var="item">
									<tr class="table_row">
										<td class="column-1">${item.createat}</td>
										<td class="column-2">${item.price}</td>
										<td class="column-3">${item.address}</td>
										<td class="column-4">${item.phone}</td>
										<td class="column-5">${item.status}</td>
										<td class="column-6">${item.delivery.name}</td>
										<td class="column-7"><a href="/order/detail/${item.id}">Xem
												chi tiết đơn hàng</a></td>
									</tr>
								</c:forEach>


							</table>
						</div>
						<div class="flex-w flex-t p-t-27 p-b-33">
							<div class="size-208">
								<span class="mtext-101 cl2"> Total: </span>
							</div>

							<div class="size-209 p-t-1">
								<span class="mtext-110 cl2"> ${total}</span>
							</div>
						</div>
					</div>
				</div>
			</c:if>
			<c:if test="${orders.size() <1}">
				<div class="">
					<div class="">Bạn chưa mua sản phẩm nào</div>
				</div>
			</c:if>

		</div>
	</div>
</form>