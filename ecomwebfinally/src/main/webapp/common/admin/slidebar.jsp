<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/common/taglib.jsp"%>

<!-- ======= Sidebar ======= -->
<aside id="sidebar" class="sidebar">

	<ul class="sidebar-nav" id="sidebar-nav">

		<li class="nav-item"><a class="nav-link collapsed"
			href="/admin/home"> <i class="bi bi-grid"></i> <span>Trang
					Chủ</span>
		</a></li>

		<li class="nav-item"><a class="nav-link collapsed"
			href="/admin/categories"> <i class="bi bi-menu-button-wide"></i>
				<span>Loại Sản Phẩm</span>
		</a></li>

		<li class="nav-item"><a class="nav-link collapsed"
			href="/admin/product"> <i class="bi bi-journal-text"></i> <span>
					Sản Phẩm</span>
		</a></li>

		<li class="nav-item"><a class="nav-link collapsed"
			href="/admin/orders"> <i class="bi bi-layout-text-window-reverse"></i>
				<span> Đơn Hàng</span>
		</a></li>


		<li class="nav-item"><a class="nav-link collapsed"
			href="/admin/deliveries"> <i class="bi bi-card-list"></i> <span>Đơn
					Vị Vận Chuyển</span>
		</a></li>

		<li class="nav-item"><a class="nav-link collapsed"
			data-bs-target="#charts-nav" data-bs-toggle="collapse" href="#">
				<i class="bi bi-bar-chart"></i><span>Cửa Hàng</span><i
				class="bi bi-chevron-down ms-auto"></i>
		</a>
			<ul id="charts-nav" class="nav-content collapse "
				data-bs-parent="#sidebar-nav">

				<%-- <c:if test="${cnewstore}"> --%>

				<li><a href="/admin/newstore"> <i class="bi bi-circle"></i><span>Cửa
							Hàng Mới </span>
				</a></li>
				<%-- 	</c:if> --%>
				<li><a href="/admin/store"> <i class="bi bi-circle"></i><span>Cửa
							Hàng</span>
				</a></li>
			</ul></li>
		<!-- End Charts Nav -->

		<li class="nav-item"><a class="nav-link collapsed"
			data-bs-target="#tables-nav" data-bs-toggle="collapse" href="#">
				<i class="bi bi-layout-text-window-reverse"></i><span>Quản Lý
					Tài Khoản</span><i class="bi bi-chevron-down ms-auto"></i>
		</a>
			<ul id="tables-nav" class="nav-content collapse "
				data-bs-parent="#sidebar-nav">
				<li><a href="/admin/user"> <i class="bi bi-circle"></i><span>
							Người Dùng</span>
				</a></li>
				<li><a href="/admin/seller"> <i class="bi bi-circle"></i><span>Seller</span>
				</a></li>

				<li><a href="/admin/newuser"> <i class="bi bi-circle"></i><span>Người
							Dùng Mới</span><span class="badge bg-success"></span>
				</a></li>

			</ul></li>
		<!-- End Tables Nav -->

		<li class="nav-heading">Trang</li>

		<li class="nav-item"><a class="nav-link collapsed"
			href="/admin/profile"> <i class="bi bi-person"></i> <span>Thông
					Tin Cá Nhân</span>
		</a></li>
		<!-- End Profile Page Nav -->

		<!-- 		<li class="nav-item"><a class="nav-link collapsed"
			href="/admin/error"> <i class="bi bi-question-circle"></i> <span>F.A.Q</span>
		</a></li> -->
		<!-- End F.A.Q Page Nav -->

		<li class="nav-item"><a class="nav-link collapsed"
			href="/admin/user"> <i class="bi bi-envelope"></i> <span>Người
					Dùng</span>
		</a></li>
		<!-- End Register Page Nav -->

		<li class="nav-item"><a class="nav-link collapsed" href="/logout">
				<i class="bi bi-box-arrow-in-right"></i> <span>Login Out</span>
		</a></li>
		<!-- End Login Page Nav -->

	</ul>

</aside>
<!-- End Sidebar-->
