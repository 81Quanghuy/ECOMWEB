<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>

<main id="main" class="main">

	<div class="pagetitle">
		<h1>Dashboard</h1>
		<nav>
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="index.html">Trang Chủ</a></li>
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

									<li><a class="dropdown-item" href="#">Theo Ngày</a></li>
									<li><a class="dropdown-item" href="#">Theo Tháng</a></li>
									<li><a class="dropdown-item" href="#">Theo Năm</a></li>
								</ul>
							</div>
							<!-- Count Cart -->
							<div class="card-body">
								<h5 class="card-title">
									Đơn Hàng <span>| Theo Ngày</span>
								</h5>

								<div class="d-flex align-items-center">
									<div
										class="card-icon rounded-circle d-flex align-items-center justify-content-center">
										<i class="bi bi-cart"></i>
									</div>

									<!-- Thống kê hôm nay bán được bao nhiêu đơn tăng bao nhiêu % so với hôm qua -->
									<div class="ps-3">
										<h6>${odercount}</h6>
										<span class="text-success small pt-1 fw-bold">12%</span> <span
											class="text-muted small pt-2 ps-1">increase</span>

									</div>
								</div>
							</div>

						</div>
					</div>
					<!-- End Sales Card -->

					<!-- Revenue Card -->
					<div class="col-xxl-4 col-md-6">
						<div class="card info-card revenue-card">

							<div class="filter">
								<a class="icon" href="#" data-bs-toggle="dropdown"><i
									class="bi bi-three-dots"></i></a>
								<ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
									<li class="dropdown-header text-start">
										<h6>Lọc theo</h6>
									</li>

									<li><a class="dropdown-item" href="#">Theo Ngày</a></li>
									<li><a class="dropdown-item" href="#">Theo Tháng</a></li>
									<li><a class="dropdown-item" href="#">Theo Năm</a></li>
								</ul>
							</div>
							<!-- Doanh thu theo ngày tháng năm  -->
							<div class="card-body">
								<h5 class="card-title">
									Doanh Thu <span>| Theo Tháng</span>
								</h5>

								<div class="d-flex align-items-center">
									<div
										class="card-icon rounded-circle d-flex align-items-center justify-content-center">
										<i class="bi bi-currency-dollar"></i>
									</div>
									<div class="ps-3">
										<h6>VND ${doanhthu}</h6>
										<span class="text-success small pt-1 fw-bold">8%</span> <span
											class="text-muted small pt-2 ps-1">increase</span>

									</div>
								</div>
							</div>

						</div>
					</div>
					<!-- End Revenue Card -->

					<!-- Customers Card -->
					<div class="col-xxl-4 col-xl-12">

						<div class="card info-card customers-card">

							<div class="filter">
								<a class="icon" href="#" data-bs-toggle="dropdown"><i
									class="bi bi-three-dots"></i></a>
								<ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
									<li class="dropdown-header text-start">
										<h6>Lọc Theo</h6>
									</li>

									<li><a class="dropdown-item" href="#">Ngày</a></li>
									<li><a class="dropdown-item" href="#">Tháng</a></li>
									<li><a class="dropdown-item" href="#">Năm</a></li>
								</ul>
							</div>

							<div class="card-body">
								<h5 class="card-title">
									Khách Hàng <span>| Năm </span>
								</h5>

								<div class="d-flex align-items-center">
									<div
										class="card-icon rounded-circle d-flex align-items-center justify-content-center">
										<i class="bi bi-people"></i>
									</div>
									<div class="ps-3">
										<h6>${countuser}</h6>
										<span class="text-danger small pt-1 fw-bold">12%</span> <span
											class="text-muted small pt-2 ps-1">decrease</span>

									</div>
								</div>

							</div>
						</div>

					</div>
					<!-- End Customers Card -->

					<!-- Recent Sales -->
					<div class="col-12">
						<div class="card recent-sales overflow-auto">

							<div class="filter">
								<a class="icon" href="#" data-bs-toggle="dropdown"><i
									class="bi bi-three-dots"></i></a>
								<ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
									<li class="dropdown-header text-start">
										<h6>Lọc Theo</h6>
									</li>

									<li><a class="dropdown-item" href="#">Hôm Nay</a></li>
									<li><a class="dropdown-item" href="#">Theo Tháng</a></li>
									<li><a class="dropdown-item" href="#">Theo Năm</a></li>
								</ul>
							</div>

							<!--  Sử dụng vòng lặp lấy order -->
							<div class="card-body">
								<h5 class="card-title">
									Đơn Hàng <span>| Hôm Nay</span>
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
											<th scope="row"><a href="#">#1</a></th>
											<td>Brandon Jacob</td>
											<td><a href="#" class="text-primary"> minu</a></td>
											<td>$64</td>
											<td><span class="badge bg-success">Approved</span></td>
										</tr>
										<tr>
											<th scope="row"><a href="#">#2</a></th>
											<td>Bridie Kessler</td>
											<td><a href="#" class="text-primary">Blanditiis
													dolor omnis similique</a></td>
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
											<td><a href="#" class="text-primary">At praesentium
													minu</a></td>
											<td>$64</td>
											<td><span class="badge bg-success">Approved</span></td>
										</tr>
										<tr>
											<th scope="row"><a href="#">#7</a></th>
											<td>Bridie Kessler</td>
											<td><a href="#" class="text-primary">Blanditiis
													dolor omnis similique</a></td>
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
					<!-- End Recent Sales -->

					<!-- Top Selling -->
					<div class="col-12">
						<div class="card top-selling overflow-auto">

							<div class="filter">
								<a class="icon" href="#" data-bs-toggle="dropdown"><i
									class="bi bi-three-dots"></i></a>
								<ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
									<li class="dropdown-header text-start">
										<h6>Lọc Theo</h6>
									</li>

									<li><a class="dropdown-item" href="#">Hôm Nay</a></li>
									<li><a class="dropdown-item" href="#">Theo Ngày</a></li>
									<li><a class="dropdown-item" href="#">Theo Tháng</a></li>
								</ul>
							</div>

							<div class="card-body pb-0">
								<h5 class="card-title">
									Sản Phẩm Mới Nhất <span>| Hôm Nay</span>
								</h5>

								<table class="table table-borderless">
									<thead>
										<tr>
											<th scope="col">Preview</th>
											<th scope="col">Product</th>
											<th scope="col">Price</th>
											<th scope="col">Sold</th>
											<th scope="col">Rating</th>
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

												<td>${product.rating }</td>
											</tr>
											<!-- <tr>
											<th scope="row"><a href="#"><img
													src="assets/img/product-2.jpg" alt=""></a></th>
											<td><a href="#" class="text-primary fw-bold">Exercitationem
													similique doloremque</a></td>
											<td>$46</td>
											<td class="fw-bold">98</td>
											<td>$4,508</td>
										</tr>
										<tr>
											<th scope="row"><a href="#"><img
													src="assets/img/product-3.jpg" alt=""></a></th>
											<td><a href="#" class="text-primary fw-bold">Doloribus
													nisi exercitationem</a></td>
											<td>$59</td>
											<td class="fw-bold">74</td>
											<td>$4,366</td>
										</tr>
										<tr>
											<th scope="row"><a href="#"><img
													src="assets/img/product-4.jpg" alt=""></a></th>
											<td><a href="#" class="text-primary fw-bold">Officiis
													quaerat sint rerum error</a></td>
											<td>$32</td>
											<td class="fw-bold">63</td>
											<td>$2,016</td>
										</tr>
										<tr>
											<th scope="row"><a href="#"><img
													src="assets/img/product-5.jpg" alt=""></a></th>
											<td><a href="#" class="text-primary fw-bold">Sit
													unde debitis delectus repellendus</a></td>
											<td>$79</td>
											<td class="fw-bold">41</td>
											<td>$3,239</td>
										</tr> -->
										</c:forEach>
									</tbody>
								</table>

							</div>

						</div>
					</div>
					<!-- End Top Selling -->
					<!-- 
					Reports
					<div class="col-12">
						<div class="card">

							<div class="filter">
								<a class="icon" href="#" data-bs-toggle="dropdown"><i
									class="bi bi-three-dots"></i></a>
								<ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
									<li class="dropdown-header text-start">
										<h6>Lọc Theo</h6>
									</li>

									<li><a class="dropdown-item" href="#">Ngày</a></li>
									<li><a class="dropdown-item" href="#">Tháng</a></li>
									<li><a class="dropdown-item" href="#">Năm</a></li>
								</ul>
							</div>

							<div class="card-body">
								<h5 class="card-title">
									Báo Cáo <span>/Hôm Nay</span>
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
					</div> -->
					<!-- End Reports -->


				</div>
			</div>


			<!-- End Left side columns -->




			<!-- Right side columns -->
			<div class="col-lg-4">

				<!-- Recent Activity -->
				<div class="card">
					<div class="filter">
						<a class="icon" href="#" data-bs-toggle="dropdown"><i
							class="bi bi-three-dots"></i></a>
						<ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
							<li class="dropdown-header text-start">
								<h6>Filter</h6>
							</li>

							<li><a class="dropdown-item" href="#">Today</a></li>
							<li><a class="dropdown-item" href="#">This Month</a></li>
							<li><a class="dropdown-item" href="#">This Year</a></li>
						</ul>
					</div>

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


							<!-- End activity item-->
							<!-- 
							<div class="activity-item d-flex">
								<div class="activite-label">56 min</div>
								<i
									class='bi bi-circle-fill activity-badge text-danger align-self-start'></i>
								<div class="activity-content">Voluptatem blanditiis
									blanditiis eveniet</div>
							</div>
							End activity item

							<div class="activity-item d-flex">
								<div class="activite-label">2 hrs</div>
								<i
									class='bi bi-circle-fill activity-badge text-primary align-self-start'></i>
								<div class="activity-content">Voluptates corrupti
									molestias voluptatem</div>
							</div>
							End activity item

							<div class="activity-item d-flex">
								<div class="activite-label">1 day</div>
								<i
									class='bi bi-circle-fill activity-badge text-info align-self-start'></i>
								<div class="activity-content">
									Tempore autem saepe <a href="#" class="fw-bold text-dark">occaecati
										voluptatem</a> tempore
								</div>
							</div>
							End activity item

							<div class="activity-item d-flex">
								<div class="activite-label">2 days</div>
								<i
									class='bi bi-circle-fill activity-badge text-warning align-self-start'></i>
								<div class="activity-content">Est sit eum reiciendis
									exercitationem</div>
							</div>
							End activity item

							<div class="activity-item d-flex">
								<div class="activite-label">4 weeks</div>
								<i
									class='bi bi-circle-fill activity-badge text-muted align-self-start'></i>
								<div class="activity-content">Dicta dolorem harum nulla
									eius. Ut quidem quidem sit quas</div>
							</div>
							End activity item
 -->
						</div>

					</div>
				</div>
				<!-- End Recent Activity -->

				<!-- Budget Report -->
				<div class="card">
					<div class="filter">
						<a class="icon" href="#" data-bs-toggle="dropdown"><i
							class="bi bi-three-dots"></i></a>
						<ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
							<li class="dropdown-header text-start">
								<h6>Lọc Theo</h6>
							</li>

							<li><a class="dropdown-item" href="#">Hôm nay</a></li>
							<li><a class="dropdown-item" href="#">Tháng</a></li>
							<li><a class="dropdown-item" href="#">Năm</a></li>
						</ul>
					</div>

					<!-- 			<div class="card-body pb-0">
						<h5 class="card-title">
							Ngân Sách <span>| Theo Tháng</span>
						</h5>

						<div id="budgetChart" style="min-height: 400px;" class="echart"></div>

						<script>
                document.addEventListener("DOMContentLoaded", () => {
                  var budgetChart = echarts.init(document.querySelector("#budgetChart")).setOption({
                    legend: {
                      data: ['Ngân Sách', 'Chi Tiêu']
                    },
                    radar: {
                      // shape: 'circle',
                      indicator: [{
                          name: 'Sales',
                          max: 6500
                        },
                        {
                          name: 'Administration',
                          max: 16000
                        },
                        {
                          name: 'Information Technology',
                          max: 30000
                        },
                        {
                          name: 'Customer Support',
                          max: 38000
                        },
                        {
                          name: 'Development',
                          max: 52000
                        },
                        {
                          name: 'Marketing',
                          max: 25000
                        }
                      ]
                    },
                    series: [{
                      name: 'Budget vs spending',
                      type: 'radar',
                      data: [{
                          value: [4200, 3000, 20000, 35000, 50000, 18000],
                          name: 'Ngân Sách'
                        },
                        {
                          value: [5000, 14000, 28000, 26000, 42000, 21000],
                          name: 'Chi Tiêu'
                        }
                      ]
                    }]
                  });
                });
              </script>

					</div>
				</div>
				End Budget Report
 -->
					<!-- Website Traffic -->
					<div class="card">
						<div class="filter">
							<a class="icon" href="#" data-bs-toggle="dropdown"><i
								class="bi bi-three-dots"></i></a>
							<ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
								<li class="dropdown-header text-start">
									<h6>Lọc Theo</h6>
								</li>

								<li><a class="dropdown-item" href="#">Hôm Nay</a></li>
								<li><a class="dropdown-item" href="#">Theo Tháng</a></li>
								<li><a class="dropdown-item" href="#">Theo Năm</a></li>
							</ul>
						</div>

						<div class="card-body pb-0">
							<h5 class="card-title">
								Lượt truy cập <span>| Hôm nay</span>
							</h5>

							<div id="trafficChart" style="min-height: 400px;" class="echart"></div>

							<script>
                document.addEventListener("DOMContentLoaded", () => {
                  echarts.init(document.querySelector("#trafficChart")).setOption({
                    tooltip: {
                      trigger: 'item'
                    },
                    legend: {
                      top: '5%',
                      left: 'center'
                    },
                    series: [{
                      name: 'Access From',
                      type: 'pie',
                      radius: ['40%', '70%'],
                      avoidLabelOverlap: false,
                      label: {
                        show: false,
                        position: 'center'
                      },
                      emphasis: {
                        label: {
                          show: true,
                          fontSize: '18',
                          fontWeight: 'bold'
                        }
                      },
                      labelLine: {
                        show: false
                      },
                      data: [{
                          value: ${countadmin},
                          name: 'admin'
                        },
                        {
                          value: ${countseller},
                          name: 'Seller'
                        },
                        {
                          value: ${countuser},
                          name: 'User'
                        }
                      ]
                    }]
                  });
                });
              </script>

						</div>
					</div>
					<!-- End Website Traffic -->

					<!-- News & Updates Traffic -->
					<div class="card">
						<div class="filter">
							<a class="icon" href="#" data-bs-toggle="dropdown"><i
								class="bi bi-three-dots"></i></a>
							<ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
								<li class="dropdown-header text-start">
									<h6>Filter</h6>
								</li>

								<li><a class="dropdown-item" href="#">Today</a></li>
								<li><a class="dropdown-item" href="#">This Month</a></li>
								<li><a class="dropdown-item" href="#">This Year</a></li>
							</ul>
						</div>

						<div class="card-body pb-0">
							<h5 class="card-title">
								Báo Cáo <span>| Today</span>
							</h5>
							<!-- Pie Chart -->
							<div id="pieChart"></div>

							<script>
                document.addEventListener("DOMContentLoaded", () => {
                  new ApexCharts(document.querySelector("#pieChart"), {
                    series: [44, 55, 13],
                    chart: {
                      height: 350,
                      type: 'pie',
                      toolbar: {
                        show: true
                      }
                    },
                    labels: ['Team A', 'Team B', 'Team C']
                  }).render();
                });
              </script>
							<!-- End Pie Chart -->

							<!-- 	<div class="news">
							<div class="post-item clearfix">
								<img src="assets/img/news-1.jpg" alt="">
								<h4>
									<a href="#">Nihil blanditiis at in nihil autem</a>
								</h4>
								<p>Sit recusandae non aspernatur laboriosam. Quia enim
									eligendi sed ut harum...</p>
							</div>

							<div class="post-item clearfix">
								<img src="assets/img/news-2.jpg" alt="">
								<h4>
									<a href="#">Quidem autem et impedit</a>
								</h4>
								<p>Illo nemo neque maiores vitae officiis ...</p>
							</div>

						</div> -->
							<!-- End sidebar recent posts-->

						</div>
					</div>
					<!-- End News & Updates -->

				</div>
				<!-- End Right side columns -->

			</div>
	</section>

</main>
<!-- End #main -->