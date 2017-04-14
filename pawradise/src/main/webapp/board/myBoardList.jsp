<!-- 모든페이지 상단 공통 인클루드 시작-->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!-- 헤더부분 -->
<%@ include file="/include/header.jsp"%>
<!-- 모든페이지 상단 공통 인클루드 끝 <body>태그 바로 위에 </head>태그 모두 삭제하고 넣어주세요 -->
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"
	type="text/javascript"></script>
<script>
function pageGo(page) {
	document.getElementById("page").value = page;
	document.getElementById("frm").submit();
}

function goWriter(){
	location.href="<%=request.getContextPath()%>/board/boardWrite"
	//location.href="./board/boardWrite"
}

</script>

<script type="text/javascript">
$(document).ready(function(){
     $("a[name='title']").on("click", function(e){ //제목
        e.preventDefault();
        fn_openBoardDetail($(this));
    });
}); 

</script>

<body>
	<!--항상 같이 다니는 메뉴  -->
	<%@ include file="/include/topMenu.jsp"%>

	<!-- 서브상단헤더 -->
	<%@ include file="/include/topBanner.jsp"%>

	<!--breadcrumbs-->
	<div class="divide80"></div>
	<div class="center-heading">
		<h2>내가 쓴 글</h2>
		<span class="center-line"></span>
	</div>

	<div class="container">
		<div class="row">
			<!--컨텐츠들어가는부분 시작-->
			<c:forEach var="board" items="${boards}">
				<div class="col-md-10 col-md-offset-1">
					<div class="blog-post">
						<c:choose>
							<c:when test="${!empty board.fileName}">
								<img src="<%=request.getContextPath() %>/uploads/${board.fileName}" class="img-responsive">
							</c:when>
						</c:choose>
						<br>
						<h3>
							<a href="<c:url value="/board/detail/${board.seq}"/>">${board.title}</a>
						</h3>

						<ul class="list-inline post-detail">
							<li>${board.name}님의글</li>
							<li><i class="fa fa-calendar"></i>
							<fmt:formatDate value="${board.regdate}" pattern="yyyy-MM-dd HH:mm" /></li>
							<li>글번호:${board.seq}</li>
						</ul>
						<p>"${board.content}"</p>
						<img src="<%=request.getContextPath()%>/img/comment.png"
							width="15"> [${board.reply}]</a>
					</div>
				</div>
			</c:forEach>
			<!--컨텐츠들어가는부분 끝-->
		</div>
	</div>
	<div class="pager">
		<!--글쓰기버튼 -->
		<a href="#" onclick="goWriter();" class="btn btn-theme-dark btn-lg">글쓰기</a>
		&nbsp;&nbsp;&nbsp;
		<!-- 전체게시판으로 가기 -->
		<a href="<%=request.getContextPath()%>/boardList"
			class="btn btn-theme-dark btn-lg">포토게시판</a>
		<div class="divide10"></div>
		<!--글쓰기버튼 -->

		<!--검색 -->
		<form:form commandName="pageMaker" id="frm">
			<p>
			<input type="text" id="srch" name="srch" placeholder="검색" /> <input type="submit" value="조회">
			<input type="text" name="page" id="page" hidden />
			</p>
		</form:form>
		<!--검색 -->
	</div>

	<div class="container">
		<ul class="pager">
			<c:if test="${pageMaker.prev }">
				<li class="previous"><a href='#'
					onclick='pageGo(${pageMaker.page-1});'>← Previous Page</a></li>
			</c:if>
			<c:forEach begin="${pageMaker.start }" end="${pageMaker.end}"
				var="idx">
				<li class='<c:out value="${idx == pageMaker.page?'current':''}"/>'>
					<a href='#' onclick='pageGo(${idx});'>${idx}</a>
				</li>
			</c:forEach>
			<c:if test="${pageMaker.next }">
				<li class="next"><a href='#'
					onclick='pageGo(${pageMaker.page+1});'>Next Page →</a></li>
			</c:if>
		</ul>
	</div>

	<!--masonary wrapper-->
	<div class="divide60"></div>

	<!--하단 footer부분 인클루드시작 body태그안에들어감 -->
	<%@ include file="/include/footer2.jsp"%>
	<!--하단 footer부분 인클루드 끝 body태그안에들어감-->
</body>
</html>