<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/common/taglib.jsp"%>
<section class="bg0 p-t-52 p-b-20">
	<div class="container">
		<div class=" m-all-40" style="margin-top: 40px;">
			<div class="">
				<div class="p-r-45 p-r-0-lg">
					<!--  -->
					<div class="wrap-pic-w how-pos5-parent">
						<c:if
							test="${!store.featuredimages.substring(0,4).equals('http')}">
							<img src="/images/seller/${store.featuredimages}"
								style="display: block; position: relative;">
						</c:if>
						<c:if test="${store.featuredimages.substring(0,4).equals('http')}">
							<img src="${store.featuredimages}"
								style="display: block; position: relative;">
						</c:if>
						<div style="position: absolute; bottom: -15%; left: 35%;">
							<c:if test="${!store.avatar.substring(0,4).equals('http')}">
								<img src="/images/seller/${store.avatar}"
									style="width: 300px; border: 2px #fff solid; display: block; border-radius: 20px;">
							</c:if>
							<c:if test="${store.avatar.substring(0,4).equals('http')}">
								<img src="${store.avatar}"
									style="width: 300px; border: 2px #fff solid; display: block; border-radius: 20px;">
							</c:if>
							<h4 class="mtext-112 cl2 " style="text-align: center;">${store.name}</h4>
						</div>
					</div>

					<div class="p-t-80">
						<h5 class="ltext-109 cl2 p-b-28">${message}</h5>
						<h4 class="ltext-109 cl2 p-b-28">${store.bio}</h4>

						<p class="stext-117 cl6 p-b-26">
							<%-- ${store.about} --%>
						</p>

						<p class="stext-117 cl6 p-b-26">Praesent vel mi bibendum,
							finibus leo ac, condimentum arcu. Pellentesque sem ex, tristique
							sit amet suscipit in, mattis imperdiet enim. Integer tempus justo
							nec velit fringilla, eget eleifend neque blandit. Sed tempor
							magna sed congue auctor. Mauris eu turpis eget tortor ultricies
							elementum. Phasellus vel placerat orci, a venenatis justo.
							Phasellus faucibus venenatis nisl vitae vestibulum. Praesent id
							nibh arcu. Vivamus sagittis accumsan felis, quis vulputate</p>
					</div>

					<!--  -->
					<section class="sec-relate-product bg0 p-t-45 p-b-105">
						<div class="container">
							<div class="p-b-45">
								<h3 class="ltext-106 cl5 txt-center">Các sản phẩm đang kinh
									doanh</h3>
							</div>

							<!-- Slide2 -->
							<div class="">
								<div class="" style="display: flex; flex-wrap: wrap;">
									<c:forEach items="${products}" var="item">
										<div
											class="col-sm-6 col-md-4 col-lg-3 p-b-35 isotope-item women">
											<!-- Block2 -->
											<div class="block2">
												<c:if
													test="${!item.listimage.substring(0,4).equals('http')}">
													<div class="block2-pic hov-img0">
														<img src="/images/admin/${item.listimage}"
															alt="IMG-PRODUCT"> <a href="add/${item.id}"
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
					<h5 class="mtext-113 cl2 p-b-12">Leave a Comment</h5>

					<p class="stext-107 cl6 p-b-40">Your email address will not be
						published. Required fields are marked *</p>

					<form>
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
						<div class="bor19 m-b-20">
							<textarea class="stext-111 cl2 plh3 size-124 p-lr-18 p-tb-15"
								name="cmt" placeholder="Comment..."></textarea>
						</div>
						<button
							class="flex-c-m stext-101 cl0 size-125 bg3 bor2 hov-btn3 p-lr-15 trans-04">
							Post Comment</button>
					</form>
				</div>
			</div>
		</div>
	</div>
	</div>
</section>
