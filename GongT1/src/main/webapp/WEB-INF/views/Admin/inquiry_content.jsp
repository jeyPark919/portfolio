<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
   <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html lang="ko">
<jsp:include page="../inc/top.jsp" />
<head>
<meta charset="UTF-8">
<title>문의 내용</title>
<link href="//i.jobkorea.kr/content/css/ver_2/common-sv-202401301659.css" rel="stylesheet" type="text/css" />
<link href="//i.jobkorea.kr/content/css/ver_2/text_user/resume/view.css?v=202402061400" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<style>
table {
  border-collapse: collapse;
  width: 100%;
}

th, td {
  padding: 8px;
  text-align: left;
  border-bottom: 1px solid #ddd;
}


</style>
</head>
<body>


<div id="border">
	</div>
	<div class="sidemenu-wrap" style="margin-left:-1660px; margin-top: 195px;">
    <div class="sidemenu">
    
        <button type="button" class="button button-update" ><span onclick="location.href='${pageContext.request.contextPath}/Admin/notice'" >공지사항</span></button>
      	<button type="button" class="button button-update" ><span onclick="location.href='${pageContext.request.contextPath}/Admin/FAQ'" >자주 묻는 질문</span></button>
        <button type="button" class="button button-update" style="background-color: #1842B6;"><span onclick="location.href='${pageContext.request.contextPath}/Admin/inquiry'" style="color: white !important;">1:1문의</span></button>
    </div>
</div>
    <div class="modal modal-spinner" role="dialog" aria-hidden="true" style="display:none;"></div>
    <div class="resume-view-page">
        <div class="resumeHeader">
            
        </div>
        <div class="resume-view-wrapper" >
        <br><br>
            <div class="resume-view-container" style="height: 700px !important">
                <div class="resume-subject" style="text-align: center !important;">마이 페이지(기업)</div>


<div class="summary col-4"></div>
<div class="list list-education"></div>
<br>


<fieldset style="text-align: center; font-size: 20px; width: 100%; height: 80%;" >

<table id="notice">
<tr><td style=" font-size:25px !important; color: black;">문의 번호</td><td style=" font-size:25px !important; color: black;">${inquiryDTO.i_num}</td></tr>
<tr><td style=" font-size:25px !important; color: black;">문의 제목</td><td style=" font-size:25px !important; color: black;">${inquiryDTO.i_title}</td></tr>
<tr><td style=" font-size:25px !important; color: black;">문의 작성자</td><td style=" font-size:25px !important; color: black;">${inquiryDTO.id}</td></tr>  
<tr><td style=" font-size:25px !important; color: black;">문의 내용</td><td style=" font-size:25px !important; color: black;">${inquiryDTO.i_content}</td></tr>
<tr><td style=" font-size:25px !important; color: black;">문의 작성날짜</td><td style=" font-size:25px !important; color: black;">${inquiryDTO.i_date}</td></tr>
<c:if test="${sessionScope.id != 'admin'}">
</c:if>
</table>
<div id="table_search">
		<c:if test="${sessionScope.id != 'admin'}">
		<input type="button" value="문의 수정" class="btn" 
  			onclick="location.href='${pageContext.request.contextPath}/Admin/update?n_num=${inquiryDTO.i_num}'">
		<input type="button" value="문의 삭제" class="btn" 
  			onclick="location.href='${pageContext.request.contextPath}/Admin/delete?n_num=${inquiryDTO.i_num}'">
  		</c:if>
  		<c:if test="${sessionScope.id == 'admin'}">
		<input type="button" value="답변 쓰기" class="btn"  
  	onclick="location.href='${pageContext.request.contextPath}/Admin/inquiry_update?i_num=${inquiryDTO.i_num}'">
		</c:if>
<input type="button" value="문의 목록" class="btn" 
  onclick="location.href='${pageContext.request.contextPath}/Admin/inquiry'">
</div>
</fieldset>
 			</div>
        </div>
    </div>
 
 <br><br><br><br><br>
<jsp:include page="../inc/bottom.jsp" />
</body>
</html>