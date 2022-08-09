<%@ page import="bloggy.helper.Message" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
User user = (User) session.getAttribute("user");
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor"
	crossorigin="anonymous">
<title>PROFILE | <c:out
		value="${user.getUsername().toUpperCase()}"></c:out></title>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<style>
body {
	background-image: url("/resources/image/profile.jpg");
	background-attachment: fixed;
	background-repeat: no-repeat;
	background-size: cover;
}
</style>

	<script>
	function readContent(id)
	{
		swal($("#eachPostBlogBody"+id).text(),{
			  button: "Cose",
			});
	}
	
	function demo(){
		alert("boka");
	}
	
	function setEditFormContent(postid)
	{/* 
		$("#editBlogForm").attr("action","/blog/edit/"+postid);
		$("#editPostId").val(postid);
		$("#editTitle").val(posttitle);
		$("#editBody").val(postbody); */
		
		$("#editBlogForm").attr("action","/blog/edit/"+postid);
		$("#editPostId").val(postid);
		$("#editTitle").val($("#eachPostTitle"+postid).text());
		$("#editBody").val($("#eachPostBlogBody"+postid).text());
	}
	
	function checkExtension()
	{
		//alert($("#formFileSm").val().endsWith(".jpg"));
		if($("#formFileSm").val().endsWith(".jpg") || $("#formFileSm").val().endsWith(".jpeg") || $("#formFileSm").val().endsWith(".png"))
		{
				$("#addPostButton").attr("disabled",false);
		}else{
			$("#addPostButton").attr("disabled",true);
		}
	}
	</script>

