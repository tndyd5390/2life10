<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import= "com.cl.util.HttpUtil" %>
<!--#include file="../include/inc_header.jsp"-->
<%@include file="/WEB-INF/view/include/inc_header.jsp"%>

<!--#include file="../include/inc_header.jsp"-->
<script type="text/javascript" src="/public/js/samsungcnt.js"></script>
<script type="text/javascript" src="/public/js/samsungcnt-jquery.js"></script>
<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
	<div id="contentsWrap">
		<div class="container">
			<div class="conTitWrap">
				<h2>가입상담신청</h2>
				<div class="location">
					<span class="home">홈</span>
					<span>고객센터</span>
					<strong>가입상담신청</strong>
				</div>
			</div> <!-- // conTitWrap -->
			<!-- 메뉴 영역 -->
			



<script type="text/javascript">
	$(function() {
		//메뉴 제어 
		var lnb = $(".pcLnbWrap ul li a");
		var menuId = "MN60800";
		var mbId = "MO60800";
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
	function agreeCheck(check){
		if(check.checked){
			document.getElementById('agree1').checked = true;
			document.getElementById('agree').checked = true;
		}else{
			document.getElementById('agree1').checked = false;
			document.getElementById('agree2').checked = true;
		}
	}
	
	function disAgree(check){
		if(check.checked){
			document.getElementById('agree1').checked = false;
			document.getElementById('agree').checked = false;
		}
	}
	
	function appliForSub(){
		var form = document.getElementById('frm');
		
		if(!telChk('tel1', 'tel2', 'tel3') || !telChk('phoneTel1', 'phoneTel2', 'phoneTel3')){
			alert("전화번호와 휴대폰번호 중 하나는 반드시 입력되야 합니다.")
			return
		}else if(form.appliName.value == ""){
			alert("성명을 입력해 주세요.");
			form.appliName.focus();
			return;
		}else{
			form.submit();
		}
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
                        <strong><button type="button" class="select" id="subtitle">상담사조회</button></strong>
                        <ul>
							<li id="MO60100"><a href="javascript:goMenu('/notice/noticeList.do', 'MO60100');">공지사항</a></li>
                            <li id="MO60200"><a href="javascript:goMenu('/qna/qnaList.do', 'MO60200');">자주하는질문</a></li>
                            <li id="MO60300"><a href="javascript:goMenu('/counsel/counselWrite.do', 'MO60300');">1:1상담</a></li>
                            <li id="MO60400"><a href="javascript:goMenu('/infomation/infomation_a.do', 'MO60400');">주요정보고시사항</a></li>
                            <li id="MO60500"><a href="javascript:goMenu('/regulation/regulationList.do', 'MO60500');">상조관련법규</a></li>
                            <li id="MO60600"><a href="javascript:goMenu('/agreement/agreementList.do', 'MO60600');">이용약관</a></li>
                            <li id="MO60700"><a href="javascript:goMenu('/inquiry/inquiryList.do', 'MO60700');">납부조회</a></li>
                            <li id="MO60800"><a href="javascript:goMenu('/appli/appliForm.do', 'MO60800');">가입상담신청</a></li>
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
                            <li id="MN60800"><a href="javascript:goMenu('/appli/appliForm.do', 'MO60800');">가입상담신청</a></li>
                    </ul>
                </nav>
            </div> <!-- // pcLnbWrap -->

			<!-- 메뉴 영역 -->

			<div id="agreebox" class="contents"> <!-- 페이지별 ID none -->

				<div class="businessIntro">
					<h3 class="subTit">가입상담신청</h3>
				</div>

				<br/><br/>
				<form id="frm" method="post" action="/appli/appliProc.do">
				<%
					if(HttpUtil.getUtype(request).equals("F")){
				%>
					<h3 class="smallTit">가입상담 상품</h3>
	                    <div class="boardType2">
	                        <table summary="">
	                            <colgroup>
	                                <col width="20%">
	                                <col width="80%">
	                            </colgroup>
	                            <tbody>
	                                <tr>
	                                    <th scope="row">상품선택</th>
	                                    <td>
											<input type="radio" id="agree1" name="appliProdCode" value="42" checked> <label for="agree1">프리미엄 390</label>
											<br><b style="color:red; font-weight:bold;">※ 30만원 할인적용 대상입니다.</b>
	                                    </td>
	                                </tr>
	                                <tr>
	                                    <th scope="row">계약구좌</th>
	                                    <td>
	                                        <input type="radio" id="agree2" name="appliContractCode" value="45" checked> <label for="agree1">1구좌</label>
	                                    </td>
	                                </tr>
								</tbody>
	                        </table>
	                    </div>
						<br/><br/>
				<% 
					}
				%>
					<h3 class="smallTit">상담자정보 입력</h3>
					<div class="boardType2">
						<table summary="">
							<caption>회원가입</caption>
							<colgroup>
								<col width="20%">
								<col width="80%">
							</colgroup>
							<tbody>
								<tr>
									<th scope="row">상담자명</th>
									<td>
										<input type="text" name="appliName" value="" title="이름" class="inputType1" style="" maxlength="25">
									</td>
								</tr>
								<tr>
									<th scope="row">자택전화</th>
									<td>
										<select id="tel1" name="tel1" id="tel1" title="" class="numPhn inputType3">
	                                        <option value="02">02</option>
											<option value="031">031</option>
											<option value="032">032</option>
											<option value="033">033</option>
											<option value="041">041</option>
											<option value="042">042</option>
											<option value="043">043</option>
											<option value="051">051</option>
											<option value="052">052</option>
											<option value="053">053</option>
											<option value="054">054</option>
											<option value="055">055</option>
											<option value="061">061</option>
											<option value="062">062</option>
											<option value="063">063</option>
											<option value="064">064</option>
                                        </select>
										-
										<input type="text" name="tel2" id="tel2" class="numPhn inputType2" style="" maxlength="4">
										-
										<input type="text" name="tel3" id="tel3" class="numPhn inputType2" style="" maxlength="4">
									</td>
								</tr>
								<tr>
									<th scope="row">휴대전화</th>
									<td>
										<select id="phoneTel1" name="phoneTel1" id="phoneTel1" title="" class="inputType3">
                                            <option value="010">010</option>
                                            <option value="011">011</option>
                                            <option value="016">016</option>
                                            <option value="017">017</option>
                                            <option value="019">019</option>
                                        </select>
										-
										<input type="text" name="phoneTel2" id="phoneTel2" class="inputType2" style="" maxlength="4">
										-
										<input type="text" name="phoneTel3" id="phoneTel3" class="inputType2" style="" maxlength="4">
									</td>
								</tr>
								
								<tr>
							</tbody>
						</table>
					</div>

					<br/><br/>

                    <div class="btn_area">
                        <a href="javascript:appliForSub();" id="submitLink" class="btn_active">가입상담신청</a>
                        <a href="#" id="btnCancel" class="btn_cancel">취소</a>
                    </div>
                </form>
			</div> <!-- // contents -->


		</div>
	</div> <!-- // contentsWrap -->

<%@include file="/WEB-INF/view/include/inc_footer.jsp"%>