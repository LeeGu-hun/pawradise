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
<title><spring:message code="member.search" /></title>
<link rel="stylesheet" href=" ${pageContext.request.contextPath}/resources/css/style.css?ver=1" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" media="all" />
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js" type="text/javascript"></script>
<script>
$(function() {
  $( "#from, #to" ).datepicker({
    dateFormat: 'yymmdd',
    prevText: '이전 달',
    nextText: '다음 달',
    monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
    monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
    dayNames: ['일','월','화','수','목','금','토'],
    dayNamesShort: ['일','월','화','수','목','금','토'],
    dayNamesMin: ['일','월','화','수','목','금','토'],
    showMonthAfterYear: true,
    yearSuffix: '년'
  });
});
function pageGo(page) {
	document.getElementById("page").value = page;
	document.getElementById("frm").submit();
}
function goBoard(){
	location.href = "<c:url value='/boardList' />";
}
</script>
<style>
	ul{list-style: none;}
	li{float: left;margin-right: 15px;}
</style>
</head>
<body>

<div id="maincontainer">
	<div id="contentsBox">
	<h2>관리자페이지-회원검색</h2>
	<form:form commandName="pageMaker" id="frm">
		<p>
			<label>from:
			<input type="text" name="from" id="from" value="${from }" />
			</label>
			~ <label>to: 
			<input type="text" name="to" id="to" value="${to }" />
			</label>
			<input type="submit" value="조회">
			<input type="button" value="게시판 가기" onclick="goBoard();">
			<form:hidden path="page" id="page" />
		</p>
	</form:form>
	
	<c:if test="${! empty members}">
		<table class="table">
			<tr>
				<th>아이디</th>
				<th>이메일</th>
				<th>이름</th>
				<th>가입일</th>
			</tr>
			<c:forEach var="mem" items="${members}">
				<tr>
					<td>${mem.id}</td>
					<td><a href="<c:url value="/member/detail/${mem.id}"/>">
							${mem.email}</a></td>
					<td>${mem.name}</td>
					<td><fmt:formatDate value="${mem.registerDate}"
							pattern="yyyy-MM-dd" /></td>
				</tr>
			</c:forEach>
			<tr>
				<td colspan="4">
					<ul class="pageUL">
						<c:if test="${pageMaker.prev }">
							<li><a href='#' onclick='pageGo(${pageMaker.page-1});'>이전</a></li>
						</c:if>
						<c:forEach begin="${pageMaker.start }" end="${pageMaker.end}"
							var="idx">
							<li class='<c:out value="${idx == pageMaker.page?'current':''}"/>'>
								<a href='#' onclick='pageGo(${idx});'>${idx}</a>
							</li>
						</c:forEach>
						<c:if test="${pageMaker.next }">
							<li><a href='#' onclick='pageGo(${pageMaker.page+1});'>다음</a></li>
						</c:if>
					</ul>
				</td>
			</tr>
		</table>
	</c:if>
	</div>
</div>
</body>
</html>