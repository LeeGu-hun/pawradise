<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title><spring:message code="login.title" /></title>
<link rel="stylesheet"
	href=" ${pageContext.request.contextPath}/resources/css/style.css?ver=1" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
</head>
<body>
	<div id="container">
		<div id="loginframe">
			<h2>
				<spring:message code="login.title" />
			</h2>
			<form:form commandName="loginCommand">
				<form:errors />
				<table>
					<tr>
						<td><label><form:input path="email" placeholder="이메일"
									class="form-control" /><br>
							<form:errors path="email" /> </label></td>
					</tr>
					<tr>
						<td><label><form:password path="password"
									placeholder="비밀번호" class="form-control" /><br>
							<form:errors path="password" /> </label></td>
					</tr>
					<tr>
						<td><label><spring:message code="rememberEmail" />:
								<form:checkbox path="rememberEmail" /> <form:errors
									path="rememberEmail" /> </label></td>
					</tr>
					<tr>
						<td><input id="loginbutton" type="submit" value="로그인">
							<input id="loginbutton" type="button"
							onclick="location.href='<c:url value='/register/step1' />' "
							value="회원가입"></td>
					</tr>
				</table>
			</form:form>
		</div>
	</div>
</body>
</html>