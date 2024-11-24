<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	${user.id} <br>
	${user.age} <br>
	${user.name}<br>
	${user.gender} <br>
	<%-- <c:forEach items="${user.frameworks}" var="frm">
	${frm}
	</c:forEach> --%>
	${user.frameworks}
	<br>
	${user.luckyNum  }
	<br>
	<%-- <c:forEach items="${user.country}" var="country">
	${country}
	</c:forEach> --%>
	 ${user.country } 
	<%--  <c:if test="${user.luckyNum ==1 }">
		Number 1
	</c:if>  --%>
	
	<c:if test="${user.luckyNum != null}">
    <p>Uploaded Image:</p>
    <img src="/uploads/${user.luckyNum}" alt="User Image" />
</c:if>
	
</body>
</html>