<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:url value="/image?fname=" var="URL_slides"></c:url>
<section class="jumbotron text-center fpt--img">
	<div class="container">
		<img alt=""
			src="https://images.fpt.shop/unsafe/fit-in/filters:quality(80):fill(transparent)/fptshop.com.vn/Uploads/Originals/2022/10/7/638007503624186425_desk-home-header.png">
	</div>
</section>
<div class="container">
	<div class="row">
		<div class="col">
			<div id="carouselExampleIndicators" class="carousel slide"
				data-ride="carousel">
				<ol class="carousel-indicators">
					<li data-target="#carouselExampleIndicators" data-slide-to="0"
						class="active"></li>
					<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
					<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
					<li data-target="#carouselExampleIndicators" data-slide-to="3"></li>
				</ol>
				<div class="carousel-inner">
					<div class="carousel-item active">
						<img class="d-block w-100" src="${URL_slides}anh1.png"
							alt="First slide">
					</div>
					<div class="carousel-item">
						<img class="d-block w-100" src="${URL_slides}anh2.png"
							alt="Second slide">
					</div>
					<div class="carousel-item">
						<img class="d-block w-100" src="${URL_slides}anh3.png"
							alt="Third slide">
					</div>
					<div class="carousel-item">
						<img class="d-block w-100" src="${URL_slides}anh4.png"
							alt="Fourty slide">
					</div>
				</div>
				<a class="carousel-control-prev" href="#carouselExampleIndicators"
					role="button" data-slide="prev">
					<div class="sliderbar-icon">
						<span class="carousel-control-prev-icon" aria-hidden="true"></span>
						<span class="sr-only">Previous</span>
					</div>
				</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
					role="button" data-slide="next">
					<div class="sliderbar-icon">
						<span class="carousel-control-next-icon" aria-hidden="true"></span>
						<span class="sr-only">Next</span>
					</div>
				</a>
			</div>
		</div>
		<div class="col-12 col-md-3">
			<div class="card ">
				<div class="card-header bg-success text-white text-uppercase">
					<i class="fa fa-heart"></i>Sản phẩm nổi bật
				</div>
				<c:if test="${proListbest[0].images.substring(0,4)!='http'}">
					<img class="img-fluid border-0"
						src="${URL_slides}${proListbest[0].images}" alt="Card image cap">
				</c:if>
				<c:if test="${proListbest[0].images.substring(0,4)=='http'}">
					<img class="img-fluid border-0" src="${proListbest[0].images}"
						alt="Card image cap">
				</c:if>
				<div class="card-body">
					<h4 class="card-title text-center">
						<a href="product" title="View Product">${proListbest[0].productname}</a>
					</h4>
					<div class="row">
						<div class="col">
							<p class="btn btn-danger btn-block">${proListbest[0].price}00đ</p>
						</div>
						<div class="col">
							<a href="product/detail" class="btn btn-success btn-block">Xem
								chi tiết</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>


<div class="container mt-3">
	<div class="row">
		<div class="col-sm">
			<div class="card">
				<div class="card-header bg-primary text-white text-uppercase">
					<i class="fa fa-star"></i> Last products
				</div>
				<div class="card-body">
					<div class="row">
						<c:forEach items="${proListlast}" var="product">
							<div class="col-sm">
								<div class="card " style="height: 580px;">
									<c:if test="${product.images.substring(0,4)=='http'}">
										<img class="card-img-top" src="${product.images}"
											alt="Card image cap">
									</c:if>
									<c:if test="${product.images.substring(0,4)!='http'}">
										<img class="card-img-top" src="${URL_slides}${product.images}"
											alt="Card image cap">
									</c:if>
									<div class="card-body">
										<h4 class="card-title">
											<a href="product.jsp" title="View Product">${product.productname}</a>
										</h4>
										<p class="card-text">${product.description}</p>
										<div class="row"
											style="position: absolute; bottom: 24px; left: 24px; right: 24px;">
											<div class="col">
												<p class="btn btn-danger btn-block">${product.price}.000đ</p>
											</div>
											<div class="col">
												<a href="cart.html" class="btn btn-success btn-block">Add
													to cart</a>
											</div>
										</div>
									</div>
								</div>
							</div>
						</c:forEach>

					</div>
				</div>
			</div>
		</div>
	</div>
</div>


<div class="container mt-3 mb-4">
	<div class="row">
		<div class="col-sm">
			<div class="card">
				<div class="card-header bg-primary text-white text-uppercase">
					<i class="fa fa-trophy"></i> Best products
				</div>
				<div class="card-body">
					<div class="row">
							<div class="col-sm">
								<div class="card " style="min-height: 590px;">
									<c:if test="${product.images.substring(0,4)=='http'}">
										<img class="card-img-top" src="${product.images}"
											alt="Card image cap">
									</c:if>
									<c:if test="${product.images.substring(0,4)!='http'}">
										<img class="card-img-top" src="${URL_slides}${product.images}"
											alt="Card image cap">
									</c:if>
									<div class="card-body">
										<h4 class="card-title">
											<a href="product.jsp" title="View Product">${product.productname}</a>
										</h4>
										<p class="card-text">${product.description}</p>
										<div class="row"
											style="position: absolute; bottom: 24px; left: 24px; right: 24px;">
											<div class="col">
												<p class="btn btn-danger btn-block">${product.price}.000đ</p>
											</div>
											<div class="col">
												<a href="cart.html" class="btn btn-success btn-block">Add
													to cart</a>
											</div>
										</div>
									</div>
								</div>
							</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</div>