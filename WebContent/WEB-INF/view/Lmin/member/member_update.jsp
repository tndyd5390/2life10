<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.cl.util.CmmUtil" %>
<%@ page import="com.cl.util.TextUtil" %>
<%@ page import="com.cl.util.AES256Util" %>
<%@ page import="com.cl.dto.MemberDTO" %>
<%
	MemberDTO mDTO = (MemberDTO) request.getAttribute("mDTO");

	if(mDTO == null) {
		mDTO = new MemberDTO();
	}				
%>

<!DOCTYPE html>
<html lang="ko">
<head>
<title>관리자모드-크리스찬라이프</title>

<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />
<link type="text/css" rel="stylesheet" href="../../public/css/default.css" />
<link type="text/css" rel="stylesheet" href="../../public/css/layout_kor.css" />

<link type="text/css" rel="stylesheet" href="../../public/css/sub_kor.css" />

<script type="text/javascript" src="../../public/js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="../../public/js/TweenMax.min.js"></script>
<script type="text/javascript" src="../../public/js/common.js"></script>
<script type="text/javascript" src="../../public/js/contents.js"></script>
<script type="text/javascript" src="../../public/js/jquery.form.js"></script>
<script type="text/javascript" src="../../public/js/jquery.rss.js"></script>

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
			
			<!-- Header Include -->
			<%@include file="/WEB-INF/view/include/inc_header.jsp"%>

		</div>
	</div> <!-- // header -->

	<div id="contentsWrap">
		<div class="container">
			<div class="conTitWrap">
				<h2>관리자/회원정보 수정</h2>
				<div class="location">
					<span class="home">홈</span>
					<span>관리자모드</span>
					<span>회원정보</span>
					<strong>회원정보 수정</strong>
				</div>
			</div> <!-- // conTitWrap -->
			<!-- 메뉴 영역 -->

