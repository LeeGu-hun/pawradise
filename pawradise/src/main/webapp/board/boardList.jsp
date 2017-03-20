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
	location.href="./boardWrite"
}

function goMemList(){
	location.href="./member/list"
}
</script>


<script type="text/javascript">
$(document).ready(function(){
     $("a[name='title']").on("click", function(e){ //제목
        e.preventDefault();
        fn_openBoardDetail($(this));
    });
});
 
 
 

</script>



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
                            <li>냥냥멍멍귀여워</li>
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
                <div class="mas-boxes-inner">
                    <img src="img/showcase-1.jpg" alt="" class="img-responsive">
                    <c:if test="${!empty board.filename}">
							<c:set var="ext" value="${fn:split(board.filename, '.') }" />
							<c:choose>
								<c:when
									test="${ext[1] eq 'jpg' || ext[1] eq 'gif' ||ext[1] eq 'png'}">
									<img src='<c:url value="/" />uploads/${board.filename}' width="200">
								</c:when>
							</c:choose>
							<a href='<c:url value="/" />uploads/${board.filename}'>${board.filename}</a>
						</c:if>
                    <div class="mas-blog-inner">
                        <h3><a href="#">${board.title}</a></h3>
                        <ul class="list-inline post-detail">
                            <li>by  <a href="#">${board.writer}글쓴이들어갈부분</a>  님의 글</li>
                            <li><i class="fa fa-calendar"></i><fmt:formatDate value="${board.regdate}"
											pattern="yyyy-MM-dd" /></li>                            
                        </ul>
                        <p>${board.content}컨텐츠들어갈부분</p>
                        <a href="#">...더보기</a>
                    </div><!--blog inner-->
                </div>
                   
                   <!--blog inner-->
                </div>
              </div>	
           
            <div class="container">
                   
                <ul class="pager">
                <li class="previous"><a href="#">← Previous Page</a></li>
                <li class="next"><a href="#">Next Page →</a></li>
            </ul>
            </div>
        </div><!--masonary wrapper-->
        <div class="divide60"></div>

<!--하단 footer부분 인클루드시작 body태그안에들어감 -->	
	<%@ include file="/include/footer2.jsp" %>
<!--하단 footer부분 인클루드 끝 body태그안에들어감-->	
</body>
</html>