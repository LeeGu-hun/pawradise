<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>글쓰기</title>
</head>
<body>
	<h2>글쓰기</h2>
	
	<table>
	<tr>
		<td>작성자</td><td>${board.writer}</td>
	</tr>
	<tr>
		<td>제목</td><td><form:input path="subject"/></td>
	</tr>
	
	<tr>
		<td>내용</td><td><form:textarea path="content"/></td>
	</tr>
	<tr>
		<td>파일</td><td><form:input path="file"/></td>
	</tr>
</table>

<input type="submit" value="등록하기" />
	
</body>
</html>