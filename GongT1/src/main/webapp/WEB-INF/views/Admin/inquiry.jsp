<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>notice</title>
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
</style>
</head>

<body>
<jsp:include page="../inc//top.jsp" />
<div id="border">
<div id="up">
	<h1>문의하기</h1>
</div>

<div id="left">		
<ul>
<li ><a href="${pageContext.request.contextPath}/Admin/notice">공지사항</a></li>

<li><a href="${pageContext.request.contextPath}/Admin/FAQ">자주 묻는 질문</a></li>
<li style="font-weight: bold;"><a href="${pageContext.request.contextPath}/Admin/inquiry">1:1문의</a></li>

</ul>
</div>

<div id="right">
<form action="" id="join">
<fieldset>
<h2>내문의 내역</h2>
<table>
<tr>
<th>번호</th>
<th>제목</th>
<th>작성자</th>
<th>작성일</th>
</tr>
<c:forEach var="irDTO" items="${inquiryList }">
<%--     	<tr onclick="location.href='${pageContext.request.contextPath}/board/content?num=${boardDTO.num}'"> --%>
<%--     		<td>${boardDTO.num}</td> --%>
<%--     	    <td class="left">${boardDTO.subject}</td> --%>
<%--     		<td>${boardDTO.name}</td> --%>
<%--     		<td><fmt:formatDate value="${boardDTO.date}" pattern="yyyy.MM.dd"/> </td> --%>
<%--     		<td>${boardDTO.readcount}</td> --%>
<!--     	</tr> -->
    	
    	<tr><td>${irDTO.i_num}</td><td class="left">${irDTO.i_title}</td><td>${irDTO.admin_id}</td>
    	<td><fmt:formatDate value="${irDTO.i_date}" pattern="yyyy.MM.dd"/></td>
    	</tr>
    </c:forEach>


				</table>
				<div id="table_search">
					
						<input type="button" value="글쓰기" class="btn" 
  	onclick="location.href='${pageContext.request.contextPath}/Admin/inquiry_write'">
<%-- 					<c:if test="${sessionScope.id != admin}"> --%>
	
<%-- </c:if> --%>
				</div>
				<div class="clear"></div>
<!-- 				<div id="page_control"> -->
<!-- 					<a href="#">이전</a> <a href="#">1</a><a href="#">2</a><a href="#">3</a> -->
<!-- 					<a href="#">4</a><a href="#">5</a><a href="#">6</a> <a href="#">7</a><a -->
<!-- 						href="#">8</a><a href="#">9</a> <a href="#">10</a> <a href="#">다음</a> -->
</fieldset>	

</form>		
	

	
</div>

</div>
<jsp:include page="../inc//bottom.jsp" />
</body>
</html>