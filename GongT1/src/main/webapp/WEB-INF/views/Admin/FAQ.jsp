<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">

<title>notice</title>
<link href="//i.jobkorea.kr/content/css/ver_2/text_user/resume/view.css?v=202402061400" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">



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
/* 	border-style : groove; */
	float: left;
/* 	border-radius: 20px; */
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
#side1 {
	float:left;
	margin-left:50px;
	line-height: 100px;
}
#side2 {
	float:right;
	margin-right:50px;
	line-height: 100px;
}
 #side1_c{  
/*  	border:1px solid black;  */
 	width:340px;
	float:left	;	
 	margin-left:50px; 
 	padding-left:30px;
 	
} #side2_c{  
/*  border:1px solid black;  */
	width:340px; 
	float:right	;	
 	margin-right:30px; 
 	padding-right:30px;
/*  	hight:541px; */
} 
a {
  text-decoration-line: none;
}
.clear{
	clear:both;
}
fieldset {
	width:1000px;
}
#table_search {

padding-right:60px;
}


button{
padding:0; margin:0; font-size:12.5px; letter-spacing: 0px; border:0 none;
vertical-align:middle; overflow:visible; background:transparent; cursor:pointer;
}

.sidemenu {
	width: 15%;
	position: relative;
	top : 5%;
	left : 8%;
}

.accordion {
  background-color: #eee;
  color: #444;
  cursor: pointer;
  padding: 18px;
  width: 100%;
  border: none;
  text-align: left;
  outline: none;
  font-size: 15px;
  transition: 0.4s;
}

.active, .accordion:hover {
  background-color: #ccc; 
}

.panel {
  padding: 0 18px;
  display: none;
  background-color: white;
  overflow: hidden;
}
</style>
</head>

<body>
<jsp:include page="../inc/top.jsp" />
<div id="border">
<div id="up">
	<h1>자주 묻는 질문</h1>
</div>

<div id="left">		
<div class="sidemenu">
        <button type="button" class="button button-update" ><span onclick="location.href='${pageContext.request.contextPath}/Admin/notice'" >공지사항</span></button>
      	<button type="button" class="button button-update" style="background-color: #1842B6;"><span onclick="location.href='${pageContext.request.contextPath}/Admin/FAQ'" style="color: white !important;">자주 묻는 질문</span></button>
        <button type="button" class="button button-update"><span onclick="location.href='${pageContext.request.contextPath}/Admin/inquiry'">1:1문의</span></button>
</div>
</div>

<div id="right">
<form action="" id="join">
<fieldset>
<!-- <h2>자주 묻는 질문</h2> -->

<div id="side1_c">
<h3>기업 회원 </h3>
<ul>

<li id="side1"><a href="intro.html">매칭 방법 안내</a></li>
<li id="side1"><a href="intro.html">매칭 방법 안내</a></li>
<li id="side1"><a href="intro.html">매칭 방법 안내</a></li>
<li id="side1"><a href="intro.html">매칭 방법 안내</a></li>
<li id="side1"><a href="intro.html">매칭 방법 안내</a></li>

</ul>
</div>



<div id="side2_c">
<h3>프리랜서 회원 </h3>
<ul>

<li id="side2"><a href="intro1.html">매칭 방법 안내1</a></li>
<li id="side2"><a href="intro1.html">매칭 방법 안내1</a></li>
<li id="side2"><a href="intro1.html">매칭 방법 안내1</a></li>
<li id="side2"><a href="intro1.html">매칭 방법 안내1</a></li>
<li id="side2"><a href="intro1.html">매칭 방법 안내1</a></li>
</ul>
</div>

				

<!-- 				<div id="page_control"> -->
<!-- 					<a href="#">이전</a> <a href="#">1</a><a href="#">2</a><a href="#">3</a> -->
<!-- 					<a href="#">4</a><a href="#">5</a><a href="#">6</a> <a href="#">7</a><a -->
<!-- 						href="#">8</a><a href="#">9</a> <a href="#">10</a> <a href="#">다음</a> -->
</fieldset>	
</form>			
<div class="clear"></div>	
<div id="table_search">
	
						<input type="text" name="search" class="input_box"> 
						<input id="btn"type="button" value="검색" class="btn">
				</div>
				<div class="clear"></div>
</div>

</div>
<jsp:include page="../inc//bottom.jsp" />
</body>
</html>