<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include/inc_header.jsp" %>
<script type="text/javascript" src="/public/js/samsungcnt.js"></script>
<script type="text/javascript" src="/public/js/samsungcnt-jquery.js"></script>
	<div id="contentsWrap">
		<div class="container">
			<div class="conTitWrap">
				<h2>1:1상담</h2>
				<div class="location">
					<span class="home">홈</span>
					<span>고객센터</span>
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
		
	});
	
	function doSubmit(){
		var f = document.getElementById('f');
		
		if(f.name.value == ""){
			alert("작성자를 입력하세요.");
			name.focus();
			return;
		}else if(f.phone2.value ==""){
			alert("휴대전화를 입력하세요.");
			phone2.focus();
			return;
		}else if(f.phone3.value==""){
			alert("휴대전화를 입력하세요.");
			phone2.focus();
			return;
		}else if(!telChk('phone1', 'phone2', 'phone3')){
			return;
		}else if(f.email1.value==""){
			alert("이메일 주소를 입력하세요.");
			f.email1.focus();
			return;
		}else if(f.email2.value == ""){
			alert("이메일 주소를 선택하세요.");
			f.email2.focus();
			return;
		}else if(f.title.value == ""){
			alert("제목을 입력하세요.");
			f.title.focus();
			return;
		}else if(f.contents.value == ""){
			alert("문의내용을 입력하세요.");
			contents.focus();
			return;
		}else if(checkRadio()){
			alert("개인정보 수집.이용 동의가 필요합니다.");
			document.getElementById('agree1').focus();
			return;
		}else{
			f.submit();
		} 
	};
	
	function checkRadio(){
		var radio = document.getElementById('agree1');
		if(radio.checked){
			return false;
		}else{
			return true;
		}
	}
	
	function doEmailChange(){
		var email = document.getElementById('emailBox').value;
		if(email == "direct")document.getElementById('email2').value = "";
		else document.getElementById('email2').value = email;
	}
</script>

<form action="#" name="menuFrm" method="post">
	<input type="hidden" name="menuNum"/>
</form>	

			<div class="moLnbWrap">
				<nav class="flexContainer">
					<div class="flexItem3">
						<strong><button type="button" class="select">고객센터</button></strong>
						<ul>
                            <li><a href="javascript:goMenu('/company/overView.do', '');">회사소개</a></li>
                            <li><a href="javascript:goMenu('/info/proInfo.do', '');">상조상품특징</a></li>
                            <li><a href="javascript:goMenu('/funeral/funeralMark.do', '');">장례상품</a></li>
                            <li><a href="javascript:goMenu('/marry/marryMark.do', '');">웨딩상품</a></li>
                            <li><a href="javascript:goMenu('/cruise/cruiseMark.do', '');">크루즈상품</a></li>
                            <li><a href="javascript:goMenu('/notice/noticeList.do', '');">고객센터</a></li>
						</ul>
					</div>
					<div class="flexItem4"> <!-- .select 버튼 클릭시 다중클래스 on 추가 -->
						<strong><button type="button" class="select" id="subtitle">1:1상담</button></strong>
						<ul>
							<li id="MO60100"><a href="javascript:goMenu('/notice/noticeList.do', 'MO60100');">공지사항</a></li>
                            <li id="MO60200"><a href="javascript:goMenu('/qna/qnaList.do', 'MO60200');">자주하는질문</a></li>
                            <li id="MO60300"><a href="javascript:goMenu('/counsel/counselWrite.do', 'MO60300');">1:1상담</a></li>
                            <li id="MO60400"><a href="javascript:goMenu('/infomation/infomation_a.do', 'MO60400');">주요정보고시사항</a></li>
                            <li id="MO60500"><a href="javascript:goMenu('/regulation/regulationList.do', 'MO60500');">상조관련법규</a></li>
                            <li id="MO60600"><a href="javascript:goMenu('/agreement/agreementList.do', 'MO60600');">이용약관</a></li>
                            <li id="MO60700"><a href="javascript:goMenu('/inquiry/inquiryList.do', 'MO60700');">납부조회</a></li>
                            <li id="MO60800"><a href="javascript:goMenu('/appli/appliForm.do', 'MO60800');">가입신청</a></li>
						</ul>
					</div>
								
				</nav>
			</div> <!-- // moLnbWrap -->

			<div class="pcLnbWrap">
				<nav>
					<ul class="pcLnb">
							<li id="MN60100"><a href="javascript:goMenu('/notice/noticeList.do', 'MO60100');">공지사항</a></li>
                            <li id="MN60200"><a href="javascript:goMenu('/qna/qnaList.do', 'MO60200');">자주하는질문</a></li>
                            <li id="MN60300"><a href="javascript:goMenu('/counsel/counselWrite.do', 'MO60300');">1:1상담</a></li>
                            <li id="MN60400"><a href="javascript:goMenu('/infomation/infomation_a.do', 'MO60400');">주요정보고시사항</a></li>
                            <li id="MN60500"><a href="javascript:goMenu('/regulation/regulationList.do', 'MO60500');">상조관련법규</a></li>
                            <li id="MN60600"><a href="javascript:goMenu('/agreement/agreementList.do', 'MO60600');">이용약관</a></li>
                            <li id="MN60700"><a href="javascript:goMenu('/inquiry/inquiryList.do', 'MO60700');">납부조회</a></li>
                            <li id="MN60800"><a href="javascript:goMenu('/appli/appliForm.do', 'MO60800');">가입신청</a></li>
					</ul>
				</nav>
			</div> <!-- // pcLnbWrap -->

			<!-- 메뉴 영역 -->

			<div id="counsel" class="contents"> <!-- 페이지별 ID none -->
				<h3 class="smallTit">1:1상담</h3>
				<form id="f" name="f" method="post" action="/counsel/counselRegProc.do">
					
					<section  class="grayWrap" id="section">
						<header>
							<h4 class="subTit">고객정보</h4>
						</header>

						<div class="boardType2">
							<table summary="">
								<caption>1:1 상담</caption>
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
												<option value="010">010</option>
												<option value="011">011</option>
											</select>
											-
											<input type="text" name="phone2" id="phone2" class="numPhn inputType2" maxlength="4">
											-
											<input type="text" name="phone3" id="phone3" class="numPhn inputType2" maxlength="4">
										</td>
									</tr>
									<tr>
										<th scope="row">이메일 주소</th>
										<td>
											<input type="text" name="email1" id="email1" class="inputType2" maxlength="10"> @
											<input type="text" name="email2" id="email2" class="inputType2" maxlength="15">
											<select id="emailBox" name="emailBox" class="inputType2" onchange="doEmailChange();">
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
								</tbody>
							</table>
						</div>
	
						<div class="termsWrap">
							<h5 class="blueTit">[필수] 개인정보 수집.이용 동의</h5>
							<p>크리스찬상조(주)는 고객님들의 의견 접수와 관련하여 성실한 답변을 드리기 위해 필요한 최소한의 개인정보를 수집하고 있습니다.</p>
							<ul class="defaultGrayDotList">
								<li>수집 항목 : 이름, 이메일, 휴대전화</li>
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
							<!-- <a href="#" class="btnDefaultForm">완료</a> -->
							<button type="button" class="psyBtnDefaultForm" onclick="doSubmit();">완료</button>
							<!-- <button type="button" class="btnDefaultForm">완료</button> -->
						</div>
					</section>
				</form>



			</div> <!-- // contents -->


		</div>
	</div> <!-- // contentsWrap -->

<%@ include file="/WEB-INF/view/include/inc_footer.jsp" %>