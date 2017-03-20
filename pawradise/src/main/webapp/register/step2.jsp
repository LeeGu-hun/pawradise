<!-- 모든페이지 상단 공통 인클루드 시작-->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!-- 헤더부분 -->
<%@ include file="/include/header.jsp"%>
<!-- 모든페이지 상단 공통 인클루드 끝 <body>태그 바로 위에 </head>태그 모두 삭제하고 넣어주세요 -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><spring:message code="member.register" /></title>
<body>
	<!--항상 같이 다니는 메뉴  -->
	<%@ include file="/include/topMenu.jsp"%>

	<!--서브상단헤더 시작 -->
	<div class="breadcrumb-wrap">
		<div class="container">
			<div class="row">
				<div class="col-sm-6">
					<h4>냥냥멍멍 귀여워</h4>
				</div>
				<div class="col-sm-6 hidden-xs text-right">
					<ol class="breadcrumb">
						<li><a href="index.jsp">HOME</a></li>
						<li>냥냥멍멍귀여워</li>
					</ol>
				</div>
			</div>
		</div>
	</div>
	<!--breadcrumbs-->
	<div class="divide50"></div>
	<div class="center-heading">
                <h2>JOIN US</h2>
                <span class="center-line"></span>
            </div>
	<div class="joininfo">
		
		<form:form action="step3" commandName="registerRequest">
			<table class="joinform">
				<tr id="btline">
					<td id="tbname"><spring:message code="Id" /></td>
					<td id="tbwrite"><form:input path="name" /> <form:errors path="name" /> 
					</td>
				</tr>
				<tr id="btline">
					<td id="tbname"><spring:message code="email" /></td>
					<td id="tbwrite"><form:input path="email" /> <form:errors path="email" />
						</td>
				</tr>
				<tr id="btline">
					<td id="tbname"><spring:message code="name" /></td>
					<td id="tbwrite"><form:input path="name" /> <form:errors path="name" /> </td>
				</tr>
				<tr id="btline">
					<td id="tbname"><spring:message
								code="password" /></td>
					<td id="tbwrite"><form:password path="password" />
				<form:errors path="password" /> </td>
				</tr>
				<tr id="btline">
					<td id="tbname"><spring:message	code="password.confirm" /></td>
					<td id="tbwrite"><form:password path="confirmPassword" /> <form:errors
							path="confirmPassword" /> </td>
				<tr id="btline">
					<td id="tbname"><spring:message code="phone" /></td>
					<td id="tbwrite"><form:input path="name" /> <form:errors path="name" /> </td>
				</tr>
				<tr id="btline">
					<td id="tbname"><spring:message code="petname" /></td>
					<td id="tbwrite"><form:input path="name" /> <form:errors path="name" /> </td>
				</tr>
				<tr id="btline2">
					<td id="tbname"><spring:message code="address" /></td>
					<td id="tbwrite"><form:input path="name" style="width:120px;" /> <form:errors path="name" /> 
					<input type="button" value="우편번호 검색" id="addsearch"/><br>
					<form:input path="name" style="width:240px;"/> <form:errors path="name" /><span id="addadd">나머지 주소 입력</span>
					</td>
				</tr>			
			</table>
			<div class="divide20"></div>
			<input type="submit" value="<spring:message code="register.btn" />"
				id="joinbutton" />
		</form:form>
	</div>
	<div class="divide50"></div>
	<!--하단 footer부분 인클루드시작 body태그안에들어감 -->
	<%@ include file="/include/footer2.jsp"%>
	<!--하단 footer부분 인클루드 끝 body태그안에들어감-->
</body>
</html>