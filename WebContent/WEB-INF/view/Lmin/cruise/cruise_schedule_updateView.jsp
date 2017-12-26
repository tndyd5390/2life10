<%@page import="com.cl.util.CmmUtil"%>
<%@page import="com.cl.dto.CruiseDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	CruiseDTO cDTO = (CruiseDTO)request.getAttribute("cDTO");
	if(cDTO == null) cDTO = new CruiseDTO();
%>
<!-- updateView -->
<!DOCTYPE html>
<html lang="ko">
<head>
<title>관리자모드-크리스찬라이프</title>

<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />
<link type="text/css" rel="stylesheet" href="/public/css/default.css" />
<link type="text/css" rel="stylesheet" href="/public/css/layout_kor.css" />

<link type="text/css" rel="stylesheet" href="/public/css/sub_kor.css" />

<script type="text/javascript" src="/public/js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="/public/js/TweenMax.min.js"></script>
<script type="text/javascript" src="/public/js/common.js"></script>
<script type="text/javascript" src="/public/js/contents.js"></script>
<script type="text/javascript" src="/public/js/jquery.form.js"></script>
<script type="text/javascript" src="/public/js/jquery.rss.js"></script>

<!--[if lt IE 9]>
	<script src="/js/html5.js"></script>
	<script src="/js/respond.js"></script>
<![endif]-->
<script type="text/javascript">

window.onload = function() {
    var frm = document.getElementById('cruiseForm');
    
    var nowDate        = new Date();
    var nowYear        = nowDate.getFullYear();
    var nowMonth       = eval(nowDate.getMonth()) +1;
    var nowDay         = eval(nowDate.getDate());
    var psyStartYear = <%=CmmUtil.nvl(cDTO.getStartYear())%>;
    /***************
     * 년 세팅
     ***************/
    var startYear    = psyStartYear - 10;
    for( var i=0; i<40; i++ ) {
        frm['startYear'].options[i] = new Option(startYear+i, startYear+i);
        frm['endYear'].options[i] = new Option(startYear+i, startYear+i);
    }

    /***************
     * 월 세팅
     **************/
    for (var i=0; i<12; i++) {
    	frm['startMonth'].options[i] = new Option(i+1, i+1);
    	frm['endMonth'].options[i] = new Option(i+1, i+1);
    }
    
    
    /***************************************
     * 먼저 현재 년과 월을 셋팅
     * 윤년계산과 월의 마지막 일자를 구하기 위해
     ***************************************/
    frm['startYear'].value   = <%=CmmUtil.nvl(cDTO.getStartYear())%>;
    frm['endYear'].value     = <%=CmmUtil.nvl(cDTO.getEndYear())%>;
    frm['startMonth'].value  = <%=CmmUtil.nvl(cDTO.getStartMonth())%>;
    frm['endMonth'].value    = <%=CmmUtil.nvl(cDTO.getEndMonth())%>;
    setStartDay();
    setEndDay();
    frm['startDay'].value    = <%=CmmUtil.nvl(cDTO.getStartDay())%>;
    frm['endDay'].value      = <%=CmmUtil.nvl(cDTO.getEndDay())%>;
}

/******************
 * 일(day) 셋팅
 ******************/
function setStartDay() {
    var frm = document.getElementById('cruiseForm');
    
    var year            = frm['startYear'].value;
    var month            = frm['startMonth'].value;
    var day                = frm['startDay'].value;    
    var dateDay        = frm['startDay'];
    
    var arrayMonth    = [31,28,31,30,31,30,31,31,30,31,30,31];

    /*******************************************
     * 윤달 체크 부분
     * 윤달이면 2월 마지막 일자를 29일로 변경
     *******************************************/
    if ((year % 4 == 0 && year % 100 != 0) || year % 400 == 0) {
        arrayMonth[1] = 29;
    }

    /**************************************
     * 기존 일(day) select를 모두 삭제한다.
     **************************************/
    for( var i=dateDay.length; i>0; i--) {
        dateDay.remove(dateDay.selectedIndex);
    }
        
    /*********************************
     * 일(day) select 옵션 생성
     *********************************/
    for (var i=1; i<=arrayMonth[month-1]; i++) {
        dateDay.options[i-1] = new Option(i, i);
    }

    /*********************************************
     * 기존에 선택된 일값 유지
     * 기존 일값보다 현재 최대일값이 작을 경우
     * 현재 선택 최대일값으로 세팅
     ********************************************/
    if( day != null || day != "" ) {
        if( day > arrayMonth[month-1] ) {
            dateDay.options.selectedIndex = arrayMonth[month-1]-1;
        } else {
            dateDay.options.selectedIndex = day-1;
        }
    }
}

