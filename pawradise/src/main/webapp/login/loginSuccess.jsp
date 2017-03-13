<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html>
<head>
<title><spring:message code="login.title" /></title>
</head>
<body>

	<c:if test="${empty authInfo }">
	<c:redirect url="/login"/>	
	</c:if>
	
	<c:if test="${!empty authInfo }">
	<p>${authInfo.name}님 <spring:message code="login.done" /></p>
	<p><a href="<c:url value='/main'/>"> 
		[<spring:message code="go.main" />]
	   </a>
	</p>
	</c:if>
	
</body>
</html>