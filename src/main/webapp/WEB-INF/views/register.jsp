<%@ page import="bloggy.helper.Message" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor"
	crossorigin="anonymous">
<title>Bloggy | Register</title>
<style>
body {
	background-image: url("/resources/image/register.jpg");
	background-attachment: fixed;
	background-repeat: no-repeat;
	background-size: cover;
}
</style>
</head>
<body>
	<%@include file="navbar.jsp"%>
	<div class="container" style="padding: 50px;">
		<div class="row">
			<div class="col-md-6 offset-md-3">
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

				<div class="card text-white"
					style="padding: 20px; background: rgba(255, 255, 255, 0.2); border-radius: 20px">
					<div class="card-header">
						<div>
							<h3 class="text-center">REGISTER HERE</h3>
						</div>
					</div>
					<div class="card-body">
						<div>
							<form id="myregform" action="/register" method="post">
								<div class="mb-3">
									<label for="name" class="form-label">Name</label> <input
										type="text" class="form-control" name="name" id="name"
										aria-describedby="nameHelp" required>
								</div>
								<div class="mb-3">
									<label for="username" class="form-label">Username</label> <input
										type="text" class="form-control" name="username" id="username"
										aria-describedby="usernameHelp" required>
									<div id="usernameCheck" class="form-text"></div>
								</div>
								<div class="mb-3">
									<label for="exampleInputEmail1" class="form-label">Email</label>
									<input type="email" class="form-control" name="email"
										id="email" aria-describedby="emailHelp" required>
									<div id="emailCheck" class="form-text"></div>
								</div>
								<div class="mb-3">
									<label for="exampleInputPassword1" class="form-label">Password</label>
									<input type="password" name="password" class="form-control"
										id="exampleInputPassword1" required>
								</div>
								<div id="status" style="display: none; text-align: center;">
									<span class="fa fa-refresh fa-spin fa-3x"></span>
								</div>
								<div class="text-center">
									<button type="submit" class="btn btn-primary">Register</button>
									<a href="/login" class="btn btn-secondary">Go to Login Page</a>
									<a href="/home" class="btn btn-primary">Home</a>
								</div>
							</form>
						</div>

					</div>
				</div>
			</div>
		</div>
	</div>

	<script>
		$(document).ready(function() {
			$("#username").change(function() {
				$.ajax({
					url:'/checkUsername',
					data:{username:$("#username").val()},
					success:function(responseText){
						if(responseText!="")
						{
							$("#usernameCheck").text(responseText)
							$("#usernameCheck").css("color","red")
						}else{
							$("#usernameCheck").text("Username Available !!")
							$("#usernameCheck").css("color","green")
						}
							
					}
				});
			});

			
			$("#email").change(function() {
				$.ajax({
					url:'/checkEmail',
					data:{email:$("#email").val()},
					success:function(responseText){
						if(responseText!="")
						{
							$("#emailCheck").text(responseText)
							$("#emailCheck").css("color","red")
						}else{
							$("#emailCheck").text("Email Available !!")
							$("#emailCheck").css("color","green")
						}
							
					}
				});
			});
		});

	</script>

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