function setEndDay() {
    var frm = document.getElementById('cruiseForm');
    
    var year            = frm['endYear'].value;
    var month            = frm['endMonth'].value;
    var day                = frm['endDay'].value;    
    var dateDay        = frm['endDay'];
    
    var arrayMonth    = [31,28,31,30,31,30,31,31,30,31,30,31];

    /*******************************************
     * 윤달 체크 부분
     * 윤달이면 2월 마지막 일자를 29일로 변경
     *******************************************/
    if ((year % 4 == 0 && year % 100 != 0) || year % 400 == 0) {
        arrayMonth[1] = 29;
    }

    /**************************************
     * 기존 일(day) select를 모두 삭제한다.
     **************************************/
    for( var i=dateDay.length; i>0; i--) {
        dateDay.remove(dateDay.selectedIndex);
    }
        
    /*********************************
     * 일(day) select 옵션 생성
     *********************************/
    for (var i=1; i<=arrayMonth[month-1]; i++) {
        dateDay.options[i-1] = new Option(i, i);
    }

    /*********************************************
     * 기존에 선택된 일값 유지
     * 기존 일값보다 현재 최대일값이 작을 경우
     * 현재 선택 최대일값으로 세팅
     ********************************************/
    if( day != null || day != "" ) {
        if( day > arrayMonth[month-1] ) {
            dateDay.options.selectedIndex = arrayMonth[month-1]-1;
        } else {
            dateDay.options.selectedIndex = day-1;
        }
    }
}

function doCruiseUpdate(){
	var form = document.getElementById('cruiseForm');
	var imgExtension = ["jpg", "jpeg", "png"];
	var pdfExtecsion = ["pdf"];
	var imgFileName = '<%=CmmUtil.nvl(cDTO.getCruiseImgFileName())%>';
	var scheFileName = '<%=CmmUtil.nvl(cDTO.getCruiseScheFileName())%>';
	if(form.cruiseShipName.value == ""){
		alert('선사명을 입력해 주세요.');
		form.cruiseShipName.focus();
		return;
	}else if(form.cruiseName.value == ""){
		alert('상품명을 입력해주세요.');
		form.cruiseName.focus();
		return;
	}else if(form.cruisePrice.value == ""){
		alert('상품가격을 입력해 주세요');
		form.cruisePrice.focus();
		return;
	}else if(form.cruiseAccomodation.value == ""){
		alert('인원을 입력해 주세요.');
		form.cruiseAccomodation.focus();
		return;
	}else if(form.cruiseCabinCode.value == ""){
		alert('캐빈을 입력해 주세요.');
		form.cruiseCabinCode.focus();
		return;
	}else{
		var hiddenField = document.createElement("input");
		hiddenField.setAttribute("type", "hidden");
		hiddenField.setAttribute("name", "cruiseImgFileNo");
		hiddenField.setAttribute("value", <%=CmmUtil.nvl(cDTO.getCruiseImgFileNo() + "")%>);
		form.appendChild(hiddenField);
		 
		hiddenField = document.createElement("input");
		hiddenField.setAttribute("type", "hidden");
		hiddenField.setAttribute("name", "cruiseScheFileNo");
		hiddenField.setAttribute("value", <%=CmmUtil.nvl(cDTO.getCruiseScheFileNo() + "")%>);
		form.appendChild(hiddenField);
		
		hiddenField = document.createElement("input");
		hiddenField.setAttribute("type", "hidden");
		hiddenField.setAttribute("name", "imgFileName");
		hiddenField.setAttribute("value", imgFileName);
		form.appendChild(hiddenField);
		
		hiddenField = document.createElement("input");
		hiddenField.setAttribute("type", "hidden");
		hiddenField.setAttribute("name", "scheFileName");
		hiddenField.setAttribute("value", scheFileName);
		form.appendChild(hiddenField);
		
		form.submit();
	}
}

