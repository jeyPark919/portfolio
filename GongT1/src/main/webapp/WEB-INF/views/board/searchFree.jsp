<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">

	<head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>공T 프리랜서 찾기</title>
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
	margin-left: 800px !important;
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
	<h2>프리랜서 찾기</h2>	
</div>

<div class="sidemenu">
        <button type="button" class="button button-update"><span onclick="location.href='${pageContext.request.contextPath}/board/searchCom'">프로젝트 찾기</span></button>
        <button type="button" class="button button-update" style="background-color: #1842B6;"><span onclick="location.href='${pageContext.request.contextPath}/board/searchFree'" style="color: white !important;">프리랜서 찾기</span></button>
</div><br>

<form action="${pageContext.request.contextPath}/board/searchFree" method="get">

<div id="right">
<div class="btn-group" role="group" aria-label="Basic example">
<input type="hidden" name="search" value="${pageDTO.search }">
<input type="hidden" name="select" value="${pageDTO.select }">
  <label><button name="sort" value="sortM" type="submit" class="btn btn-primary" id="sortMatching" style="background-color: #1842B6 !important;">매칭순</button>
  <button name="sort" value="sortS" type="submit" class="btn btn-primary" id="sortSalary" style="background-color: #1842B6 !important;">급여순</button></label>
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
<th scope="col">이름</th>
<th scope="col">매칭횟수</th>
<th scope="col">희망급여</th>
</tr>
</thead>
	<c:forEach var="resumeDTO" items="${resumeBoardList }">
    	<tr onclick="location.href='${pageContext.request.contextPath}/resume/resume?r_num=${resumeDTO.r_num }'">
    		<td>${resumeDTO.r_num}</td>
    	    <td class="left">${resumeDTO.r_name}</td>
    		<td>${resumeDTO.name}</td>
    		<td>${resumeDTO.matching }</td>
    		<td><fmt:formatNumber value="${resumeDTO.r_salary}" pattern="#,###"/>만원</td>
    	</tr>
    </c:forEach>
</table>
	<form action="${pageContext.request.contextPath}/board/searchFree" method="get">
	<select name="select">
	<option value="r_name" selected>제목</option>
	<option value="r_content">내용</option>
	<option value="name123">이름</option>
	<option value="field">직종</option>
	<option value="region">지역</option>
	</select>
	
	<input type="text" class="search" name="search">
	<input type="submit" value="검색" class="btn btn-primary" style="background-color: #1842B6 !important;">
	</form>
	
	<div id="page_control">
<c:if test="${pageDTO.startPage > pageDTO.pageBlock}">
	<a href="${pageContext.request.contextPath}/board/searchFree?pageNum=${pageDTO.startPage - pageDTO.pageBlock}&search=${pageDTO.search}&sort=${pageDTO.sort}&select=${pageDTO.select}">[이전]</a>
</c:if>

<c:forEach var="i" begin="${pageDTO.startPage}" end="${pageDTO.endPage}" step="1">
<a href="${pageContext.request.contextPath}/board/searchFree?pageNum=${i}&search=${pageDTO.search}&sort=${pageDTO.sort}&select=${pageDTO.select}">${i}</a>
</c:forEach>

<c:if test="${pageDTO.pageCount > pageDTO.endPage}">
	<a href="${pageContext.request.contextPath}/board/searchFree??pageNum=${pageDTO.startPage + pageDTO.pageBlock}&search=${pageDTO.search}&sort=${pageDTO.sort}&select=${pageDTO.select}">[다음]</a>
</c:if>
	</div>
</div>

	</div>
</div>

<!--	Footer Start -->
    <jsp:include page="../inc/bottom.jsp"/>
<!--	Footer End -->
        
<script type="text/javascript">
$(function(){
	
});
</script>
    </body>

</html>