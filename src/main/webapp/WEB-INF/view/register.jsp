
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<meta name="description" content="">
<meta name="author" content="">

<title>Z Shop | Register or Create an account</title>

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
<link
	href="${pageContext.request.contextPath}/resources/css/register.css"
	rel="stylesheet">

</head>

<body>

	<main>

		<header class="site-header">
			<div class="container">
				<div class="row justify-content-between">

					<div class="col-lg-12 col-12 d-flex">
						<a
							class="site-header-text d-flex justify-content-center align-items-center me-auto"
							href="index.html"> <i class="bi-box"></i> <span> Z
								Shop </span>
						</a>



					</div>

				</div>
			</div>
		</header>


		<section
			class="hero-section d-flex justify-content-center align-items-center">
			<div class="container">
				<div class="row">

					<div class="col-lg-6 col-12 mx-auto">
						<form:form class="custom-form" role="form"
							modelAttribute="CustomerObj" action="insert" method="post" onsubmit="return validateRegisterForm()">
							<h2 class="hero-title text-center mb-4 pb-2">Create an
								account</h2>
							<p>${error}</p>
							<div class="row">
								<div class="col-lg-12 col-12">
									<div class="form-floating">
										<form:input type="text" path="name" name="full-name"
											id="full_name" class="form-control" placeholder="Full Name"
											required="" />

										<label for="full_name">Full Name</label>
										<span id="nameError" class="error"></span>
									</div>
								</div>
							</div>
							<div class="col-lg-12 col-12">
								<div class="form-floating mb-4 p-0">
									<form:input type="email" path="email" name="email" id="email"
										pattern="[^ @]*@[^ @]*" class="form-control"
										placeholder="Email address" required="" />

									<label for="email">Email address</label>
									<span id="emailError" class="error"></span>
								</div>
							</div>

							<div class="col-lg-12 col-12">
								<div class="form-floating p-0">
									<form:input type="password" path="password" name="password"
										id="password" class="form-control" placeholder="Password"
										required="" oninput="checkPassword()" />

									<label for="password">Password</label>
									<form:errors path="password" cssClass="error" />
									<span id="passwordError" class="error"></span>
								</div>


								<div class="col-lg-12 col-12">
									<div class="form-floating p-0">
										<form:input type="password" path="c_password" name="cpassword"
											id="cpassword" class="form-control" placeholder="Password"
											required="" oninput="checkConfirmPassword()" />

										<label for="cpassword">Confirm Password</label>
										<form:errors path="c_password" cssClass="error" />
										<span id="confirmPasswordError" class="error"></span>
									</div>


								</div>

								<div class="row justify-content-center align-items-center">
									<div class="col-lg-5 col-md-5 col-5 ms-auto">
										<button type="submit" class="form-control">Sign Up</button>
									</div>

									<div class="col-lg-6 col-md-6 col-7">
										<p class="mb-0">
											Already have an account? <a href="login" class="ms-2">Sign
												In</a>
										</p>
									</div>
								</div>
							</div>
						</form:form>

					</div>
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
	<script
		src="${pageContext.request.contextPath}/resources/js/register.js"></script>

</body>
</html>
