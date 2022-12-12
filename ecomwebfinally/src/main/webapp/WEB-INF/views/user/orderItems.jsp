<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<c:url value="/resources/user/" var="URL"></c:url>
<!-- breadcrumb -->
<div class="container" style="margin-top: 40px;">
	<div class="bread-crumb flex-w p-l-25 p-r-15 p-t-30 p-lr-0-lg">
		<a href="/" class="stext-109 cl8 hov-cl1 trans-04"> Home <i
			class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i>
		</a> <span class="stext-109 cl4"> Đơn hàng</span>
	</div>
</div>
<div class="container">

	<div class="row">
		<c:if test="${orderItems.size()>0 }">
			<div class="col-lg-10  m-b-50">
				<div class="m-l-25 m-r--38 m-lr-0-xl">


					<div class="wrap-table-shopping-cart">
						<table class="table-shopping-cart">
							<tr class="table_head">
								<th class="column-1">Product</th>
								<th class="column-2"></th>
								<th class="colunm-2">Tên Shop</th>
								<th class="column-3">Giá sản phẩm</th>
								<th class="column-3">Số lượng</th>
							</tr>

							<c:forEach items="${orderItems}" var="item">
								<form class="bg0 p-t-75 p-b-85" action="/cart/update/${item.id}"
									method="post" enctype="mutipart/form-data">
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
										<td class="column-2">${item.product.store.name}</td>
										<td class="column-3 price"><input type="text"
											name="price" value="${item.product.price}"
											readonly="readonly"></td>
										<td class="column-2"><input
											class="mtext-104 cl3 txt-center " type="text" name="count"
											readonly="readonly" value="${item.count}"></td>
									</tr>
								</form>
							</c:forEach>


						</table>
					</div>

					<div class="size-209 m-3">
						<span class="mtext-110 cl2">Tổng tiền : $${order.price} </span>
						<c:if test="${order.isactive == true}">
							<a href="/order/delete/${order.id}"
								style="border: 2px solid; border-radius: 5px; padding: 10px; float: right; color: black;">Huỷ
								đơn hàng</a>
						</c:if>
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