<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Product</title>
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
<script
	src="${pageContext.request.contextPath}/resources/js/register.js"></script>
</head>
<body>
<header class="site-header">
                <div class="container">
                    <div class="row justify-content-between">

                        <div class="col-lg-12 col-12 d-flex">
                            <a class="site-header-text d-flex justify-content-center align-items-center me-auto" href="admin">
                                <i class="bi-box"></i>

                                <span>
                                    Z Shop
                                </span>
                            </a>

                            

                        </div>

                    </div>
                </div>
            </header>
            <section class="hero-section d-flex justify-content-center align-items-center">
	<div class="container">
		<div class="row">

			<div class="col-lg-5 col-12 mx-auto">
				<br> <br>
				<form:form modelAttribute="ProductObj" method="post"
					action="addProduct" class="custom-form login-form"
					enctype="multipart/form-data" onsubmit="return validateForm()">
					<h2 class="hero-title text-center mb-4 pb-2">Add Product</h2>
					<p>${message }</p>
					<div class="form-floating mb-4 p-0">
						<form:select path="c_id" class="form-control" id="category">
							<option value="">Select Category</option>
							<c:forEach var="cbean" items="${cbeans}">
								<option value="${cbean.id}">${cbean.name}</option>
							</c:forEach>
						</form:select>
						<span id="categoryError"
							class="error"></span>
					</div>
					<div class="form-floating mb-4 p-0">
						<form:input type="text" path="product_name" id="name"
							class="form-control" placeholder="Enter Product Name" required="" />

						<label for="name">Enter Product Name</label> <span id="nameError"
							class="error"></span>
					</div>
					<div class="form-floating mb-4 p-0">
						<form:input type="text" path="brand" id="bname"
							class="form-control" placeholder="Enter Product Brand"
							required="" />

						<label for="bname">Enter Product Brand</label> <span
							id="bnameError" class="error"></span>
					</div>
					<div class="form-floating mb-4 p-0">
						<form:input type="number" path="quantity" id="quantity"
							class="form-control" placeholder="Enter Product Quantity"
							required="" />

						<label for="quantity">Enter Product Quantity</label> <span
							id="quantityError" class="error"></span>
					</div>
					<div class="form-floating mb-4 p-0">
						<form:input type="number" path="price" id="price"
							class="form-control" placeholder="Enter Product Price"
							required="" />

						<label for="price">Enter Product Price</label> <span
							id="priceError" class="error"></span>
					</div>

					<div class="form-floating mb-4 p-0">

						<form:input type="file" path="product_image" id="product_image"
							accept="image/*" class="form-control"
							placeholder="Upload Photo" />
						<label for="product_image">Upload Photo</label> <span
							id="photoError" class="error"></span>
					</div>

					<div class="row justify-content-center align-items-center">
						<div class="col-lg-5 col-12">
							<button type="submit" class="form-control">Submit</button>
						</div>
					</div>

				</form:form>
			</div>
		</div>
	</div>
</section>
</body>
</html>