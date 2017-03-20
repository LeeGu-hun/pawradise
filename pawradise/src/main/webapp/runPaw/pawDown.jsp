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
	<!--서브상단헤더 끝 -->
	<!-- About Us 내용 시작 -->
	<div class="divide80"></div>

	<div class="container">
		<div class="center-heading">
			<h2>제품 소개</h2>
			<span class="center-line"></span>
		</div>
		<div>
			<h3>내가 없는 빈 집에서 우리 야옹이는 무엇을 하고 있을까?</h3>
			<h2>사람의, 사랑에 의한, 반려동물을 위한 새로운 테크놀로지, PAWRADISE!</h2>
			<br>
		</div>
		<br>
		<h4>
			반려인이 없는 지루한 낮 시간에도<br> 냥이 멍이들이 신나게 뛰어놀고, 시간에 맞춰 신선한 사료를 먹을 수 있으며<br>
			또한 원격으로 반려동물의 사진을 촬영하는 것도 가능합니다.
		</h4>

		<!-- 동영상 div -->
		<div>
			<br>
			<h4>냥이 밥주는 영상(예시) - 소스有</h4>
			<iframe width="560" height="315"
				src="https://www.youtube.com/embed/7DwUOdvJp-8" 
				frameborder="2" allowfullscreen> </iframe>
		</div>
		<div>
			<br>
			<h4>냥이 놀아주는 영상(예시) - 소스有</h4>
			<iframe width="560" height="315"
				src="https://www.youtube.com/embed/Q05TAoPIHtQ" 
				frameborder="2"	allowfullscreen> </iframe>
		</div>
		<br>
		<h4>
			반려인이 없는 지루한 낮 시간에도<br> 냥이 멍이들이 신나게 뛰어놀고, 시간에 맞춰 신선한 사료를 먹을 수 있으며<br>
			또한 원격으로 반려동물의 사진을 촬영하는 것도 가능합니다.
		</h4>
	</div>
	<div class="divide60"></div>



	<!-- About Us 내용 끝 -->

	<!--하단 footer부분 인클루드시작 body태그안에들어감 -->
	<%@ include file="/include/footer2.jsp"%>
	<!--하단 footer부분 인클루드 끝 body태그안에들어감-->
</body>
</html>