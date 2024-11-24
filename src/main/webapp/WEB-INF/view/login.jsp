<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <meta name="description" content="">
        <meta name="author" content="">

        <title>Z Shop | Login page</title>

        <!-- CSS FILES -->                
        <link rel="preconnect" href="https://fonts.googleapis.com">
        
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

        <link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,200;0,400;0,700;1,200&family=Unbounded:wght@400;700&display=swap" rel="stylesheet">
        
        <link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/resources/css/bootstrap-icons.css" rel="stylesheet">
       
       <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <link href="${pageContext.request.contextPath}/resources/css/tooplate-kool-form-pack.css" rel="stylesheet">
<script type="text/javascript">
function validateLoginForm() {
	let isValid = true;

	const email = document.getElementById("email").value.trim();
	const password = document.getElementById("password").value.trim();
	
	
	const emailError = document.getElementById("emailError");
	const passwordError = document.getElementById("passwordError");
	

	emailError.innerHTML = "";
	passwordError.innerHTML = "";

	
	if (email === "") {
		emailError.innerHTML = "Email is required.";
		isValid = false;
	}
	if (password === "") {
		passwordError.innerHTML = "Password is required.";
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
<c:if test="${not empty successMessage}">
    <script>
        Swal.fire({
            icon: 'success',
            title: 'Success!',
            text: '${successMessage}',
            showConfirmButton: false,
            timer: 2000,
            timerProgressBar: true,
        });
    </script>
</c:if>
<c:if test="${not empty warningMessage}">
    <script>
        Swal.fire({
            icon: 'warning',
            title: 'Warning!',
            text: '${warningMessage}',
            showConfirmButton: false,
            timer: 2000,
            timerProgressBar: true,
        });
    </script>
</c:if>
        <main>

            <header class="site-header">
                <div class="container">
                    <div class="row justify-content-between">

                        <div class="col-lg-12 col-12 d-flex">
                            <a class="site-header-text d-flex justify-content-center align-items-center me-auto" href="index.html">
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
                            <form:form class="custom-form login-form" modelAttribute="CustomerObj" role="form" method="post" action="doLogin" onsubmit="return validateLoginForm()">
                                <h2 class="hero-title text-center mb-4 pb-2">Login Form</h2>
								<p>${error }</p>
                                <div class="form-floating mb-4 p-0">
                                    <form:input type="email" path="email" name="email" id="email" pattern="[^ @]*@[^ @]*" class="form-control" placeholder="Email address" required="" />

                                    <label for="email">Email address</label>
                                    <span id="emailError" class="error"></span>
                                </div>

                                <div class="form-floating p-0">
                                    <form:input type="password" path="password" name="password" id="password" class="form-control" placeholder="Password" required="" />

                                    <label for="password">Password</label>
                                    <span id="passwordError" class="error"></span>
                                </div>

                                

                                <div class="row justify-content-center align-items-center">
                                    <div class="col-lg-5 col-12">
                                        <button type="submit" class="form-control">Sign In</button>
                                    </div>

                                    <div class="col-lg-5 col-12">
                                        <a href="register" class="btn custom-btn custom-border-btn">Sign Up</a>
                                    </div>
                                </div>

                            </form:form>
                            
                        </div>
                    </div>
                </div>

                
            </section>
        </main>

        <!-- JAVASCRIPT FILES -->
        <script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
        <script src="${pageContext.request.contextPath}/resourecs/js/bootstrap.bundle.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/js/countdown.js"></script>
        <script src="${pageContext.request.contextPath}/resources/js/init.js"></script>
        <script src="${pageContext.request.contextPath}/resources/js/register.js"></script>

    </body>
</html>
