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

function goBoardList(){
	location.href="./boardList"
}

</script>
<style>
#boardsrchb {
	background-color: #333;
	border: 0;
	color: white;
	border-radius: 2px;
	height: 36px;
	width: 55px;
}

#boardsrchb:hover {
	background-color: #32c5d2;
	color: white;
}
</style>
<body>
	<!--항상 같이 다니는 메뉴  -->
	<%@ include file="/include/topMenu.jsp"%>

	<!--서브상단헤더 -->
	<%@ include file="/include/topBanner.jsp"%>

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
						<c:choose>
							<c:when test="${!empty board.fileName}">
								<a href="<c:url value="/board/detail/${board.seq}"/>"> <img
									src="<%=request.getContextPath() %>/uploads/${board.fileName}"
									class="img-responsive"></a>
							</c:when>

							<c:otherwise>
								<c:set var="rand"><%=java.lang.Math.round(java.lang.Math.random() * 6)%>
								</c:set>
								<c:choose>
									<c:when test="${rand==1 }">
										<img src="http://192.168.0.75:8080/pawradise/img/0.jpg/"
											class="img-responsive" />
									</c:when>
									<c:when test="${rand==2 }">
										<img src="http://192.168.0.75:8080/pawradise/img/1.jpg/"
											class="img-responsive" />
									</c:when>
									<c:when test="${rand==3 }">
										<img src="http://192.168.0.75:8080/pawradise/img/2.jpg/"
											class="img-responsive" />
									</c:when>
									<c:when test="${rand==4 }">
										<img src="http://192.168.0.75:8080/pawradise/img/3.jpg/"
											class="img-responsive" />
									</c:when>
									<c:when test="${rand==5 }">
										<img src="http://192.168.0.75:8080/pawradise/img/4.jpg/"
											class="img-responsive" />
									</c:when>
									<c:when test="${rand==6 }">
										<img src="http://192.168.0.75:8080/pawradise/img/5.jpg/"
											class="img-responsive" />
									</c:when>
								</c:choose>
							</c:otherwise>
						</c:choose>

					</div>
					<div class="mas-blog-inner">
						<h3>
							<a href="<c:url value="/board/detail/${board.seq}"/>">${board.title}</a>
						</h3>

						<ul class="list-inline post-detail">
							<li>${board.name}님의글</li>
							<li><i class="fa fa-calendar"></i> <fmt:formatDate
									value="${board.regdate}" pattern="yyyy-MM-dd HH:mm" /></li>
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
	<div class="divide10"></div>
	<div class="container">

		<!--글쓰기버튼 -->
		<table width=100%>
			<tr>
				<td id="listtd" width=33.33%><a href="#"
					onclick="goBoardList();" class="btn btn-theme-dark btn-lg">처음
						페이지로</a>&nbsp;&nbsp; <a href="#" onclick="goMyWriter();"
					class="btn btn-theme-dark btn-lg">내 글만 보기</a>&nbsp;&nbsp;</td>
				<td width=33.33%></td>
				<td id="listtd" align=right width=33.33%><a href="#"
					onclick="goWriter();" class="btn btn-theme-dark btn-lg">글쓰기</a></td>
			</tr>
			<tr>
				<td align=center colspan="3">
					<div class="divide20"></div> <!--검색 --> <form:form
						commandName="pageMaker" id="frm">
						<input type="text" id="srch" name="srch" placeholder="검색" />
						<input type="submit" value="조회" id="boardsrchb">
						<input type="text" name="page" id="page" hidden />
						<!--검색 -->
					</form:form>
				</td>
			</tr>
		</table>

		<div class="divide20"></div>
		<ul class="pager">
			<c:if test="${pageMaker.prev}">
				<li class="previous"><a href='#'
					onclick='pageGo(${pageMaker.page-1});'>← Previous Page</a></li>
			</c:if>
			<c:choose>
				<c:when test="${pageMaker.srch==null || pageMaker.srch.equals('')}">
					<c:forEach begin="${pageMaker.start }" end="${pageMaker.end}"
						var="idx">
						<c:choose>
							<c:when test="${idx eq pagemaker.page}">
								<li
									class='<c:out value="${idx == pageMaker.page?'current':''}"/>'>
									<font style="color: red;"><a href='#'
										onclick='pageGo(${idx});'>${idx}</a></font>
								</li>
							</c:when>
							<c:otherwise>
								<li
									class='<c:out value="${idx == pageMaker.page?'current':''}"/>'>
									<a href='#' onclick='pageGo(${idx});'>${idx}</a>
								</li>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<c:forEach begin="${pageMaker.start }" end="" var="idx2">
						<li class='<c:out value="${idx2 == 1}"/>'></li>
					</c:forEach>
				</c:otherwise>
			</c:choose>
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