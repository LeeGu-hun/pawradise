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
<script>
	function chgPwd() {
		var currentPassword = document.getElementById("currentPassword");
		var newPassword = document.getElementById("newPassword");

		if (currentPassword.value == "") {
			alert("비밀번호를 입력하세요.");
			return;
		}
		if (newPassword.value == "") {
			alert("새로운 비밀번호를 입력하세요.");
			return;
		}
		if (currentPassword.value == "" || newPassword.value == "") {
			alert("비밀번호와 새로운 비밀번호를 입력하세요.");
			return;
		}
		document.getElementById("frm").submit();
	}
</script>

<body>
	<!--항상 같이 다니는 메뉴  -->
	<%@ include file="/include/topMenu.jsp"%>

	<!-- 서브상단헤더 -->
	<%@ include file="/include/topBanner.jsp"%>
	
	<!-- 마이페이지  -->
	<div class="divide80"></div>
	<div class="container">
		<div class="center-heading">
			<h2>비밀번호 변경</h2>
			<span class="center-line"></span>
		</div>
		<div class="row">

			<div>
				<form:form id="frm" commandName="changePwdCommand">
					<table class="memmodi" align=center>
						<tr class="modibottom">
							<td class="var2"></td>
							<td class="mpinfo"><input type="password" placeholder="비밀번호"
								name="currentPassword" id="currentPassword" size="50" /></td>
						</tr>
						<tr class="modibottom">
							<td class="var2"></td>
							<td class="mpinfo">
								<div class="divide10"></div> <input type="password"
								placeholder="새 비밀번호" name="newPassword" id="newPassword"
								size="50" />
							</td>
						</tr>
						<tr>
							<td><input type="hidden" id="userNum" name="userNum"
								value="${sessionScope.authInfo.userNum}"></td>
						</tr>

						<tr>
							<td colspan="2">
								<div class="mptab" align="center">
									<div class="divide30"></div>
									<input type="button" value="변경하기" id="loginbutton"
										onclick="chgPwd();">
								</div>
							</td>
						</tr>
					</table>
				</form:form>
			</div>
			<div class="divide30"></div>
		</div>

	</div>

	<div class="divide50"></div>
	<!--하단 footer부분 인클루드시작 body태그안에들어감 -->
	<%@ include file="/include/footer2.jsp"%>
	<!--하단 footer부분 인클루드 끝 body태그안에들어감-->
</body>
</html>