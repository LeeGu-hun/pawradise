<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
 <header class="side-panel clearfix">
            <div class="container">
                <div class="pull-left">
                    <a href="index.jsp"><img src="img/logo.png" alt="logo"></a>
                </div>
                <div class="pull-right">
                    <button type="button" class="offcanvas-toggle-right navbar-toggle" data-toggle="offcanvas" data-target="#offcanvas" data-canvas="body"><i class="fa fa-bars"></i></button>
                </div>
            </div>
        </header>
        <!--offcanvas start-->

        <div class="offcanvas-container offcanvas-side-content dark-version">
            <nav id="offcanvas" class="animated navmenu navmenu-default navmenu-fixed-right offcanvas offcanvas-right" role="navigation">
                <!-- logo -->
                <div class="logo-side-nav">
                    <a href="index.jsp"><img id="logo" src="img/logo.png" alt="iDea"></a>
                </div>


                <ul class="nav metismenu" id="side-menu">
                    <li class="nav-header">
                        <div class="dropdown profile-element"> <span>
                                <img alt="image" class="img-circle" src="img/customer-1.jpg" width="60">
                            </span>
                            <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                                <span class="clearfix"> <span class="text-center" style="display: block;"> <strong>냥냥멍멍귀여워<i class="fa fa-angle-down"></i></strong>
                                    </span></span> </a>
                            <ul class="dropdown-menu animated fadeInUp">
                                <li><a href="#"><i class="pe-7s-user"></i>개인정보수정</a></li>
                                <li><a href="#"><i class="pe-7s-settings"></i>나의게시물</a></li>                          
                                <li><a href="#"><i class="pe-7s-power"></i>로그아웃</a></li>
                            </ul>
                        </div>
                    </li>

                    <li>
                        <a href="index.jsp"> Home</a>
                    </li>
                    <li>
                        <a href="#">COMMUNITY<span class=" arrow"></span></a>
                        <ul class="nav nav-second-level collapse">
                            <li><a href="boardList">포토갤러리</a></li>                       
                        </ul>
                    </li>
                    <li>
                        <a href="#">PAWRADISE<span class=" arrow"></span></a>
                        <ul class="nav nav-second-level collapse">
                            <li><a href="cat1.html">오토레이져캣</a></li>

                        </ul> 
                    </li>
                    <li>
                        <a href="#">My Page<span class=" arrow"></span></a>
                        <ul class="nav nav-second-level collapse">
                            <li><a href="/member/memberDetail.jsp">마이페이지</a></li>
                        </ul> 
                    </li>
                    <li>
                        <a href="#">About Us<span class=" arrow"></span></a>
                        <ul class="nav nav-second-level collapse">
                            <li><a href="#">제품문의</a></li>
                            <li><a href="#">제휴문의</a></li>
                        </ul>
                    </li>
                </ul>

            </nav>

        </div>
        <!-- offcanvas side end -->