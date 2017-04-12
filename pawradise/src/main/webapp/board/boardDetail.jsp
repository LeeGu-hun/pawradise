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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 모든페이지 상단 공통 인클루드 끝 <body>태그 바로 위에 </head>태그 모두 삭제하고 넣어주세요 -->
<title>게시판상세</title>
<script>
	function goDelete() {
		location.href = "../delete/"
	}
	function delComment() {
		document.getElementById("delComment").submit();
		window.location.reload(true);
	}
	function clearText(field){
		 if(field.defaultValue==field.value)
		 field.value="";
	}
</script>

<body>
	<!--항상 같이 다니는 메뉴  -->
	<%@ include file="/include/topMenu.jsp"%>

	<!--서브상단헤더 시작 -->
	<div class="breadcrumb-wrap">
		<div class="container">
			<div class="row">
				<div class="col-sm-6">
					<h4>냥냥멍멍 귀여워</h4>
				</div>
				<div class="col-sm-6 hidden-xs text-right">
					<ol class="breadcrumb">
						<li><a href="index.jsp">HOME</a></li>
						<li>냥냥멍멍귀여워</li>
					</ol>
				</div>
			</div>
		</div>
	</div>
	<!--서브상단헤더 끝 -->

	<div class="divide80"></div>

		<div class="center-heading">
			<h2>${board.title}</h2>
			<span class="center-line"></span>
		</div>
	<div class="container">
	<div class="row">
			<!-- 상세보기 -->
			<div class="col-md-10 col-md-offset-1">
				<div class="blog-post">
				<!-- 이미지 -->					
					<div align=center>
						<img src="<%=request.getContextPath() %>/uploads/${board.fileName}" width="800" >
					</div>
					
				<!-- 상세보기 -->
					<ul class="list-inline post-detail">
						<li>by ${board.name}</li>
						<li><i class="fa fa-calendar"></i>
						<fmt:formatDate value="${board.regdate}" pattern="yyyy-MM-dd HH:mm" /></li>
						<li><i class="fa fa-comment"></i>${board.reply} Comments</li>
					</ul>
					<p>${board.content}</p>
				</div>
				<p align="center">		
					<a href="<c:url value='/boardList'/>" class="btn btn-theme-dark btn-lg">리스트</a>
					<c:choose>										
					    <c:when test="${sessionScope.authInfo.userNum eq board.userNum}">
					        <a href="<c:url value='/board/delete/${seq}' />" class="btn btn-theme-dark btn-lg">삭제하기</a>
					        <a href="<c:url value='/board/update/${seq}' />" class="btn btn-theme-dark btn-lg">수정하기</a>
					    </c:when>															
					</c:choose>
				</p>
				<!-- comments list -->
				<br>
				<div class="comment-post">
					<h3>[${board.reply}]개의 Comments가 있습니다</h3>
					<br>
					<c:forEach var="comments" items="${comments}">
						<div class="comment-list">
							<h6>${comments.name} 님의 comment &nbsp;&nbsp;
							<fmt:formatDate value="${comments.regdate}" pattern="yyyy-MM-dd HH:mm" /></h6>
							<p>${comments.c_content} &nbsp;&nbsp;							
							<c:choose>					
					    	<c:when test="${sessionScope.authInfo.userNum eq comments.userNum}">
					    	<form:form commandName="comment" id="delComment">
							<input name="c_seq"  value="${comments.c_seq}" hidden/>
					        <button type="submit" onclick="delComment();" class="btn btn-theme-dark btn-xs">댓글삭제</button>
					        </form:form>
					   		</c:when>															
							</c:choose>
							
							
							</p>
						</div>
						</c:forEach>
				</div>

				<!--댓글등록 시작-->
				<div class="divide30"></div>
				<div class="comment-form">
					<div class="form-contact">
						<form:form commandName="comment" id="frm">
							<div class="form-group">
								<label for="name">Name</label> 
								<input type="text" name="name" class="form-control" value="${sessionScope.authInfo.name}"	readonly />
								<form:hidden path="userNum" value="${sessionScope.authInfo.userNum}" /> 
							</div>
							<div class="form-group">
								<label for="message">Comment</label>
								<form:input path="c_content" size="50" id="c_content" maxlength="100" class="form-control" placeholder="댓글을 입력해주세요" onfocus="clearText(this)" />
								<!-- <textarea path="c_content" class="form-control" rows="7" id="c_content" ></textarea> -->
							</div>							
							<button type="submit" onclick="addComment();" id="demo" class="btn btn-theme-bg btn-lg pull-right">댓글등록</button>
							
						</form:form>
					</div>
				</div>			
			<!--댓글등록 끝-->
			
			</div>
		</div>
	</div>

	<div class="divide80"></div>

	<!--하단 footer부분 인클루드시작 body태그안에들어감 -->
	<%@ include file="/include/footer2.jsp"%>
	<!--하단 footer부분 인클루드 끝 body태그안에들어감-->
</body>
</html>