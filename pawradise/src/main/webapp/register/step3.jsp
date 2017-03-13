<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><spring:message code="member.register" /></title>
</head>
<body>
	<h2><spring:message code="register.btn" /></h2>
	<p><spring:message code="register.done" arguments="${registerRequest.name},${word}"/></p>
	<p><a href="<c:url value='/main' />">[<spring:message code="go.main" />]</a></p>
</body>
</html>