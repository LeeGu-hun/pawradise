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
<title>글쓰기</title>
<script>
	function addBoard() {
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
			<h2>글쓰기</h2>
			<form:form commandName="boardCommand" enctype="multipart/form-data"
				id="frm">
				<table class="table">
					<tr>
						<td>글쓴이</td>
						<td><input type="text" class="form-control" name="writer"
							size="10" maxlength="10" value="${sessionScope.authInfo.name}"
							readonly /></td>
					</tr>
					<tr>
						<td>제목</td>
						<td><form:input path="subject" size="50" maxlength="100"
								class="form-control" /> <br>
						<form:errors path="subject" /></td>
					</tr>
					<tr>
						<td>내용</td>
						<td><form:textarea path="content" id="content" cols="67"
								rows="15" class="form-control" /> <br>
						<form:errors path="content" /></td>
					</tr>
					<tr>
						<td>파일첨부</td>
						<td><form:hidden path="upDir"
								value='<%=request.getRealPath("/uploads/")%>' /> <input
							type="file" id="multiFile" name="multiFile" /></td>
					<tr align="center" valign="middle">
						<td colspan="2">
						<input type="submit" value="등록"	onclick="addBoard();" />&nbsp;&nbsp;
						<input type="button" value="취소" onclick="history.go(-1);" /></td>
					</tr>
				</table>
			</form:form>
		</div>
	</div>
</body>
</html>