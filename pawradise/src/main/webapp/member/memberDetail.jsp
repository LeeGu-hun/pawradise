<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><spring:message code="member.info"/></title>
<link rel="stylesheet" href=" ${pageContext.request.contextPath}/resources/css/style.css?ver=1" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
</head>
<body>
	<div id="maincontainer">
		<h2>마이 페이지</h2>
		<span class="center-line"></span>
		<div>
			<ul class="filter list-inline">
				<li><a class="active" href="#">놀이 로그</a></li>
				<li><a href="#">식사 로그</a></li>
				<li><a href="#">내 정보</a></li>
			</ul>
		</div>
		<div id="maincontainer2">	
			<div>
				<ul class="filter list-inline">
				    <li><a class="active" href="#">내가 쓴 글</a></li>
				    <li><a href="#">구매내역</a></li>
				    <li><a href="#">문의내역</a></li>
				    <li><a href="#">개인 정보 수정</a></li>
				</ul>
			</div>
	
			<div id="contentsBox">
				<h2>관리자페이지-회원상세정보</h2>
				<table class="table">
				<tr><th>아이디</th><td>${member.id}</td></tr>
				<tr><th>이메일</th><td>${member.email}</td></tr>
				<tr><th>이름 </th><td>${member.name}</td></tr>
				<tr><th>가입일</th><td><fmt:formatDate value="${member.registerDate}" pattern="yyyy-MM-dd HH:mm" /></td></tr>
				<tr><td colspan="2"><a href="#" onclick="history.back();">돌아가기</a></td></tr>
				</table>
			</div>
		</div>
	</div>
</body>
</html>