<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>프로젝트 공고 수정</title>
<!-- <link href="//i.jobkorea.kr/content/css/ver_2/common-sv-202401301659.css" rel="stylesheet" type="text/css" /> -->
<!-- <link href="//i.jobkorea.kr/content/css/ver_2/text_user/resume/view.css?v=202402061400" rel="stylesheet" type="text/css" /> -->
<style>
button{ padding: 0; margin: 0; border: 0 none; vertical-align:middle; overflow:visible; background:transparent; cursor:pointer; }

input{
height: 45px;
width: 400px;
}

.wrappe {
  display: flex;
  justify-content: center;
  align-items: center;
  min-height: 100dvh;
}

.conten {
  padding: 1rem;
/*   font-size: 2rem; */
  border-radius: 1rem;
}

#button {
background-color: #1842B6;
color: white;
padding: 10px;
border: none;
border-radius: 4px;
cursor: pointer;
width: 100px;
}


</style>
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.min.js"></script>
</head>
<body>
    <jsp:include page="../inc/top.jsp"/>


<br><br><br>
<div class="wrappe">
<div class="conten">
<h1>프로젝트 공고 수정</h1>
<p>변경해야 할 정보가 있다면 수정하세요.</p>

<form action="${pageContext.request.contextPath}/main/updateProjectPro" id="join" method="post" enctype="multipart/form-data">
<fieldset>
<legend><h5>정해진 양식에 맞게 수정해주십시오.</h5></legend>
<h3>프로젝트 공고 제목</h3>
<input type="text" width="300" name="p_name" class="id" maxlength="50" value="${projectDTO.p_name}" required autofocus>

<h3>필요 인원 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 직종 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 지역</h3>
<input type="number" name="p_member" placeholder="1" min="1" style="font-size:120%; width: 60px; height: 30px;" required>명
&nbsp;
<select name="field" id="field" style="width: 100px; height: 30px;">
	<option>개발자</option>
	<option>퍼블리셔</option>
	<option>디자이너</option>
	<option>기타</option>
</select>
&nbsp;
<select name="region" id="region" style="width: 100px; height: 30px;">
	<option>전체</option>
	<option>서울특별시</option>
	<option>부산광역시</option>
	<option>인천광역시</option>
	<option>대전광역시</option>
	<option>대구광역시</option>
	<option>울산광역시</option>
	<option>광주광역시</option>
	<option>세종특별자치시</option>
	<option>경기도</option>
	<option>강원도</option>
	<option>충청북도</option>
	<option>충청남도</option>
	<option>경상북도</option>
	<option>경상남도</option>
	<option>전라북도</option>
	<option>전라남도</option>
	<option>제주특별자치도</option>
</select>
<br>

<h3>모집 마감 기한</h3>
<input type="datetime-local" name="p_deadline"><br>
<sub>※모집 마감할 시간을 선택해 주세요.</sub><br>

<h3>프로젝트 시작 예정일</h3>
<input type="date" name="p_start"><br>
<sub>※프로젝트 시작 예정일을 선택해 주세요.</sub><br>

<h3>프로젝트 종료 예정일</h3>
<input type="date" name="p_end"><br>
<sub>※프로젝트 종료 예정일을 선택해 주세요.</sub><br>

<h3>첨부 파일</h3>
<input type="file" name="file"><br>
<sub>※첨부할 파일이 있다면 등록해주세요. (판촉물, 광고지 등)</sub><br><br>

<h3>프로젝트 공고 내용</h3>
<textarea name="r_content" placeholder="내용" maxlength="1000" cols="50" rows="20" ></textarea>

<center>
<button type="submit" value="회원가입" id="button" class="submit">공고 등록</button>
<button type="reset" value="취소" id="button" class="cancel" onclick="history.back()">돌아가기</button>
</center>
</fieldset>
</form>


</div>
</div>
<br><br><br><br><br>


<script type="text/javascript">

$(function() {
	//아이디 중복 확인
	$(".dupid").click(function(){
		$.ajax({
			url : '${pageContext.request.contextPath}/main/idCheck',
			data : {'id' : $('.id').val()}, 
			success : function(result){
				if(result=="iddup"){
					result = "사용불가능한 아이디입니다.";
					$(".dupdivid").css("color", "#ff2020");
				}else{
					result = "사용가능한 아이디입니다.";
					$(".dupdivid").css("color", "green");
				}
				$('.dupdivid').html(result);
			}
		});
	
	});
		
	//이메일 중복 확인
	$(".dupemail").click(function(){
	$.ajax({
		url : '${pageContext.request.contextPath}/main/emailCheck',
		data : {'email' : $('.email').val()}, 
		success : function(result){
			if(result=="emaildup"){
				result = "사용불가능한 이메일입니다.";
				$(".dupdivemail").css("color", "red");
			}else{
				result = "사용가능한 이메일입니다.";
				$(".dupdivemail").css("color", "green");
			}
			$('.dupdivemail').html(result);
			}
		});

	});
	
	//전화번호 중복 확인
	$(".dupphone").click(function(){
	$.ajax({
		url : '${pageContext.request.contextPath}/main/phoneCheck',
		data : {'phone' : $('.phone').val()}, 
		success : function(result){
			if(result=="phonedup"){
				result = "사용불가능한 전화번호입니다.";
				$(".dupdivphone").css("color", "red");
			}else{
				result = "사용가능한 전화번호입니다.";
				$(".dupdivphone").css("color", "green");
			}
			$('.dupdivphone').html(result);
			}
		});

	});
	
});

</script>
    <jsp:include page="../inc/bottom.jsp"/>
</body>
</html>