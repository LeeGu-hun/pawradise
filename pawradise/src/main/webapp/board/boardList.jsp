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
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"
	type="text/javascript"></script>
<script>
function pageGo(page) {
	document.getElementById("page").value = page;
	document.getElementById("frm").submit();
}

function goWriter(){
	location.href="./board/boardWrite"
}

function goMemList(){
	location.href="./member/list"
}
</script>


<body>
<!--항상 같이 다니는 메뉴  -->
<%@ include file="/include/topMenu.jsp" %>

<!--서브상단헤더 시작 -->
        <div class="breadcrumb-wrap">
            <div class="container">
                <div class="row">
                    <div class="col-sm-6">
                        <h4>냥냥멍멍 귀여워m </h4>
                    </div>
                    <div class="col-sm-6 hidden-xs text-right">
                        <ol class="breadcrumb">
                            <li><a href="index.jsp">HOME</a></li>
                            <li>냥냥멍멍귀</li>
                        </ol>
                    </div>
                </div>
            </div>
        </div>
<!--서브상단헤더 끝 -->

<!--breadcrumbs-->
        <div class="divide80"></div>
       	<div class="center-heading">
			<h2>냥멍이의은밀한사생활</h2>
			<span class="center-line"></span>
		</div>
        
        <div class="blog-masonary-wrapper"> 
          <div class="container mas-boxes">
             
          
            <!--컨텐츠들어가는부분 시작-->
           <c:forEach var="board" items="${boards}">
                <div class="mas-boxes-inner">
                   
                    <c:if test="${!empty board.fileName}">
							<img src="img/showcase-1.jpg" alt="" class="img-responsive">
							<c:choose>
								<c:when	test="${ext[1] eq 'jpg' || ext[1] eq 'gif' ||ext[1] eq 'png'}">
									<img src='<c:url value="/" />uploads/${board.filename}' width="200">
								</c:when>
							</c:choose>
						</c:if>
                    <div class="mas-blog-inner">
                        <h3><a href="<c:url value="/board/detail/${board.seq}"/>">${board.title}</a></h3>
                        <ul class="list-inline post-detail">
                            <li>by  <a href="#">${board.name}</a> 님의 글</li>
                            <li><i class="fa fa-calendar"></i><fmt:formatDate value="${board.regdate}"
											pattern="yyyy-MM-dd" /></li>                            
                        </ul>
                        <a href="<c:url value="/board/detail/${board.seq}"/>"> 
                        <p>${board.content}</p>
                        <img src="<%=request.getContextPath() %>/img/comment.png" width="15">  [${board.reply}]</a>
                        
                    </div>
                 </div>
                   </c:forEach>
				<!--컨텐츠들어가는부분 끝-->
                </div>
              </div>
           <div class="container">
           
		  <!--글쓰기버튼 -->
            <a href="#" onclick="goWriter();" class="btn btn-theme-dark btn-lg">글쓰기</a>
             <div class="divide10"></div> 
              <!--검색 -->
           <form:form commandName="pageMaker" id="frm">
				<p>
				<input type="text" id="srch" name="srch" placeholder="검색" />
				<input type="submit" value="조회">
				<input type="text" name="page" id="page" hidden />
				</p>
		   </form:form>
		  <!--검색 -->    
           <ul class="pager">
			<c:if test="${pageMaker.prev }">
			<li class="previous"><a href='#' onclick='pageGo(${pageMaker.page-1});'>← Previous Page</a></li>
			</c:if>
			<c:forEach begin="${pageMaker.start }" end="${pageMaker.end}" var="idx">
			<li	class='<c:out value="${idx == pageMaker.page?'current':''}"/>'>
			<a href='#' onclick='pageGo(${idx});'>${idx}</a>
			</li>
			</c:forEach>
			<c:if test="${pageMaker.next }">
			<li class="next"><a href='#' onclick='pageGo(${pageMaker.page+1});'>Next Page →</a></li>
			</c:if>
		  </ul>
            
            </div>
        </div><!--masonary wrapper-->
        <div class="divide60"></div>

<!--하단 footer부분 인클루드시작 body태그안에들어감 -->	
	<%@ include file="/include/footer2.jsp" %>
<!--하단 footer부분 인클루드 끝 body태그안에들어감-->	
</body>
</html>