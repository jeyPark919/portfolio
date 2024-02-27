<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>notice</title>
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.min.js"></script>
        
<style>
#border{
	height: 1000px;
}
#up {
	margin-top : 75px;
	text-align: center;
	width: 100%;
/* 	background-color: lightgray; */
	height: 100px;
	line-height: 100px;
}

#left {
	height: 300px;
	width: 15%;
	border-style : groove;
	float: left;
	border-radius: 20px;
	text-align: center;
	margin-left: 10%;
}

#right {
 	height: 50%; 
	width: 60%;
	float: left;
	text-align: center;
	margin-right: 10%;
}


table {
	width: 100%;
/* 	height: 200px; */
	border-collapse: collapse;
	margin-bottom: 20px;
}

th, td {
	border: 1px solid black;
	text-align: center;
	padding: 4px;
	height: 1px;
}
a {
  text-decoration-line: none;
}
#footer {
    position: relative; 
    transform: translatY(100%);
}
#table_search{
	margin-left:100px;
}

</style>
</head>

<body>
<jsp:include page="../inc/top.jsp" />
<div id="border">
<div id="up">
	<h1>공지사항</h1>
</div>

<div id="left">		
<ul>
<li style="font-weight: bold;"><a href="${pageContext.request.contextPath}/Admin/notice">공지사항</a></li>

<li><a href="${pageContext.request.contextPath}/Admin/FAQ">자주 묻는 질문</a></li>
<li><a href="${pageContext.request.contextPath}/Admin/inquiry">1:1문의</a></li>

</ul>
</div>

<div id="right">

<table>
<tr>
<th>번호</th>
<th>제목</th>
<th>작성자</th>
<th>작성일</th>
<th>조회수</th>
</tr>
<c:forEach var="nDTO" items="${noticeList }">
    	
    	<tr onclick="location.href='${pageContext.request.contextPath}/Admin/content?n_num=${nDTO.n_num}'">
    	<td>${nDTO.n_num}</td><td class="left">${nDTO.n_title}</td><td>${nDTO.admin_id}</td>
    	<td><fmt:formatDate value="${nDTO.n_date}" pattern="yyyy.MM.dd"/></td>
    	<td>${nDTO.n_readcount}</td></tr>
    </c:forEach>


				</table>
				<div id="page_control">
<c:if test="${pageDTO.startPage > pageDTO.pageBlock}">
	<a href="${pageContext.request.contextPath}/Admin/notice?pageNum=${pageDTO.startPage - pageDTO.pageBlock}&search=${noticeDTO.search}">Prev</a>
</c:if>

<c:forEach var="i" begin="${pageDTO.startPage}" end="${pageDTO.endPage}" step="1">
	<a href="${pageContext.request.contextPath}/Admin/notice?pageNum=${i}&search=${pageDTO.search}">${i}</a>
</c:forEach>

<c:if test="${pageTO.endPage < pageDTO.pageCount}">
	<a href="${pageContext.request.contextPath}/Admin/notice?pageNum=${pageDTO.startPage + pageDTO.pageBlock}&search=${noticeDTO.search}">Next</a>
</c:if>


</div>

	<div id="table_search">			
<form action="${pageContext.request.contextPath}/Admin/notice" method="get">
<select name="select">
	<option value="p_title" selected>제목</option>
	<option value="p_content">내용</option>
</select>
	<input type="text" name="search" class="input_box">
	<input type="submit" value="검색" class="btn btn-primary">
	<input type="button" value="글목록" class="btn btn-primary"
 	 onclick="location.href='${pageContext.request.contextPath}/Admin/notice'">
	
							
<c:if test="${sessionScope.id == 'admin'}">
		<input type="button" value="글쓰기" class="btn btn-primary" 
  	onclick="location.href='${pageContext.request.contextPath}/Admin/write?n_num=${nDTO.n_num}'">
  </c:if>
	</form>
		</div>	
	</div>
	<div class="clear"></div>
	</div>


<jsp:include page="../inc/bottom.jsp" />
</body>
</html>