<script type="text/javascript">
	var idCheckTF = false;
	var passCheckTF = false;
	
	$(function() {
		//메뉴 제어 
		var lnb = $(".pcLnbWrap ul li a");
		var menuId = "MN70200";
		var mbId = "MO70200";
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
			
		$("#name").focusout(function(){
			var value = $(this).val();
			var regex = /[a-z0-9]|[ \[\]{}()<>?|`~!@#$%^&*-_+=,.;:\"'\\]/g;
			
			if(value==""){
				
			}else if(regex.test(value)){
				alert("한글만 입력 가능합니다.");
				$(this).val("");
			}
		});
		
		$("#tel2,#tel3,#phone2,#phone3").focusout(function(){
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
			
	//폼 Submit
	function doSubmit(){
		var f = $("#f");		
		var name = $("#name");
		var sex = $("#sex");
		var home1 = $("#tel1");
		var home2 = $("#tel2");
		var home3 = $("#tel3");
		var phone1 = $("#phone1");
		var phone2 = $("#phone2");
		var phone3 = $("#phone3");
		var postno = $("#postcode");
		var addr1 = $("#address1");
		var addr2 = $("#address2");
		var mNo = '<%=CmmUtil.nvl(mDTO.getMemberNo()) %>';
		
		if(name.val() == "") {
			alert("이름을 입력하세요.");
			name.focus();
			return false;		
		} else if(sex.val() == "") {
			alert("성별을 선택하세요.");
			sex.focus();
			return false;
		} else if(home2.val() == "") {
			alert("전화번호를 입력하세요.");
			home2.focus();
			return false;
		} else if(home3.val() == "") {
			alert("전화번호를 입력하세요.");
			home3.focus();
			return false;
		} else if(phone2.val() == "") {
			alert("휴대전화번호를 입력하세요.");
			phone2.focus();
			return false;
		} else if(phone3.val() == "") {
			alert("휴대전화번호를 입력하세요.");
			phone3.focus();
			return false;
		} else {
			$("mNo").val(mNo);
			f.attr("action", "/Lmin/member/memberUpdateProc.do");
			f.submit();
			return true;
		}
	};
		
	function goList() {
		location.href="/Lmin/member/memberList.do";
	}
	

</script>

<form action="#" name="menuFrm" method="post">
	<input type="hidden" name="menuNum"/>
</form>	

			<div class="moLnbWrap">
				<nav class="flexContainer">
					<div class="flexItem3">
						<strong><button type="button" class="select">관리자모드</button></strong>
						<ul>
							<li><a href="javascript:goMenu('', '');">관리자모드</a></li>
						</ul>
					</div>
					<div class="flexItem4"> <!-- .select 버튼 클릭시 다중클래스 on 추가 -->
						<strong><button type="button" class="select" id="subtitle">고객센터</button></strong>
						<ul>
						<li id="MO70100"><a href="javascript:goMenu('../company/branch.jsp', 'MO70100');">전국지사안내</a></li>
						<li id="MO70200"><a href="javascript:goMenu('../company/advice.jsp', 'MO70200');">상담사조회</a></li>
						<li id="MO70300"><a href="javascript:goMenu('../company/cyber.jsp', 'MO70300');">사이버홍보실</a></li>
						<li id="MO70400"><a href="javascript:goMenu('../funeral/funeral_info_list.jsp', 'MO70400');">전국장례시설안내</a></li>
						<li id="MO70500"><a href="javascript:goMenu('../funeral/funeral_notice.jsp', 'M760500');">부고알림</a></li>
						<li id="MO70600"><a href="javascript:goMenu('../cruise/cruise_schedule.jsp', 'MO70600');">크루즈일정</a></li>
						<li id="MO70700"><a href="javascript:goMenu('../notice/notice_list.jsp', 'MO70700');">공지사항</a></li>
						<li id="MO70800"><a href="javascript:goMenu('../counsel/counsel_list.jsp', 'MO70800');">1:1상담</a></li>
						<li id="MO70900"><a href="javascript:goMenu('../regulation/regulation_list.jsp', 'MO0900');">상조관련법규</a></li>
						<li id="MO71200"><a href="javascript:goMenu('../appli/appli_list.jsp', 'MO71200');">가입신청</a></li>
						<li id="MO71300"><a href="javascript:goMenu('../member/member_list.jsp', 'MO71200');">회원정보</a></li>
						</ul>
					</div>
								
				</nav>
			</div> <!-- // moLnbWrap -->

			<div class="pcLnbWrap">
				<nav>
					<ul class="pcLnb">
						<li id="MN70100"><a href="javascript:goMenu('../company/branch.jsp', 'MN70100');">전국지사안내</a></li>
						<li id="MN70200"><a href="javascript:goMenu('../company/advice.jsp', 'MN70200');">상담사조회</a></li>
						<li id="MN70300"><a href="javascript:goMenu('../company/cyber.jsp', 'MN70300');">사이버홍보실</a></li>
						<li id="MN70400"><a href="javascript:goMenu('../funeral/funeral_info_list.jsp', 'MN70400');">전국장례시설안내</a></li>
						<li id="MN70500"><a href="javascript:goMenu('../funeral/funeral_notice.jsp', 'M760500');">부고알림</a></li>
						<li id="MN70600"><a href="javascript:goMenu('../cruise/cruise_schedule.jsp', 'MN70600');">크루즈일정</a></li>
						<li id="MN70700"><a href="javascript:goMenu('../notice/notice_list.jsp', 'MN70700');">공지사항</a></li>
						<li id="MN70800"><a href="javascript:goMenu('../counsel/counsel_list.jsp', 'MN70800');">1:1상담</a></li>
						<li id="MN70900"><a href="javascript:goMenu('../regulation/regulation_list.jsp', 'MN0900');">상조관련법규</a></li>
						<li id="MN71200"><a href="javascript:goMenu('../appli/appli_list.jsp', 'MN71200');">가입신청</a></li>
						<li id="MN71300"><a href="javascript:goMenu('../member/member_list.jsp', 'MN71200');">회원정보</a></li>
					</ul>
				</nav>
			</div> <!-- // pcLnbWrap -->

			<!-- 메뉴 영역 -->

			<div class="contents"> <!-- 페이지별 ID none -->
				<h3 class="smallTit">회원정보 수정</h3>			
			<form name="f" id="f" method="post" action="/Lmin/member/memberUpdateProc.do">
			<input type="hidden" name="mNo" id="mNo" value="<%=CmmUtil.nvl(mDTO.getMemberNo()) %>">
                <div class="boardType2">
					<table summary="">
						<caption>회원정보 수정</caption>
						<colgroup>
							<col width="20%">
							<col width="80%">
						</colgroup>
						<tbody>
							<tr>
								<th scope="row">아이디</th>
								<td>
									<input type="text" name="id" id="id" value="<%=CmmUtil.nvl(mDTO.getMemberId()) %>" title="이름" class="inputType1" style="" readonly>									
								</td>
							</tr>							
							<tr>
								<th scope="row">성명</th>
								<td>
									<input type="text" name="name" id="name" value="<%=AES256Util.strDecode(CmmUtil.nvl(mDTO.getMemberName())) %>" title="이름" class="inputType1" style="" maxlength="5">
								</td>
							</tr>
							<tr>
								<th scope="row">성별</th>
								<td>
									<input type="radio" id="gender" name="sex" value="M" <%=CmmUtil.checked("남자", CmmUtil.nvl(mDTO.getMemberSex())) %>> <label for="agree1">남</label>
									<input type="radio" id="gender" name="sex" value="F" <%=CmmUtil.checked("여자", CmmUtil.nvl(mDTO.getMemberSex())) %>> <label for="agree1">여</label>
								</td>
							</tr>
							<tr>
								<th scope="row">자택전화</th>
								<td>
									<select id="tel1" name="tel1" title="" class="inputType3">
										<option value="02" <%=CmmUtil.select("02", AES256Util.strDecode(CmmUtil.nvl(mDTO.getMemberHomeNo())).split("-")[0]) %>>02</option>
										<option value="031" <%=CmmUtil.select("031", AES256Util.strDecode(CmmUtil.nvl(mDTO.getMemberHomeNo())).split("-")[0]) %>>031</option>
									</select>
									-
									<input type="text" name="tel2" id="tel2" value="<%=AES256Util.strDecode(CmmUtil.nvl(mDTO.getMemberHomeNo())).split("-")[1] %>" title="이름" class="inputType2" style="" maxlength="4">
									-
									<input type="text" name="tel3" id="tel3" value="<%=AES256Util.strDecode(CmmUtil.nvl(mDTO.getMemberHomeNo())).split("-")[2] %>" title="이름" class="inputType2" style="" maxlength="4">
								</td>
							</tr>
							<tr>
								<th scope="row">휴대전화</th>
								<td>
									<select id="phone1" name="phone1" title="" class="inputType3">
										<option value="010" <%=CmmUtil.select("010", AES256Util.strDecode(CmmUtil.nvl(mDTO.getMemberPhoneNo())).split("-")[0]) %>>010</option>
										<option value="011" <%=CmmUtil.select("011", AES256Util.strDecode(CmmUtil.nvl(mDTO.getMemberPhoneNo())).split("-")[0]) %>>011</option>
									</select>
									-
									<input type="text" name="phone2" id="phone2" value="<%=AES256Util.strDecode(CmmUtil.nvl(mDTO.getMemberPhoneNo())).split("-")[1] %>" title="이름" class="inputType2" style="" maxlength="4">
									-
									<input type="text" name="phone3" id="phone3" value="<%=AES256Util.strDecode(CmmUtil.nvl(mDTO.getMemberPhoneNo())).split("-")[2] %>" title="이름" class="inputType2" style="" maxlength="4">
								</td>
							</tr>
							<tr>
								<th scope="row" rowspan="2">주소</th>
								<td>
									<input type="text" name="postcode" id="postcode" value="<%=AES256Util.strDecode(CmmUtil.nvl(mDTO.getMemberPostNo())) %>" title="이름" class="inputType2" style="" maxlength="5">
									<a href="javascript:daumPostcode();" class="btn_active_small">우편번호</a>
									<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>									
									<script>
										function daumPostcode() {
											new daum.Postcode(
													{
														oncomplete : function(
																data) {
															var fullAddr = '';
															var extraAddr = '';
															if (data.userSelectedType === 'R') {
																fullAddr = data.roadAddress;

															} else {
																fullAddr = data.jibunAddress;
															}
															if (data.userSelectedType === 'R') {
																if (data.bname !== '') {
																	extraAddr += data.bname;
																}
																if (data.buildingName !== '') {
																	extraAddr += (extraAddr !== '' ? ', '
																			+ data.buildingName
																			: data.buildingName);
																}
																fullAddr += (extraAddr !== '' ? ' ('
																		+ extraAddr
																		+ ')'
																		: '');
															}
															document.getElementById('postcode').value = data.zonecode;
															document.getElementById('address1').value = fullAddr;
															document.getElementById('address2').focus();
														}
													}).open();
										}
									</script>
									
								</td>
							</tr>
							<tr>
								<td>
									<input type="text" name="address1" id="address1" value="<%=TextUtil.exchangeEscape(AES256Util.strDecode(CmmUtil.nvl(mDTO.getMemberAddress()))) %>" title="이름" class="inputType5" style="">
									<input type="text" name="address2" id="address2" value="<%=AES256Util.strDecode(CmmUtil.nvl(mDTO.getMemberAddressDetail())) %>" title="이름" class="inputType5" style="">
								</td>
							</tr>
							<tr>
								<th scope="row">이메일 주소</th>
								<td>
									<input type="text" name="email1" id="email1" value="<%=AES256Util.strDecode(CmmUtil.nvl(mDTO.getMemberEmail1())) %>" title="이름" class="inputType2" style="" maxlength="20"> @
									<input type="text" name="email2" id="email2" value="<%=AES256Util.strDecode(CmmUtil.nvl(mDTO.getMemberEmail2())) %>" title="이름" class="inputType2" style="" maxlength="5">
									<select id="emailBox" name="emailBox" title="" class="inputType2">
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
						</tbody>
					</table>
				</div>

				<div class="btn_area">
					<a href="#" id="submitLink" class="btn_active" onclick="return doSubmit();">수정</a>
					<a href="#" id="submitLink" class="btn_active" onclick="goList()">취소</a>					
				</div>

			</form>
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