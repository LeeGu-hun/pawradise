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
<title>상세보기</title>
<script>
	function goDelete() {
		location.href = "../delete/"
	}
</script>
<style>
#pawCont {
	background-color: #ffe8f3;
	width: 75%;
}

.pawr {
	font-size: 13pt;
}

#tran {
	font-size: 16pt;
}

#tran2 {
	font-size: 20pt;
}

.class {
	width: 75%;
}
</style>
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
						<li>제품소개</li>
					</ol>
				</div>
			</div>
		</div>
	</div>
	<!--서브상단헤더 끝 -->
	<!-- About Us 내용 시작 -->
	<div class="divide80"></div>

	<div class="container">
		<div class="center-heading">
			<h2>제품 소개</h2>
			<span class="center-line"></span>
		</div>
		<div align=center>
			<div id="pawCont">
				<br>
				<h3>
					<i> 내가 없는 빈 집에서 <strong>우리 야옹이</strong>는 무엇을 하고 있을까?
					</i>
				</h3>
				<br>
				<p class="pawr">반려동물을 사랑하는 마음에서 시작된 PAWRADISE!</p>
				<p class="pawr">
					오랜 외출로 항상 미안했던 마음, <strong> PAWRADISE</strong>가 덜어드립니다.
				</p>
				<p class="pawr">
					반려인이 집을 비운 시간에도<br> 냥이 멍이들이 신나게 뛰어놀고, 시간에 맞춰 신선한 사료를 먹을 수 있으며,
					<br> 또한 원격으로 반려동물의 사진을 촬영하는 것도 가능합니다.
				</p>
				<br>
				<p id="tran">
					<i>사람의, 사랑에 의한, 반려동물을 위한 새로운 테크놀로지,</i>
				</p>
				<p id="tran2">
					<i><strong>PAWRADISE!</strong></i>
				</p>
				<br>
			</div>

			<div class="divide60"></div>
			<!-- 동영상 div -->
			<h4>고양이 밥주기</h4>
			<div class="video">
				<embed
					src="http://www.youtube.com/v/7DwUOdvJp-8?version=3&vq=highres"
					type="application/x-shockwave-flash" width="640" height="360"
					allowscriptaccess="always" allowfullscreen="true"
					allowscriptaccess="never"></embed>
			</div>
			<div class="divide60"></div>
			<h4>고양이 놀아주기</h4>
			<div class="video">
				<embed
					src="http://www.youtube.com/v/hHIrxL0giJQ?version=3&vq=highres"
					type="application/x-shockwave-flash" width="640" height="360"
					allowscriptaccess="always" allowfullscreen="true"
					allowscriptaccess="never"></embed> 
			</div>

			<br>
		</div>
	</div>
	<div class="divide60"></div>



	<!-- About Us 내용 끝 -->

	<!--하단 footer부분 인클루드시작 body태그안에들어감 -->
	<%@ include file="/include/footer2.jsp"%>
	<!--하단 footer부분 인클루드 끝 body태그안에들어감-->
</body>
</html>