<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- ======= Sidebar ======= -->
<aside id="sidebar" class="sidebar">

	<ul class="sidebar-nav" id="sidebar-nav">

		<li class="nav-item"><a class="nav-link collapsed"
			href="/seller/home"> <i class="bi bi-grid"></i> <span>Trang
					Chủ</span>
		</a></li>

		<li class="nav-item"><a class="nav-link collapsed"
			href="/seller/categories"> <i class="bi bi-menu-button-wide"></i>
				<span>Loại Sản Phẩm</span>
		</a></li>


		<li class="nav-item"><a class="nav-link collapsed"
			href="/seller/product"> <i class="bi bi-journal-text"></i> <span>
					Sản Phẩm</span>
		</a></li>

		<li class="nav-item"><a class="nav-link collapsed"
			href="/seller/orders"> <i
				class="bi bi-layout-text-window-reverse"></i> <span> Đơn Hàng</span>
		</a></li>


		<li class="nav-item"><a class="nav-link collapsed"
			href="/seller/deliveries"> <i class="bi bi-card-list"></i> <span>Đơn
					Vị Vận Chuyển</span>
		</a></li>

		<li class="nav-item"><a class="nav-link collapsed"
			href="/seller/store"> <i class="bi bi-envelope"></i> <span>Gian
					Hàng</span>
		</a></li>
		<!-- 	<li class="nav-item"><a class="nav-link collapsed"
			data-bs-target="#tables-nav" data-bs-toggle="collapse" href="#">
				<i class="bi bi-layout-text-window-reverse"></i><span>Quản Lý
					Điểm</span><i class="bi bi-chevron-down ms-auto"></i>
		</a>
			<ul id="tables-nav" class="nav-content collapse "
				data-bs-parent="#sidebar-nav">
				<li><a href="/admin/grade"> <i class="bi bi-circle"></i><span>
							Danh Sách Điểm</span>
				</a></li>
				<li><a href="/admin/grade/add"> <i class="bi bi-circle"></i><span>Nhập
							Điểm</span>
				</a></li>
			</ul></li>
		End Tables Nav

		<li class="nav-item"><a class="nav-link collapsed"
			data-bs-target="#charts-nav" data-bs-toggle="collapse" href="#">
				<i class="bi bi-bar-chart"></i><span>Lớp Học</span><i
				class="bi bi-chevron-down ms-auto"></i>
		</a>
			<ul id="charts-nav" class="nav-content collapse "
				data-bs-parent="#sidebar-nav">
				<li><a href="/admin/studentclass"> <i class="bi bi-circle"></i><span>Danh
							Sách Lớp</span>
				</a></li>
				<li><a href="charts-apexcharts.html"> <i
						class="bi bi-circle"></i><span>Thêm Lớp Học</span>
				</a></li>
			</ul></li>
		End Charts Nav

		<li class="nav-item"><a class="nav-link collapsed"
			data-bs-target="#icons-nav" data-bs-toggle="collapse" href="#"> <i
				class="bi bi-gem"></i><span>Môn Học</span><i
				class="bi bi-chevron-down ms-auto"></i>
		</a>
			<ul id="icons-nav" class="nav-content collapse "
				data-bs-parent="#sidebar-nav">
				<li><a href="/admin/subject"> <i class="bi bi-circle"></i><span>
							Danh Sách Môn</span>
				</a></li>
				<li><a href="/admin/subject/add"> <i class="bi bi-circle"></i><span>Thêm
							Môn Học</span>
				</a></li>
			</ul></li>
		End Icons Nav

		<li class="nav-item"><a class="nav-link collapsed"
			data-bs-target="#icons-nav1" data-bs-toggle="collapse" href="#">
				<i class="bi bi-card-list"></i><span>Chuyên Ngành</span><i
				class="bi bi-chevron-down ms-auto"></i>
		</a>
			<ul id="icons-nav1" class="nav-content collapse "
				data-bs-parent="#sidebar-nav">
				<li><a href="/admin/faculty"> <i class="bi bi-circle"></i><span>Danh
							Sách Chuyên Ngành </span>
				</a></li>
				<li><a href="/admin/faculty/add"> <i class="bi bi-circle"></i><span>
							Thêm Chuyên Ngành</span>
				</a>
			</ul></li> -->

		<li class="nav-heading">Trang</li>

		<li class="nav-item"><a class="nav-link collapsed"
			href="/seller/profile/${seller.id}"> <i class="bi bi-person"></i> <span>Thông
					Tin Cá Nhân</span>
		</a></li>
		<!-- End Profile Page Nav -->

		<!-- 		<li class="nav-item"><a class="nav-link collapsed"
			href="/admin/error"> <i class="bi bi-question-circle"></i> <span>F.A.Q</span>
		</a></li> -->
		<!-- End F.A.Q Page Nav -->

		<li class="nav-item"><a class="nav-link collapsed"
			href="/seller/infoStore/${user.id}"> <i class="bi bi-envelope"></i> <span>Thông
					Tin Gian Hàng</span>
		</a></li>

		<li class="nav-item"><a class="nav-link collapsed"
			href="/seller/reviews"> <i class="bi bi-envelope"></i> <span>Quản
					Lý Đánh Giá</span>
		</a></li>
		<!-- End Register Page Nav -->

		<li class="nav-item"><a class="nav-link collapsed" href="/logout">
				<i class="bi bi-box-arrow-in-right"></i> <span>Login Out</span>
		</a></li>
	</ul>
</aside>
<!-- End Sidebar-->
