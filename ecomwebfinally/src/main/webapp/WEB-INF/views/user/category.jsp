<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/common/taglib.jsp"%>
<!-- breadcrumb -->
<div class="container" style="margin-top: 40px;">
	<div class="bread-crumb flex-w p-l-25 p-r-15 p-t-30 p-lr-0-lg">
		<a href="/" class="stext-109 cl8 hov-cl1 trans-04"> Home <i
			class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i>
		</a> <a class="stext-109 cl8 hov-cl1 trans-04"> Category <i
			class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i>
		</a><span class="stext-109 cl4"> ${category.name}</span>
	</div>
</div>
<div class="m-t-40 m-l-60 p-l-80 m-r-60 p-r-80">
	<div class="row isotope-grid">
		<c:forEach items="${products}" var="item">
			<div class="col-sm-6 col-md-4 col-lg-3 p-b-35 isotope-item women">
				<!-- Block2 -->
				<div class="block2">
					<c:if test="${!item.listimage.substring(0,4).equals('http')}">
						<div class="block2-pic hov-img0">
							<img src="/images/admin/${item.listimage}" alt="IMG-PRODUCT">
							<a href="/store/add/${item.id}"
								class="block2-btn flex-c-m stext-103 cl2 size-102 bg0 bor2 hov-btn1 p-lr-15 trans-04">
								Add to Cart</a>
						</div>
					</c:if>
					<c:if test="${item.listimage.substring(0,4).equals('http')}">
						<div class="block2-pic hov-img0">
							<img src="${item.listimage}" alt="IMG-PRODUCT"> <a
								href="/store/add/${item.id}"
								class="block2-btn flex-c-m stext-103 cl2 size-102 bg0 bor2 hov-btn1 p-lr-15 trans-04">
								Add to Cart</a>
						</div>
					</c:if>
					<div class="block2-txt flex-w flex-t p-t-14">
						<div class="block2-txt-child1 flex-col-l ">
							<a href="/product/detail/${item.id}"
								class="stext-104 cl4 hov-cl1 trans-04 js-name-b2 p-b-6">
								${item.name} </a> <span class="stext-105 cl3"> $${item.price}
							</span>
						</div>

						<div class="block2-txt-child2 flex-r p-t-3">
							<a href="#"
								class="btn-addwish-b2 dis-block pos-relative js-addwish-b2">
								<img class="icon-heart1 dis-block trans-04"
								src="${URL}images/icons/icon-heart-01.png" alt="ICON"> <img
								class="icon-heart2 dis-block trans-04 ab-t-l"
								src="${URL}images/icons/icon-heart-02.png" alt="ICON">
							</a>
						</div>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
</div>