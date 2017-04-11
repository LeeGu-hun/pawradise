<!-- 모든페이지 상단 공통 인클루드 시작-->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!-- 헤더부분 -->
<%@ include file="/include/header.jsp"%>
<!-- 모든페이지 상단 공통 인클루드 끝 <body>태그 바로 위에 </head>태그 모두 삭제하고 넣어주세요 -->

<script type="text/javascript">
	function checkIt() {
		var pw = document.getElementById("password");
		var em = document.getElementById("email");
		if (em.value = "") {
			alert("암호를 입력하세요");
		} else if (pw.vlaue = "") {
			alert("이메일을 입력하세요");
		}
	}
	function sendDel() {
		var pw = document.getElementById("pw");
		var rePw = document.getElementById("rePw");
		if (pw.value == "") {
			alert("비밀번호를 입력하세요");
			return;
		} 
		if (rePw.value == "") {
			alert("비밀번호 확인을 입력하세요");
			return;
		}
		if(pw.value != rePw.value){
			alert("비밀번호와 비밀번호 확인을 확인해주세요");
			return;
		}
		document.getElementById('frm').submit();
	}
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
						<li>냥냥멍멍귀여워</li>
					</ol>
				</div>
			</div>
		</div>
	</div>
	<!--breadcrumbs-->
	<div class="divide50"></div>
	<div class="passconf">

		<div class="center-heading">
			<h2>탈퇴</h2>
			<span class="center-line"></span>
		</div>
		<h5>※ 탈퇴할 경우 회원관련 데이터가 복구되지 않습니다. 정말로 탈퇴하시겠습니까?</h5>
		<div class="divide20"></div>
		<form:form id="frm">
			<table class="passconf2">
				<tr>
					<td ><label id="mempw"><input id="pw" name="pw"
							placeholder="비밀번호" class="form-control" type="password" /></label></td>
				</tr>
				<tr>
					<td ><label id="mempw"><input id="rePw" name="rePw"
							placeholder="비밀번호확인" class="form-control" type="password" /></label></td>
				</tr>
				<tr>
				<td><input type="button" id="loginbutton" onclick="sendDel();"value="탈퇴완료"></td>
				</tr>
			</table>
		</form:form>
	</div>
	<div class="divide50"></div>
	<!--하단 footer부분 인클루드시작 body태그안에들어감 -->
	<%@ include file="/include/footer2.jsp"%>
	<!--하단 footer부분 인클루드 끝 body태그안에들어감-->
</body>
</html>