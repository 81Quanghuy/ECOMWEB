
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!-- breadcrumb -->
<div class="container" style="margin-top: 40px;">
	<div class="bread-crumb flex-w p-l-25 p-r-15 p-t-30 p-lr-0-lg">
		<a href="/" class="stext-109 cl8 hov-cl1 trans-04"> Home <i
			class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i>
		</a> <a href="/category/${product.category.id}"
			class="stext-109 cl8 hov-cl1 trans-04"> ${product.category.name}
			<i class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i>
		</a> <span class="stext-109 cl4"> ${product.name} </span>
	</div>
</div>


<!-- Product Detail -->
<section class="sec-product-detail bg0 p-t-65 p-b-60">
	<div class="container">
		<div class="row">
			<div class="col-md-6 col-lg-7 p-b-30">
				<div class="p-l-25 p-r-30 p-lr-0-lg">
					<div class="wrap-slick3 flex-sb flex-w">
						<div class="wrap-slick3-dots"></div>
						<div class="wrap-slick3-arrows flex-sb-m flex-w"></div>

						<div class="slick3 gallery-lb">
							<c:if test="${!product.listimage.substring(0,4).equals('http')}">
								<div class="item-slick3"
									data-thumb="/images/admin/${product.listimage}">
									<div class="wrap-pic-w pos-relative">
										<img src="/images/admin/${product.listimage}"
											alt="IMG-PRODUCT"> <a
											class="flex-c-m size-108 how-pos1 bor0 fs-16 cl10 bg0 hov-btn3 trans-04"
											href="/images/admin/${product.listimage}"> <i
											class="fa fa-expand"></i>
										</a>
									</div>
								</div>
							</c:if>
							<c:if test="${product.listimage.substring(0,4).equals('http')}">
								<div class="item-slick3"
									data-thumb="/images/admin/${product.listimage}">
									<div class="wrap-pic-w pos-relative">
										<img src="${product.listimage}" alt="IMG-PRODUCT"> <a
											class="flex-c-m size-108 how-pos1 bor0 fs-16 cl10 bg0 hov-btn3 trans-04"
											href="/images/admin/${product.listimage}"> <i
											class="fa fa-expand"></i>
										</a>
									</div>
								</div>
							</c:if>
						</div>
					</div>
				</div>
			</div>

			<div class="col-md-6 col-lg-5 p-b-30">
				<div class="p-r-50 p-t-5 p-lr-0-lg">
					<h4 class="mtext-105 cl2 js-name-detail p-b-14">${product.name}</h4>
					<span class="mtext-106 cl2 "> $${product.promotionaprice} </span> <s
						class="mtext-106 cl3 "> $${product.price} </s>
					<p class="stext-102 cl3 p-t-23">${product.desciption}</p>

					<!--  -->
					<div class="p-t-33">


						<div class="flex-w flex-r-m p-b-10">
							<div class="size-204 flex-w flex-m respon6-next">
								<div class="wrap-num-product flex-w m-r-20 m-tb-10">
									<div
										class="btn-num-product-down cl8 hov-btn3 trans-04 flex-c-m">
										<i class="fs-16 zmdi zmdi-minus"></i>
									</div>

									<input class="mtext-104 cl3 txt-center num-product"
										type="number" name="count" value="1">

									<div class="btn-num-product-up cl8 hov-btn3 trans-04 flex-c-m">
										<i class="fs-16 zmdi zmdi-plus"></i>
									</div>
								</div>

								<a href="/store/add/${product.id}"
									class="flex-c-m stext-101 cl0 size-101 bg1 bor1 hov-btn1 p-lr-15 trans-04 js-addcart-detail">
									Thêm vào giỏ hàng</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="bor10 m-t-50 p-t-43 p-b-40">
			<!-- Tab01 -->
			<div class="tab01">
				<!-- Nav tabs -->
				<ul class="nav nav-tabs" role="tablist">
					<li class="nav-item p-b-10"><a class="nav-link active"
						data-toggle="tab" href="#description" role="tab">Mô tả</a></li>

					<li class="nav-item p-b-10"><a class="nav-link"
						data-toggle="tab" href="#information" role="tab">Thông tin
							thêm</a></li>

					<li class="nav-item p-b-10"><a class="nav-link"
						data-toggle="tab" href="#reviews" role="tab">Đánh giá </a></li>
				</ul>

				<!-- Tab panes -->
				<div class="tab-content p-t-43">
					<!-- - -->
					<div class="tab-pane fade show active" id="description"
						role="tabpanel">
						<div class="how-pos2 p-lr-15-md">
							<p class="stext-102 cl6">Chất lượng sản phẩm là một trong số
								niềm tự hào của chúng tôi.${product.desciption}</p>
						</div>
					</div>

					<!-- - -->
					<div class="tab-pane fade" id="information" role="tabpanel">
						<div class="row">
							<div class="col-sm-10 col-md-8 col-lg-6 m-lr-auto">
								<ul class="p-lr-28 p-lr-15-sm">
									<li class="flex-w flex-t p-b-7"><span
										class="stext-102 cl3 size-205"> Số lượng bán ra </span> <span
										class="stext-102 cl6 size-206"> ${product.sold} cái </span></li>

									<li class="flex-w flex-t p-b-7"><span
										class="stext-102 cl3 size-205"> Số lượng còn lại </span> <span
										class="stext-102 cl6 size-206"> ${product.quantity- product.sold}
											cái</span></li>

									<li class="flex-w flex-t p-b-7"><span
										class="stext-102 cl3 size-205"> Thể loại </span> <span
										class="stext-102 cl6 size-206">
											${product.category.name}</span></li>

								</ul>
							</div>
						</div>
					</div>

					<!-- - -->
					<div class="tab-pane fade" id="reviews" role="tabpanel">
						<div class="row">
							<div class="col-sm-10 col-md-8 col-lg-6 m-lr-auto">
								<div class="p-b-30 m-lr-15-sm">
									<!-- Review -->
									<div class="flex-w flex-t p-b-68">
										<div class="wrap-pic-s size-109 bor0 of-hidden m-r-18 m-t-6">
											<img src="images/avatar-01.jpg" alt="AVATAR">
										</div>

										<div class="size-207">
											<div class="flex-w flex-sb-m p-b-17">
												<span class="mtext-107 cl2 p-r-20"> Ariana Grande </span> <span
													class="fs-18 cl11"> <i class="zmdi zmdi-star"></i> <i
													class="zmdi zmdi-star"></i> <i class="zmdi zmdi-star"></i>
													<i class="zmdi zmdi-star"></i> <i
													class="zmdi zmdi-star-half"></i>
												</span>
											</div>

											<p class="stext-102 cl6">Quod autem in homine
												praestantissimum atque optimum est, id deseruit. Apud
												ceteros autem philosophos</p>
										</div>
									</div>
									<c:forEach items="${reviews}" var="item">
										<div class="flex-w flex-t p-b-68">
											<div class="wrap-pic-s size-109 bor0 of-hidden m-r-18 m-t-6">
												<c:if
													test="${item.user.avatar.substring(0,4).equals('http')}">
													<img src="${item.user.avatar}" alt="AVATAR">
												</c:if>
												<c:if
													test="${!item.user.avatar.substring(0,4).equals('http')}">
													<img src="/images/user/${item.user.avatar}" alt="AVATAR">
												</c:if>
											</div>

											<div class="size-207">
												<div class="flex-w flex-sb-m p-b-17">
													<span class="mtext-107 cl2 p-r-20">
														${item.user.lastName} </span> <span class="fs-18 cl11">
														${item.rating} <i class="zmdi zmdi-star"></i>
													</span>
												</div>

												<p class="stext-102 cl6">${item.content }</p>
											</div>


										</div>
									</c:forEach>

									<c:if test="${checkreview}">
										<!-- Add review -->
										<form class="w-full" action="/product/review" method="post"
											enctype="mutipart/form-data">
											<h5 class="mtext-108 cl2 p-b-7">Thêm đánh giá</h5>



											<div class="flex-w flex-m p-t-50 p-b-23">
												<span class="stext-102 cl3 m-r-16"> Đánh giá </span> <span
													class="wrap-rating fs-18 cl11 pointer"> <i
													class="item-rating pointer zmdi zmdi-star-outline"></i> <i
													class="item-rating pointer zmdi zmdi-star-outline"></i> <i
													class="item-rating pointer zmdi zmdi-star-outline"></i> <i
													class="item-rating pointer zmdi zmdi-star-outline"></i> <i
													class="item-rating pointer zmdi zmdi-star-outline"></i> <input
													class="dis-none" type="number" name="rating">
												</span>
											</div>

											<div class="row p-b-25">
												<div class="col-12 p-b-5">
													<label class="stext-102 cl3" for="content">Đánh giá
														của bạn</label>
													<textarea
														class="size-110 bor8 stext-102 cl2 p-lr-20 p-tb-10"
														id="review" name="content"></textarea>
												</div>


											</div>

											<button
												class="flex-c-m stext-101 cl0 size-112 bg7 bor11 hov-btn3 p-lr-15 trans-04 m-b-10">
												Xác nhận</button>
										</form>
									</c:if>
									<c:if test="${!checkreview}">
										<h5 class="mtext-108 cl2 p-b-7">Bạn cần mua sản phẩm để
											thực hiện đánh giá</h5>
									</c:if>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</section>


