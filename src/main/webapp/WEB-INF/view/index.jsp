<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<meta name="description" content="">
<meta name="author" content="">

<title>Z shop | Coming Soon Page</title>

<!-- CSS FILES -->
<link rel="preconnect" href="https://fonts.googleapis.com">

<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

<link
	href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,200;0,400;0,700;1,200&family=Unbounded:wght@400;700&display=swap"
	rel="stylesheet">

<link
	href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/css/bootstrap-icons.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/css/tooplate-kool-form-pack.css"
	rel="stylesheet">


</head>

<body>

	<main>

		<header class="site-header">
			<div class="container">
				<div class="row justify-content-between">

					<div class="col-lg-12 col-12 d-flex align-items-center">
						<a
							class="site-header-text d-flex justify-content-center align-items-center me-auto"
							href="home"> <i class="bi-box"></i> <span> Z Shop </span>
						</a>
						

						<div style="margin-right: 5%;">
							<a href="addToCart">Product</a>
						</div>
						<div style="margin-right: 5%;">
							<a href="login">Sign In</a>
						</div>
						<div style="margin-right: 5%;">
							<a href="register">Sign Up</a>
						</div>
						<div>
							<a href="logout">LogOut</a>
						</div>

					</div>

				</div>
			</div>
		</header>




		<section class="hero-section d-flex justify-content-center "
			id="section_1">
			<div class="container">
				<div class="row">

					<div class="col-lg-12 col-4 mx-auto">
						<h1 class="text-white">Welcome From Z Shop</h1>
						<div style="margin-right: 5%;" class="text-white">
							<a href="changeProfile"><p> Welcome! ${sessionScope.uName}</p></a>
						</div>
					</div>

					<c:if test="${not empty productList}">
						<div class="row row-cols-1 row-cols-md-3 g-4">
							<c:forEach var="product" items="${productList}">
								<div class="col">
									<div class="card h-80">
										<img
											src="${pageContext.request.contextPath}/upload/${product.photo}"
											class="card-img-top" alt="${product.product_name}">
										<div class="card-body">
											<h5 class="card-title">${product.product_name}</h5>
											<p class="card-text">Brand: ${product.brand}</p>

										</div>
									</div>
								</div>
							</c:forEach>
						</div>
					</c:if>
				</div>
			</div>


		</section>
	</main>

	<!-- JAVASCRIPT FILES -->
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resourecs/js/bootstrap.bundle.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/countdown.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/init.js"></script>

</body>
</html>
