<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/common/taglib.jsp"%>

<!-- <!doctype html>
<html lang="en">
<head>
Required meta tags
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

Bootstrap CSS
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">

<title>Hello, world!</title>
</head>
<body> -->

<section id="main" class="row">

	<div class="col mt-4">
		<form action=<c:url value = "/seller/categories/saveOrUpdate"/>
			method=POST>
			<div class="card">
				<div class="card-header">
					<h2>${category.isEdit ? 'Edit Category' : 'Add New Category'}</h2>
				</div>

			</div>
			<div class="card-body">
				<div class="form-group">
					<label for="images">Images:</label> <input type="file"
						class="form-control" name="imageFile" id="imageFile" />
				</div>


				<div class="mb-3">
					<input type="text" class="form-control" name="image" id="image"
						value="${category.image}" />
				</div>


				<div class="mb-3">


					<label for="categoryId" class="form-lablel">Mã Loại Sản
						Phẩm:</label> <input type="hidden" value="${category.isEdit}"> <input
						type="text" class="form-control" readonly="readonly" name="id"
						value="${category.id}" id="id" aria-describedby="id"
						placeholder="Id" />
				</div>

				<div class="mb-3">
					<label for="categoryname" class="form-lablel"> Tên Loại Sản
						Phẩm:</label> <input type="text" value="${category.name}" id="name"
						name="name" aria-describedby="nane" placeholder="Name">
				</div>

				<div class="mb-3">
					<label for="createat" class="form-lablel">Ngày Tạo :</label> <input
						type=date value="${category.createat}" id="createat"
						name="createat" readonly="readonly">

				</div>
				<div class="mb-3">
					<label for="updateat" class="form-lablel">Ngày Cập Nhật :</label> <input
						type="date" value="${category.updateat}" id="updateat"
						readonly="readonly" name="updateat">

				</div>

				<div class="mb-3">
					<label for="Satus" class="form-lablel">Status:</label> <select
						class="form-select" name="isdeleted"
						aria-describedby="categorycodeid" id="isdeleted">

						<option ${category.isdeleted == true ? 'selected':'' }
							value="true">Active</option>
						<option ${category.isdeleted == false ? 'selected':'' }
							value="false">Not Active</option>
					</select>

				</div>

				<div class="card-footer text-muted">
					<a href=<c:url value="/seller/categories/add"/>
						class="btn btn-secondary"><i class="fas fa-new"></i>New</a> <a
						href=<c:url value="/seller/categories"/> class="btn btn-success"><i
						class="fas bars"></i>List Category</a>
					<button class="btn btn-primary" type="submit">
						<i class="fas fa-save"></i>
						<c:if test="${category.isEdit }">
							<span>Update</span>
						</c:if>

						<c:if test="${!category.isEdit }">
							<span>Save</span>
						</c:if>

					</button>
				</div>
			</div>
		</form>

	</div>

</section>

<!-- 

</body>
</html> -->