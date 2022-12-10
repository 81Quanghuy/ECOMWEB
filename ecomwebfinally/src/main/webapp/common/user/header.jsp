<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>


<!-- Header -->
<header>
	<!-- Header desktop -->
	<div class="container-menu-desktop">
		<!-- Topbar -->
		<div class="top-bar">
			<div class="content-topbar flex-sb-m h-full container">
				<div class="left-top-bar">Miễn phí vận chuyển lên đến 10$</div>

				<div class="right-top-bar flex-w h-full">
					<a href="help" class="flex-c-m trans-04 p-lr-25"> Trợ giúp </a> <a
						href="about" class="flex-c-m trans-04 p-lr-25"> Về chúng tôi </a>
				</div>
			</div>
		</div>

		<div class="wrap-menu-desktop">
			<nav class="limiter-menu-desktop container">

				<!-- Logo desktop -->
				<a href="/" class=""> <img src="${URL}images/icons/logo-01.png"
					alt="IMG-LOGO">
				</a>

				<!-- Menu desktop -->
				<div class="menu-desktop">
					<ul class="main-menu">
						<li class="active-menu"><a href="/">Trang chủ</a></li>
						<li><a href="/store">Các cửa hàng</a></li>

						<li><a href="#">Loại sản phẩm</a>
							<ul class="sub-menu">
								<c:forEach items="${categories}" var="item">
									<li><a href="category/${item.id}">${item.name}</a></li>
								</c:forEach>
							</ul></li>


						<li class="label1" data-label1="hot"><a href="/product/hot">Sản
								phẩm nổi bật</a></li>

						<li><a href="/contact">Contact</a></li>
					</ul>
				</div>

				<!-- Icon header -->
				<div class="wrap-icon-header flex-w flex-r-m">
					<div
						class="icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11 js-show-modal-search">
						<i class="zmdi zmdi-search"></i>
					</div>

					<div
						class="icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11 icon-header-noti js-show-cart"
						data-notify="${cartitem}">
						<i class="zmdi zmdi-shopping-cart"></i>
					</div>

					<ul class="main-menu">

						<c:if test="${ user!= null}">
							<li><a
								class="nav-link nav-profile d-flex align-items-center pe-0"
								href="/user/profile/${user.id}" data-bs-toggle="dropdown"> <c:if
										test="${user.avatar.substring(0,4).equals('http')}">
										<img src="${user.avatar}" alt="Profile" class="rounded-circle"
											style="width: 37px; height: 37px; border-radius: 50%;">
									</c:if> <c:if test="${!user.avatar.substring(0,4).equals('http')}">
										<img src="/images/user/${user.avatar}" alt="Profile"
											class="rounded-circle"
											style="width: 37px; height: 37px; border-radius: 50%;">
									</c:if> <span class="d-none d-md-block dropdown-toggle ps-2">${admin.name}</span>
							</a> <!-- End Profile Iamge Icon -->

								<ul class="sub-menu"
									style="right: 0; top: 76%; left: -150%; border-radius: 5px;">
									<li><a href="/user/profile/${user.id}">${user.firstName}
											${user.lastName}</a></li>
									<c:if test="${store == null}">
										<li><a href="/store/register">Trở thành người bán </a></li>
									</c:if>
									<c:if test="${store != null}">
										<li><a href="/store/${store.id}">Cửa hàng của tôi </a></li>
									</c:if>
									<li><a href="/logout">Đăng xuất</a></li>
								</ul></li>


						</c:if>
						<c:if test="${user == null}">
							<a href="/login">Đăng nhập</a>
							<p style="padding: 10px;">|</p>
							<a href="/resgiter">Đăng ký</a>
						</c:if>
					</ul>
				</div>
			</nav>
		</div>
	</div>

	<!-- Header Mobile -->
	<div class="wrap-header-mobile">
		<!-- Logo moblie -->
		<div class="logo-mobile">
			<a href="index.html"><img src="images/icons/logo-01.png"
				alt="IMG-LOGO"></a>
		</div>

		<!-- Icon header -->
		<div class="wrap-icon-header flex-w flex-r-m m-r-15">
			<div
				class="icon-header-item cl2 hov-cl1 trans-04 p-r-11 js-show-modal-search">
				<i class="zmdi zmdi-search"></i>
			</div>

			<div
				class="icon-header-item cl2 hov-cl1 trans-04 p-r-11 p-l-10 icon-header-noti js-show-cart"
				data-notify="2">
				<i class="zmdi zmdi-shopping-cart"></i>
			</div>

			<a href="#"
				class="dis-block icon-header-item cl2 hov-cl1 trans-04 p-r-11 p-l-10 icon-header-noti"
				data-notify="0"> <i class="zmdi zmdi-favorite-outline"></i>
			</a>
		</div>

		<!-- Button show menu -->
		<div class="btn-show-menu-mobile hamburger hamburger--squeeze">
			<span class="hamburger-box"> <span class="hamburger-inner"></span>
			</span>
		</div>
	</div>


	<!-- Menu Mobile -->
	<div class="menu-mobile">
		<ul class="topbar-mobile">
			<li>
				<div class="left-top-bar">Free shipping for standard order
					over $100</div>
			</li>

			<li>
				<div class="right-top-bar flex-w h-full">
					<a href="#" class="flex-c-m p-lr-10 trans-04"> Help & FAQs </a> <a
						href="#" class="flex-c-m p-lr-10 trans-04"> My Account </a> <a
						href="#" class="flex-c-m p-lr-10 trans-04"> EN </a> <a href="#"
						class="flex-c-m p-lr-10 trans-04"> USD </a>
				</div>
			</li>
		</ul>

		<ul class="main-menu-m">
			<li><a href="index.html">Home</a>
				<ul class="sub-menu-m">
					<li><a href="index.html">Homepage 1</a></li>
					<li><a href="home-02.html">Homepage 2</a></li>
					<li><a href="home-03.html">Homepage 3</a></li>
				</ul> <span class="arrow-main-menu-m"> <i
					class="fa fa-angle-right" aria-hidden="true"></i>
			</span></li>

			<li><a href="product.html">Shop</a></li>

			<li><a href="shoping-cart.html" class="label1 rs1"
				data-label1="hot">Features</a></li>

			<li><a href="blog.html">Blog</a></li>

			<li><a href="about.html">About</a></li>

			<li><a href="contact.html">Contact</a></li>
		</ul>
	</div>

	<!-- Modal Search -->
	<div class="modal-search-header flex-c-m trans-04 js-hide-modal-search">
		<div class="container-search-header">
			<button
				class="flex-c-m btn-hide-modal-search trans-04 js-hide-modal-search">
				<img src="images/icons/icon-close2.png" alt="CLOSE">
			</button>

			<form class="wrap-search-header flex-w p-l-15">
				<button class="flex-c-m trans-04">
					<i class="zmdi zmdi-search"></i>
				</button>
				<input class="plh3" type="text" name="search"
					placeholder="Search...">
			</form>
		</div>
	</div>
