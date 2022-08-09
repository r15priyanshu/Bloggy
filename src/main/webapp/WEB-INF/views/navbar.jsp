<%@ page import="bloggy.entities.*" %>
<%User u=(User)session.getAttribute("user");%>
<div class="container-fluid m-0 p-0">
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<div class="container-fluid">
			<a class="navbar-brand" href="/home">BLOGGY</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="/home">HOME</a></li>
					<li class="nav-item"><a class="nav-link" href="#">CONTACT-US</a>
					</li>
				</ul>
				<ul class="navbar-nav ms-auto">
				<%if(u!=null){%>
					<li class="nav-item ms-auto"><a class="nav-link" href="/profile/<%=u.getUsername()%>"><%=u.getName().toUpperCase()%></a></li>
				<%}%>
					<li class="nav-item dropdown "><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
						role="button" data-bs-toggle="dropdown" aria-expanded="false">
							<i class="fa fa-cog fa-spin fa-lg"></i>
					</a>
						<ul class="dropdown-menu dropdown-menu-end"
							aria-labelledby="navbarDropdown">
							<%if(u==null){%>
							<li><a class="dropdown-item" href="/register">Register</a></li>
							<li><a class="dropdown-item" href="/login">Login</a></li>
							<%}else{%>
								<li><a class="dropdown-item" data-bs-toggle="modal" data-bs-target="#exampleModal">User Details</a></li>
								<li><a class="dropdown-item" href="/logout">Logout</a></li>
							<%}%>
							
						</ul></li>
				</ul>
			</div>
		</div>
	</nav>
</div>