<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>

<main id="main" class="main">

	<div class="pagetitle">
		<h1>Dashboard</h1>
		<nav>
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="/seller/home">Trang
						Chủ</a></li>
				<li class="breadcrumb-item active">Dashboard</li>
			</ol>
		</nav>
	</div>
	<!-- End Page Title -->

	<section class="section dashboard">
		<div class="row">

			<!-- Left side columns -->
			<div class="col-lg-8">
				<div class="row">

					<!-- Sales Card -->
					<div class="col-xxl-4 col-md-6">
						<div class="card info-card sales-card">

							<div class="filter">
								<a class="icon" href="#" data-bs-toggle="dropdown"><i
									class="bi bi-three-dots"></i></a>
								<ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
									<li class="dropdown-header text-start">
										<h6>Lọc</h6>
									</li>

									<li><a id="ngay" class="dropdown-item" href="#">Theo
											Ngày</a></li>
									<li><a id="thang" class="dropdown-item" href="#">Theo
											Tháng</a></li>
									<li><a id="nam" class="dropdown-item" href="#">Theo
											Năm</a></li>
								</ul>
							</div>
							<!-- Count Cart -->
							<div class="card-body">
								<h5 class="card-title">
									Đơn Hàng <span></span>
								</h5>

								<div class="d-flex align-items-center">
									<div
										class="card-icon rounded-circle d-flex align-items-center justify-content-center">
										<i class="bi bi-cart"></i>
									</div>

									<!-- Thống kê hôm nay bán được bao nhiêu đơn tăng bao nhiêu % so với hôm qua -->
									<div class="ps-3">
										<h6>${odercount}</h6>
										<span class="text-success small pt-1 fw-bold"></span> <span
											class="text-muted small pt-2 ps-1"></span>

									</div>
								</div>
							</div>

						</div>
					</div>
					<!-- End Sales Card -->

					<!-- Revenue Card -->
					<div class="col-xxl-4 col-md-6">
						<div class="card info-card revenue-card">
							<!-- Doanh thu theo ngày tháng năm  -->
							<div class="card-body">
								<h5 class="card-title">
									Doanh Thu <span></span>
								</h5>

								<div class="d-flex align-items-center">
									<div
										class="card-icon rounded-circle d-flex align-items-center justify-content-center">
										<i class="bi bi-currency-dollar"></i>
									</div>
									<div class="ps-3">
										<h6>$ ${doanhthu}</h6>
										<span class="text-success small pt-1 fw-bold"></span> <span
											class="text-muted small pt-2 ps-1"></span>

									</div>
								</div>
							</div>

						</div>
					</div>
					<!-- End Revenue Card -->
					<!-- Revenue Card -->

					<!-- Customers Card -->
					<div class="col-xxl-4 col-xl-6">

						<div class="card info-card customers-card">


							<div class="card-body">
								<h5 class="card-title">
									Khách Hàng <span> </span>
								</h5>

								<div class="d-flex align-items-center">
									<div
										class="card-icon rounded-circle d-flex align-items-center justify-content-center">
										<i class="bi bi-people"></i>
									</div>
									<div class="ps-3">
										<h6>${odercount}</h6>
										<span class="text-danger small pt-1 fw-bold"></span> <span
											class="text-muted small pt-2 ps-1"></span>

									</div>
								</div>

							</div>
						</div>

					</div>
					<!-- End Customers Card -->


				</div>


			</div>
			<!-- Right side columns -->
			<div class="col-lg-4">

				<!-- Recent Activity -->
				<div class="card">
					<div class="card-body">
						<h5 class="card-title">
							Hoạt động gần đây <span>| Hôm Nay</span>
						</h5>

						<div class="activity">

							<c:forEach items="${filters}" var="filter" varStatus="STT">

								<div class="activity-item d-flex">
									<div class="activite-label">${filter.timelogin}</div>
									<i
										class='bi bi-circle-fill activity-badge text-success align-self-start'></i>
									<div class="activity-content">
										${filter.user.firstName} ${filter.user.lastName} <a href="#"
											class="fw-bold text-dark"> </a>
									</div>
								</div>

							</c:forEach>
						</div>
					</div>
				</div>
			</div>
	</section>
	<!-- Recent Sales -->
	<div class="col-12">
		<div class="card recent-sales overflow-auto">

			<!--  Sử dụng vòng lặp lấy order -->
			<div class="card-body">
				<h5 class="card-title">
					Đơn Hàng <span></span>
				</h5>

				<table class="table table-borderless datatable">
					<thead>
						<tr>
							<th scope="col">#</th>
							<th scope="col">Khách Hàng</th>
							<th scope="col">Sản Phẩm</th>
							<th scope="col">Giá</th>
							<th scope="col">Trạng Thái</th>
						</tr>
					</thead>
					<tbody>

						<c:forEach items="${listoder}" var="order" varStatus="STT">
							<tr>
								<th scope="row"><a href="#">${STT.index+1}</a></th>
								<td>${order.user.lastName}</td>
								<td><a href="#" class="text-primary">${order.store.name}</a></td>
								<td>${order.price}</td>
								<td><c:if test="${order.status == 1 }">

										<span class="badge bg-success">Đã Thanh Toán</span>

									</c:if> <c:if test="${order.status == 0}">

										<span class="badge bg-warning">Chưa Thanh Toán</span>

									</c:if></td>
							</tr>
						</c:forEach>
						<tr>
							<th scope="row"><a href="#">#2</a></th>
							<td>Bridie Kessler</td>
							<td><a href="#" class="text-primary">Blanditiis dolor
									omnis similique</a></td>
							<td>$47</td>
							<td><span class="badge bg-warning">Pending</span></td>
						</tr>
						<tr>
							<th scope="row"><a href="#">#3</a></th>
							<td>Ashleigh Langosh</td>
							<td><a href="#" class="text-primary">At recusandae
									consectetur</a></td>
							<td>$147</td>
							<td><span class="badge bg-success">Approved</span></td>
						</tr>
						<tr>
							<th scope="row"><a href="#">#4</a></th>
							<td>Angus Grady</td>
							<td><a href="#" class="text-primar">Ut voluptatem id
									earum et</a></td>
							<td>$67</td>
							<td><span class="badge bg-danger">Rejected</span></td>
						</tr>
						<tr>
							<th scope="row"><a href="#">#5</a></th>
							<td>Raheem Lehner</td>
							<td><a href="#" class="text-primary">Sunt similique
									distinctio</a></td>
							<td>$165</td>
							<td><span class="badge bg-success">Approved</span></td>
						</tr>
						<tr>
							<th scope="row"><a href="#">#6</a></th>
							<td>Brandon Jacob</td>
							<td><a href="#" class="text-primary">At praesentium minu</a></td>
							<td>$64</td>
							<td><span class="badge bg-success">Approved</span></td>
						</tr>
						<tr>
							<th scope="row"><a href="#">#7</a></th>
							<td>Bridie Kessler</td>
							<td><a href="#" class="text-primary">Blanditiis dolor
									omnis similique</a></td>
							<td>$47</td>
							<td><span class="badge bg-warning">Pending</span></td>
						</tr>
						<tr>
							<th scope="row"><a href="#">#8</a></th>
							<td>Ashleigh Langosh</td>
							<td><a href="#" class="text-primary">At recusandae
									consectetur</a></td>
							<td>$147</td>
							<td><span class="badge bg-success">Approved</span></td>
						</tr>
						<tr>
							<th scope="row"><a href="#">#9</a></th>
							<td>Angus Grady</td>
							<td><a href="#" class="text-primar">Ut voluptatem id
									earum et</a></td>
							<td>$67</td>
							<td><span class="badge bg-danger">Rejected</span></td>
						</tr>
						<tr>
							<th scope="row"><a href="#">#10</a></th>
							<td>Raheem Lehner</td>
							<td><a href="#" class="text-primary">Sunt similique
									distinctio</a></td>
							<td>$165</td>
							<td><span class="badge bg-success">Approved</span></td>
						</tr>
					</tbody>
				</table>

			</div>

		</div>
	</div>

	<!-- <div class="col-12">
		<div class="card">

			<div class="card-body">
				<h5 class="card-title">
					Báo Cáo <span></span>
				</h5>

				Line Chart
				<div id="reportsChart"></div>

				<script>
                    document.addEventListener("DOMContentLoaded", () => {
                      new ApexCharts(document.querySelector("#reportsChart"), {
                        series: [{
                          name: 'Bán Hàng',
                          data: [31, 40, 28, 51, 42, 82, 56],
                        }, {
                          name: 'Doanh Thu',
                          data: [11, 32, 45, 32, 34, 52, 41]
                        }, {
                          name: 'Khách Hàng',
                          data: [15, 11, 32, 18, 9, 24, 11]
                        }],
                        chart: {
                          height: 350,
                          type: 'area',
                          toolbar: {
                            show: false
                          },
                        },
                        markers: {
                          size: 4
                        },
                        colors: ['#4154f1', '#2eca6a', '#ff771d'],
                        fill: {
                          type: "gradient",
                          gradient: {
                            shadeIntensity: 1,
                            opacityFrom: 0.3,
                            opacityTo: 0.4,
                            stops: [0, 90, 100]
                          }
                        },
                        dataLabels: {
                          enabled: false
                        },
                        stroke: {
                          curve: 'smooth',
                          width: 2
                        },
                        xaxis: {
                          type: 'datetime',
                          categories: ["2018-09-19T00:00:00.000Z", "2018-09-19T01:30:00.000Z", "2018-09-19T02:30:00.000Z", "2018-09-19T03:30:00.000Z", "2018-09-19T04:30:00.000Z", "2018-09-19T05:30:00.000Z", "2018-09-19T06:30:00.000Z"]
                        },
                        tooltip: {
                          x: {
                            format: 'dd/MM/yy HH:mm'
                          },
                        }
                      }).render();
                    });
                  </script>
				End Line Chart

			</div>

		</div>
	</div>
	End Reports -->

	<!-- Top Selling -->
	<div class="col-12">
		<div class="card top-selling overflow-auto">

			<div class="card-body pb-0">
				<h5 class="card-title">
					Top Bán Chạy <span>| Hôm Nay</span>
				</h5>

				<table class="table table-borderless">
					<thead>
						<tr>
							<th scope="col">Preview</th>
							<th scope="col">Product</th>
							<th scope="col">Price</th>
							<th scope="col">Sold</th>
							<th scope="col">Revenue</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${products}" var="product">

							<tr>
								<th scope="row"><a href="#"><img
										src="assets/img/product-1.jpg" alt=""></a>${product.id }</th>

								<td><a href="#" class="text-primary fw-bold">${product.name}
								</a></td>

								<td>${product.price}</td>

								<td class="fw-bold">${product.sold}</td>

								<td>${product.price * product.sold}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>

			</div>

		</div>
	</div>
	<!-- End Top Selling -->

	<div class="card-body">
		<h5 class="card-title">Doanh Thu Theo Tháng</h5>

		<!-- Bar Chart -->
		<div id="barChart" style="min-height: 400px;" class="echart"></div>

		<script>
                document.addEventListener("DOMContentLoaded", () => {
                  echarts.init(document.querySelector("#barChart")).setOption({
                    xAxis: {
                      type: 'category',
                      data: ['Tháng 1', 'Tháng 2', 'Tháng 3', 'Tháng 4', 'Tháng 5', 'Tháng 6', 'Tháng 7', 'Thháng 8', 'Thháng 9', 'Thháng 10', 'Thháng 11', 'Thháng 12']
                    },
                    yAxis: {
                      type: 'value'
                    },
                    series: [{
                      data: [${doanhthu1}, ${doanhthu2}, ${doanhthu3}, ${doanhthu4}, ${doanhthu5}, ${doanhthu6}, ${doanhthu7}, ${doanhthu8}, ${doanhthu9}, ${doanhthu10}, ${doanhthu11}, ${doanhthu12}],
                      type: 'bar'
                    }]
                  });
                });
              </script>
		<!-- End Bar Chart -->
	</div>
</main>
<!-- End #main -->