</head>
<body>
	<%@include file="navbar.jsp"%>

	<div class="container-fluid  m-0 p-0">
		<%-- User Details Modal start --%>
		<!-- Modal -->
		<div class="modal fade" id="exampleModal" tabindex="-1"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">User Details</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">

						<form action="/profile/${user.getUsername()}/edit" method="post">
							<div class="row mb-3">
								<label for="inputName3" class="col-sm-2 col-form-label">Name</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="inputName3"
										value="${user.getName()}" name="name">
								</div>
							</div>
							<div class="row mb-3">
								<label for="inputUsername3" class="col-sm-2 col-form-label">Username</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="inputUsername3"
										value="${user.getUsername()}" disabled>
								</div>
							</div>

							<div class="row mb-3">
								<label for="inputEmail3" class="col-sm-2 col-form-label">Email</label>
								<div class="col-sm-10">
									<input type="email" class="form-control" id="inputEmail3"
										value="${user.getEmail()}" disabled>
								</div>
							</div>

							<div class="row mb-3">
								<label for="inputPassword3" class="col-sm-2 col-form-label">Password</label>
								<div class="col-sm-10">
									<input type="password" class="form-control" id="inputPassword3"
										value="${user.getPassword()}" name="password">
								</div>
							</div>



							<button type="submit" class="btn btn-primary btn-sm">Update</button>
						</form>

					</div>
				</div>
			</div>
		</div>

		<%-- User Details Modal End--%>

		<div class="row" style="margin-left: 0px; margin-right: 0px;">
			<div class="col-md-4">
				<div
					style="padding: 20px; margin-top: 20px; background: rgba(255, 255, 255, 0.8); border-radius: 20px">
					<%
					Message msg = (Message) session.getAttribute("msg");
					%>
					<c:if test="${msg!=null}">
						<div
							class="alert ${msg.getMsgClass()} text-center alert-dismissible fade show"
							role="alert">
							${msg.getMsg()}
							<button type="button" class="btn-close" data-bs-dismiss="alert"
								aria-label="Close"></button>
						</div>
						<%
						session.removeAttribute("msg");
						%>
					</c:if>
					<div class="text-center">
						<h4>ADD POST</h4>
					</div>
					<form action="/blog/add" method="post"
						enctype="multipart/form-data">
						<div class="mb-3">
							<label for="title" class="form-label">Post Title</label> <input
								type="text" class="form-control" id="title" name="title"
								aria-describedby="emailHelp" required>
						</div>
						<div class="mb-3">
							<label for="body" class="form-label">Post Body</label>
							<textarea id="body" name="body" class="form-control" rows=""
								cols="" required></textarea>
						</div>
						<div class="mb-3">
							<label for="formFileSm" class="form-label">Select Image</label> <input
								class="form-control form-control-sm" id="formFileSm" type="file"
								name="image" required onchange="checkExtension()">
						</div>
						<button id="addPostButton" type="submit" class="btn btn-primary" disabled>Post</button>
					</form>
				</div>
			</div>

			<!-- Modal for editing post start -->
			<!-- Modal -->
			<div class="modal fade" id="EditBlogPostModal" tabindex="-1"
				aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLabel">Edit Post</h5>
							<button type="button" class="btn-close" data-bs-dismiss="modal"
								aria-label="Close"></button>
						</div>
						<div class="modal-body">
							<form id="editBlogForm" method="post">
								<div class="row mb-3" hidden>
									<label for="editPostId" class="col-sm-2 col-form-label">Post
										ID</label>
									<div class="col-sm-10">
										<input type="text" class="form-control" id="editPostId"
											value="" name="editPostId">
									</div>
								</div>
								<div class="row mb-3">
									<label for="title" class="col-sm-2 col-form-label">Title</label>
									<div class="col-sm-10">
										<input type="text" class="form-control" id="editTitle"
											value="" name="editTitle" required>
									</div>
								</div>

								<div class="row mb-3">
									<label for="body" class="col-sm-2 col-form-label">Body</label>
									<div class="col-sm-10">
										<textarea class="form-control" id="editBody" name="editBody"
											rows="15" required></textarea>
									</div>
								</div>
								<button type="submit" class="btn btn-primary btn-sm">Update</button>
							</form>
						</div>
					</div>
				</div>
			</div>


			<!-- Modal for editing post end -->

			<div class="col-md-8">
				<div class="row">
					<div style="width: 60%; margin-left: auto; margin-right: auto;">
						<%
						Message postmsg = (Message) session.getAttribute("postmsg");
						%>
						<c:if test="${postmsg!=null}">
							<div
								class="alert ${postmsg.getMsgClass()} text-center alert-dismissible fade show"
								role="alert">
								${postmsg.getMsg()}
								<button type="button" class="btn-close" data-bs-dismiss="alert"
									aria-label="Close"></button>
							</div>
							<%
							session.removeAttribute("postmsg");
							%>
						</c:if>
					</div>
					<c:forEach var="blog" items="${blogs }">
						<div class="col-md-6">
							<div class="m-3">
								<div class="card" style="width: 20rem;">
									<img src="/resources/image/uploads/${blog.getImage()}"
										class="card-img-top" alt="..." height="230px;">
									<div class="card-body">
										<h5 class="card-title" id="eachPostTitle${blog.getId()}">${blog.getTitle()}</h5>

										<c:choose>
											<c:when test="${blog.getBody().length()>100 }">
												<p class="card-text">${blog.getBody().substring(0,100) }...</p>
												<p class="card-text" id="eachPostBlogBody${blog.getId()}" hidden>${blog.getBody()}</p>
												<button class="btn btn-sm btn-primary"
													onclick="readContent(${blog.getId()})"
													id="readLink${blog.getId()}">Read Full Post</button>
											</c:when>
											<c:otherwise>
												<p class="card-text" id="eachPostBlogBody${blog.getId()}">${blog.getBody()}</p>
												<br>
												<br>
												<br>
											</c:otherwise>
										</c:choose>
										<button class="btn btn-outline-success btn-sm"
											data-bs-toggle="modal" data-bs-target="#EditBlogPostModal"
											onclick="setEditFormContent(${blog.getId()})">Edit</button>

										<a href="/blog/delete/${blog.getId()}"
											class="btn btn-outline-danger btn-sm">Delete</a>

									</div>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>

			</div>
		</div>
	</div>


	<!-- JavaScript Bundle with Popper -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
		crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"
		integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
		crossorigin="anonymous"></script>
</body>
</html>
