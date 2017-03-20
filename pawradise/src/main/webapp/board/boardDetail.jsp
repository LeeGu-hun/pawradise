<!-- 모든페이지 상단 공통 인클루드 시작-->
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!-- 헤더부분 -->
<%@ include file="/include/header.jsp" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 모든페이지 상단 공통 인클루드 끝 <body>태그 바로 위에 </head>태그 모두 삭제하고 넣어주세요 -->
<title>게시판상세</title>
<script>
function goDelete() {
	location.href="../delete/"
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
            
		<div id="contentsBox">
			<h2>게시글 보기</h2>
			<table class="table">
				<tr>
					<td>글쓴이</td>
					<td>${board.name}</td>
				</tr>
				<tr>
					<td>제목</td>
					<td>${board.title}</td>
				</tr>
				<tr>
					<td>작성일자</td>
					<td><fmt:formatDate value="${board.regdate}"
							pattern="yyyy-MM-dd" /></td>
				</tr>
				<tr>
					<td>내용</td>
					<td><textarea path="content" id="content" name="content"
							cols="100" rows="15" class="form-control" readonly>${board.content}</textarea></td>
				</tr>
				<tr>
					<td>파일첨부</td>
					<td><c:if test="${!empty board.files}">
							<c:set var="ext" value="${fn:split(board.files, '.') }" />
							<c:choose>
								<c:when
									test="${ext[1] eq 'jpg' || ext[1] eq 'gif' ||ext[1] eq 'png'}">
									<img src='<c:url value="/" />uploads/${board.files}' width="200">
								</c:when>
							</c:choose>
							<a href='<c:url value="/" />uploads/${board.files}'>${board.files}</a>
						</c:if></td>
				</tr>
				<tr align="center" valign="middle">
					<td colspan="2"><input type="button"
						onclick="location.href='<c:url value='/boardList'/>'" value="리스트">&nbsp;&nbsp;
						<input type="button"
						onclick="location.href='<c:url value='/board/reply/${seq}' />' "
						value="답글달기">&nbsp;&nbsp; <input type="button"
						onclick="location.href='<c:url value='/board/delete/${seq}' />' "
						value="삭제하기">&nbsp;&nbsp; <input type="button"
						onclick="location.href='<c:url value='/board/update/${seq}' />' "
						value="수정하기">
				</tr>
			</table>
		</div>	
	</div>
<!--하단 footer부분 인클루드시작 body태그안에들어감 -->	
	<%@ include file="/include/footer2.jsp" %>
<!--하단 footer부분 인클루드 끝 body태그안에들어감-->		
</body>
</html>