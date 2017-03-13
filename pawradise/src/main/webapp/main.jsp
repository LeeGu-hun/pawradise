<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>메인</title>
</head>
<body>
<tiles:insertAttribute name="header" />
	<c:if test="${empty authInfo }">
	<p>
	<c:redirect url="/login"/>
	</p>
	</c:if>
	<c:if test="${!empty authInfo }">
	<p>${authInfo.name}님 회원가입을 환영합니다.</p>
	<p><a href="<c:url value='/edit/changePassword'/>">[비밀번호 변경]</a>
	<a href="<c:url value='/logout'/>">[로그아웃]</a> 
	<a href="<c:url value='/member/list'/>">[멤버리스트]</a></p>
	</c:if>
</body>
</html>