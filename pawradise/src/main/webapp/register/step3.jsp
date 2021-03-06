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

	<!-- 서브상단헤더 -->
	<%@ include file="/include/topBanner.jsp"%>
	
	<!--breadcrumbs-->
	<div class="divide70"></div>
	<div class="regdone">
		<div class="donemsg">
		<div class="center-heading">
                <h2>가입 완료</h2>
                <span class="center-line"></span>
            </div>
		<p>
			<spring:message code="register.done"
				arguments="${registerRequest.name},${word}" />
		</p>
		<p>PAWRADISE의 회원이 되신 것을 축하드립니다!</p>
		<p>
		
			<a href="<c:url value="/index.jsp"/>">[<spring:message code="go.main" />]&nbsp;&nbsp;
			<a href="<c:url value="/login"/>">[로그인하기]
			</a>
		</p>
		</div>
	</div>
	<div class="divide70"></div>
	<!--하단 footer부분 인클루드시작 body태그안에들어감 -->
	<%@ include file="/include/footer2.jsp"%>
	<!--하단 footer부분 인클루드 끝 body태그안에들어감-->
</body>
</html>