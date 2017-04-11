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
	<!-- 마이페이지  -->
<div class="divide80"></div>
    <div class="container">
     <div class="center-heading">
                <h2>마이페이지</h2>
                <span class="center-line"></span>
            </div> 
     <div class="row">
           

		<table class="mptb" align="center">
			<tr class="mpbottom">
				<td class="var">닉네임</td>
				<td id="mp\">|<td>
				<td class="mpinfo">${member.name}</td>
			</tr>
			<tr class="mpbottom">
				<td class="var">전화번호</td>
				<td id="mp\">|<td>
				<td class="mpinfo">${member.phone}</td>
			</tr>		
			<tr class="mpbottom">
				<td class="var">E-mail</td>
				<td id="mp\">|<td>
				<td class="mpinfo">${member.email}</td>
			</tr>  
		</table>
		<div class="mptab" align="center">
			<a href="<c:url value="/mypage/modify/${member.userNum}"/>"> 비밀번호 수정</a>		
		

		<div class="divide30"></div>
		<input type="button" id="loginbutton" onclick="location.href='<c:url value="/mypage/memdelete/${sessionScope.authInfo.userNum }"/>' "value="탈퇴하기">
		<%-- <a href="<c:url value="/mypage/memdelete/${sessionScope.authInfo.userNum }"/>" >탈퇴하기</a> --%> 
		<%-- <a href="<c:url value="/mypage/mempassword.jsp"/>" id="logbutton"> 회원탈퇴</a> --%> 
		<input type="button" value="메인으로" id="loginbutton" onclick="location.href='/pawradise/index.jsp'">
		</div>

	</div>
</div>	
	<div class="divide50"></div>
	<!--하단 footer부분 인클루드시작 body태그안에들어감 -->
	<%@ include file="/include/footer2.jsp"%>
	<!--하단 footer부분 인클루드 끝 body태그안에들어감-->
</body>
</html>