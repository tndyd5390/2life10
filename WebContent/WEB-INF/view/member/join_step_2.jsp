<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../include/inc_header.jsp"%>
<!--#include file="../include/inc_header.jsp"-->

	<div id="contentsWrap">
		<div class="container">
			<div class="conTitWrap">
				<h2>회원가입</h2>
				<div class="location">
					<span class="home">홈</span>
					<span>로그인</span>
					<strong>회원가입</strong>
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
	});
	
	//아이디 중복확인 ajax
	function idCheck(){
		var memberId = $("#id");
		if(memberId.val()==""){
			alert("아이디를 입력해주세요.");
		}else{
			$.ajax({
				url : "/member/idCheck.do",
				method : "post",
				data : {"memberId" : memberId.val()},
				success : function(result){
					if(result == 0){
						alert("가입가능한 아이디입니다.");
						idCheckTF = true;
					}else{
						alert("이미 가입되어있는 아이디입니다.");
						memberId.focus();
						idCheckTF = false;
					}
				}
			})
		}
	};
	
	//폼 Submit
	function doSubmit(){
		var f = $("#f");
		var id = $("#id");
		var pwd = $("#password");
		var pwdChk = $("#passwordCheck");
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
		
		if(id.val()==""){
			alert("아이디를 입력하세요.");
			id.focus();
			return false;
		}else if(idCheckTF == false){
			alert("아이디 중복확인이 필요합니다.");
			return false;
		}else if(pwd.val()==""){
			alert("패스워드를 입력하세요.");
			pwd.focus();
			return false;
		}else if(pwdChk==""){
			alert("패스워드확인을 입력하세요.");
			pwd.focus();
			return false;
		}else if(pwd.val()!=pwdChk.val()){
			alert("패스워드가 일치 하지 않습니다.");
			pwd.focus();
			return false;
		}else if(name.val()==""){
			alert("이름을 입력하세요.");
			name.focus();
			return false;
		}else if(sex.val()==""){
			alert("성별을 선택하세요.");
			sex.focus();
			return false;
		}else if(home2.val()==""){
			alert("전화번호를 입력하세요.");
			home2.focus();
			return false;
		}else if(home3.val()==""){
			alert("전화번호를 입력하세요.");
			home3.focus();
			return false;
		}else if(phone2.val()==""){
			alert("휴대전화번호를 입력하세요.");
			phone2.focus();
			return false;
		}else if(phone3.val()==""){
			alert("휴대전화번호를 입력하세요.");
			phone3.focus();
			return false;
		}else{
			if(confirm("가입하시겠습니까?")){
				f.submit();
				return true;
			}else{
				return false;
			}
		}
	};
	

</script>

<form action="#" name="menuFrm" method="post">
	<input type="hidden" name="menuNum"/>
