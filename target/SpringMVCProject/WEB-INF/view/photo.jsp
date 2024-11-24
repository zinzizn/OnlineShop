<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form:form modelAttribute="photoObj" action="AddPhoto" method="post" enctype="multipart/form-data">
		<form:input path="photo" type="file" accept="image/*" />
		<input type="submit" value="Add">
	</form:form>
</body>
</html>