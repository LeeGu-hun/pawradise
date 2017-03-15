<!-- 모든페이지 상단 공통 인클루드 시작-->
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!-- 헤더부분 -->
<%@ include file="/include/header.jsp" %>
<!-- 모든페이지 상단 공통 인클루드 끝 <body>태그 바로 위에 </head>태그 모두 삭제하고 넣어주세요 -->
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
                            <li>마이페이지</li>
                        </ol>
                    </div>
                </div>
            </div>
        </div>
<!--서브상단헤더 끝 -->

<!-- 마이페이지  -->
<div class="divide80"></div>
    <div class="container">
     <div class="center-heading">
                <h2>마이페이지</h2>
                <span class="center-line"></span>
            </div> 
     <div class="row">
            <!--개인정보 메뉴부분 -->
                <div class="col-sm-3">
                
                    <div class="sidebar-box margin40">
                        <h4>개인정보</h4>
                         <ul class="list-unstyled cat-list">
                            <li><a href="#">개인정보내역</a></li>
                            <li><a href="#">구매내역</a></li>
                            <li><a href="#">문의내역</a></li>
                        </ul>
                        <hr>
                    </div>
                    
                     <div class="sidebar-box margin40">
                        <h4> 제품 로그</h4>
                         <ul class="list-unstyled cat-list">
                            <li><a href="#">놀이로그</a></li>
                            <li><a href="#">먹이로그</a></li>
                        </ul>                   
                        <hr>
                    </div>
                                        
                </div>
               
                
           <div class="col-sm-9">
                   
               
                <h3>개인정보</h3>
                <table class="table">
				<tr><th>아이디</th><td>${member.id}</td></tr>
				<tr><th>이메일</th><td>${member.email}</td></tr>
				<tr><th>이름 </th><td>${member.name}</td></tr>
				<tr><th>가입일</th><td><fmt:formatDate value="${member.registerDate}" pattern="yyyy-MM-dd HH:mm" /></td></tr>
				<tr><td colspan="2"><a href="#" onclick="history.back();">돌아가기</a></td></tr>
				</table>
                </div>
           </div>
     </div> 
     

<div class="divide80"></div>


<!--하단 footer부분 인클루드시작 body태그안에들어감 -->	
	<%@ include file="/include/footer2.jsp" %>
<!--하단 footer부분 인클루드 끝 body태그안에들어감-->	
</body>
</html>