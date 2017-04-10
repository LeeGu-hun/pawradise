<!-- 모든페이지 상단 공통 인클루드 시작-->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.Random"%>
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
	location.href="./board/boardWrite"
}
function goMyWriter(){
	location.href="./board/myBoardList/${sessionScope.authInfo.userNum}"
}
function goMemList(){
	location.href="./member/list"
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

<script>
// 삽입될 이미지와 링크
var pictures =[
'<A href ="#"><img src="http://www.jsguide.net/ver2/images/examples.jpg" border = "0"></A>',
'<A href ="#"><img src="http://www.jsguide.net/ver2/images/faq.jpg" border = "0"></A>',
'<A href ="#"><img src="http://www.jsguide.net/ver2/images/qna.jpg" border = "0"></A>',
'<A href ="#"><img src="http://www.jsguide.net/ver2/images/manual.jpg" border = "0"></A>',
'<A href ="#"><img src="http://www.jsguide.net/ver2/images/articles.jpg" border = "0"></A>',
'<A href ="#"><img src="http://www.jsguide.net/ver2/images/board.jpg" border = "0"></A>'

];
// 이미지 갱신 주기( 1000 == 1초 )
//var refreshTime = 1000;

function outRandomImage()
{
randomId = Math.floor( Math.random() * pictures.length ); // 랜덤 값 추출
viewImage( randomId ); // viewImage 호출
}

function viewImage( randomId )
{
randomId++; // 랜덤값 1증가
if( randomId == pictures.length ) randomId = 0; // 랜덤값이 배열 크기와 같을 경우 가장 처음 이미지..
image.innerHTML = pictures[ randomId ]; // 이미지 출력
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
						<li>냥냥멍멍 귀여워</li>
					</ol>
				</div>
			</div>
		</div>
	</div>
	<!--서브상단헤더 끝 -->

	<!--breadcrumbs-->
	<div class="divide80"></div>
	<div class="center-heading">
		<h2>냥멍이의 은밀한 사생활</h2>
		<span class="center-line"></span>
	</div>

	<div class="blog-masonary-wrapper">
		<div class="container mas-boxes">

			<!--컨텐츠들어가는부분 시작-->
			<c:forEach var="board" items="${boards}">
				<div class="mas-boxes-inner">
					<div class="item-img-wrap">
						<div class="item-img-wrap">
							<c:choose>
								<c:when test="${!empty board.fileName}">
									<a href="<c:url value="/board/detail/${board.seq}"/>">
									<img src="<%=request.getContextPath() %>/uploads/${board.fileName}" class="img-responsive"></a>
								</c:when>
							</c:choose>
						</div>
					</div>

					<div class="mas-blog-inner">
						<h3>
							<a href="<c:url value="/board/detail/${board.seq}"/>">${board.title}</a>
						</h3>

						<ul class="list-inline post-detail">
							<li>${board.name}님의글</li>
							<li><i class="fa fa-calendar"></i>
							<fmt:formatDate value="${board.regdate}" pattern="yyyy-MM-dd HH:mm" /></li>
							<li>No.${board.seq}</li>
						</ul>

						<p>
							<c:forEach items="${board.content}" var="data" varStatus="status">
								<c:choose>
									<c:when test="${fn:length(board.content) > 14}">
										<c:out value="${fn:substring(board.content,0,13)}" />
										<a href="<c:url value="/board/detail/${board.seq}"/>"> ···
											더보기</a>
									</c:when>
									<c:otherwise>
										<a href="<c:url value="/board/detail/${board.seq}"/>"><c:out
												value="${board.content}" /></a>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</p>
						<img src="<%=request.getContextPath()%>/img/comment.png"
							width="15"> [${board.reply}]</a>
						
					</div>
				</div>
			</c:forEach>
			<!--컨텐츠들어가는부분 끝-->
		</div>
	</div>
	<div class="container">

		<!--글쓰기버튼 -->
		<a href="#" onclick="goWriter();" class="btn btn-theme-dark btn-lg">글쓰기</a>&nbsp;
		<a href="#" onclick="goMyWriter();" class="btn btn-theme-dark btn-lg">내가 쓴 글</a>
		<div class="divide10"></div>
		<!--검색 -->
		<form:form commandName="pageMaker" id="frm">
			<p>
				<input type="text" id="srch" name="srch" placeholder="검색" /> <input
					type="submit" value="조회"> <input type="text" name="page"
					id="page" hidden />
			</p>
		</form:form>
		<!--검색 -->
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