</header>

<!-- Cart -->
<div class="wrap-header-cart js-panel-cart">
	<div class="s-full js-hide-cart"></div>

	<div class="header-cart flex-col-l p-l-65 p-r-25">
		<div class="header-cart-title flex-w flex-sb-m p-b-8">
			<span class="mtext-103 cl2"> Your Cart </span>

			<div
				class="fs-35 lh-10 cl2 p-lr-5 pointer hov-cl1 trans-04 js-hide-cart">
				<i class="zmdi zmdi-close"></i>
			</div>
		</div>

		<div class="header-cart-content flex-w js-pscroll">
			<ul class="header-cart-wrapitem w-full">
				<c:forEach items="${cartItems}" var="cartItem">
					<li class="header-cart-item flex-w flex-t m-b-12">
						<div class="header-cart-item-img">
							<c:if
								test="${!cartItem.product.listimage.substring(0,4).equals('http')}">
								<img src="/images/admin/${cartItem.product.listimage}" alt="IMG">
							</c:if>
							<c:if
								test="${cartItem.product.listimage.substring(0,4).equals('http')}">
								<img src="${cartItem.product.listimage}" alt="IMG">
							</c:if>
						</div>
						<div class="header-cart-item-txt p-t-8">
							<a href="product/${cartItem.product.id}"
								class="header-cart-item-name m-b-18 hov-cl1 trans-04">
								${cartItem.product.name}</a> <span class="header-cart-item-info">
								${cartItem.count} x ${cartItem.product.price} </span>
						</div>
					</li>
				</c:forEach>



			</ul>

			<div class="w-full">
				<div class="header-cart-total w-full p-tb-40">Total:${total}</div>

				<div class="header-cart-buttons flex-w w-full">
					<a href="/cart"
						class="flex-c-m stext-101 cl0 size-107 bg3 bor2 hov-btn3 p-lr-15 trans-04 m-r-8 m-b-10">
						Giỏ hàng </a> <a href="/order"
						class="flex-c-m stext-101 cl0 size-107 bg3 bor2 hov-btn3 p-lr-15 trans-04 m-b-10">
						Đơn hàng </a>
				</div>
			</div>
		</div>
	</div>
</div>