<!-- Related Products -->
<section class="sec-relate-product bg0 p-t-45 p-b-105">
	<div class="container">
		<div class="p-b-45">
			<h3 class="ltext-106 cl5 txt-center">Related Products</h3>
		</div>

		<!-- Slide2 -->
		<div class="wrap-slick2">
			<div class="slick2">
				<c:forEach items="${products}" var="item">
					<div class="col-sm-6 col-md-4 col-lg-3 p-b-35 isotope-item women">
						<!-- Block2 -->
						<div class="block2">
							<c:if test="${!item.listimage.substring(0,4).equals('http')}">
								<div class="block2-pic hov-img0">
									<img src="/images/admin/${item.listimage}" alt="IMG-PRODUCT">
									<a href="add/${item.id}"
										class="block2-btn flex-c-m stext-103 cl2 size-102 bg0 bor2 hov-btn1 p-lr-15 trans-04">
										Add to Cart</a>
								</div>
							</c:if>
							<c:if test="${item.listimage.substring(0,4).equals('http')}">
								<div class="block2-pic hov-img0">
									<img src="${item.listimage}" alt="IMG-PRODUCT"> <a
										href="add/${item.id}"
										class="block2-btn flex-c-m stext-103 cl2 size-102 bg0 bor2 hov-btn1 p-lr-15 trans-04">
										Add to Cart</a>
								</div>
							</c:if>
							<div class="block2-txt flex-w flex-t p-t-14">
								<div class="block2-txt-child1 flex-col-l ">
									<a href="/product/detail/${item.id}"
										class="stext-104 cl4 hov-cl1 trans-04 js-name-b2 p-b-6">
										${item.name} </a> <span class="stext-105 cl3">
										$${item.price} </span>
								</div>

								<div class="block2-txt-child2 flex-r p-t-3">
									<a href="#"
										class="btn-addwish-b2 dis-block pos-relative js-addwish-b2">
										<img class="icon-heart1 dis-block trans-04"
										src="/images/user/icon-heart-01.png" alt="ICON"> <img
										class="icon-heart2 dis-block trans-04 ab-t-l"
										src="/images/user/icon-heart-02.png" alt="ICON">
									</a>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>

			</div>
		</div>
	</div>
</section>