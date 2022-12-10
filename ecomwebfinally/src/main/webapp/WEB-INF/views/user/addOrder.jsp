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

		<div class="row">
			<c:if test="${cartItems.size()>0 }">
				<div class="col-lg-10  m-b-50">
					<div class="m-l-25 m-r--38 m-lr-0-xl">


						<div class="wrap-table-shopping-cart">
							<table class="table-shopping-cart">
								<tr class="table_head">
									<th class="column-1">Product</th>
									<th class="column-2"></th>
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
											<td class="column-3 price"><input type="text"
												name="price" value="${item.product.price}"
												readonly="readonly"></td>
											<td class="column-3"><input
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
							<span class="mtext-110 cl2">Tổng tiền : $${total} </span>
						</div>
						<c:if test="${cartItems.size() >0}">
							<a
								class="flex-c-m stext-101 cl0 size-116 bg3 bor14 hov-btn3 p-lr-15 trans-04 pointer "
								href="/order/add">Mua hàng</a>
						</c:if>
					</div>
				</div>
			</c:if>
			<c:if test="${cartItems.size() <1}">
				<div class="">
					<div class="">Chưa có sản phẩm trong giỏ hàng</div>
				</div>
			</c:if>
		</div>
	</div>

</c:if>
<div>
	<form action="/action_page.php">
		<label for="cars">Choose a car:</label> <select name="cars" id="cars">
			<option value="volvo">Volvo</option>
			<option value="saab">Saab</option>
			<option value="opel">Opel</option>
			<option value="audi">Audi</option>
		</select> <br> <br> <input type="submit" value="Submit">
	</form>
</div>