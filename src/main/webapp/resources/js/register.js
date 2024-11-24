function togglePasswordVisibility() {
	const passwordField = document.getElementById("password");
	const toggleIcon = document.getElementById("toggleIcon");

	if (passwordField.type === "password") {
		passwordField.type = "text";
		toggleIcon.textContent = "👁️";
	} else {
		passwordField.type = "password";
		toggleIcon.textContent = "👁️‍🗨️";
	}
}



function checkPassword() {
	const password = document.getElementById("password").value;
	const passwordError = document.getElementById("passwordError");

	const lengthCheck = password.length >= 8;
	const numberCheck = /[0-9]/.test(password);
	const specialCharCheck = /[!@#$%^&*]/.test(password);
	const upperCaseCheck = /[A-Z]/.test(password);
	const lowerCaseCheck = /[a-z]/.test(password);

	passwordError.innerHTML = "";

	if (!lengthCheck) {
		passwordError.innerHTML += "Password must be at least 8 characters long.<br>";
	}
	if (!upperCaseCheck) {
		passwordError.innerHTML += "Password must contain at least one uppercase letter.<br>";
	}
	if (!lowerCaseCheck) {
		passwordError.innerHTML += "Password must contain at least one lowercase letter.<br>";
	}
	if (!numberCheck) {
		passwordError.innerHTML += "Password must contain at least one number.<br>";
	}
	if (!specialCharCheck) {
		passwordError.innerHTML += "Password must contain at least one special character.<br>";
	}

	return lengthCheck && upperCaseCheck && lowerCaseCheck && numberCheck && specialCharCheck;
}

function checkConfirmPassword() {
	const password = document.getElementById("password").value;
	const confirmPassword = document.getElementById("cpassword").value;
	const confirmPasswordError = document.getElementById("confirmPasswordError");

	if (password !== confirmPassword) {
		confirmPasswordError.innerHTML = "Passwords do not match.";
	} else {
		confirmPasswordError.innerHTML = "";
	}
}


function validateForm() {
	let isValid = true;


	const name = document.getElementById("name").value.trim();
	const brand = document.getElementById("bname").value;
	const price = document.getElementById("quantity").value.trim();
	const quantity = document.getElementById("price").value.trim();
	const photos = document.getElementById("product_image").files;
	const category=document.getElementById("category").value.trim();

	const nameError = document.getElementById("nameError");
	const bnameError = document.getElementById("bnameError");
	const priceError = document.getElementById("priceError");
	const quantityError = document.getElementById("quantityError");
	const photoError = document.getElementById("photoError");
	const cateError=document.getElementById("categoryError");

	nameError.innerHTML = "";
	bnameError.innerHTML = "";
	priceError.innerHTML = "";
	quantityError.innerHTML = "";
	photoError.innerHTML = "";
	cateError.innerHTML="";
	
	if(category==""){
		cateError.innerHTML="Please Choose the Category.";
		isValid=false;
	}
	if (name === "") {
		nameError.innerHTML = "Product name is required.";
		isValid = false;
	}
	if (brand === "") {
		bnameError.innerHTML = "Brand name is required.";
		isValid = false;
	}
	if (price === "") {
		priceError.innerHTML = "Price is required.";
		isValid = false;
	} else if (isNaN(price) || price <= 0) {
		priceError.innerHTML = "Price must be a positive number.";
		isValid = false;
	}
	if (quantity === "" || isNaN(quantity) || parseInt(quantity) <= 0) {
		quantityError.innerHTML = "Quantity must be a positive number greater than zero.";
		isValid = false;
	}
	if (photos.length === 0) {
		photoError.innerHTML = "Please upload at least one product photo.";
		isValid = false;
	}
	return isValid;
}

function validateRegisterForm() {
	let isValid = true;


	const name = document.getElementById("full_name").value.trim();
	const email = document.getElementById("email").value.trim();
	const password = document.getElementById("password").value.trim();
	const cpassword = document.getElementById("cpassword").value.trim();
	


	const nameError = document.getElementById("nameError");
	const emailError = document.getElementById("emailError");
	const passwordError = document.getElementById("passwordError");
	const confirmPasswordError = document.getElementById("confirmPasswordError");
	


	nameError.innerHTML = "";
	emailError.innerHTML = "";
	passwordError.innerHTML = "";
	confirmPasswordError.innerHTML = "";
	


	if (name === "") {
		nameError.innerHTML = "Name is required.";
		isValid = false;
	}
	if (email === "") {
		emailError.innerHTML = "Email is required.";
		isValid = false;
	}
	if (password === "") {
		passwordError.innerHTML = "Password is required.";
		isValid = false;
	} 
	
	if (cpassword === "") {
			confirmPasswordError.innerHTML = "Confirm Password is required.";
			isValid = false;
		} 
	return isValid;
}





