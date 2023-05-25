<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<c:url value="/resources/user/" var="URL"></c:url>
<!-- breadcrumb -->
<div class="container" style="margin-top: 40px;">
	<div class="bread-crumb flex-w p-l-25 p-r-15 p-t-30 p-lr-0-lg">
		<a href="/" class="stext-109 cl8 hov-cl1 trans-04"> Home <i
			class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i>
		</a> <span class="stext-109 cl4"> Shoping Cart </span>
	</div>
</div>


<!-- Shoping Cart -->
<c:if test="${cart!=null}">

	<div class="container">
		<h5 style="padding-left: 25px; padding-top: 20px;">${message}</h5>
		<div class="row">
			<c:if test="${cartItems.size()>0 }">
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
									<th class="column-5">Xóa sản phẩm</th>
								</tr>

								<c:forEach items="${cartItems}" var="item">
									<form class="bg0 p-t-75 p-b-85"
										action="/cart/update/${item.id}" method="post"
										enctype="mutipart/form-data">
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
												class="mtext-104 cl3 txt-center " type="number" name="count"
												onchange="this.form.submit()" value="${item.count}"></td>
											<td class="column-5"><a
												href="/cartItem/delete/${item.id}"><i
													class="fa fa-trash"></i></a></td>
										</tr>
									</form>
								</c:forEach>


							</table>
						</div>
						<div class="size-209 m-3">
							<span class="mtext-110 cl2">Tổng tiền : $${total} </span> <a
								href="/cart/delete/${cart.id}"
								style="border: 2px solid; border-radius: 5px; padding: 10px; float: right; color: black;">Xóa
								giỏ hàng</a>
						</div>

					</div>
				</div>
			</c:if>
			<c:if test="${cartItems.size() <1}">
				<div class="">
					<div class="">Chưa có sản phẩm trong giỏ hàng</div>
				</div>
			</c:if>
		</div>
		<div class="col-sm-10 col-lg-7 col-xl-5 m-lr-auto m-b-50">
			<div class="bor10 p-lr-40 p-t-30 p-b-40 m-l-63 m-lr-0-xl p-lr-15-sm">
				<h4 class="mtext-109 cl2 p-b-30">Cart Totals</h4>

				<div class="flex-w flex-t bor12 p-b-13">
					<div class="size-208">
						<span class="stext-110 cl2"> Subtotal: </span>
					</div>

					<div class="size-209">
						<span class="mtext-110 cl2"> $${total}</span>
					</div>
				</div>

				<div class="flex-w flex-t bor12 p-t-15 p-b-30"
					style="flex-direction: column;">
					<div class="size-208 w-full-ssm">
						<span class="stext-110 cl2"> Giao hàng: </span>

					</div>

					<div class="p-r-18 p-r-0-sm w-full-ssm">
						<div class="p-t-15">
							<form action="order/add">
								<label for="cars">Địa chỉ nhận hàng:</label>
								<div class="bor8 bg0 m-b-22">
									<input class="stext-111 cl8 plh3 size-111 p-lr-15" type="text"
										name="address" placeholder="ADDRESS">
								</div>
								<label for="cars">Số điện thoại nhận hàng:</label>
								<div class="bor8 bg0 m-b-22">
									<input class="stext-111 cl8 plh3 size-111 p-lr-15" type="text"
										name="phone" placeholder="Số điện thoại">
								</div>
								<div class="" style="display: flex; flex-direction: column;">
									<label for="cars">Chọn đơn vị vận chuyển:</label> <select
										name="delivery" id="delivery" style="padding: 10px;">
										<c:forEach items="${deliveries}" var="item">
											<option value="${item.id}">${item.name}
												${item.desciption}. Price:${item.price}</option>
										</c:forEach>
									</select>
								</div>
								<c:if test="${cartItems.size() >0}">
									<button
										class="flex-c-m stext-101 cl0 size-116 bg3 bor14 hov-btn3 p-lr-15 trans-04 pointer "
										type="submit">Mua hàng</button>
								</c:if>
							</form>
						</div>

					</div>
				</div>




			</div>
		</div>
	</div>


</c:if>
<c:if test="${cart==null}">
	<div class="col-sm-10 col-lg-7 col-xl-5 m-lr-auto m-b-50">
		<div
			class="bor10 p-lr-40 p-t-30 p-b-40 m-l-63 m-r-40 m-lr-0-xl p-lr-15-sm">
			<h4 class="mtext-109 cl2 p-b-30">Chưa có giỏ hàng</h4>

			<div class="flex-w flex-t bor12 p-b-13">
				<div class="">
					<span class="stext-110 cl2">Bạn cần phải đăng nhập vào hệ
						thống để thưc hiện mua hàng. </span>
				</div>
				<div class=""
					style="margin-top: 20px; display: flex; width: 100%; justify-content: space-around;">
					<div
						class="flex-c-m stext-101 cl2 size-118 bg8 bor13 hov-btn3 p-lr-15 trans-04 pointer">
						<a href="/login">Đăng nhập</a>
					</div>
					<div
						class="flex-c-m stext-101 cl2 size-118 bg8 bor13 hov-btn3 p-lr-15 trans-04 pointer">
						<a href="/resgiter">Đăng ký</a>
					</div>
				</div>

			</div>
		</div>
	</div>
</c:if>