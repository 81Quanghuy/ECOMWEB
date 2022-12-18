<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/common/taglib.jsp"%>



<section id="main" class="row">

	<div class="col mt-4">
		<form action=<c:url value = "/admin/store/saveOrUpdate"/>
			method="POST" enctype="multipart/form-data">
			<div class="card">
				<div class="card-header">
					<h2>${store.isEdit ? 'Chính Sửa Cửa Hàng' : 'Cửa Hàng Mới'}</h2>
				</div>

			</div>
			<div class="card-body">

				<c:if test="${error != null}">
					<p class="text-danger">${error}</p>
				</c:if>
				<c:if test="${message != null}">
					<p class="text-warning">${message}</p>
				</c:if>

				<div class="mb-3">
					<label for="id" class="form-lablel">Store ID:</label> <input
						type="hidden" value="${store.isEdit}"> <input type="text"
						class="form-control" readonly="readonly" name="id"
						value="${store.id}" id="id" aria-describedby="id"
						placeholder="Store Id" />
				</div>

				<div class="mb-3">
					<label for="storename" class="form-lablel">Store Name:</label> <input
						type="text" value="${store.name}" id="name" name="name"
						aria-describedby="name" placeholder="store Name">
				</div>

				<div class="mb-3">
					<label for="bio" class="form-lablel">bio :</label> <input
						type="text" value="${store.bio}" id="bio" name="bio">

				</div>

				<div class="mb-3">
					<input type="text" class="form-control" id="avatar" name="avatar"
						value="${store.avatar}" hidden="true">
				</div>

				<div class="mb-3">
					<label for="avatarFile" class="form-label">Avatar</label> <input
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
					<label for="avatarFile" class="form-label"> Featured image</label>
					<input type="file" class="form-control" id="avatarFile"
						aria-describedby="avatarFile" name="featuredimagesFile"
						value="${store.featuredimagesFile}">
				</div>

				<div class="mb-3">
					<label for="ownerId" class="form-lablel"> Chủ Sở Hữu:</label> <br>


					<select class="form-select" name="ownerid" aria-label="storeid">
						<c:forEach items="${users}" var="item">
							<option value="${item.id}"
								selected="${item.id == store.ownerid? 'selected':'' }">${item.firstName}
								${item.lastName }</option>
						</c:forEach>

					</select>

					<%-- 			 <input type="text" class="form-control" id="avatarFile"
						　aria-describedby="ownerid" name="ownerid"
						value="${store.ownerid}"> --%>
				</div>

				<div class="mb-3">
					<label for="active" class="form-lablel">active:</label> <select
						class="form-select" name="status" aria-describedby="active"
						id="active">

						<option ${store.isactive == true ? 'selected':'' } value="true">Còn</option>
						<option ${store.isactive  == false ? 'selected':'' } value="false">Hết</option>
					</select>

				</div>
			</div>


			<div class="card-footer text-muted">
				<a href=<c:url value="/admin/store/addOrEdit"/>
					class="btn btn-secondary"><i class="fas fa-new"></i>New</a> <a
					href=<c:url value="/admin/store"/> class="btn btn-success"><i
					class="fas bars"></i>List Store</a>


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
		</form>


	</div>

</section>
