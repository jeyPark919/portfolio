<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html lang="ko">

	<head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>공T 프로젝트 찾기</title>
        <script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.min.js"></script>
        
        
<!-- ★★★★★★★★★★★★★★ 스타일 태그 여기에 넣으시면 됩니다 ★★★★★★★★★★★★★★ -->
<link href="//i.jobkorea.kr/content/css/ver_2/text_user/resume/view.css?v=202402061400" rel="stylesheet" type="text/css" />
    	<style>
button{
padding:0; margin:0; font-size:12.5px; letter-spacing: 0px; border:0 none;
vertical-align:middle; overflow:visible; background:transparent; cursor:pointer;
}
    	
#up {
	margin-top : 50px !important;
	text-align: center;
	width: 100%;
/* 	background-color: lightgray; */
	height: 60px;
	line-height: 60px;
}

h2{
	text-align: center;
	height: 60px;
	line-height: 60px;
}


.sidemenu {
	width: 15%;
	position: relative;
	top : 5%;
	left : 8%;
}

#right {
	clear: inherit;
	text-align: center;
	margin-right: 0px;
	position: absolute;
	top : 30%;
	left : 35%;
	}

table {
 	width: 1000px !important;
/* 	height: 200px; */
	border-collapse: collapse;
	margin-bottom: 20px;
}

th, td {
	border: 1px solid black;
	text-align: center !important;
	font-size: 20px !important;
}

h5{
	text-align: center; background-color: #1842B6;
	color : white !important;
	border-top-left-radius: 18px;
	border-top-right-radius: 18px;
}

.btn-group{
	margin-left: 640px !important;
	margin-bottom: 5px !important;
}

		</style>

    </head>

    <body>
    
<!--	Navbar Start -->
    <jsp:include page="../inc/top.jsp"/>
<!--	Navbar End -->

<div class="container-fluid project py-5 my-5" style="height:100%;
						margin-top: 0px !important;	padding: 0px !important;">
	<div class="container py-5" style="padding: 0px !important;">

                
<!-- ★★★★★★★★★★★★★★ 본문 여기에 넣으시면 됩니다 ★★★★★★★★★★★★★★ -->

<div id="up" style="margin-top: 50px !important;">
	<h2>프로젝트 찾기</h2>	
</div>

<div class="sidemenu">
        <button type="button" class="button button-update" style="background-color: #1842B6;"><span onclick="location.href='${pageContext.request.contextPath}/board/searchCom'" style="color: white !important;">프로젝트 찾기</span></button>
        <button type="button" class="button button-update"><span onclick="location.href='${pageContext.request.contextPath}/board/searchFree'">프리랜서 찾기</span></button>
</div><br>

<form action="${pageContext.request.contextPath}/board/searchCom" method="get">
<div id="right">
<div class="btn-group" role="group" aria-label="Basic example">
  <input type="hidden" name="search" value="${pageDTO.search }">
  <input type="hidden" name="select" value="${pageDTO.select }">
  <label><button name="sort" value="sortM" type="submit" class="btn btn-primary" style="background-color: #1842B6 !important;">매칭순</button>
  <button name="sort" value="sortR" type="submit" class="btn btn-primary" style="background-color: #1842B6 !important;">조회순</button></label>
</div>
</form>

<br>
직종 : 개발자, 퍼블리셔, 디자이너, 기타
<br>
지역 : 전체, 서울, 부산, 인천, 대전, 대구, 울산, 광주, 세종, 경기도, 강원도, 충청북도, 충청남도, 경상북도, 경상남도, 전라북도, 전라남도, 제주

	<table class="table">
  <thead>
    <tr>
<th scope="col">글번호</th>
<th scope="col">제목</th>
<th scope="col">회사명</th>
<th scope="col">등록일</th>
<th scope="col">매칭횟수</th>
<th scope="col">조회수</th>
<th scope="col">마감여부</th>
</tr>
</thead>

<c:set var = "today" value="<%=new java.util.Date()%>"/>
<fmt:formatDate var="now" type="date" value="${today}" pattern="yyyy.MM.dd.HH.mm.ss"/>

    <c:forEach var="projectDTO" items="${projectBoardList }">
    	<tr onclick="location.href='${pageContext.request.contextPath}/project/project?p_num=${projectDTO.p_num }'">
    		<td>${projectDTO.p_num}</td>
    	    <td class="left">${projectDTO.p_title}</td>
    		<td>${projectDTO.name}</td>
    		<td><fmt:formatDate value="${projectDTO.p_writedate}" pattern="yyyy.MM.dd"/></td>
    		<td>${projectDTO.matching }</td>
    		<td>${projectDTO.p_readcount}</td>
    		<td>
    		<fmt:formatDate var="dead" value="${projectDTO.p_deadline}" pattern="yyyy.MM.dd.HH.mm.ss"/>
    		<c:choose>
    		<c:when test="${now ge dead}">모집종료</c:when>
    		<c:when test="${now lt dead}">모집중</c:when>
    		</c:choose>
    		</td>
    	</tr>
    </c:forEach>

</table>
	<form action="${pageContext.request.contextPath}/board/searchCom" method="get">
	<select name="select">
	<option value="p_title">제목</option>
	<option value="p_content">내용</option>
	<option value="name123">회사명</option>
	<option value="field">직종</option>
	<option value="region">지역</option>
	</select>
	<input type="text" class="search" name="search">
	<input type="submit" value="검색" class="btn btn-primary" style="background-color: #1842B6 !important;">
	</form>
	
<div id="page_control">
<c:if test="${pageDTO.startPage > pageDTO.pageBlock}">
	<a href="${pageContext.request.contextPath}/board/searchCom?pageNum=${pageDTO.startPage - pageDTO.pageBlock}&search=${pageDTO.search}&sort=${pageDTO.sort}&select=${pageDTO.select}">[이전]</a>
</c:if>

<c:forEach var="i" begin="${pageDTO.startPage}" end="${pageDTO.endPage}" step="1">
	<a href="${pageContext.request.contextPath}/board/searchCom?pageNum=${i}&search=${pageDTO.search}&sort=${pageDTO.sort}&select=${pageDTO.select}">${i}</a>
</c:forEach>

<c:if test="${pageDTO.pageCount > pageDTO.endPage}">
	<a href="${pageContext.request.contextPath}/board/searchCom?pageNum=${pageDTO.startPage + pageDTO.pageBlock}&search=${pageDTO.search}&sort=${pageDTO.sort}&select=${pageDTO.select}">[다음]</a>
</c:if>
</div>
</div>

	</div>
</div>

<!--	Footer Start -->
    <jsp:include page="../inc/bottom.jsp"/>
<!--	Footer End -->

<script type="text/javascript">
// $(function(){
// 	$('#sortMatching').click(function(){
// 		var arr1 = [${projectDTO.matching }];
// 		arr1.sort().reverse();
// 	});
// });
// $(function(){
// 	$('#sortReadcount').click(function(){
// 		var arr2 = [${projectDTO.p_readcount }];
// 		arr2.sort().reverse();
// 	});
// });
</script>
    </body>

</html>