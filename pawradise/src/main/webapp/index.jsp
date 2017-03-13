<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>냥냥멍멍귀여워</title>
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
                            <li><a href="/member/memberDetail.jsp">마이페이지</a></li>
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

        <!--revolution slider-->
        <article>
            <div>
                <div class="tp-banner-vertical" >
                    <ul>	<!-- SLIDE  -->
                        <li data-transition="slidevertical" data-slotamount="1" data-masterspeed="1000" data-thumb="img/bg-1.jpg"  data-saveperformance="off"  data-title="Slide">
                            <!-- MAIN IMAGE -->
                            <img src="img/bg-1.jpg"  alt="fullslide1"  data-bgposition="center top" data-bgfit="cover" data-bgrepeat="no-repeat">
                            <!-- LAYERS -->

                            <!-- LAYER NR. 1 -->
                            <div class="tp-caption vertical-title lfb ltt tp-resizeme"
                                 data-x="left" data-hoffset="100"
                                 data-y="center" data-voffset="-70"
                                 data-speed="600"
                                 data-start="800"
                                 data-easing="Power4.easeOut"
                                 data-splitin="none"
                                 data-splitout="none"
                                 data-elementdelay="0.01"
                                 data-endelementdelay="0.1"
                                 data-endspeed="500"
                                 data-endeasing="Power4.easeIn"
                                 style="z-index: 2; max-width: auto; max-height: auto; white-space: nowrap;">마이펫의 사생활
                            </div>

                            <!-- LAYER NR. 2 -->
                            <div class="tp-caption vertical-caption lfb ltt tp-resizeme"
                                 data-x="left" data-hoffset="100"
                                 data-y="center" data-voffset="20"
                                 data-speed="600"
                                 data-start="900"
                                 data-easing="Power4.easeOut"
                                 data-splitin="none"
                                 data-splitout="none"
                                 data-elementdelay="0.01"
                                 data-endelementdelay="0.1"
                                 data-endspeed="500"
                                 data-endeasing="Power4.easeIn"
                                 style="z-index: 3; max-width: auto; max-height: auto; white-space: nowrap;">집에 혼자 둔 강아지는 외로움을 느낍니다.<br> 혼자 있어도 외롭지 않도록 스마트한 펫토이.
                            </div>                        
                        </li>
                        <!-- SLIDE  -->
                        <li data-transition="slidevertical" data-slotamount="1" data-masterspeed="1000" data-thumb="img/showcase-4.jpg"  data-saveperformance="off"  data-title="Slide">
                            <!-- MAIN IMAGE -->
                            <img src="img/showcase-4.jpg"  alt="fullslide1"  data-bgposition="center top" data-bgfit="cover" data-bgrepeat="no-repeat">
                            <!-- LAYERS -->

                            <!-- LAYER NR. 1 -->
                            <div class="caption modern_big_redbg sfb medium tp-resizeme"
                                 data-x="left" data-hoffset="100"
                                 data-y="center" data-voffset="-70"
                                 data-speed="600"
                                 data-start="800"
                                 data-easing="Power4.easeOut"
                                 data-splitin="none"
                                 data-splitout="none"
                                 data-elementdelay="0.01"
                                 data-endelementdelay="0.1"
                                 data-endspeed="500"
                                 data-endeasing="Power4.easeIn"
                                 style="z-index: 2; max-width: auto; max-height: auto; white-space: nowrap;">냥냥 멍멍 귀여워!
                            </div>

                            <!-- LAYER NR. 2 -->
                            <div class="tp-caption vertical-caption lfb ltt tp-resizeme"
                                 data-x="left" data-hoffset="100"
                                 data-y="center" data-voffset="20"
                                 data-speed="600"
                                 data-start="900"
                                 data-easing="Power4.easeOut"
                                 data-splitin="none"
                                 data-splitout="none"
                                 data-elementdelay="0.01"
                                 data-endelementdelay="0.1"
                                 data-endspeed="500"
                                 data-endeasing="Power4.easeIn"
                                 style="z-index: 3; max-width: auto; max-height: auto; white-space: nowrap;">내가 없을때 우리 강아지는 뭘 하고 있을까?
                                 <br>귀여운 냥이 멍이들을 위한 스마트한 장난감.
                            </div>                        
                        </li>
                        <!-- SLIDE  -->
                        <li data-transition="slidevertical" data-slotamount="1" data-masterspeed="1000" data-thumb="img/bg-2.jpg"  data-saveperformance="off"  data-title="Slide">
                            <!-- MAIN IMAGE -->
                            <img src="img/bg-2.jpg"  alt="fullslide1"  data-bgposition="center top" data-bgfit="cover" data-bgrepeat="no-repeat">
                            <!-- LAYERS -->

                            <!-- LAYER NR. 1 -->
                            <div class="tp-caption vertical-title lfb ltt tp-resizeme"
                                 data-x="left" data-hoffset="100"
                                 data-y="center" data-voffset="-70"
                                 data-speed="600"
                                 data-start="800"
                                 data-easing="Power4.easeOut"
                                 data-splitin="none"
                                 data-splitout="none"
                                 data-elementdelay="0.01"
                                 data-endelementdelay="0.1"
                                 data-endspeed="500"
                                 data-endeasing="Power4.easeIn"
                                 style="z-index: 2; max-width: auto; max-height: auto; white-space: nowrap;">혼자있을때도 외롭지 않아요!
                            </div>

                            <!-- LAYER NR. 2 -->
                            <div class="tp-caption vertical-caption lfb ltt tp-resizeme"
                                 data-x="left" data-hoffset="100"
                                 data-y="center" data-voffset="20"
                                 data-speed="600"
                                 data-start="900"
                                 data-easing="Power4.easeOut"
                                 data-splitin="none"
                                 data-splitout="none"
                                 data-elementdelay="0.01"
                                 data-endelementdelay="0.1"
                                 data-endspeed="500"
                                 data-endeasing="Power4.easeIn"
                                 style="z-index: 3; max-width: auto; max-height: auto; white-space: nowrap;">
                                 	내가 없을때 우리 강아지는 뭘 하고 있을까?
                                 <br>귀여운 냥이 멍이들을 위한 스마트한 장난감.
                            </div>                        
                        </li>

                    </ul>	
                    <div class="tp-bannertimer"></div>	
                </div>
            </div>	
        </article>		<!--revolution vertical slider end-->


        
        <div class="divide80"></div>
        <div class="full-width"> 
            <div class="cotnainer">
                <div class="center-heading">
                    <h2>So CUTE</h2>
                    <span class="center-line"></span>
                </div>
            </div>
            <ul class="filter list-inline">
                <li><a class="active" href="#" data-filter="*">Show All</a></li>
                <li><a href="#" data-filter=".photography">마이펫의사생활</a></li>
                <li><a href="#" data-filter=".illustration">도와줘요 펫</a></li>
            </ul>

            <div class="portfolio-box iso-call col-4-no-space">

                <div class="project-post photography branding">
                    <div class="img-icon">
                        <img src="img/img-1.jpg" class="img-responsive" alt="">
                        <div class="img-icon-overlay">
                            <p>
                                <a href="img/img-1.jpg" class="show-image"><i class="fa fa-eye"></i></a>
                                <a href="#"><i class="fa fa-sliders"></i></a>
                            </p>
                        </div>
                    </div> <!--img-icon-->

                </div><!--project post-->
                <div class="project-post illustration web-design">
                    <div class="img-icon">
                        <img src="img/img-2.jpg" class="img-responsive" alt="">
                        <div class="img-icon-overlay">
                            <p>
                                <a href="img/img-2.jpg" class="show-image"><i class="fa fa-eye"></i></a>
                                <a href="#"><i class="fa fa-sliders"></i></a>
                            </p>
                        </div>
                    </div> <!--img-icon-->
                </div><!--project post-->

                <div class="project-post illustration web-design">
                    <div class="img-icon">
                        <img src="img/img-3.jpg" class="img-responsive" alt="">
                        <div class="img-icon-overlay">
                            <p>
                                <a href="img/img-3.jpg" class="show-image"><i class="fa fa-eye"></i></a>
                                <a href="#"><i class="fa fa-sliders"></i></a>
                            </p>
                        </div>
                    </div> <!--img-icon-->
                </div><!--project post-->
                <div class="project-post photography web-design">
                    <div class="img-icon">
                        <img src="img/img-4.jpg" class="img-responsive" alt="">
                        <div class="img-icon-overlay">
                            <p>
                                <a href="img/img-4.jpg" class="show-image"><i class="fa fa-eye"></i></a>
                                <a href="#"><i class="fa fa-sliders"></i></a>
                            </p>
                        </div>
                    </div> <!--img-icon-->
                </div><!--project post-->

                <div class="project-post branding">
                    <div class="img-icon">
                        <img src="img/img-5.jpg" class="img-responsive" alt="">
                        <div class="img-icon-overlay">
                            <p>
                                <a href="img/img-5.jpg" class="show-image"><i class="fa fa-eye"></i></a>
                                <a href="#"><i class="fa fa-sliders"></i></a>
                            </p>
                        </div>
                    </div> <!--img-icon-->
                </div><!--project post-->
                <div class="project-post  illustration">
                    <div class="img-icon">
                        <img src="img/img-6.jpg" class="img-responsive" alt="">
                        <div class="img-icon-overlay">
                            <p>
                                <a href="img/img-6.jpg" class="show-image"><i class="fa fa-eye"></i></a>
                                <a href="#"><i class="fa fa-sliders"></i></a>
                            </p>
                        </div>
                    </div> <!--img-icon-->
                </div><!--project post-->

                <div class="project-post  branding">
                    <div class="img-icon">
                        <img src="img/img-7.jpg" class="img-responsive" alt="">
                        <div class="img-icon-overlay">
                            <p>
                                <a href="img/img-7.jpg" class="show-image"><i class="fa fa-eye"></i></a>
                                <a href="#"><i class="fa fa-sliders"></i></a>
                            </p>
                        </div>
                    </div> <!--img-icon-->
                </div><!--project post-->


                <div class="project-post   web-design">
                    <div class="img-icon">
                        <img src="img/img-8.jpg" class="img-responsive" alt="">
                        <div class="img-icon-overlay">
                            <p>
                                <a href="img/img-8.jpg" class="show-image"><i class="fa fa-eye"></i></a>
                                <a href="#"><i class="fa fa-sliders"></i></a>
                            </p>
                        </div>
                    </div> <!--img-icon-->
                </div><!--project post-->

            </div>
        </div><!--full width-->
        <div class="divide50"></div>
        <div class="text-center">
            <a href="community.jsp" class="btn btn-lg border-black">커뮤니티 전체보기</a>
        </div>
        
        <div class="divide60"></div>
        <div class="container">
            <div class="row">
                <div class="col-sm-8 col-sm-offset-2">
                    <div class="center-heading">
                        <h2>냥냥 멍멍 귀여워</h2>
                        <span class="center-line"></span>
                        <p class="sub-text margin40">
                        집에 혼자 있는 우리 냥이 멍이를 위한 모바일연동 장난감 "냥냥멍멍 귀여워" 당신이 있을때도 없을때에도 우리의 귀여운 냥이 멍이들이 외롭지 않게 배고프지 않도록 저희는 사랑으로 모든 제품을 제작합니다.
                        </p>
                    </div>
                </div>

            </div><!--center heading end-->
            <div class="divide50"></div>
            <div class="row">
                <div class="col-md-3 col-sm-6 margin30">
                    <div class="colored-boxed green">
                        <i class="fa fa-cogs"></i>
                        <h3>자동모드로 스마트한 장난감</h3>
                        <span class="center-line"></span>
                        <p>
                            피곤할땐 놀아주기도 힘들어요! 혼자서도 잘 노는 똑똑한 장난감 지금 경험 해 보세요!
                        </p>
                    </div>
                </div><!--colored boxed col end-->
                <div class="col-md-3 col-sm-6 margin30">
                    <div class="colored-boxed dark">
                        <i class="fa fa-tablet"></i>
                        <h3>모바일앱과 연동</h3>
                        <span class="center-line"></span>
                        <p>
                            집에 없을때에도 함께 노는듯한 기분을 느낄 수 있도록 모바일과 연동되어 있습니다.
                        </p>
                    </div>
                </div><!--colored boxed col end-->
                <div class="col-md-3 col-sm-6 margin30">
                    <div class="colored-boxed blue">
                        <i class="fa fa-heart"></i>
                        <h3>냥이와 멍이의 기분</h3>
                        <span class="center-line"></span>
                        <p>
                           냥이와 멍이의 기분만을 생각합니다. 사랑으로 함께 하세요! 
                        </p>
                    </div>
                </div><!--colored boxed col end-->
                <div class="col-md-3 col-sm-6 margin30">
                    <div class="colored-boxed red">
                        <i class="fa fa-sliders"></i>
                        <h3>웹사이트 연동</h3>
                        <span class="center-line"></span>
                        <p>
                           제품 로그기록을 웹과 모바일을 통해서 보실 수 있습니다.
                        </p>
                    </div>
                </div><!--colored boxed col end-->
            </div>
        </div>
        <!--services container-->
        <div class="testimonials-v-2 wow animated fadeInUp" data-wow-duration="700ms" data-wow-delay="100ms">
            <div class="container">
                <div class="row">
                    <div class="col-sm-8 col-sm-offset-2">
                        <div class="center-heading">
                            <h2>고객 상품평</h2>
                            <span class="center-line"></span>

                        </div>
                    </div>
                </div><!--center heading end-->

                <div class="row">

                    <div class="col-sm-8 col-sm-offset-2">
                        <div class="testi-slide">
                            <ul class="slides">
                                <li>
                                    <img src="img/customer-1.jpg" alt="">
                                    <p>
                                        <i class="ion-quote"></i>
                                       처음 사용해 봤는데 냥이가 너무 좋아해요! 외출했을때도 안심되고 요즘엔 같이 놀아달라고 매달리지 않아요 같이 놀아주기 모드도 있어서 집에서 놀아주기도 좋아요.
                                    </p>
                                    <h4 class="test-author">
                                      	  냥이당 
                                    </h4>
                                </li><!--testi item-->
                                <li>
                                    <img src="img/customer-2.jpg" alt="">
                                    <p>
                                        <i class="ion-quote"></i>
                                         처음 사용해 봤는데 멍이가 너무 좋아해요! 외출했을때도 안심되고 요즘엔 같이 놀아달라고 매달리지 않아요 같이 놀아주기 모드도 있어서 집에서 놀아주기도 좋아요.</p>
                                    <h4 class="test-author">
                                      	 멍멍네
                                    </h4>
                                </li><!--testi item-->
                                <li>
                                    <img src="img/customer-3.jpg" alt="">
                                    <p>
                                        <i class="ion-quote"></i>
                                         처음 사용해 봤는데 멍이가 너무 좋아해요! 외출했을때도 안심되고 요즘엔 같이 놀아달라고 매달리지 않아요 같이 놀아주기 모드도 있어서 집에서 놀아주기도 좋아요.</p>
                                    <h4 class="test-author">
                                      	 멍멍네
                                    </h4>
                                </li><!--testi item-->
                            </ul>
                        </div><!--flex slider testimonials end here-->
                    </div>
                </div><!--testi slider row end-->
                <div class="divide70"></div>
                <div class="row">
                    <div class="col-md-4 margin-btm-20">
                        <div class="quote dark">
                            <blockquote>
                                <p>
                                      처음 사용해 봤는데 냥이가 너무 좋아해요! 외출했을때도 안심되고 요즘엔 같이 놀아달라고 매달리지 않아요 같이 놀아주기 모드도 있어서 집에서 놀아주기도 좋아요.
                                    </p>
                            </blockquote>                        
                        </div>
                        <div class="quote-footer text-right">
                            <div class="quote-author-img">
                                <img src="img/customer-1.jpg" alt="">
                            </div>
                            <h4>헤헤헤</h4>
                        </div>
                    </div><!--colored quote box col-->
                    <div class="col-md-4 margin-btm-20">
                        <div class="quote green">
                            <blockquote>
                                <p>
                                      처음 사용해 봤는데 냥이가 너무 좋아해요! 외출했을때도 안심되고 요즘엔 같이 놀아달라고 매달리지 않아요 같이 놀아주기 모드도 있어서 집에서 놀아주기도 좋아요.
                                    </p>
                            </blockquote>                        
                        </div>
                        <div class="quote-footer text-right">
                            <div class="quote-author-img">
                                <img src="img/customer-2.jpg" alt="">
                            </div>
                            <h4>읍읍</h4>
                        </div>
                    </div><!--colored quote box col-->
                    <div class="col-md-4 margin-btm-20">
                        <div class="quote dark">
                            <blockquote>
                                <p>
                                   처음 사용해 봤는데 냥이가 너무 좋아해요! 외출했을때도 안심되고 요즘엔 같이 놀아달라고 매달리지 않아요 같이 놀아주기 모드도 있어서 집에서 놀아주기도 좋아요.
                                    </p>
                            </blockquote>                        
                        </div>
                        <div class="quote-footer text-right">
                            <div class="quote-author-img">
                                <img src="img/customer-3.jpg" alt="">
                            </div>
                            <h4>글쎄염</h4>
                        </div>
                    </div><!--colored quote box col-->
                </div>
            </div>
        </div><!--testimonials v-2 end-->
       
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
                                <li><a href="portfolio-single.html"><img src="img/img-1.jpg" class="img-responsive" alt=""></a></li>
                                <li><a href="portfolio-single.html"><img src="img/img-2.jpg" class="img-responsive" alt=""></a></li>
                                <li><a href="portfolio-single.html"><img src="img/img-3.jpg" class="img-responsive" alt=""></a></li>
                                <li><a href="portfolio-single.html"><img src="img/img-4.jpg" class="img-responsive" alt=""></a></li>
                                <li><a href="portfolio-single.html"><img src="img/img-5.jpg" class="img-responsive" alt=""></a></li>
                                <li><a href="portfolio-single.html"><img src="img/img-6.jpg" class="img-responsive" alt=""></a></li>
                                <li><a href="portfolio-single.html"><img src="img/img-7.jpg" class="img-responsive" alt=""></a></li>
                                <li><a href="portfolio-single.html"><img src="img/img-8.jpg" class="img-responsive" alt=""></a></li>
                                <li><a href="portfolio-single.html"><img src="img/img-9.jpg" class="img-responsive" alt=""></a></li>
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
