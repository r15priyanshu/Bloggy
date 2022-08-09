<%@ page import="bloggy.helper.Message" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
<title>BLOGGY</title>
</head>
<style>
body {
	background-image: url("/resources/image/home.jpg");
	background-attachment: fixed;
	background-repeat: no-repeat;
	background-size: cover;
}
</style>
<body>
	<%@include file="navbar.jsp"%>
	<div class="container-fluid m-0 p-0">
		<div class="container mt-4 p-5 text-light rounded">
			<h1>Welcome to Bloggy !!</h1>
			<p>Bloggy is a platform which prides itself on being an open
				source framework used for tech blogging. They strive to be one of
				the best blogging platforms for developers.</p>
			<p>Technical Blogging mainly serves three audiences:
			<ul>
				<li>Bloggers interested in making money online by sharing their
					expertise.</li>
				<li>Techies interested in advancing their career and increasing
					their influence.</li>
				<li>Entrepreneurs who intend to use blogging as an internet
					marketing tool for their startup/business.</li>
			</ul>
			</p>
			<p>
				<a href="/login" class="btn btn-outline-secondary btn-sm">Login</a>
				<a href="/register" class="btn btn-outline-primary btn-sm">Get
					Started !!</a>
			</p>
		</div>


		<div class="container-fluid">
			<c:choose>
				<c:when test="${allblogs.size()==0}">
					<div class="alert alert-info text-center" role="alert">!! No
						Post Available !!</div>
				</c:when>
				<c:otherwise>
					<div class="alert alert-info text-center" role="alert">!! ALL
						POSTS BELOW !!</div>
					<div class="row">
						<c:forEach var="blog" items="${allblogs}">
							<div class="col-md-4">
								<div class="card"
									style="width: 23rem; margin-left: auto; margin-right: auto;">
									<img src="/resources/image/uploads/${blog.getBlogimage()}"
										class="card-img-top" alt="..." height="240px">
									<div class="card-body">
										<h5 class="card-title">
											<strong>${blog.getBlogtitle()}</strong>
										</h5>
										<c:choose>
											<c:when test="${blog.getBlogbody().length()>100 }">
												<p class="card-text">${blog.getBlogbody().substring(0,100) }...</p>
												<p class="card-text" id="blogBody${blog.getPostid()}" hidden>${blog.getBlogbody()}</p>
												<button class="btn btn-sm btn-outline-primary"
													onclick="readContent(${blog.getPostid()})"
													id="readLink${blog.getPostid()}">Read Full Post</button>
											</c:when>
											<c:otherwise>
												<p class="card-text">${blog.getBlogbody()}</p>
												<br>
												<br>
												<br>
											</c:otherwise>
										</c:choose>
									</div>
									<ul class="list-group list-group-flush">
										<li class="list-group-item"><strong>Post By : </strong>${blog.getUserfullname() }</li>
										<li class="list-group-item"><strong>Post Date :
										</strong>${blog.getBlogpostdate().split(" ")[0] }</li>
									</ul>
								</div>

							</div>
						</c:forEach>
					</div>
				</c:otherwise>
			</c:choose>
		</div>
	</div>

	<script>
	function readContent(id)
	{
		swal($("#blogBody"+id).text(),{
			  button: "Close",
			});
	}
	
	</script>
	<!-- JavaScript Bundle with Popper -->
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
		crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"
		integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
		crossorigin="anonymous"></script>
</body>
</html>