function fileCheck(fileName, permissibleExtension){
	var result = 0;
	var fileExtension = fileName.value.slice(fileName.value.indexOf(".") + 1).toLowerCase();
	var alertStr = permissibleExtension[0];
	for(var i = 0; i<permissibleExtension.length; i++){
		if(fileExtension == permissibleExtension[i]){
			result++;
		}
		if(i>=1){
			alertStr += ", " + permissibleExtension[i];
		}
	}
	if(result == 0){
		alert(alertStr + " 파일만 업로드 가능합니다.");
		$(fileName).val("");
	}
}

function doCancel(){
	if(confirm('작성하신 내용은 변경되지 않습니다. 취소하시겠습니까?')){
		location.href="/Lmin/cruise/cruiseScheduleList.do";
	}
}
</script>
<body>
<div id="skipnavi">
	<a href="#contentsWrap">본문 바로가기</a>
</div>
<div class="wrap">
	<div class="header">
		<div class="container">
			
			<!-- heaer 인쿠르드 -->
			<%@ include file="/WEB-INF/view/include/inc_header.jsp" %>

		</div>
	</div> <!-- // header -->

	<div id="contentsWrap">
		<div class="container">
			<div class="conTitWrap">
				<h2>관리자/크루즈일정</h2>
				<div class="location">
					<span class="home">홈</span>
					<span>관리자모드</span>
					<strong>크루즈일정</strong>
				</div>
			</div> <!-- // conTitWrap -->
			<!-- 메뉴 영역 -->
			



<script type="text/javascript">
	$(function() {
		//메뉴 제어 
		var lnb = $(".pcLnbWrap ul li a");
		var menuId = "MN70600";
		var mbId = "MO70600";
		var mbId2 = "";
		
		console.log(menuId);
		if ( menuId != '' ){
			var temp = menuId.substring((menuId.length-2), menuId.length);
			if ( temp == '00'){//대메뉴 // class="active"
				$("#"+menuId).addClass("active");
				$("#"+menuId).children().find("li:eq(0)").addClass("active");
			}else{//소메뉴
				$("#"+menuId).addClass("active");
				$("#"+menuId).parents("li").addClass("active");
			}
		}

		$("#subtitle").text($("#"+mbId).text());
		$("#subtitle2").text($("#"+mbId2).text());
		
	});

</script>

<form action="#" name="menuFrm" method="post">
	<input type="hidden" name="menuNum"/>
