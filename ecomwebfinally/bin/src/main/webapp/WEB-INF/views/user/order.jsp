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
<c:if test="${order!=null}">
	<form class="bg0 p-t-75 p-b-85">
		<div class="container">

			<div class="row">
				<c:if test="${orderItems.size()>0 }">
					<div class=" m-lr-auto m-b-50">
						<div class="m-l-25 m-r--38 m-lr-0-xl">

							<div class="wrap-table-shopping-cart">
								<table class="table-shopping-cart">
									<tr class="table_head">
										<th class="column-1">Product</th>
										<th class="column-2"></th>
										<th class="column-3">Price</th>
										<th class="column-4">Quantity</th>
										<th class="column-5">Tình trạng</th>
										<th class="column-6">Đơn vị vận chuyển</th>
									</tr>

									<c:forEach items="${orderItems}" var="item">
										<tr class="table_row">
											<td class="column-1">
												<div class="how-itemcart1">
													<c:if
														test="${item.product.listimage.substring(0,4).equals('http')}">
														<img src="${item.product.listimage}" alt="IMG">
													</c:if>
													<c:if
														test="${!item.product.listimage.substring(0,4).equals('http')}">
														<img src="/images/admin/${item.product.listimage}"
															alt="IMG">
													</c:if>
												</div>
											</td>
											<td class="column-2">${item.product.name}</td>
											<td class="column-3">$${item.product.price}</td>
											<td class="column-4">${item.count}</td>
											<td class="column-5">${order.status}</td>
											<td class="column-5">${order.delivery.name}</td>
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
				<c:if test="${orderItems.size() <1}">
					<div class="">
						<div class="">Chưa có sản phẩm trong giỏ hàng</div>
					</div>
				</c:if>

			</div>
		</div>
	</form>
</c:if>
<c:if test="${order==null}">
	<div class="col-sm-10 col-lg-7 col-xl-5 m-lr-auto m-b-50">
		<div
			class="bor10 p-lr-40 p-t-30 p-b-40 m-l-63 m-r-40 m-lr-0-xl p-lr-15-sm">
			<h4 class="mtext-109 cl2 p-b-30">Chưa có đơn hàng</h4>

			<div class="flex-w flex-t bor12 p-b-13">
				<div class="">
					<span class="stext-110 cl2">Mua hàng ngay </span>
				</div>
				<div class=""
					style="margin-top: 20px; display: flex; width: 100%; justify-content: space-around;">
					<div
						class="flex-c-m stext-101 cl2 size-118 bg8 bor13 hov-btn3 p-lr-15 trans-04 pointer">
						<a href="/">Mua hàng</a>
					</div>
				</div>

			</div>
		</div>
	</div>
</c:if>
