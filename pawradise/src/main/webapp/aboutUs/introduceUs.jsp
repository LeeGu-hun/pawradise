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
#def {
	border: 1px solid #d6d6d6;
	background-color : #eaf2ff;
	width: 75%;
}

.def {
	font-size: 13pt;
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
</style>

<body>
	<!--항상 같이 다니는 메뉴  -->
	<%@ include file="/include/topMenu.jsp"%>
	<!-- 서브상단헤더 -->
	<%@ include file="/include/topBanner.jsp"%>
	
	<!-- About Us 내용 시작 -->
	<div class="divide80"></div>

	<div class="container">
		<div class="center-heading">
			<h2>회사 소개</h2>
			<span class="center-line"></span>
		</div>
		<div align=center>
			<div id=def>
				<br>
				<h3>
					<strong>PAWRADISE</strong> 란?
				</h3>
				<br>
				<p class="def">
					동물들의 발을 뜻하는 영어 단어인 <strong>PAW</strong>와, 낙원이라는 뜻의 <strong>PARADISE</strong>를 합쳐,

				</p>
				<p class="def">
					모든 반려동물들이 행복하길 바라는 마음을 담아 <strong>PAWRADISE</strong>가 탄생하게 되었습니다.
				</p>
				<br>
			</div>
			<div class="divide60"></div>

			<h3>
				<i> 내가 없는 빈 집에서 <strong>우리 야옹이</strong>는 무엇을 하고 있을까?
				</i>
			</h3>
			<br>
			<p class="pawr">반려동물을 사랑하는 마음에서 시작된 PAWRADISE!</p>
			<p class="pawr">
				오랜 외출로 항상 미안했던 마음, PAWRADISE가 덜어드립니다.
			</p>
			<br>
			<p id="tran">
				사람의, 사랑에 의한, 반려동물을 위한 새로운 테크놀로지,
			</p>
			<p id="tran2">
				<strong>PAWRADISE!</strong>
			</p>
			<br>

			<div>
				<img src="<%=request.getContextPath()%>/img/pawradise.jpg" />
			</div>
		</div>
	</div>
	<div class="divide60"></div>


	<!-- About Us 내용 끝 -->

	<!--하단 footer부분 인클루드시작 body태그안에들어감 -->
	<%@ include file="/include/footer2.jsp"%>
	<!--하단 footer부분 인클루드 끝 body태그안에들어감-->
</body>
</html>