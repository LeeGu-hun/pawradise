<!-- 모든페이지 상단 공통 인클루드 시작-->
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!-- 헤더부분 -->
<%@ include file="/include/header.jsp" %>
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
	location.href="./boardWrite"
}

function goMemList(){
	location.href="./member/list"
}
</script>

<body>
<!--항상 같이 다니는 메뉴  -->
<%@ include file="/include/topMenu.jsp" %>

<!--서브상단헤더 시작 -->
        <div class="breadcrumb-wrap">
            <div class="container">
                <div class="row">
                    <div class="col-sm-6">
                        <h4>냥냥멍멍 귀여워 </h4>
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

 	<div class="divide80"></div>
		<div class="container">

            <div class="center-heading">
                <h2>포토게시판</h2>
                <span class="center-line"></span>
            </div>    
            
			
			<form:form commandName="pageMaker" id="frm">
				<p>
				<input type="text" id="srch" name="srch" placeholder="검색" />
				<input type="submit" value="조회">
				<input type="text" name="page" id="page" hidden />
				</p>
			</form:form>
			<p>

				<input type="submit" value="글쓰기" onclick="goWriter();">
			</p>
			<c:if test="${!empty boards}">
				<table class="table">
					<tr>
						<th>글번호</th>
						<th>글제목</th>
						<th>작성일자</th>
						<th>글쓴이</th>
						<th>조회수</th>
					</tr>
					<c:forEach var="board" items="${boards}">
						<tr>
							<td>${board.seq}</td>
							<td><a href="<c:url value="/board/detail/${board.seq}"/>">${board.title}</a>
							</td>
							<td><fmt:formatDate value="${board.regdate}"
									pattern="yyyy-MM-dd" /></td>
							<td>${board.name}</td>
							<td>${board.readCount}</td>
						</tr>
					</c:forEach>
					<tr>
						<td colspan="5">
							<ul  class="pagination">
								<c:if test="${pageMaker.prev }">
									<li><input type="button" value="이전"
										onclick='pageGo(${pageMaker.page-1});' /></li>
								</c:if>
								<c:forEach begin="${pageMaker.start }" end="${pageMaker.end}"
									var="idx">
									<li	class='<c:out value="${idx == pageMaker.page?'current':''}"/>'>
										<a href='#' onclick='pageGo(${idx});'>${idx}</a>
									</li>
								</c:forEach>
								<c:if test="${pageMaker.next }">
									<li><input type="button" value="다음"
										onclick='pageGo(${pageMaker.page+1});' /></li>
								</c:if>
							</ul>
						</td>
					</tr>
				</table>

			</c:if>

	</div>
<!--하단 footer부분 인클루드시작 body태그안에들어감 -->	
	<%@ include file="/include/footer.jsp" %>
<!--하단 footer부분 인클루드 끝 body태그안에들어감-->	
</body>
</html>