</form>	
			<%@include file="/WEB-INF/view/Lmin/include/navBar.jsp" %>
			<!-- 메뉴 영역 -->

			<div id="cruise_sch" class="contents"> <!-- 페이지별 ID -->
				<h3 class="smallTit">크루즈일정</h3>

				<div class="boardType2">
				<form action="/Lmin/cruise/cruiseScheduleUpdateProc.do" method="post" enctype="multipart/form-data" id="cruiseForm">
				<input type="hidden" name="cruiseNo" value="<%=CmmUtil.nvl(cDTO.getCruiseNo()) %>">
					<table summary="">
						<caption></caption>
						<colgroup>
							<col width="20%">
							<col width="80%">
						</colgroup>
						<tbody>
							<tr>
								<th scope="row">선사명</th>
								<td>
									<input type="text" name="cruiseShipName" value="<%=CmmUtil.nvl(cDTO.getCruiseShipName()) %>" class="inputType1" style="" maxlength="25">
								</td>
							</tr>
							<tr>
								<th scope="row">시작일</th>
								<td>
									<select name="startYear" id="startYear" onChange="setStartDay()" class="inputType3"></select>
    								<select name="startMonth" id="startMonth" onChange="setStartDay()" class="inputType3"></select>
   									<select name="startDay" id="startDay" class="inputType3"></select>
								</td>
							</tr>
							<tr>
								<th scope="row">완료일</th>
								<td>
									<select name="endYear" id="endYear" onChange="setEndDay()" class="inputType3"></select>
    								<select name="endMonth" id="endMonth" onChange="setEndDay()" class="inputType3"></select>
   									<select name="endDay" id="endDay" class="inputType3"></select>
								</td>
							</tr>
							<tr>
								<th scope="row">상품명</th>
								<td>
									<input type="text" name="cruiseName" value="<%=CmmUtil.nvl(cDTO.getCruiseName()) %>" class="inputType1" maxlength="25">
								</td>
							</tr>
							<tr>
								<th scope="row">상품가</th>
								<td>
									<input type="text" name="cruisePrice" value="<%=CmmUtil.nvl(cDTO.getCruisePrice()) %>" class="inputType1" maxlength="25">
								</td>
							</tr>
							<tr>
								<th scope="row">인원</th>
								<td>
									<input type="text" name="cruiseAccomodation" value="<%=CmmUtil.nvl(cDTO.getCruiseAccomodation()) %>" class="inputType1" style="" maxlength="25">
								</td>
							</tr>
							<tr>
								<th scope="row">캐빈</th>
								<td>
									<input type="text" name="cruiseCabinCode" value="<%=CmmUtil.nvl(cDTO.getCruiseCabinCode()) %>" class="inputType1" style="" maxlength="25">
								</td>
							</tr>
							<tr>
								<th scope="row">비고</th>
								<td>
									<input type="text" name="cruiseEtc" value="<%=CmmUtil.nvl(cDTO.getCruiseEtc()) %>" class="inputType1" style="" maxlength="25">
								</td>
							</tr>
							<tr>
								<th scope="row">일정업로드</th>
								<td>
									<input type="file" name="cruiseScheFile" id="cruiseScheFile" onchange="javascript:fileCheck(this, ['pdf']);" class="inputType1" style="" maxlength="25">
									일정파일 미 선택시 기존의 일정 파일이 유지 됩니다.
								</td>
							</tr>
							<tr>
								<th scope="row">사진업로드</th>
								<td>
									<input type="file" name="cruiseImgFile" id="cruiseImgFile" onchange="javascript:fileCheck(this, ['jpg', 'jpeg', 'png']);" class="inputType1" style="" maxlength="25">
									사진파일 미선택시 기존의 사진이 유지 됩니다.
								</td>
							</tr>
						</tbody>
					</table>
					</form>
				</div>
				<div class="btn_area">
					<a href="#" id="submitLink" class="btn_active" onclick="doCruiseUpdate();">수정</a>
					<a href="#" id="btnCancel" class="btn_cancel" onclick="doCancel();">취소</a>
				</div>
			</div> <!-- // contents -->
		</div>
	</div> <!-- // contentsWrap -->
	<div class="footer">
		<div class="container">
			<footer>
				<div class="footMenuWrap">
					<ul>
						<li><a href="">채용정보</a></li>
						<li><a href="">주요정보고시사항</a></li>
						<li><a href="">오시는길</a></li>
						<li><a href="">개인정보 취급방침</a></li>
					</ul>
				</div>

				<p class="copy">
					<small>크리스찬라이프, 대표자 : 김현재, 서울시 강남구 논현동 268-2 1층, E-mail:cg4491@naver.com</small><br/>
					<small>대표전화:1644-4491, 팩스:02-556-4439, 통신판매신고번호:제2008-서울강남-1083호</small><br/>
					<small>Copyright (C) 2016 Samsung C&amp;T Corporation. All rights reserved</small>
				</p>

				<div class="familyWrap"> <!-- .btnFamily 버튼 클릭시 다중클래스 on 추가 -->
					<section>
						<h2><button type="button" class="btnFamily">FAMILY MAP</button></h2>
						<div class="familyArea">
							<div class="container">
								<dl class="etc">
									<dt>기타</dt>
									
									<dd><a href="" target="_blank" title="새창">참조사이트1</a></dd>
									<dd><a href="" target="_blank" title="새창">참조사이트2</a></dd>
									<dd><a href="" target="_blank" title="새창">참조사이트3</a></dd>
									<dd><a href="" target="_blank" title="새창">참조사이트4</a></dd>
								</dl>
							</div>
						</div>
					</section>
				</div>
			</footer>
			
		</div>
	</div> <!-- // footer -->
</div> <!-- // wrap -->
</body>
</html>
