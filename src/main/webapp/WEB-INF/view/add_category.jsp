<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Category</title>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
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
	<script type="text/javascript">
	function validateCategory() {
		let isValid = true;

		const name = document.getElementById("name").value.trim();
		
		const nameError = document.getElementById("nameError");
		
		nameError.innerHTML = "";
		
		if (name === "") {
			nameError.innerHTML = "Category name is required.";
			isValid = false;
		}
		
		return isValid;
	}
	</script>
	<style type="text/css">
	.error{
	color:red;
	}
	</style>
</head>
<body>
<c:if test="${not empty errorMessage}">
    <script>
        Swal.fire({
            icon: 'error',
            title: 'Error!',
            text: '${errorMessage}',
            showConfirmButton: false,
            timer: 2000,
            timerProgressBar: true,
        });
    </script>
</c:if>
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
			<br><br>
				<form:form modelAttribute="CategoryObj" method="post"
					action="addCategory" class="custom-form login-form" onsubmit="return validateCategory()">
					<h2 class="hero-title text-center mb-4 pb-2">Add Product
						Category</h2>
						<p>${message }</p>
					<div class="form-floating mb-4 p-0">
						<form:input type="text" path="name" name="name" id="name"
							class="form-control" placeholder="Add Category" required="" />

						<label for="name">Add Category</label>
						<span id="nameError" class="error"></span>
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