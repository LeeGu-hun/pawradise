<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>원글에 댓글달기</title>
<script>
function replyOk(){
	document.getElementById("frm").submit();

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
			<h2>글수정하기</h2>
			<form:form commandName="board" id="frm">
				<table class="table">
					<tr>
						<td>글쓴이</td>
						<td><input type="text" name="writer" size="10" maxlength="10"
							class="form-control" value="${sessionScope.authInfo.name}"
							readonly /> <input type="text" name="re_ref"
							value="${board.re_ref }" hidden /> <input type="text"
							name="re_lev" value="${board.re_lev }" hidden /> <input
							type="text" name="re_seq" value="${board.re_seq }" hidden /></td>
					</tr>
					<tr>
						<td>제목</td>
						<td><input type="text" path="subject" name="subject"
							value="re: ${board.subject}" size="50" maxlength="100"
							class="form-control" /> <br> <form:errors path="subject" /></td>
					</tr>
					<tr>
						<td>내용</td>
						<td><textarea path="content" id="content" name="content"
								cols="67" rows="15" class="form-control">원글 :${board.content}</textarea>
							<br> <form:errors path="content" /></td>
					</tr>
					<tr>
						<td>파일첨부</td>
						<td></td>
					<tr align="center" valign="middle">
						<td colspan="2"><input type="submit" onclick="replyOk();"
							value="답변하기"> <input type="button" value="취소"
							onclick="location.href='<c:url value='/board/detail/${num}'/>'" /></td>
					</tr>
				</table>
			</form:form>
		</div>
	</div>
</body>
</html>