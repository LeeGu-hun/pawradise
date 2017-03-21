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
	<!--breadcrumbs-->
	<div class="divide50"></div>

	<div class="center-heading">
		<h2>MEMBER OUT</h2>
		<span class="center-line"></span>
	</div>
	<div class="outcon">
		<table class="cause">
			<td>저희 냥냥멍멍귀여워의 부족했던 점과 아쉬웠던 점을 적어주십시오. <br> 더 좋은 모습으로
				발전하도록 최선을 다하겠습니다.<br> 앞으로 더 나은 모습으로 고객님을 다시 만날 수 있도록 노력하겠습니다.<br>
				그동안 이용해주신 것을 진심으로 감사드립니다.
			</td>
			<td><img src="<%=request.getContextPath()%>/img/sadpuppy.jpg"
				class="casueimg" /></td>
		</table>
		<div class="divide10"></div>
		<table class="because">
			<td id="outwrite">사유</td>
			<td>
				<div class="becauseof">
					<textarea rows="10" cols="70" class="outtext"></textarea>
				</div>
			</td>
			<td><input type="button" value="회원탈퇴" id="outbutton" onclick="location.href='/pawradise/mypage/mempassword.jsp'"><br>
				<input type="button" value="취소" id="outback"
				onclick="location.href='/pawradise/mypage/mypage.jsp'"></td>
		</table>
	</div>
	</div>

	<div class="divide50"></div>
	<!--하단 footer부분 인클루드시작 body태그안에들어감 -->
	<%@ include file="/include/footer2.jsp"%>
	<!--하단 footer부분 인클루드 끝 body태그안에들어감-->
</body>
</html>