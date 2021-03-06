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
<title>게시판 글쓰기</title>
<script>
	function addBoard() {
		document.getElementByName("frm").submit();
	}
</script>

<body>
	<!--항상 같이 다니는 메뉴  -->
	<%@ include file="/include/topMenu.jsp"%>

	<!-- 서브상단헤더 -->
	<%@ include file="/include/topBanner.jsp"%>

	<div class="divide80"></div>
	<div class="container">

		<div class="center-heading">
			<h2>포토게시판- 글쓰기</h2>
			<span class="center-line"></span>
		</div>

		<div id="contentsBox">

			<form:form commandName="board" enctype="multipart/form-data" name="frm" method="post" >
				<table class="table">
					<tr>
						<td>글쓴이</td>
						<td><input type="text" path="name" class="form-control"
							name="name" size="10" maxlength="10"
							value="${sessionScope.authInfo.name}" readonly /> <form:hidden
								path="userNum" value="${sessionScope.authInfo.userNum}" /></td>
					</tr>
					<tr>
						<td>제목</td>
						<td><form:input path="title" size="50" maxlength="100"
								class="form-control" /> <br> <form:errors path="title" /></td>
					</tr>
					<tr>
						<td>내용</td>
						<td><form:textarea path="content" id="content" cols="67"
								rows="15" class="form-control" /> <br> <form:errors
								path="content" /></td>
					</tr>
					<tr>
						<td>파일첨부</td>
						<td><form:hidden path="upDir"
								value='<%=request.getRealPath("/resources/uploads/")%>' /> <input
							type="file" id="multiFile" name="multiFile" /></td>
					</tr>
					<tr>
						<td><label class="item">공개설정</label></td>
						<td>																
									<input type="radio" name="pub" value="<%=1%>" id="all_open" checked
										title="전체공개">									
									<label for="all_open" class="item_align">전체공개</label>									
									<input type="radio" name="pub" value="<%=2%>" id="no_open"
										 title="나만보기">
										
									<label for="no_open" class="item_align">나만보기</label></td>					
						
					</tr>
					<tr align="center" valign="middle">
						<td colspan="2"><input type="submit" value="등록"
							onclick="addBoard();" />&nbsp;&nbsp; <input type="button"
							value="취소" onclick="history.go(-1);" /></td>
					</tr>
				</table>
			</form:form>
		</div>
	</div>

	<!--하단 footer부분 인클루드시작 body태그안에들어감 -->
	<%@ include file="/include/footer.jsp"%>
	<!--하단 footer부분 인클루드 끝 body태그안에들어감-->
</body>
</html>