<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Spring MVC Form Handling</title>

<style type="text/css">
.error {
	color: red;
}
</style>
</head>
<body>
	<form:form modelAttribute="userobj" action="addUser" method="post">
	ID <form:input path="id"/>
	<form:errors path="id" cssClass="error"></form:errors>
	<br><br>
	Age <form:input path="age"/>
	<form:errors path="age" cssClass="error" ></form:errors>
	<br><br>
	Name <form:input path="name"/>
	<form:errors path="name" cssClass="error" ></form:errors>
	<br><br>
	Gender 
	
	Male<form:radiobutton path="gender" value="Male"/>
	Female<form:radiobutton path="gender" value="Female"/><br><br>
	
	Frameworks
	<form:checkboxes items="${framework}" path="frameworks"/><br><br>
	
	Numbers
	<form:radiobuttons items="${numAdd}" path="luckyNum"/><br><br>
	
	Country
	<form:select path="country" items="${list}" multiple="multiple">
	</form:select><br><br>
	
	Image
	<form:input path="image" type="file" accept="image/*"/><br><br>
	<input type="submit" value="Add">
	</form:form>
</body>
</html>