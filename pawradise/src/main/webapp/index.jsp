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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<body class="side-panel-page">
	<!--항상 같이 다니는 메뉴 로고포함 시작 -->
	<%@ include file="/include/topMenu.jsp"%>
	<!--항상 같이 다니는 메뉴 로고포함  시작 -->
	<!--메인배너시작 -->
	<article>
		<div>
			<div class="tp-banner-vertical">
				<ul>
					<!-- SLIDE  -->
					<li data-transition="slidevertical" data-slotamount="1"
						data-masterspeed="1000" data-thumb="img/bg-1.jpg"
						data-saveperformance="off" data-title="Slide">
						<!-- MAIN IMAGE --> <img src="img/bg-1.jpg" alt="fullslide1"
						data-bgposition="center top" data-bgfit="cover"
						data-bgrepeat="no-repeat"> <!-- LAYERS --> <!-- LAYER NR. 1 -->
						<div class="tp-caption vertical-title lfb ltt tp-resizeme"
							data-x="left" data-hoffset="100" data-y="center"
							data-voffset="-70" data-speed="600" data-start="800"
							data-easing="Power4.easeOut" data-splitin="none"
							data-splitout="none" data-elementdelay="0.01"
							data-endelementdelay="0.1" data-endspeed="500"
							data-endeasing="Power4.easeIn"
							style="z-index: 2; max-width: auto; max-height: auto; white-space: nowrap;">이젠 더이상 외롭지 않아요!
							</div> <!-- LAYER NR. 2 -->
						<div class="tp-caption vertical-caption lfb ltt tp-resizeme"
							data-x="left" data-hoffset="100" data-y="center"
							data-voffset="20" data-speed="600" data-start="900"
							data-easing="Power4.easeOut" data-splitin="none"
							data-splitout="none" data-elementdelay="0.01"
							data-endelementdelay="0.1" data-endspeed="500"
							data-endeasing="Power4.easeIn"
							style="z-index: 3; max-width: auto; max-height: auto; white-space: nowrap;">
							집에 홀로 남겨진 우리 강아지, <br> 혼자 있어도 외롭지 않도록 PAWRADISE!
						</div>
					</li>
					<!-- SLIDE  -->
					<li data-transition="slidevertical" data-slotamount="1"
						data-masterspeed="1000" data-thumb="img/showcase-4.jpg"
						data-saveperformance="off" data-title="Slide">
						<!-- MAIN IMAGE --> <img src="img/showcase-4.jpg" alt="fullslide1"
						data-bgposition="center top" data-bgfit="cover"
						data-bgrepeat="no-repeat"> <!-- LAYERS --> <!-- LAYER NR. 1 -->
						<div class="caption modern_big_redbg sfb medium tp-resizeme"
							data-x="left" data-hoffset="100" data-y="center"
							data-voffset="-70" data-speed="600" data-start="800"
							data-easing="Power4.easeOut" data-splitin="none"
							data-splitout="none" data-elementdelay="0.01"
							data-endelementdelay="0.1" data-endspeed="500"
							data-endeasing="Power4.easeIn"
							style="z-index: 2; max-width: auto; max-height: auto; white-space: nowrap;">
							엄마 아빠, 빨리 와서 놀아주세요!
							</div> <!-- LAYER NR. 2 -->
						<div class="tp-caption vertical-caption lfb ltt tp-resizeme"
							data-x="left" data-hoffset="100" data-y="center"
							data-voffset="20" data-speed="600" data-start="900"
							data-easing="Power4.easeOut" data-splitin="none"
							data-splitout="none" data-elementdelay="0.01"
							data-endelementdelay="0.1" data-endspeed="500"
							data-endeasing="Power4.easeIn"
							style="z-index: 3; max-width: auto; max-height: auto; white-space: nowrap;">
							내가 없을 때 우리 강아지는 뭘 하고 있을까? <br>귀여운 냥이 멍이들을 위한 스마트한 장난감, PAWRADISE!
						</div>
					</li>
					<!-- SLIDE  -->
					<li data-transition="slidevertical" data-slotamount="1"
						data-masterspeed="1000" data-thumb="img/bg-2.jpg"
						data-saveperformance="off" data-title="Slide">
						<!-- MAIN IMAGE --> <img src="img/bg-2.jpg" alt="fullslide1"
						data-bgposition="center top" data-bgfit="cover"
						data-bgrepeat="no-repeat"> <!-- LAYERS --> <!-- LAYER NR. 1 -->
						<div class="tp-caption vertical-title lfb ltt tp-resizeme"
							data-x="left" data-hoffset="100" data-y="center"
							data-voffset="-70" data-speed="600" data-start="800"
							data-easing="Power4.easeOut" data-splitin="none"
							data-splitout="none" data-elementdelay="0.01"
							data-endelementdelay="0.1" data-endspeed="500"
							data-endeasing="Power4.easeIn"
							style="z-index: 2; max-width: auto; max-height: auto; white-space: nowrap;">혼자있을때도
							외롭지 않아요!</div> <!-- LAYER NR. 2 -->
						<div class="tp-caption vertical-caption lfb ltt tp-resizeme"
							data-x="left" data-hoffset="100" data-y="center"
							data-voffset="20" data-speed="600" data-start="900"
							data-easing="Power4.easeOut" data-splitin="none"
							data-splitout="none" data-elementdelay="0.01"
							data-endelementdelay="0.1" data-endspeed="500"
							data-endeasing="Power4.easeIn"
							style="z-index: 3; max-width: auto; max-height: auto; white-space: nowrap;">
							귀여운 냥이 멍이들을 위한 작은 파라다이스! <br> PAWRADISE로 만들어 주세요!
						</div>
					</li>

				</ul>
				<div class="tp-bannertimer"></div>
			</div>
		</div>
	</article>
	
