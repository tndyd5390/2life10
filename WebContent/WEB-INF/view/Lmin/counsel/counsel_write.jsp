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
			<%@include file="/WEB-INF/view/include/inc_header.jsp"%>
		</div>
	</div> <!-- // header -->

	<div id="contentsWrap">
		<div class="container">
			<div class="conTitWrap">
				<h2>관리자/공지사항</h2>
				<div class="location">
					<span class="home">홈</span>
					<span>관리자모드</span>
					<strong>1:1상담</strong>
				</div>
			</div> <!-- // conTitWrap -->
			<!-- 메뉴 영역 -->



<script type="text/javascript">
	$(function() {
		//메뉴 제어 
		var lnb = $(".pcLnbWrap ul li a");
		var menuId = "MN60300";
		var mbId = "MO60300";
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
		
		
		//메일 셀렉트박스 제어
		$("#emailBox").change(function(){
			if($(this).val()=="direct"){
				$("#email2").val("");
			}else{
				$("#email2").val($(this).val())
			}
		});
		$("#phone2,#phone3").focusout(function(){
			var value = $(this).val();
			var regex = /[^0-9]/g;
			if(value==""){

			}else if(regex.test(value)){
				alert("숫자만 입력 가능합니다.");
				$(this).val("");
			}
		});
		
		/* $("#email1,#email2").focusout(function(){
			var value = $(this).val();
			var regex = /[a-z0-9]|[ \[\]{}()<>?|`~!@#$%^&*-_+=,.;:\"'\\]/g;
			
			if(value=""){
				
			}else if(!regex.test(value)){
				alert("한글은 입력 불가능 합니다.");
				$(this).val("");
			}
		}); */
	});
	
	function doSubmit(){
		var f = $("#f");
		var name = $('#name');
		var phone1 = $("#phone1");
		var phone2 = $("#phone2");
		var phone3 = $("#phone3");
		var pwd = $("#password");
		var contents = $("#contents");
		var agree = $('input:radio[name="agree"]:checked');
		
		if(name.val()==""){
			alert("작성자를 입력하세요.");
			name.focus();
			return false;
		}else if(phone2.val()==""){
			alert("휴대전화를 입력하세요.");
			phone2.focus();
			return false;
		}else if(phone2.val()==""){
			alert("휴대전화를 입력하세요.");
			phone2.focus();
			return false;
		}else if(pwd.val()==""){
			alert("비밀번호를 입력하세요.");
			pwd.focus();
			return false;
		}else if(contents.val()==""){
			alert("문의내용을 입력하세요.");
			contents.focus();
			return false;
		}else if(agree.val()=="N" || agree.val()==""){
			alert("개인정보 수집.이용 동의가 필요합니다.");
			return false;
		}else{
			f.submit();
			return true;
		}
	};

</script>

<form action="#" name="menuFrm" method="post">
	<input type="hidden" name="menuNum"/>
</form>	
			<%@include file="/WEB-INF/view/Lmin/include/navBar.jsp" %>
			<!-- 메뉴 영역 -->

			<div id="counsel" class="contents"> <!-- 페이지별 ID none -->
				<h3 class="smallTit">1:1상담</h3>

				<form id="f" name="f" method="post" action="/Lmin/counsel/counselRegProc.do">
					<input type="hidden" value="" id="" name="" />
					<section  class="grayWrap">
						<header>
							<h4 class="subTit">고객정보</h4>
							<p class="fr"><span class="compulsory">*</span> 전 항목 필수 입력 항목입니다.</p>
						</header>

						<div class="boardType2">
							<table summary="">
								<caption>회원가입</caption>
								<colgroup>
									<col width="20%">
									<col width="80%">
								</colgroup>
								<tbody>
									<tr>
										<th scope="row">작성자</th>
										<td>
											<input type="text" name="name" id="name" class="inputType1" maxlength="8">
										</td>
									</tr>
									<tr>
										<th scope="row">휴대전화</th>
										<td>
											<select id="phone1" name="phone1"  class="inputType3">
												<option value="00">010</option>
												<option value="01">011</option>
											</select>
											-
											<input type="text" name="phone2" id="phone2" class="inputType2" maxlength="4">
											-
											<input type="text" name="phone3" id="phone3" class="inputType2" maxlength="4">
										</td>
									</tr>
									<tr>
										<th scope="row">이메일 주소</th>
										<td>
											<input type="text" name="email1" id="email1" class="inputType2" maxlength="10"> @
											<input type="text" name="email2" id="email2" class="inputType2" maxlength="15">
											<select id="emailBox" name="emailBox" class="inputType2">
												<option value="">선택하세요</option>
												<option value="nate.com">nate.com</option>
												<option value="hotmail.com">hotmail.com</option>
												<option value="yahoo.co.kr">yahoo.co.kr</option>
												<option value="naver.com">naver.com</option>
												<option value="paran.com">paran.com</option>
												<option value="dreamwiz.com">dreamwiz.com</option>
												<option value="hanafos.com">hanafos.com</option>
												<option value="lycos.co.kr">lycos.co.kr</option>
												<option value="korea.com">korea.com</option>
												<option value="unitel.co.kr">unitel.co.kr</option>
												<option value="hanmail.net">hanmail.net</option>
												<option value="gmail.com">gmail.com</option>
												<option value="google.com">google.com</option>
												<option value="empal.com">empal.com</option>
												<option value="freechal.com">freechal.com</option>
												<option value="empas.com">empas.com</option>
												<option value="direct">직접입력</option>
											</select>
										</td>
									</tr>
									<tr>
										<th scope="row">제목</th>
										<td>
											<input type="text" name="title" id="title" class="inputType5" maxlength="30">
										</td>
									</tr>
									<tr>
										<th scope="row">문의내용</th>
										<td>
											<textarea id="contents" name="contents" cols="83" rows="10" class="textArea"></textarea>
										</td>
									</tr>
									<tr>
										<th scope="row">비밀번호</th>
										<td>
											<input type="password" name="password" class="inputType1" maxlength="25">
											&nbsp;
											<input type="checkbox" id="passwordYN" name="passwordYN"/> <label for="">비밀글</label>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
	
						<div class="termsWrap">
							<h5 class="blueTit">[필수] 개인정보 수집.이용 동의</h5>
							<p>삼성물산은 고객님들의 의견 접수와 관련하여 성실한 답변을 드리기 위해 필요한 최소한의 개인정보를 수집하고 있습니다.</p>
							<ul class="defaultGrayDotList">
								<li>수집 항목 : 이메일</li>
								<li>수집 및 이용목적 : 접수 문의에 대한 답변/안내</li>
								<li>보유 및 이용기간 : 수집∙이용 목적 달성 시 까지</li>
							</ul>
	
							<p class="noti">※ 문의에 대한 답변을 위해서 필요한 최소한의 개인정보 이므로 동의를 해 주셔야 서비스를 이용하실 수 있습니다.</p>
	
							<p class="pointSubColor">위 사항에 동의하십니까?</p>
							<ul class="radioArea">
								<li><input type="radio" id="agree1" name="agree" value="Y"> <label for="agree1">동의</label></li>
								<li><input type="radio" id="agree2" name="agree" value="N"> <label for="agree2">동의하지 않음</label></li>
							</ul>
						</div>
							
						<div class="btnArea">
							<button type="button" class="btnDefaultForm" onclick="return doSubmit()">완료</button>
						</div>
					</section>
				</form>



			</div> <!-- // contents -->


		</div>
	</div> <!-- // contentsWrap -->

<!--#include file="../include/inc_footer.jsp"-->
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