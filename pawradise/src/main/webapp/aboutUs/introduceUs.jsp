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
	border-radius: 25px;
	/* background-color : #eaf2ff; */
	width: 75%;
}

.def {
	font-size: 17pt;
}

#myCat {
	font-size: 20pt;
}
.pawr {
	font-size: 17pt;
}

#tran {
	font-size: 20pt;
	color: black;
}

#tran2 {
	font-size: 24pt;
	color: black;
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
			<p id="myCat"><i> 내가 없는 빈 집에서 <strong>우리 야옹이</strong>는 무엇을 하고 있을까?</i></p>
			<br><br>
			<p class="pawr">반려동물을 사랑하는 마음에서 시작된 PAWRADISE!</p><br>
			<p class="pawr">오랜 외출로 항상 미안했던 마음, <strong> PAWRADISE</strong>가 덜어드립니다.</p>
			<br>
				<div class="divide60"></div>
			<div id=def>
				<br>
				<h1><i><strong>PAWRADISE</strong> 란?</i></h1>
				<br> 
				<img src="<%=request.getContextPath()%>/img/pawParadise1.png" width="800px" /> 
				<br>

				<p class="def">	
				동물의 발을 뜻하는 영어 단어인 <strong>PAW</strong>와, 낙원이라는 뜻의 <strong>PARADISE</strong>를 합쳐,
				</p>
				<br>
				<p class="def">모든 동물들이 행복하길 바라는 마음을 담아 <strong>PAWRADISE</strong>가 탄생하게 되었습니다.</p>
				<br>
			</div>
			<div class="divide60"></div>



			<div>
				<%-- <img src="<%=request.getContextPath()%>/img/pawradise.png" width="800px" /><br>
				<img src="<%=request.getContextPath()%>/img/pawradise4.png" width="800px" /><br>
				<img src="<%=request.getContextPath()%>/img/pawradise2.png" width="800px" /><br>--%>
				<img src="<%=request.getContextPath()%>/img/pawradise5.png" width="800px" /><br> 
				
				<div class="divide50"></div>
				<p id="tran">
					<br> <i>사람의, 사랑에 의한, 반려동물을 위한 새로운 테크놀로지,</i>
				</p><br>
				<p id="tran2">
					<i><strong>PAWRADISE!</strong></i>
				</p>
			</div>
		</div>
	</div>
	<div class="divide60"></div>
	<div class="divide60"></div>


	<!-- About Us 내용 끝 -->

	<!--하단 footer부분 인클루드시작 body태그안에들어감 -->
	<%@ include file="/include/footer2.jsp"%>
	<!--하단 footer부분 인클루드 끝 body태그안에들어감-->
</body>
</html>