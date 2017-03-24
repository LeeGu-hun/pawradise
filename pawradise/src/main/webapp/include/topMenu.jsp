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
                <input type="text" name="members" id="members" hidden />
                
                <ul class="nav metismenu" id="side-menu">
                    <li class="nav-header">
                    <c:if test="${! empty members}">
                        <div class="dropdown profile-element"> <span>
                                <img alt="image" class="img-circle" src="<%=request.getContextPath() %>/img/customer-1.jpg" width="60">
                            </span>
                            <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                                <span class="clearfix"> <span class="text-center" style="display: block;">
								<strong>냥냥멍멍귀여워<i class="fa fa-angle-down"></i></strong>
                                    </span></span> </a>
                            <ul class="dropdown-menu animated fadeInUp">
                                <li><a href="#"><i class="pe-7s-user"></i>개인정보수정</a></li>
                                <li><a href="#"><i class="pe-7s-settings"></i>나의게시물</a></li>                          
                                <li><a href="#"><i class="pe-7s-power"></i>로그아웃</a></li>
                            </ul>
                        </div>
                     </c:if> 
						<div class="nav-header"> <p align="center">
                            <a href="#" onclick="location.href='<%=request.getContextPath() %>/login'" class="btn border-theme btn-sm">로그인</a>
                            <a href="<%=request.getContextPath() %>/register/step1" class="btn btn-theme-dark btn-sm">회원가입</a>
                            </p>
                        </div>
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
                            <li><a href="<c:url value="/member/detail/${member.userNum}"/>">마이페이지</a></li>
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