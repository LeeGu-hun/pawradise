<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<c:set var="url"><%=request.getRequestURL()%></c:set>

<c:choose>
<c:when test="${url == 'http://localhost:8080/pawradise/aboutUs/introduceUs.jsp' }">
		<!-- div 1 -->
		<div class="breadcrumb-wrap1">
			<div class="container">

				<div class="row">
					<div class="col-sm-6">
						<!-- <h4>PAWRADISE</h4> -->
					</div>
					<div class="col-sm-6 hidden-xs text-right">
						<ol class="breadcrumb">
							<li><a href="index.jsp">HOME</a></li>
							<li>회사소개</li>
						</ol>
					</div>
				</div>
			</div>
		</div>
	</c:when>

		
	<c:when test="${url == 'http://localhost:8080/pawradise/board/boardDetail.jsp' }">
		<!-- div 2 -->
		<div class="breadcrumb-wrap2">
			<div class="container">

				<div class="row">
					<div class="col-sm-6">
						<!-- <h4>PAWRADISE</h4> -->
					</div>
					<div class="col-sm-6 hidden-xs text-right">
						<ol class="breadcrumb">
							<li><a href="index.jsp">HOME</a></li>
							<li>포토게시판</li>
						</ol>
					</div>
				</div>
			</div>
		</div>
	</c:when>
	
	
	<c:when
		test="${url == 'http://localhost:8080/pawradise/board/boardList.jsp' }">
		<!-- div 3 -->
		<div class="breadcrumb-wrap3">
			<div class="container">

				<div class="row">
					<div class="col-sm-6">
					<!-- 	<h4>PAWRADISE</h4> -->
					</div>
					<div class="col-sm-6 hidden-xs text-right">
						<ol class="breadcrumb">
							<li><a href="index.jsp">HOME</a></li>
							<li>포토게시판</li>
						</ol>
					</div>
				</div>
			</div>
		</div>
	</c:when>


	<c:when
		test="${url == 'http://localhost:8080/pawradise/board/boardUpdate.jsp' }">
		<!-- div 4 -->
		<div class="breadcrumb-wrap4">
			<div class="container">

				<div class="row">
					<div class="col-sm-6">
						<!-- <h4>PAWRADISE</h4> -->
					</div>
					<div class="col-sm-6 hidden-xs text-right">
						<ol class="breadcrumb">
							<li><a href="index.jsp">HOME</a></li>
							<li>포토게시판</li>
						</ol>
					</div>
				</div>
			</div>
		</div>
	</c:when>

	
	<c:when
		test="${url == 'http://localhost:8080/pawradise/board/boardWrite.jsp' }">
		<!-- div 5 -->
		<div class="breadcrumb-wrap5">
			<div class="container">

				<div class="row">
					<div class="col-sm-6">
						<!-- <h4>PAWRADISE</h4> -->
					</div>
					<div class="col-sm-6 hidden-xs text-right">
						<ol class="breadcrumb">
							<li><a href="index.jsp">HOME</a></li>
							<li>포토게시판</li>
						</ol>
					</div>
				</div>
			</div>
		</div>
	</c:when>


	<c:when
		test="${url == 'http://localhost:8080/pawradise/board/myBoardList.jsp' }">
		<!-- div 6 -->
		<div class="breadcrumb-wrap6">
			<div class="container">

				<div class="row">
					<div class="col-sm-6">
						<!-- <h4>PAWRADISE</h4> -->
					</div>
					<div class="col-sm-6 hidden-xs text-right">
						<ol class="breadcrumb">
							<li><a href="index.jsp">HOME</a></li>
							<li>내 글 보기</li>
						</ol>
					</div>
				</div>
			</div>
		</div>
	</c:when>


	<c:when test="${url == 'http://localhost:8080/pawradise/login/loginForm.jsp' }">
		<!-- div 7 -->
		<div class="breadcrumb-wrap7">
			<div class="container">

				<div class="row">
					<div class="col-sm-6">
						<!-- <h4>PAWRADISE</h4> -->
					</div>
					<div class="col-sm-6 hidden-xs text-right">
						<ol class="breadcrumb">
							<li><a href="index.jsp">HOME</a></li>
							<li>환영합니다!</li>
						</ol>
					</div>
				</div>
			</div>
		</div>
	</c:when>
	
	
	<c:when
		test="${url == 'http://localhost:8080/pawradise/mypage/memberModify.jsp' }">
		<!-- div 8 -->
		<div class="breadcrumb-wrap1">
			<div class="container">

				<div class="row">
					<div class="col-sm-6">
					<!-- 	<h4>PAWRADISE</h4> -->
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
	</c:when>
	
	
	<c:when
		test="${url == 'http://localhost:8080/pawradise/mypage/memberModifyDone.jsp' }">
		<!-- div 9 -->
		<div class="breadcrumb-wrap2">
			<div class="container">

				<div class="row">
					<div class="col-sm-6">
						<!-- <h4>PAWRADISE</h4> -->
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
	</c:when>
	
	
	<c:when
		test="${url == 'http://localhost:8080/pawradise/mypage/memberout.jsp' }">
		<!-- div 10 -->
		<div class="breadcrumb-wrap3">
			<div class="container">

				<div class="row">
					<div class="col-sm-6">
						<!-- <h4>PAWRADISE</h4> -->
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
	</c:when>
	
	
	<c:when
		test="${url == 'http://localhost:8080/pawradise/mypage/mempassword.jsp' }">
		<!-- div 11 -->
		<div class="breadcrumb-wrap4">
			<div class="container">

				<div class="row">
					<div class="col-sm-6">
						<!-- <h4>PAWRADISE</h4> -->
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
	</c:when>
	

	<c:when test="${url == 'http://localhost:8080/pawradise/register/step1.jsp' }">
		<!-- div 12 -->
		<div class="breadcrumb-wrap5">
			<div class="container">

				<div class="row">
					<div class="col-sm-6">
						<!-- <h4>PAWRADISE</h4> -->
					</div>
					<div class="col-sm-6 hidden-xs text-right">
						<ol class="breadcrumb">
							<li><a href="index.jsp">HOME</a></li>
							<li>환영합니다!</li>
						</ol>
					</div>
				</div>
			</div>
		</div>
	</c:when>
	<c:when
		test="${url == 'http://localhost:8080/pawradise/register/step2.jsp' }">
		<!-- div 13 -->
		<div class="breadcrumb-wrap6">
			<div class="container">

				<div class="row">
					<div class="col-sm-6">
						<!-- <h4>PAWRADISE</h4> -->
					</div>
					<div class="col-sm-6 hidden-xs text-right">
						<ol class="breadcrumb">
							<li><a href="index.jsp">HOME</a></li>
							<li>환영합니다!</li>
						</ol>
					</div>
				</div>
			</div>
		</div>
	</c:when>
	<c:when
		test="${url == 'http://localhost:8080/pawradise/register/step3.jsp' }">
		<!-- div 14 -->
		<div class="breadcrumb-wrap7">
			<div class="container">

				<div class="row">
					<div class="col-sm-6">
						<!-- <h4>PAWRADISE</h4> -->
					</div>
					<div class="col-sm-6 hidden-xs text-right">
						<ol class="breadcrumb">
							<li><a href="index.jsp">HOME</a></li>
							<li>환영합니다!</li>
						</ol>
					</div>
				</div>
			</div>
		</div>
	</c:when>
	
	
	<c:when
		test="${url == 'http://localhost:8080/pawradise/mypage/mypage.jsp' }">
		<!-- div 15 -->
		<div class="breadcrumb-wrap1">
			<div class="container">

				<div class="row">
					<div class="col-sm-6">
					<!-- <h4>PAWRADISE</h4> -->	
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
	</c:when>
	
	<c:when
		test="${url == 'http://localhost:8080/pawradise/runPaw/pawDown.jsp' }">
		<!-- div 15 -->
		<div class="breadcrumb-wrap1">
			<div class="container">

				<div class="row">
					<div class="col-sm-6">
					<!-- <h4>PAWRADISE</h4> -->	
					</div>
					<div class="col-sm-6 hidden-xs text-right">
						<ol class="breadcrumb">
							<li><a href="index.jsp">HOME</a></li>
							<li>제품소개</li>
						</ol>
					</div>
				</div>
			</div>
		</div>
	</c:when>


</c:choose>

<!--서브상단헤더 끝 -->