<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <!-- Bootstrap -->
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">


        <!-- font awesome for icons -->
        <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet">
        <!-- flex slider css -->
        <link href="css/flexslider.css" rel="stylesheet" type="text/css" media="screen">
        <!-- animated css  -->
        <link href="css/animate.css" rel="stylesheet" type="text/css" media="screen"> 
        <!--Revolution slider css-->
        <link href="rs-plugin/css/settings.css" rel="stylesheet" type="text/css" media="screen">
        <link href="css/rev-style.css" rel="stylesheet" type="text/css" media="screen">


        <!--jasny css-->
        <link href="css/jasny-bootstrap.min.css" rel="stylesheet">
        <!--Revolution slider css-->
        <link href="rs-plugin/css/settings.css" rel="stylesheet" type="text/css" media="screen">
        <link href="css/rev-style.css" rel="stylesheet" type="text/css" media="screen">
        <!--owl carousel css-->
        <link href="owl-carousel/assets/owl.carousel.css" rel="stylesheet" type="text/css" media="screen">
        <link href="owl-carousel/assets/owl.theme.default.css" rel="stylesheet" type="text/css" media="screen">
        <!--mega menu -->
        <link href="css/yamm.css" rel="stylesheet" type="text/css">
        <!--popups css-->
        <link href="css/magnific-popup.css" rel="stylesheet" type="text/css">
        <!-- custom css-->
        <link href="css/style.css" rel="stylesheet" type="text/css" media="screen">
        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
          <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->




    </head>
    <body class="side-panel-page">


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
                        <a href="#">펫 커뮤니티<span class=" arrow"></span></a>
                        <ul class="nav nav-second-level collapse">
                            <li><a href="mypetlife.html">마이펫의 사생활</a></li>
                            <li><a href="helpme.html">도와줘요 펫</a></li>                        
                        </ul>
                    </li>
                    <li>
                        <a href="#">제품소개<span class=" arrow"></span></a>
                        <ul class="nav nav-second-level collapse">
                            <li><a href="cat1.html">오토레이져캣</a></li>
                            <li><a href="pet1.html">모바일자동급여기</a></li>

                        </ul> 
                    </li>
                    <li>
                        <a href="#">마이페이지<span class=" arrow"></span></a>
                        <ul class="nav nav-second-level collapse">
                            <li><a href="/member/memberDetail.jsp">Blog - full width</a></li>
                        </ul> 
                    </li>
                    <li>
                        <a href="#">고객문의<span class=" arrow"></span></a>
                        <ul class="nav nav-second-level collapse">
                            <li><a href="#">제품문의</a></li>
                            <li><a href="#">제휴문의</a></li>
                        </ul>
                    </li>
                </ul>

            </nav>

        </div>
        <!-- offcanvas side end -->

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

 	<div class="divide80"></div>
        
	<div class="container">

            <div class="center-heading">
                <h2>게시판 전체보기</h2>
                <span class="center-line"></span>
            </div>   

            <ul class="filter list-inline">
                <li><a class="active" href="#" data-filter="*">Show All</a></li>
                <li><a href="#" data-filter=".photography">내새끼사진</a></li>
                <li><a href="#" data-filter=".branding">도와주세요</a></li>

            </ul>
            <div class="row">
                <div class="portfolio-box iso-call col-4-space">

                    <div class="project-post photography branding">
                        <div class="item-img-wrap ">
                            <img src="img/img-8.jpg" class="img-responsive" alt="workimg">
                            <div class="item-img-overlay">
                                <a href="img/img-8.jpg" class="show-image">
                                    <span></span>
                                </a>
                            </div>
                        </div> 
                        <div class="work-desc"> <h3><a href="<c:url value='/boardList'/>">울애기오늘 신나요</a></h3>
                            <span>냥이엄마</span>
                        </div><!--work desc-->
                    </div><!--project post-->
                    <div class="project-post illustration web-design">
                        <div class="item-img-wrap ">
                            <img src="img/mas-1.jpg" class="img-responsive" alt="workimg">
                            <div class="item-img-overlay">
                                <a href="img/mas-1.jpg" class="show-image">
                                    <span></span>
                                </a>
                            </div>
                        </div> 
                        <div class="work-desc"> <h3><a href="<c:url value='/boardList'/>">울애기오늘 신나요</a></h3>
                            <span>냥이엄마</span>
                        </div><!--work desc-->
                    </div><!--project post-->

                    <div class="project-post illustration web-design">
                        <div class="item-img-wrap ">
                            <img src="img/img-3.jpg" class="img-responsive" alt="workimg">
                            <div class="item-img-overlay">
                                <a href="img/img-3.jpg" class="show-image">
                                    <span></span>
                                </a>
                            </div>
                        </div> 
                        <div class="work-desc">
                            <h3><a href="<c:url value='/boardList'/>">울애기 오늘기분</a></h3>
                            <span>넘나 신나는것</span>
                        </div><!--work desc-->
                    </div><!--project post-->
                    <div class="project-post photography web-design">
                        <div class="item-img-wrap ">
                            <img src="img/img-4.jpg" class="img-responsive" alt="workimg">
                            <div class="item-img-overlay">
                                <a href="img/img-4.jpg" class="show-image">
                                    <span></span>
                                </a>
                            </div>
                        </div> 
                        <div class="work-desc">
                            <h3><a href="<c:url value='/boardList'/>">울애기 오늘기분</a></h3>
                            <span>넘나 신나는것</span>
                        </div><!--work desc-->
                    </div><!--project post-->

                    <div class="project-post branding">
                        <div class="item-img-wrap ">
                            <img src="img/img-5.jpg" class="img-responsive" alt="workimg">
                            <div class="item-img-overlay">
                                <a href="img/img-5.jpg" class="show-image">
                                    <span></span>
                                </a>
                            </div>
                        </div> 
                        <div class="work-desc">
                            <h3><a href="<c:url value='/boardList'/>">울애기 오늘기분</a></h3>
                            <span>넘나 신나는것</span>
                        </div><!--work desc-->
                    </div><!--project post-->
                    <div class="project-post  illustration">
                        <div class="item-img-wrap ">
                            <img src="img/img-6.jpg" class="img-responsive" alt="workimg">
                            <div class="item-img-overlay">
                                <a href="img/img-6.jpg" class="show-image">
                                    <span></span>
                                </a>
                            </div>
                        </div> 
                        <div class="work-desc">
                            <h3><a href="<c:url value='/boardList'/>">울애기 오늘기분</a></h3>
                            <span>넘나 신나는것</span>
                        </div><!--work desc-->
                    </div><!--project post-->

                    <div class="project-post  branding">
                        <div class="item-img-wrap ">
                            <img src="img/mas-1.jpg" class="img-responsive" alt="workimg">
                            <div class="item-img-overlay">
                                <a href="img/mas-1.jpg" class="show-image">
                                    <span></span>
                                </a>
                            </div>
                        </div> 
                        <div class="work-desc">
                            <h3><a href="<c:url value='/boardList'/>">울애기 오늘기분</a></h3>
                            <span>넘나 신나는것</span>
                        </div><!--work desc-->
                    </div><!--project post-->


                    <div class="project-post branding">
                        <div class="item-img-wrap ">
                            <img src="img/mas-2.jpg" class="img-responsive" alt="workimg">
                            <div class="item-img-overlay">
                                <a href="img/mas-2.jpg" class="show-image">
                                    <span></span>
                                </a>
                            </div>
                        </div> 
                        <div class="work-desc">
                            <h3><a href="<c:url value='/boardList'/>">울애기 오늘기분</a></h3>
                            <span>넘나 신나는것</span>
                        </div><!--work desc-->
                    </div><!--project post-->

                    <div class="project-post  branding">
                        <div class="item-img-wrap ">
                            <img src="img/img-2.jpg" class="img-responsive" alt="workimg">
                            <div class="item-img-overlay">
                                <a href="img/img-2.jpg" class="show-image">
                                    <span></span>
                                </a>
                            </div>
                        </div> 
                        <div class="work-desc">
                            <h3><a href="<c:url value='/boardList'/>">울애기 오늘기분</a></h3>
                            <span>넘나 신나는것</span>
                        </div><!--work desc-->
                    </div><!--project post-->
                     <div class="project-post  illustration">
                        <div class="item-img-wrap ">
                            <img src="img/img-1.jpg" class="img-responsive" alt="workimg">
                            <div class="item-img-overlay">
                                <a href="img/img-1.jpg" class="show-image">
                                    <span></span>
                                </a>
                            </div>
                        </div> 
                        <div class="work-desc">
                            <h3><a href="<c:url value='/boardList'/>">울애기 오늘기분</a></h3>
                            <span>넘나 신나는것</span>
                        </div><!--work desc-->
                    </div><!--project post-->
                      <div class="project-post  photography">
                        <div class="item-img-wrap ">
                            <img src="img/img-9.jpg" class="img-responsive" alt="workimg">
                            <div class="item-img-overlay">
                                <a href="img/img-9.jpg" class="show-image">
                                    <span></span>
                                </a>
                            </div>
                        </div> 
                        <div class="work-desc">
                            <h3><a href="<c:url value='/boardList'/>">울애기 오늘기분</a></h3>
                            <span>넘나 신나는것</span>
                        </div><!--work desc-->
                    </div><!--project post-->
                    <div class="project-post  photography">
                        <div class="item-img-wrap ">
                            <img src="img/img-3.jpg" class="img-responsive" alt="workimg">
                            <div class="item-img-overlay">
                                <a href="img/img-3.jpg" class="show-image">
                                    <span></span>
                                </a>
                            </div>
                        </div> 
                        <div class="work-desc">
                            <h3><a href="<c:url value='/boardList'/>">울애기 오늘기분</a></h3>
                            <span>넘나 신나는것</span>
                        </div><!--work desc-->
                    </div><!--project post-->
                     <div class="project-post  web-design">
                        <div class="item-img-wrap ">
                            <img src="img/img-7.jpg" class="img-responsive" alt="workimg">
                            <div class="item-img-overlay">
                                <a href="img/img-7.jpg" class="show-image">
                                    <span></span>
                                </a>
                            </div>
                        </div> 
                        <div class="work-desc">
                            <h3><a href="<c:url value='/boardList'/>">울애기 오늘기분</a></h3>
                            <span>넘나 신나는것</span>
                        </div><!--work desc-->
                    </div><!--project post-->
                       <div class="project-post  branding">
                        <div class="item-img-wrap ">
                            <img src="img/img-4.jpg" class="img-responsive" alt="workimg">
                            <div class="item-img-overlay">
                                <a href="img/img-4.jpg" class="show-image">
                                    <span></span>
                                </a>
                            </div>
                        </div> 
                        <div class="work-desc">
                            <h3><a href="<c:url value='/boardList'/>">울애기 오늘기분</a></h3>
                            <span>넘나 신나는것</span>
                        </div><!--work desc-->
                    </div><!--project post-->
                </div>
            </div>
        </div>
       
        <footer id="footer">
            <div class="container">

                <div class="row">
                    <div class="col-md-3 col-sm-6 margin30">
                        <div class="footer-col">
                            <h3>About Company</h3>
                            <p>
                                Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer lorem quam, adipiscing condimentum tristique vel, eleifend sed turpis. Pellentesque cursus arcu id magna euismod in elementum purus molestie.
                            </p>
                            <ul class="list-inline social-1">
                                <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                                <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                                <li><a href="#"><i class="fa fa-google-plus"></i></a></li>
                                <li><a href="#"><i class="fa fa-pinterest"></i></a></li>
                                <li><a href="#"><i class="fa fa-dribbble"></i></a></li>
                            </ul>
                        </div>                        
                    </div><!--footer col-->
                    <div class="col-md-3 col-sm-6 margin30">
                        <div class="footer-col">
                            <h3>Contact</h3>

                            <ul class="list-unstyled contact">
                                <li><p><strong><i class="fa fa-map-marker"></i> Address:</strong> Busan Korea</p></li> 
                                <li><p><strong><i class="fa fa-envelope"></i> Mail Us:</strong> <a href="#">Support@nyangmung.com</a></p></li>
                                <li> <p><strong><i class="fa fa-phone"></i> Phone:</strong> +82 010 1234 5678</p></li>
                                <li> <p><strong><i class="fa fa-print"></i> Fax</strong> 1800 2345 2132</p></li>

                            </ul>
                        </div>                        
                    </div><!--footer col-->
                    <div class="col-md-3 col-sm-6 margin30">
                        <div class="footer-col">
                            <h3>Community</h3>
                            <ul class="list-inline f2-work">
                                <li><a href="<c:url value='/boardList'/>"><img src="img/img-1.jpg" class="img-responsive" alt=""></a></li>
                                <li><a href="<c:url value='/boardList'/>"><img src="img/img-2.jpg" class="img-responsive" alt=""></a></li>
                                <li><a href="<c:url value='/boardList'/>"><img src="img/img-3.jpg" class="img-responsive" alt=""></a></li>
                                <li><a href="<c:url value='/boardList'/>"><img src="img/img-4.jpg" class="img-responsive" alt=""></a></li>
                                <li><a href="<c:url value='/boardList'/>"><img src="img/img-5.jpg" class="img-responsive" alt=""></a></li>
                                <li><a href="<c:url value='/boardList'/>"><img src="img/img-6.jpg" class="img-responsive" alt=""></a></li>
                                <li><a href="<c:url value='/boardList'/>"><img src="img/img-7.jpg" class="img-responsive" alt=""></a></li>
                                <li><a href="<c:url value='/boardList'/>"><img src="img/img-8.jpg" class="img-responsive" alt=""></a></li>
                                <li><a href="<c:url value='/boardList'/>"><img src="img/img-9.jpg" class="img-responsive" alt=""></a></li>
                            </ul>
                        </div>                        
                    </div><!--footer col-->
                    <div class="col-md-3 col-sm-6 margin30">
                        <div class="footer-col">
                            <h3>Newsletter</h3>
                            <p>
                                Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer lorem quam, 
                            </p>
                            <form role="form" class="subscribe-form">
                                <div class="input-group">
                                    <input type="text" class="form-control" placeholder="Enter email to subscribe">
                                    <span class="input-group-btn">
                                        <button class="btn  btn-theme-dark btn-lg" type="submit">Ok</button>
                                    </span>
                                </div>
                            </form>
                        </div>                        
                    </div><!--footer col-->

                </div>
                <div class="row">
                    <div class="col-md-12 text-center">
                        <div class="footer-btm">
                            <span>&copy;2017 copyright by SoCute</span>
                        </div>
                    </div>
                </div>
            </div>
        </footer><!--default footer end here-->
        <!--scripts and plugins -->
        <!--must need plugin jquery-->
        <script src="js/jquery.min.js"></script>
        <script src="js/jquery-migrate.min.js"></script> 
        <!--bootstrap js plugin-->
        <script src="bootstrap/js/bootstrap.min.js" type="text/javascript"></script>       
        <!--easing plugin for smooth scroll-->
        <script src="js/jquery.easing.1.3.min.js" type="text/javascript"></script>
        <!--sticky header-->
        <script type="text/javascript" src="js/jquery.sticky.js"></script>
        <!--flex slider plugin-->
        <script src="js/jquery.flexslider-min.js" type="text/javascript"></script>
        <!--parallax background plugin-->
        <script src="js/jquery.stellar.min.js" type="text/javascript"></script>
        <!--digit countdown plugin-->
        <script src="js/waypoints.min.js"></script>
        <!--digit countdown plugin-->
        <script src="js/jquery.counterup.min.js" type="text/javascript"></script>
        <!--on scroll animation-->
        <script src="js/wow.min.js" type="text/javascript"></script> 

        <script src="js/jquery.isotope.min.js" type="text/javascript"></script>
        <!--image loads plugin -->
        <script src="js/jquery.imagesloaded.min.js" type="text/javascript"></script>
        <!--owl carousel slider-->
        <script src="owl-carousel/owl.carousel.min.js" type="text/javascript"></script>
        <!--popup js-->
        <script src="js/jquery.magnific-popup.min.js" type="text/javascript"></script>
        
                
        <!--customizable plugin edit according to your needs-->
        <script src="js/custom.js" type="text/javascript"></script>

        <!--revolution slider plugins-->
        <script src="rs-plugin/js/jquery.themepunch.tools.min.js" type="text/javascript"></script>
        <script src="rs-plugin/js/jquery.themepunch.revolution.min.js" type="text/javascript"></script>
        <script src="js/revolution-custom.js" type="text/javascript"></script>
        <script src="js/isotope-custom.js" type="text/javascript"></script>
        <!--revolution slider plugins-->
        <script src="rs-plugin/js/jquery.themepunch.tools.min.js" type="text/javascript"></script>
        <script src="rs-plugin/js/jquery.themepunch.revolution.min.js" type="text/javascript"></script>
        <script src="js/revolution-custom.js" type="text/javascript"></script>

        <!-- Jasny Bootstrap -->
        <script type="text/javascript" src="js/jquery.metisMenu.js"></script>
        <script type="text/javascript" src="js/jasny-bootstrap.min.js"></script>
        <script type="text/javascript">



            // MetsiMenu
            $('#side-menu').metisMenu();
        </script>
    </body>
</html>
