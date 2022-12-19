<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/common/taglib.jsp"%>


<section class="row">


	<div class="col mt-4">
		<form action=<c:url value = "/store/register"/> method="POST"
			enctype="multipart/form-data">
			<div class="card-body"
				style="margin-top: 50px; display: flex; justify-content: center; align-items: center; flex-direction: column;">
				<span>${message }</span>
				<div class="mb-3">
					<input type="hidden" value="${store.isEdit}"> <input
						type="text" class="form-control" readonly="readonly" name="id"
						value="${store.id}" id="id" aria-describedby="id" hidden="true" />
				</div>

				<div class="mb-3">
					<label for="storename" class="form-lablel">Tên cửa hàng:</label> <input
						type="text" value="${store.name}" id="name" name="name"
						aria-describedby="name" placeholder="Store Name"
						style="padding: 8px; border-radius: 5px; width: 300px;">
				</div>
				<div class="mb-3">
					<label for="storename" class="form-lablel">Giới thiệu về
						cửa hàng:</label> <input type="text" value="${store.about}" id="name"
						name="about" aria-describedby="about" placeholder="About"
						style="padding: 8px; border-radius: 5px; width: 300px;">
				</div>

				<div class="mb-3">
					<label for="bio" class="form-lablel">Mô tả :</label> <input
						type="text" value="${store.bio}" id="bio" name="bio"
						placeholder="Bio"
						style="padding: 8px; border-radius: 5px; width: 300px;">

				</div>

				<div class="mb-3">
					<input type="text" class="form-control" id="avatar" name="avatar"
						value="${store.avatar}" hidden="true">
				</div>

				<div class="mb-3">
					<label for="avatarFile" class="form-label">Ảnh đại diện</label> <input
						type="file" class="form-control" id="avatarFile"
						aria-describedby="avatarFile" name="avatarFile"
						value="${store.avatarFile}">
				</div>


				<div class="mb-3">
					<input type="text" class="form-control" id="featuredimages"
						name="featuredimages" value="${store.featuredimages}"
						hidden="true">
				</div>
				<div class="mb-3">
					<label for="avatarFile" class="form-label"> Ảnh bìa </label> <input
						type="file" class="form-control" id="avatarFile"
						aria-describedby="avatarFile" name="featuredimagesFile"
						value="${store.featuredimagesFile}">
				</div>

				<div class="mb-3">
					<input class="form-select" name="status" value="true" hidden="true">
				</div>


				<div class="card-footer text-muted">

					<button class="btn btn-primary" type="submit">
						<i class="fas fa-save"></i>
						<c:if test="${store.isEdit}">
							<span>Update</span>
						</c:if>

						<c:if test="${!store.isEdit}">
							<span>Save</span>
						</c:if>

					</button>
				</div>
			</div>
		</form>


	</div>


</section>
