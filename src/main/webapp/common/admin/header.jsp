
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:url value="/admin/product" var="product" />
<c:url value="/admin/home" var="home" />
<c:url value="/admin/category" var="category" />
<c:url value="/admin/cart" var="cart" />
<c:url value="/admin/contact" var="contact" />

<nav class="navbar navbar-expand-lg navbar-light bg-light">
	<a class="navbar-brand" href="${home}">Future World</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>

	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item active"><a class="nav-link" href="${home}">Home
					<span class="sr-only">(current)</span>
			</a></li>
			<li class="nav-item"><a class="nav-link" href="${category}">Categories</a></li>
			<li class="nav-item"><a class="nav-link" href="${product}">Product</a></li>
			<li class="nav-item"><a class="nav-link" href="${cart}">Cart</a></li>
			<li class="nav-item"><a class="nav-link" href="${contact}">Contact</a></li>
		</ul>
		<form class="form-inline my-2 my-lg-0">
			<div class="input-group input-group-sm">
				<input type="text" name="txt" class="form-control"
					placeholder="Search...">
				<div class="input-group-append">
					<button type="button" class="btn btn-secondary btn-number">
						<i class="fa fa-search"></i>
					</button>
				</div>
			</div>
			<a class="btn btn-success btn-sm ml-3" href="cart.html"> <i
				class="fa fa-shopping-cart"></i> Cart <span
				class="badge badge-light">1</span><%-- //${cartitem.quantity} --%>
			</a>
		</form>
	</div>
</nav>