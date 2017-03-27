<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page session="true" %>
 <header class="side-panel clearfix">
            <div class="container">
                <div class="pull-left">
                    <a href="<%=request.getContextPath() %>/index.jsp"><img src="<%=request.getContextPath() %>/img/logo.png" alt="logo"></a>
                </div>
                <div class="pull-right">
                    <button type="button" class="offcanvas-toggle-right navbar-toggle" data-toggle="offcanvas" data-target="#offcanvas" data-canvas="body"><i class="fa fa-bars"></i></button>
                </div>
            </div>
        </header>
        <!-- 메뉴 -->

        <div class="offcanvas-container offcanvas-side-content dark-version">
            <nav id="offcanvas" class="animated navmenu navmenu-default navmenu-fixed-right offcanvas offcanvas-right" role="navigation">
                <!-- logo -->
                <div class="logo-side-nav">
                    <a href="<%=request.getContextPath() %>/index.jsp"><img id="logo" src="<%=request.getContextPath() %>/img/logo.png" alt="iDea"></a>
                </div>
                <input type="text" name="member" id="member" hidden />
                
                <ul class="nav metismenu" id="side-menu">
                    <li class="nav-header">
                    <c:if test="${!empty sessionScope.authInfo.userNum}">
                        <div class="dropdown profile-element" align="center">
 							<strong>${sessionScope.authInfo.name }님 안녕하세요</strong><br><br>
 							<a href="#" onclick="location.href='<%=request.getContextPath() %>/logout'"  
 							class="btn border-theme btn-sm">로그아웃</a>                      
                          
                        </div>
                     </c:if>
                      <c:if test="${empty sessionScope.authInfo.userNum}">
						<div class="nav-header"> <p align="center">
                            <a href="#" onclick="location.href='<%=request.getContextPath() %>/login'" class="btn border-theme btn-sm">로그인</a>
                            <a href="<%=request.getContextPath() %>/register/step1" class="btn btn-theme-dark btn-sm">회원가입</a>
                            </p>
                        </div>
                       </c:if> 
                    </li>
				
                    <li>
                        <a href="<%=request.getContextPath() %>/index.jsp"> Home</a>
                    </li>
                    <li>
                        <a href="#">COMMUNITY<span class=" arrow"></span></a>
                        <ul class="nav nav-second-level collapse">
                            <li><a href="<%=request.getContextPath() %>/boardList">포토갤러리</a></li>                       
                        </ul>
                    </li>
                    <li>
                        <a href="#">PAWRADISE<span class=" arrow"></span></a>
                        <ul class="nav nav-second-level collapse">
                            <li><a href="<%=request.getContextPath() %>/runPaw/pawDown.jsp">PAWRADISE</a></li>

                        </ul> 
                    </li>
                    <li>
                        <a href="#">My Page<span class=" arrow"></span></a>
                        <ul class="nav nav-second-level collapse">
                            <li><a href="<c:url value="/mypage/mypage/${sessionScope.authInfo.userNum}"/>">마이페이지</a></li>
                        </ul> 
                    </li>
                    <li>
                        <a href="#">About Us<span class=" arrow"></span></a>
                        <ul class="nav nav-second-level collapse">
                            <li><a href="<%=request.getContextPath() %>/aboutUs/introduceUs.jsp">회사소개</a></li>
                            <li><a href="#">제품문의</a></li>
                        </ul>
                    </li>
                </ul>

            </nav>

        </div>
        <!-- offcanvas side end -->