<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
function doSubmit(){
	var f = $('#f');
	var name = $('#name');
	var start = $('#start');
	var end = $('#end');
	var file = $('#file');
	
	if(name.val()==""){
		alert('상품명을 입력해 주세요.');
		name.focus();
		return false;
	}else if(start.val() == "" ){
		alert('게시일을 선택해 주세요.');
		start.focus();
		return false;
	}else if(file.val() == ""){
		alert('파일을 업로드 해주세요.');
		return false;
	}else{
		f.submit();
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
</script>
<body>
<div id="skipnavi">
	<a href="#contentsWrap">본문 바로가기</a>
</div>
<div class="wrap">
	<div class="header">
		<div class="container">
			
			<!-- heaer 인쿠르드 -->
			<!--#include file="../include/inc_header.jsp"-->

			<%@include file="/WEB-INF/view/Lmin/include/inc_header.jsp"%>
		</div>
	</div> <!-- // header -->

	<div id="contentsWrap">
		<div class="container">
			<div class="conTitWrap">
				<h2>관리자/웹카타로그</h2>
				<div class="location">
					<span class="home">홈</span>
					<span>관리자모드</span>
					<strong>웹카타로그</strong>
				</div>
			</div> <!-- // conTitWrap -->
			<!-- 메뉴 영역 -->
			



<script type="text/javascript">
	$(function() {
		//메뉴 제어 
		var lnb = $(".pcLnbWrap ul li a");
		var menuId = "MN70300";
		var mbId = "MO70300";
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

			<div class="contents"> <!-- 페이지별 ID none -->
				<h3 class="smallTit">웹카타로그</h3>

				<div class="boardType2">
				<form action="/Lmin/catalogue/catalogueRegProc.do" method="post" enctype="multipart/form-data" id="f">
					<table summary="">
						<caption></caption>
						<colgroup>
							<col width="20%">
							<col width="80%">
						</colgroup>
						<tbody>
							<tr>
								<th scope="row">상품명</th>
								<td>
									<input type="text" name="name" class="inputType1">
								</td>
							</tr>
							<tr>
								<th scope="row">시작일</th>
								<td>
									<input type="date" name="start" id="start">
								</td>
							</tr>
							<tr>
								<th scope="row">종료일</th>
								<td>
									<input type="date" name="end" id="end">
								</td>
							</tr>
							<tr>
								<th scope="row">업로드</th>
								<td>
									<input type="file" name="file" class="inputType1" id="file" onchange="fileCheck(this, ['pdf']);">
								</td>
							</tr>
						</tbody>
					</table>
				</form>
				</div>

				<div class="btn_area">
					<a href="javascript:doSubmit();" id="submitLink" class="btn_active">등록</a>
					<a href="/Lmin/catalogue/catalogueList.do" id="btnCancel" class="btn_cancel">취소</a>
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