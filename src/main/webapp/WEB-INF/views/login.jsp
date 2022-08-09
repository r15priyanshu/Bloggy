<%@ page import="bloggy.helper.Message" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor"
	crossorigin="anonymous">
<title>Bloggy | Login</title>

<style>
body{
background-image: url("/resources/image/login.jpg");
background-attachment: fixed;
background-repeat: no-repeat;
background-size: cover;
}
</style>
</head>

<body>
	<%@include file="navbar.jsp" %>

	<div class="container" style="padding:50px;">
		<div class="row">
			<div class="col-md-6 offset-md-3">
			<%Message msg = (Message) session.getAttribute("msg");%>
				<c:if test="${msg!=null}">
					<div
						class="alert ${msg.getMsgClass()} text-center alert-dismissible fade show"
						role="alert">
						${msg.getMsg()}
						<button type="button" class="btn-close" data-bs-dismiss="alert"
							aria-label="Close"></button>
					</div>
					<%session.removeAttribute("msg");%>
				</c:if>
				<div class="card text-white" style="padding:20px;background: rgba(255,255,255,0.1);border-radius:20px">
					<div class="card-header">
						<div style="text-align: center">
							<h3>
								 LOGIN
							</h3>
						</div>
					</div>
					<div class="card-body">
						<div style="padding:20px;">
							<form action="/login" method="post">
								<div class="mb-3">
									<label for="email" class="form-label">Email</label>
									<input name="email" type="email" class="form-control"
										id="email" aria-describedby="emailHelp" required>
										<div id="emailCheck" class="form-text"></div>
								</div>
								<div class="mb-3">
									<label for="exampleInputPassword1" class="form-label">Password</label>
									<input name="password" type="password" class="form-control"
										id="exampleInputPassword1" required>
								</div>
								<div class="text-center">
									<button type="submit" class="btn btn-primary">Login</button>
									<a href="/register" class="btn btn-secondary">Not Yet
										Registered?</a>
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
			
			$("#email").change(function() {
				$.ajax({
					url:'/checkEmail',
					data:{email:$("#email").val()},
					success:function(responseText){
						if(responseText=="")
						{
							$("#emailCheck").text("Email Not Yet Registered !!")
							$("#emailCheck").css("color","red")
						}else{
							$("#emailCheck").text("")
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