<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Dashboard</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<style>
    .card-custom {
        border-radius: 15px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        transition: 0.3s;
    }
    .card-custom:hover {
        box-shadow: 0 8px 16px rgba(0, 0, 0, 0.3);
    }
    .btn-rounded {
        border-radius: 20px;
    }
    
    .profile-photo {
    border-radius: 50%;
    margin-bottom: 10px;
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




<nav class="navbar navbar-expand-lg navbar-light bg-light shadow-sm">
    <div class="container">
        <a class="navbar-brand" href="admin">Admin Dashboard</a>
           
               
        <ul class="navbar-nav ms-auto">
            <li class="nav-item">
                <a class="nav-link" href="home">

                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-house-fill" viewBox="0 0 16 16">
                        <path d="M8.707 1.5a1 1 0 0 0-1.414 0L.646 8.146a.5.5 0 0 0 .708.708L8 2.207l6.646 6.647a.5.5 0 0 0 .708-.708L13 5.793V2.5a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v1.293z"/>
                        <path d="m8 3.293 6 6V13.5a1.5 1.5 0 0 1-1.5 1.5h-9A1.5 1.5 0 0 1 2 13.5V9.293z"/>
                    </svg>
                    Home
                </a>
            </li>
            <li>
            <a href="logout" class="nav-link">LogOut</a>
            </li>
            
           
        </ul>
    </div>
</nav>
<p>Welcome! ${sessionScope.loggedInAdmin}</p> 
<div class="container my-5">
    <h2 class="text-center mb-4">Admin Dashboard</h2>
    
    

    <div class="row justify-content-center">
        
       

        <!-- Show Categories -->
        <div class="col-md-4 mb-4">
            <div class="card card-custom">
               <!--  <img src="category_image.jpg" class="card-img-top" alt="Categories"> -->
                <div class="card-body text-center">
                    <h5 class="card-title">Products</h5>
                    <p class="card-text">Manage product.</p>
                    <a href="showProduct" class="btn btn-primary btn-rounded">Show Products</a>
                     <a href="product" class="btn btn-primary btn-rounded">Add Products</a>
                </div>
            </div>
        </div>

       
        <!-- Show Orders -->
        <div class="col-md-4 mb-4">
            <div class="card card-custom">
                <!-- <img src="order_image.jpg" class="card-img-top" alt="Orders"> -->
                <div class="card-body text-center">
                    <h5 class="card-title">Category</h5>
                    <p class="card-text">Manage Product Category</p>
                    <a href="showCategory" class="btn btn-primary btn-rounded">Show Category</a>
                    <a href="category" class="btn btn-primary btn-rounded">Add Category</a>
                </div>
            </div>
        </div>
        
    </div>
</div>


</body>
</html>