<!-- 수정 끝 민정 -->

	<!--메인배너 끝-->
	<div class="divide80"></div>
	<!-- 80px 공간이 필요하면 이 태그를 쓰세요 -->

	<!-- 게시판 사진 타이틀  -->

	<div class="full-width">
		<div class="cotnainer">
			<div class="center-heading">
				<h2>WITH YOUR LOVE</h2>
				<span class="center-line"></span>
			</div>
		</div>

		<div class="portfolio-box iso-call col-4-no-space">

			<div class="project-post photography branding">
				<div class="img-icon">
					<img src="img/img-1.jpg" class="img-responsive" alt="">
					<div class="img-icon-overlay">
						<p>
							<a href="img/img-1.jpg" class="show-image"><i
								class="fa fa-eye"></i></a> 
						</p>
					</div>
				</div>
				<!--img-icon-->

			</div>
			<!--project post-->
			<div class="project-post illustration web-design">
				<div class="img-icon">
					<img src="img/img-2.jpg" class="img-responsive" alt="">
					<div class="img-icon-overlay">
						<p>
							<a href="img/img-2.jpg" class="show-image"><i
								class="fa fa-eye"></i></a> 
						</p>
					</div>
				</div>
				<!--img-icon-->
			</div>
			<!--project post-->

			<div class="project-post illustration web-design">
				<div class="img-icon">
					<img src="img/img-3.jpg" class="img-responsive" alt="">
					<div class="img-icon-overlay">
						<p>
							<a href="img/img-3.jpg" class="show-image"><i
								class="fa fa-eye"></i></a> 
						</p>
					</div>
				</div>
				<!--img-icon-->
			</div>
			<!--project post-->
			<div class="project-post photography web-design">
				<div class="img-icon">
					<img src="img/img-4.jpg" class="img-responsive" alt="">
					<div class="img-icon-overlay">
						<p>
							<a href="img/img-4.jpg" class="show-image"><i
								class="fa fa-eye"></i></a> 
						</p>
					</div>
				</div>
				<!--img-icon-->
			</div>
			<!--project post-->

			<div class="project-post branding">
				<div class="img-icon">
					<img src="img/img-5.jpg" class="img-responsive" alt="">
					<div class="img-icon-overlay">
						<p>
							<a href="img/img-5.jpg" class="show-image"><i
								class="fa fa-eye"></i></a> 
						</p>
					</div>
				</div>
				<!--img-icon-->
			</div>
			<!--project post-->
			<div class="project-post  illustration">
				<div class="img-icon">
					<img src="img/img-6.jpg" class="img-responsive" alt="">
					<div class="img-icon-overlay">
						<p>
							<a href="img/img-6.jpg" class="show-image"><i
								class="fa fa-eye"></i></a> 
						</p>
					</div>
				</div>
				<!--img-icon-->
			</div>
			<!--project post-->

			<div class="project-post  branding">
				<div class="img-icon">
					<img src="img/img-7.jpg" class="img-responsive" alt="">
					<div class="img-icon-overlay">
						<p>
							<a href="img/img-7.jpg" class="show-image"><i
								class="fa fa-eye"></i></a> 
						</p>
					</div>
				</div>
				<!--img-icon-->
			</div>
			<!--project post-->


			<div class="project-post   web-design">
				<div class="img-icon">
					<img src="img/img-8.jpg" class="img-responsive" alt="">
					<div class="img-icon-overlay">
						<p>
							<a href="img/img-8.jpg" class="show-image"><i
								class="fa fa-eye"></i></a> 
						</p>
					</div>
				</div>
				<!--img-icon-->
			</div>
			<!--project post-->

		</div>
	</div>
	<!--full width-->

	<div class="divide50"></div>
	<!-- 50px 공간이 필요하면 이 태그를 쓰세요 -->

	<!-- 게시판 바로가기 링크시작 -->
	<div class="text-center">
		<a href="boardList" class="btn btn-lg border-black">커뮤니티 바로가기</a>
	</div>
	<!-- 게시판 바로가기 링크 끝-->

	<div class="divide60"></div>
	<!-- 60px 공간이 필요하면 이 태그를 쓰세요 -->

	<!-- 가운데 정렬은 <div class="container"><div class="row"> 이 안에 작업파일 넣으면 다 정렬됩니다 </div></div> -->
	<div class="container">
		<div class="row">
			<div class="col-sm-8 col-sm-offset-2">
				<div class="center-heading">
					<h2>냥냥 멍멍 귀여워</h2>
					<span class="center-line"></span>
					<p class="sub-text margin40">집에 혼자 있는 우리 냥이 멍이를 위한 모바일연동 장난감, PAWRADISE!
						<br>당신이 있을 때나 없을 때나, 우리의 귀여운 냥이 멍이들이 외롭지 않고 배고프지 않도록 저희는 사랑으로
						모든 제품을 제작합니다.</p>
				</div>
			</div>
		</div>



		<div class="divide50"></div>
		<!-- 50px 공간이 필요하면 이 태그를 쓰세요 -->
		<!-- 제품설명 부분 -->
		<div class="row">
			<div class="col-md-3 col-sm-6 margin30">
				<div class="colored-boxed green">
					<i class="fa fa-home"></i>
					<h3>자동모드로 스마트한 장난감</h3>
					<span class="center-line"></span>
					<p>PAWRADISE와 함께라면,<br> 혼자서도 잘 놀 수 있어요!</p>
				</div>
			</div>
			<!--세로 설명 1-->
			<div class="col-md-3 col-sm-6 margin30">
				<div class="colored-boxed dark">
					<i class="fa fa-tablet"></i>
					<h3>모바일앱과 연동</h3>
					<span class="center-line"></span>
					<p>반려인이 없는 시간에도 함께 하는 듯!<br>앱 제어가 가능한 스마트 펫토이!</p>
				</div>
			</div>
			
			<!--세로 설명 2-->
			<div class="col-md-3 col-sm-6 margin30">
				<div class="colored-boxed red">
					<i class="fa fa-heart"></i>
					<h3>냥이와 멍이의 기분</h3>
					<span class="center-line"></span>
					<p>냥이와 멍이의 행복만을 고민합니다. <br> 언제 어디서나 사랑으로 함께 하세요!</p>
				</div>
			</div>
			
			<!--세로 설명3-->
			
			<div class="col-md-3 col-sm-6 margin30">
				<div class="colored-boxed blue">
					<i class="fa fa-thumbs-up"></i>
					<h3>최고의 고객 만족도</h3>
					<span class="center-line"></span>
					<p>고객님들께서 모두 만족 하실 수 있는<br> 서비스를 위해 최선을 다합니다.</p>
				</div>
			</div> 
			<!--세로 설명4-->
		</div>
	</div>
	<!--제품설명부분 끝-->

	<!--고객상품평 시작-->
	<div class="testimonials-v-2 wow animated fadeInUp"
		data-wow-duration="700ms" data-wow-delay="100ms">
		<div class="container">
			<div class="row">
				<div class="col-sm-8 col-sm-offset-2">
					<div class="center-heading">
						<h2>생생한 이용 후기</h2>
						<span class="center-line"></span>

					</div>
				</div>
			</div>
			<!--center heading end-->

			<div class="row">

				<div class="col-sm-8 col-sm-offset-2">
					<div class="testi-slide">
						<ul class="slides">
							<li><img src="img/customer-1.jpg" alt="">
								<p>
									<i class="ion-quote"></i> 처음 사용해 봤는데 루이가 너무 좋아해요! 외출했을때도 안심되고
									요즘엔 같이 놀아달라고 매달리지 않아요 같이 놀아주기 모드도 있어서 집에서 놀아주기도 좋아요.
								</p>
								<h4 class="test-author">루이맘 님</h4></li>
							<!--testi item-->
							<li><img src="img/customer-2.jpg" alt="">
								<p>
									<i class="ion-quote"></i> 깨발랄 캣초딩 키우는 초보집사예요. 낮에 집을 비우니 잠만 자서 그런지
									밤마다 우다다를 해서 잠을 제대로 못자서 구입하게 되었어요. 이제는 밤에도 잘 자서 너무 좋아요~! 최고예요!!
								</p>
								<h4 class="test-author">두부LOVE 님</h4></li>
							<!--testi item-->
							<li><img src="img/customer-3.jpg" alt="">
								<p>
									<i class="ion-quote"></i> 오랜시간 집을 비울때 너무 미안했는데, PAWRADISE로 그 미안함을 덜었어요.
									초코가 원하는 시간에 밥을 먹을 수 있고 집 밖에서도 놀아 줄 수도 있어서 정말 만족해요!
								</p>
								<h4 class="test-author">초코대디 님</h4></li>
							<!--testi item-->
						</ul>
					</div>
					<!--flex slider testimonials end here-->
				</div>
			</div>
			<!--testi slider row end-->
			<div class="divide70"></div>
			<div class="row">
				<div class="col-md-4 margin-btm-20">
					<div class="quote dark">
						<blockquote>
							<p> 처음 사용해 봤는데 루이가 너무 좋아해요! 외출했을때도 안심되고
									요즘엔 같이 놀아달라고 매달리지 않아요 같이 놀아주기 모드도 있어서 집에서 놀아주기도 좋아요.</p>
						</blockquote>
					</div>
					<div class="quote-footer text-right">
						<div class="quote-author-img">
							<img src="img/customer-1.jpg" alt="">
						</div>
						<h4>루이맘 님</h4>
					</div>
				</div>
				<!--colored quote box col-->
				<div class="col-md-4 margin-btm-20">
					<div class="quote green">
						<blockquote>
							<p>깨발랄 캣초딩 키우는 초보집사예요. 낮에 집을 비우니 잠만 자서 그런지
									밤마다 우다다를 해서 잠을 제대로 못자서 구입하게 되었어요. 이제는 밤에도 잘 자서 너무 좋아요~! 최고예요!!</p>
						</blockquote>
					</div>
					<div class="quote-footer text-right">
						<div class="quote-author-img">
							<img src="img/customer-2.jpg" alt="">
						</div>
						<h4>두부LOVE 님</h4>
					</div>
				</div>
				<!--colored quote box col-->
				<div class="col-md-4 margin-btm-20">
					<div class="quote dark">
						<blockquote>
							<p>오랜시간 집을 비울때 너무 미안했는데, PAWRADISE로 그 미안함을 덜었어요.
									초코가 원하는 시간에 밥을 먹을 수 있고 집 밖에서도 놀아 줄 수도 있어서 정말 만족해요!</p>
						</blockquote>
					</div>
					<div class="quote-footer text-right">
						<div class="quote-author-img">
							<img src="img/customer-3.jpg" alt="">
						</div>
						<h4>초코대디 님</h4>
					</div>
				</div>
				<!--colored quote box col-->
			</div>
		</div>
	</div>
	<!--고객상품평 끝-->

	<!--하단 footer부분 인클루드시작 body태그안에들어감 -->
	<%@ include file="/include/footer.jsp"%>
	<!--하단 footer부분 인클루드 끝 body태그안에들어감-->
</body>
</html>
