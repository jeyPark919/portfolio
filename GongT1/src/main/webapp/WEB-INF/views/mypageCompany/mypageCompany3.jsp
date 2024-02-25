<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>공T 마이페이지</title>
<link href="//i.jobkorea.kr/content/css/ver_2/common-sv-202401301659.css" rel="stylesheet" type="text/css" />
<link href="//i.jobkorea.kr/content/css/ver_2/text_user/resume/view.css?v=202402061400" rel="stylesheet" type="text/css" />

</head>
<body>


<div id="border">
	</div>
	<div class="sidemenu-wrap" style="margin-left:-1660px; margin-top: 195px;">
    <div class="sidemenu">
    
        <button type="button" class="button button-update" onclick="location.href='${pageContext.request.contextPath}/mypageCompany/mypageCompany1'"><span>회원정보 수정</span></button>
        <button type="button" class="button button-update" onclick="location.href='${pageContext.request.contextPath}/mypageCompany/mypageCompany2'"><span>나의 프로젝트</span></button>
    	<button type="button" class="button button-update" style="background-color: #1842B6;"><span style="color: white;">프로젝트 등록</span></button>
    	<button type="button" class="button button-update" onclick="location.href='${pageContext.request.contextPath}/mypageCompany/mypageCompany4'"><span>관심 프리랜서(찜)</span></button>
    	<button type="button" class="button button-update" onclick="location.href='${pageContext.request.contextPath}/mypageCompany/mypageCompany5'"><span>1:1채팅 내역</span></button>
    	<button type="button" class="button button-update" onclick="location.href='${pageContext.request.contextPath}/mypageCompany/mypageCompany6'"><span>회원탈퇴</span></button>
   
    </div>
</div>
    <div class="modal modal-spinner" role="dialog" aria-hidden="true" style="display:none;"></div>
    <div class="resume-view-page">
        <div class="resumeHeader">
            
        </div>
        <div class="resume-view-wrapper" >
        <br><br><br><br>
            <div class="resume-view-container" style="height: 700px !important">
                <div class="resume-subject" style="text-align: center !important;">마이 페이지(기업)</div>


<div class="summary col-4"></div>
<div class="list list-education"></div>
<br><br><br><br><br><br><br><br>
<fieldset style="text-align: center; font-size: 20px; width: 100%; height: 80%;" >
<label>프로젝트 제목</label><br>
<input type="text" name="Projecttitle"   style="font-size:20px;"><br><br>
<label>프로젝트 내용</label><br>
<input type="text" name="ProjectContent" style="font-size:20px;"><br><br>
<label>프로젝트 직종</label><br>
<input type="text" name="Projectfield"  style="font-size:20px;"><br><br>
<label>프로젝트 진행방식</label><br>
<input type="text" name="Projectproceeding" style="font-size:20px;"><br><br>
<label>프로젝트 지역</label><br>
<input type="text" name="Projectregion"   style="font-size:20px;"><br><br>
<label>프로젝트 작성일</label><br>
<input type="text" name="Projectwritedate" style="font-size:20px;"><br><br>
<label>프로젝트 공고마감일</label><br>
<input type="text" name="Projectdeadline"  style="font-size:20px;"><br><br>
<label>프로젝트 시작날짜</label><br>
<input type="text" name="Projectstart" style="font-size:20px;"><br><br>
<label>프로젝트 종료날짜</label><br>
<input type="text" name="Projectend"   style="font-size:20px;"><br><br>
<label>프로젝트 필요인원</label><br>
<input type="text" name="Projectmember" style="font-size:20px;"><br><br>
<input type="button" value="등록하기" style="font-size:20px;">
</fieldset>

        


 			</div>
        </div>
    </div>
 

</body>
</html>