<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상세보기</title>
<script>
function goDelete() {
	location.href="../delete/"
}
</script>
<link rel="stylesheet"
	href=" ${pageContext.request.contextPath}/resources/css/style.css?ver=1" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
</head>
<body>
	<div id="maincontainer">
		<div id="contentsBox">
			<h2>게시글 보기</h2>
			<table class="table">
				<tr>
					<td>글쓴이</td>
					<td>${board.writer}</td>
				</tr>
				<tr>
					<td>제목</td>
					<td>${board.subject}</td>
				</tr>
				<tr>
					<td>작성일자</td>
					<td><fmt:formatDate value="${board.regDate}"
							pattern="yyyy-MM-dd" /></td>
				</tr>
				<tr>
					<td>내용</td>
					<td><textarea path="content" id="content" name="content"
							cols="100" rows="15" class="form-control" readonly>${board.content}</textarea></td>
				</tr>
				<tr>
					<td>파일첨부</td>
					<td><c:if test="${!empty board.file}">
							<c:set var="ext" value="${fn:split(board.file, '.') }" />
							<c:choose>
								<c:when
									test="${ext[1] eq 'jpg' || ext[1] eq 'gif' ||ext[1] eq 'png'}">
									<img src='<c:url value="/" />uploads/${board.file}' width="200">
								</c:when>
							</c:choose>
							<a href='<c:url value="/" />uploads/${board.file}'>${board.file}</a>
						</c:if></td>
				</tr>
				<tr align="center" valign="middle">
					<td colspan="2"><input type="button"
						onclick="location.href='<c:url value='/boardList'/>'" value="리스트">&nbsp;&nbsp;
						<input type="button"
						onclick="location.href='<c:url value='/board/reply/${num}' />' "
						value="답글달기">&nbsp;&nbsp; <input type="button"
						onclick="location.href='<c:url value='/board/delete/${num}' />' "
						value="삭제하기">&nbsp;&nbsp; <input type="button"
						onclick="location.href='<c:url value='/board/update/${num}' />' "
						value="수정하기">
				</tr>
			</table>
		</div>
	</div>
</body>
</html>