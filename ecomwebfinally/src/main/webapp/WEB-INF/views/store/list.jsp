<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/common/taglib.jsp"%>
<aside id="sidebar" class="sidebar"
	style="top: 41px; padding-top: 72px;">

	<ul class="sidebar-nav" id="sidebar-nav">
		<li class="nav-item"><a class="nav-link collapsed"
			href="/admin/home"> <i class="bi bi-grid"></i> <span>Loại
					sản phẩm</span>
		</a></li>
	</ul>
	<c:forEach items="${categories}" var="item">
		<ul class="sidebar-nav" id="sidebar-nav">
			<li class="nav-item"><a class="nav-link collapsed"
				href="/store/category/${item.id}"> <i class="bi bi-grid"></i> <span>${item.name}</span>
			</a></li>
		</ul>
	</c:forEach>
</aside>
<!-- End Sidebar-->

<div id="main">
	<!-- Recent Sales -->
	<div class="col-12">
		<div class="card recent-sales overflow-auto">


			<!--  Sử dụng vòng lặp lấy order -->
			<div class="card-body">

				<table class="table table-borderless datatable">
					<thead>
						<tr>
							<th scope="col">#</th>
							<th>Ảnh</th>
							<th>Tên cửa hàng</th>
							<th>Mô tả</th>
							<th>Đánh giá</th>
							<th>Ngày tạo</th>
						</tr>
					</thead>
					<tbody>

						<c:forEach items="${stores}" var="cate" varStatus="STT">
							<tr>
								<th scope="row"><a href="#">${STT.index+1}</a></th>
								<c:if
									test="${cate.featuredimages.substring(0,4).equals('http')}">
									<td><c:url value="${cate.featuredimages}" var="imgUrl"></c:url>
										<img width="100px" height="100px" src="${imgUrl}"></td>
								</c:if>
								<c:if
									test="${!cate.featuredimages.substring(0,4).equals('http')}">
									<td><c:url value="/images/seller/${cate.featuredimages}"
											var="imgUrl"></c:url> <img width="100px" height="100px"
										src="${imgUrl}"></td>
								</c:if>
								<td><a href="store/${cate.id}">${cate.name}</a></td>
								<td>${cate.bio}</td>
								<td>${cate.rating}</td>
								<td>${cate.createat}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>

			</div>

		</div>
	</div>
	<!-- End Recent Sales -->
</div>