</form>	

			<div class="moLnbWrap">
				<nav class="flexContainer">
					<div class="flexItem3">
						<strong><button type="button" class="select">고객센터</button></strong>
						<ul>
							<li><a href="javascript:goMenu('../company/overview.jsp', '');">회사안내</a></li>
							<li><a href="javascript:goMenu('../info/pro_info.jsp', '');">상조상품안내</a></li>
							<li><a href="javascript:goMenu('../funeral/funeral_mark.jsp', '');">장례상품</a></li>
							<li><a href="javascript:goMenu('../marry/marry_mark.jsp', '');">웨딩상품</a></li>
							<li><a href="javascript:goMenu('../cruise/cruise_mark.jsp', '');">크루즈상품</a></li>
							<li><a href="javascript:goMenu('../notice/notice_list.jsp', '');">고객센터</a></li>
						</ul>
					</div>
					<div class="flexItem4"> <!-- .select 버튼 클릭시 다중클래스 on 추가 -->
						<strong><button type="button" class="select" id="subtitle">로그인</button></strong>
						<ul>
							<li id="MO70100"><a href="javascript:goMenu('../login/login.jsp', 'MO70100');">로그인</a></li>
                            <li id="MO70200"><a href="javascript:goMenu('../member/join_step.jsp', 'MO70200');">회원가입</a></li>
                            <li id="MO70300"><a href="javascript:goMenu('../member/find_id.jsp', 'MO70300');">아이디찾기</a></li>
                            <li id="MO70400"><a href="javascript:goMenu('../member/find_pass.jsp', 'MO70400');">패스워드찾기</a></li>
						</ul>
					</div>
								
				</nav>
			</div> <!-- // moLnbWrap -->

			<div class="pcLnbWrap">
				<nav>
					<ul class="pcLnb">
						<li id="MN70100"><a href="javascript:goMenu('../login/login.jsp', 'MN70100');">로그인</a></li>
                        <li id="MN70200"><a href="javascript:goMenu('../member/join_step.jsp', 'MN70200');">회원가입</a></li>
                        <li id="MN70300"><a href="javascript:goMenu('../member/find_id.jsp', 'MN70300');">아이디찾기</a></li>
                        <li id="MN70400"><a href="javascript:goMenu('../member/find_pass.jsp', 'MN70400');">패스워드찾기</a></li>
					</ul>
				</nav>
			</div> <!-- // pcLnbWrap -->

			<!-- 메뉴 영역 -->

			<div class="contents"> <!-- 페이지별 ID none -->
				<h3 class="smallTit">회원가입</h3>
			
			<form name="f" id="f" method="post" action="/member/joinProc.do" >
                <div class="boardType2">
					<table summary="">
						<caption>회원가입</caption>
						<colgroup>
							<col width="20%">
							<col width="80%">
						</colgroup>
						<tbody>
							<tr>
								<th scope="row">아이디</th>
								<td>
									<input type="text" name="id" id="id" value="" title="이름" class="inputType1" style="" maxlength="15">
									<a href="javascript:idCheck();" class="btn_active_small">중복확인</a>
								</td>
							</tr>
							<tr>
								<th scope="row">패스워드</th>
								<td>
									<input type="password" name="password" id="password" value="" title="이름" class="inputType1" style="" maxlength="25">
								</td>
							</tr>
							<tr>
								<th scope="row">패스워드확인</th>
								<td>
									<input type="password" name="passwordCheck" id="passwordCheck" value="" title="이름" class="inputType1" style="" maxlength="25">
								</td>
							</tr>
							<tr>
								<th scope="row">성명</th>
								<td>
									<input type="text" name="name" id="name" value="" title="이름" class="inputType1" style="" maxlength="5">
								</td>
							</tr>
							<tr>
								<th scope="row">성별</th>
								<td>
									<input type="radio" id="gender" name="sex" value="M"> <label for="agree1">남</label>
									<input type="radio" id="gender" name="sex" value="F"> <label for="agree1">여</label>
								</td>
							</tr>
							<tr>
								<th scope="row">자택전화</th>
								<td>
									<select id="tel1" name="tel1" title="" class="inputType3">
										<option value="02">02</option>
										<option value="031">031</option>
									</select>
									-
									<input type="text" name="tel2" id="tel2" value="" title="이름" class="inputType2" style="" maxlength="4">
									-
									<input type="text" name="tel3" id="tel3" value="" title="이름" class="inputType2" style="" maxlength="4">
								</td>
							</tr>
							<tr>
								<th scope="row">휴대전화</th>
								<td>
									<select id="phone1" name="phone1" title="" class="inputType3">
										<option value="00">010</option>
										<option value="01">011</option>
									</select>
									-
									<input type="text" name="phone2" id="phone2" value="" title="이름" class="inputType2" style="" maxlength="4">
									-
									<input type="text" name="phone3" id="phone3" value="" title="이름" class="inputType2" style="" maxlength="4">
								</td>
							</tr>
							<tr>
								<th scope="row" rowspan="2">주소</th>
								<td>
									<input type="text" name="postcode" id="postcode" value="" title="이름" class="inputType2" style="" maxlength="5">
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
									<input type="text" name="address1" id="address1" value="" title="이름" class="inputType5" style="">
									<input type="text" name="address2" id="address2" value="" title="이름" class="inputType5" style="">
								</td>
							</tr>
							<tr>
								<th scope="row">이메일 주소</th>
								<td>
									<input type="text" name="email1" id="email1" value="" title="이름" class="inputType2" style="" maxlength="5"> @
									<input type="text" name="email2" id="email2" value="" title="이름" class="inputType2" style="" maxlength="5">
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
					<a href="javascript:doSubmit();" id="submitLink" class="btn_active">가입신청</a>
					<a href="#" id="btnCancel" class="btn_cancel">취소</a>
				</div>

			</form>
			</div> <!-- // contents -->


		</div>
	</div> <!-- // contentsWrap -->

<!--#include file="../include/inc_footer.jsp"--><%@include file="../include/inc_footer.jsp"%>
