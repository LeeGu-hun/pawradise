<!-- 모든페이지 상단 공통 인클루드 시작-->
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!-- 헤더부분 -->
<%@ include file="/include/header.jsp"%>
<!-- 모든페이지 상단 공통 인클루드 끝 <body>태그 바로 위에 </head>태그 모두 삭제하고 넣어주세요 --> 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
        </div><!--breadcrumbs-->
	<div class="divide50"></div>

		<div class="container">

            <div class="center-heading">
                <h2>로그인</h2>
                <span class="center-line"></span>
            </div>   
            <div>
			<form:form commandName="loginCommand">
				
				<table style="margin-left: auto; margin-right: auto;">
					<tr>
						<td align="center"><label><form:input path="email" id="email" name="email" placeholder="이메일" class="form-control" type="text" /><br>
							 </label></td>
					</tr>
					
					<tr>
						<td align="center"><label><input id="password" name="password" placeholder="비밀번호" class="form-control" type="password" value=""/><br>
							 </label></td>
							 
					</tr>
					<tr align="center">
						<td align="center"><p>이메일 저장
								<input id="chkid" name="rememberEmail" type="checkbox" value="true" checked="checked"/><input type="hidden" name="rememberEmail" value="on"/>
								 </p></td>
					</tr>	
					<tr><td align="center"><form:errors /><br></td></tr>				
					<tr align="center">
						<td>
												
						<input id="loginbutton" type="submit" value="로그인">
						<input id="loginbutton" type="button" onclick="location.href='/pawradise/register/step1' " value="회원가입"></td>
					</tr>
				</table>
			</form:form>
			</div>
		</div>
<div class="divide50"></div>
<!--하단 footer부분 인클루드시작 body태그안에들어감 -->	
	<%@ include file="/include/footer2.jsp" %>
<!--하단 footer부분 인클루드 끝 body태그안에들어감-->	
</body>
</html>