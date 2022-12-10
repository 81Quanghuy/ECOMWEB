<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/common/taglib.jsp"%>



<section id="main" class="row">

	<div class="col mt-4">

		<div class="card">

			<div class="card-header">Đánh Giá Sản Phẩm</div>

			<div class="card-body">

				<!-- Hiển thông báo -->

				<c:if test="${message != null}">

					<div class="alert alert-primary" role="alert">

						<i>${message}</i>

					</div>

				</c:if>

				<!-- Hêt thông báo -->

				<table class="table table-striped table-responsive">

					<thead class="thead-inverse">

						<tr>

							<th>Người Dùng</th>
							<th>Tên Sản Phẩm</th>
							<th>Nội Dung</th>
							<th>Đánh Giá</th>
							<th>Thời Gian</th>
							<th>Action</th>
						</tr>

					</thead>

					<tbody>

						<c:forEach items="${reviews}" var="review">

							<tr>

								<td>${review.user.lastName}</td>
								<td>${review.product.name}</td>
								<td>${review.content}</td>
								<td>${review.rating} / 5</td>
								<td>${review.createat}</td>

								<td><a href="/user/reviews/view/${review.id}"
									class="btn btn-outline-info"><i class="fa fa-info"></i></a> <a
									href="/user/reviews/edit/${review.id}"
									class="btn btn-outline-warning"><i class="fa fa-edit"></i></a>

									<a data-id="${review.id}" data-name="${review.content}"
									onclick="showconfirmation(this.getAttribute('data-id'),this.getAttribute('data-name'))"
									class="btn btn-outline-danger"><i class="fa fa-trash"></i></a></td>

							</tr>

						</c:forEach>

					</tbody>



				</table>

				<script type="text/javascript">
					function showconfirmation(id, name) {
						$('#content').text(name);
						$('#yesOption').attr('href',
								'/user/reviews/delete/' + id);
						$('#confirmationId').modal('show');
					}
				</script>

				<!-- Modal -->
				<div class="modal fade" tabindex="-1" id="confirmationId"
					aria-labelledby="confirmationlabel" aria-hidden="true">
					<div class="modal-dialog" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="confirmationLabel">Confirmation</h5>
								<button type="button" class="btn-close" data-bs-dismiss="modal"
									aria-label="Close"></button>
							</div>
							<div class="modal-body">
								Bạn có muốn xóa "<span id="title"></span>"?
							</div>
							<div class="modal-footer">
								<a id="yesOption" class="btn btn-primary">Yes</a>
								<button type="button" class="btn btn-secondary"
									data-bs-dismiss="modal">Close</button>
							</div>
						</div>
					</div>
				</div>
				<!-- Modal -->

			</div>

		</div>

	</div>

</section>
