<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

input {
	width: 473px;
	margin-bottom: 10px;
	

}
a {
  text-decoration-line: none;
}

</style>
</head>

<body>
<jsp:include page="../inc//top.jsp" />
<div id="border">
<div id="up">
	<h1>커뮤니티</h1>
</div>

<div id="left">		
<ul>
<li> <a href="${pageContext.request.contextPath}/Admin/notice">공지사항</a></li>
<li> <a href="${pageContext.request.contextPath}/Admin/FAQ">자주 묻는 질문</a></li>
<li  style="font-weight: bold;"><a href="${pageContext.request.contextPath}/Admin/inquiry">1:1문의</a></li>

</ul>
</div>

<div id="right">
<!-- <form action="" id="join"> -->

<h2>문의 하기</h2>

<div>

<form action="${pageContext.request.contextPath}/Admin/inquiry_writePro" method="post">

<div>
<table>
<c:if test="${sessionScope.id ne 'admin'}">
<tr>
	<td>문의 작성자</td>
	<td><input type="text" name="id" id = "write" value="${sessionScope.id}" readonly></td>
</tr>
<tr>
	<td>문의 제목</td>
	<td><input type="text" id = "write" name="i_title"  style ="width:473px;"></td>
</tr>
<tr>
	<td>문의 내용</td>
	<td><textarea name="i_content" rows="20" cols="50" id = "write"></textarea></td>
</tr>
<input type="submit" value="글쓰기" class="btn"   
onclick="location.href='${pageContext.request.contextPath}/Admin/inquiry'">
</c:if>

<c:if test="${sessionScope.id == 'admin'}">
<tr>
	<td>답변 수신자</td>
	<td><input type="text" name="id" id = "write" value="${inquiryDTO.id}" readonly></td>
	</tr>
<tr>
	<td>답변 작성자</td>
	<td><input type="text" name="admin_id" id = "write" value="${sessionScope.id}" readonly></td>
</tr>
<tr>
<td>답변 제목</td>
	<td><input type="text" id = "write" name="asw_title"  style ="width:473px;"></td>
</tr>
<tr>
<td>문의 답변내용</td>
	<td><textarea name="asw_content" rows="20" cols="50" id = "write"></textarea></td>

</tr>
<input type="submit" value="답변 쓰기" class="btn"   
onclick="location.href='${pageContext.request.contextPath}/Admin/inquiry_update?num=${inquiryDTO.i_num }'">
</c:if>

</table>
</div>


</form>
</div>
</div>			
<div class="clear"></div>


</div>

<jsp:include page="../inc/bottom.jsp" />
</body>
</html>