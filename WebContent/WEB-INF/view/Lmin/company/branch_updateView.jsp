<%@page import="com.cl.util.CmmUtil"%>
<%@page import="com.cl.util.TextUtil"%>
<%@page import="com.cl.dto.BranchDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	BranchDTO bDTO = (BranchDTO)request.getAttribute("bDTO");
	if(bDTO == null) bDTO = new BranchDTO();
	System.out.println("test : " + TextUtil.exchangeEscapeNvl(bDTO.getBranchPostNo()));
	String[] tel = TextUtil.exchangeEscapeNvl(bDTO.getBranchTelNo()).split("-");
	if(tel.length != 3){
		tel = new String[3];
		tel[0] = "";
		tel[1] = "";
		tel[2] = "";
	}
%>
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
<script type="text/javascript" src=/public/js/common.js"></script>
<script type="text/javascript" src="/public/js/contents.js"></script>
<script type="text/javascript" src="/public/js/jquery.form.js"></script>
<script type="text/javascript" src="/public/js/jquery.rss.js"></script>
<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
<!--[if lt IE 9]>
	<script src="/js/html5.js"></script>
	<script src="/js/respond.js"></script>
<![endif]-->
<script type="text/javascript">
function branchReg(){
	var f = document.getElementById('form');
	if(f.name.value == ""){
		alert("성명을 입력해 주세요.");
		f.name.focus();
		return;
	}else if(f.branchAreaCode.value == "선택하세요"){
		alert("지역을 선택해 주세요.");
		f.branchAreaCode.focus();
		return;
	}else if(f.branchName.value == ""){
		alert("지사명을 입력해 주세요.");
		f.branchName.focus();
		return;
	}else if(f.branchOfficerName.value == ""){
		alert("대표자명을 입력해 주세요.");
		f.branchOfficerName.focus();
		return;
	}else if(f.branchTel2.value == ""){
		alert("전화번호를 입력해 주세요.");
		f.branchTel2.focus();
		return;
	}else if(f.branchTel3.value == ""){
		alert("전화번호를 입력해 주세요.");
		f.branchTel3.focus();
		return;
	}else if(f.branchPostNo.value == ""){
		alert("우편번호를 입력해주세요.");
		f.branchPostNo.focus();
		return;
	}else if(f.branchAddressDetail.value == ""){
		alert("상세주소를 입력해 주세요.");
		f.branchAddressDetail.focus();
		return;
	}else{
		f.submit();
	}
}

function onlyNumber(obj) {
    $(obj).focusout(function(){
         $(this).val($(this).val().replace(/[^0-9]/g,""));
    }); 
}

function sample6_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var fullAddr = ''; // 최종 주소 변수
            var extraAddr = ''; // 조합형 주소 변수

            // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                fullAddr = data.roadAddress;

            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                fullAddr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
            if(data.userSelectedType === 'R'){
                //법정동명이 있을 경우 추가한다.
                if(data.bname !== ''){
                    extraAddr += data.bname;
                }
                // 건물명이 있을 경우 추가한다.
                if(data.buildingName !== ''){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('branchPostNo').value = data.zonecode; //5자리 새우편번호 사용
            document.getElementById('branchAddress').value = fullAddr;

            // 커서를 상세주소 필드로 이동한다.
            document.getElementById('branchAddressDetail').focus();
        }
    }).open();
}

function doCancel(){
	if(confirm("현재 작성중인 정보는 저장되지 않습니다. 취소하시겠습니까?")){
		location.href="/Lmin/company/branchList.do";
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
			<%@include file="/WEB-INF/view/include/inc_header.jsp"%>
		</div>
	</div> <!-- // header -->

	<div id="contentsWrap">
		<div class="container">
			<div class="conTitWrap">
				<h2>관리자/전국지사안내</h2>
				<div class="location">
					<span class="home">홈</span>
					<span>관리자모드</span>
					<strong>전국지사안내</strong>
				</div>
			</div> <!-- // conTitWrap -->
			<!-- 메뉴 영역 -->
			



<script type="text/javascript">
	$(function() {
		//메뉴 제어 
		var lnb = $(".pcLnbWrap ul li a");
		var menuId = "MN70100";
		var mbId = "MO70100";
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
		
		
		$('#geoCode_1 option').each(function(){
		    if($(this).val()=="<%=CmmUtil.nvl(bDTO.getBranchAreaCode())%>"){
		    	$(this).attr("selected","selected"); 
		 	}
		 });
		
		$('#telAbleEndTime option').each(function(){
		    if($(this).val()=="<%=CmmUtil.nvl(tel[0])%>"){
		    	$(this).attr("selected","selected"); 
		 	}
		 });
	});
</script>

<form action="#" name="menuFrm" method="post">
	<input type="hidden" name="menuNum"/>
</form>	
			<%@include file="/WEB-INF/view/Lmin/include/navBar.jsp" %>


			<div id="write" class="contents"> <!-- 페이지별 ID none -->
				<h4 class="smallTit">전국지사안내</h4>

				<div class="boardType2">
				<form action="/Lmin/company/branchUpdateProc.do" method="post" id="form">
				<input type="hidden" name="branchNo" value="<%=TextUtil.exchangeEscapeNvl(bDTO.getBranchNo()) %>">
					<table summary="">
						<caption></caption>
						<colgroup>
							<col width="20%">
							<col width="80%">
						</colgroup>
						<tbody>
							<tr>
								<th scope="row">지역</th>
								<td>
									<select id="geoCode_1" name="branchAreaCode" title="" class="inputType2">
										<option value="선택하세요">선택하세요</option>
										<option value="서울특별시">서울특별시</option>
										<option value="부산광역시">부산광역시</option>
										<option value="대구광역시">대구광역시</option>
										<option value="인천광역시">인천광역시</option>
										<option value="광주광역시">광주광역시</option>
										<option value="대전광역시">대전광역시</option>
										<option value="울산광역시">울산광역시</option>
										<option value="경기도">경기도</option>
										<option value="강원도">강원도</option>
										<option value="충청북도">충청북도</option>
										<option value="충청남도">충청남도</option>
										<option value="전라북도">전라북도</option>
										<option value="전라남도">전라남도</option>
										<option value="경상북도">경상북도</option>
										<option value="경상남도">경상남도</option>
										<option value="제주특별자치도">제주특별자치도</option>
									</select>
								</td>
							</tr>
							<tr>
								<th scope="row">지사명</th>
								<td>
									<input type="text" name="branchName" title="" class="inputType1" value="<%=TextUtil.exchangeEscapeNvl(bDTO.getBranchName())%>">
								</td>
							</tr>
							<tr>
								<th scope="row">대표자명</th>
								<td>
									<input type="text" name="branchOfficerName"  title="" class="inputType1" value="<%=TextUtil.exchangeEscapeNvl(bDTO.getBranchOfficerName())%>">
								</td>
							</tr>
							<tr>
								<th scope="row">지사전화</th>
								<td>
									<select id="telAbleEndTime" name="branchTel1" title="" class="inputType3">
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
									<input type="text" name="branchTel2" title="" class="inputType2" style="" maxlength="5" onkeydown="onlyNumber(this)" value="<%=CmmUtil.nvl(tel[1])%>">
									-
									<input type="text" name="branchTel3" title="" class="inputType2" style="" maxlength="5" onkeydown="onlyNumber(this)" value="<%=CmmUtil.nvl(tel[2])%>">
								</td>
							</tr>
							<tr>
								<th scope="row" rowspan="3">주소</th>
								<td>
									<input type="text" name="branchPostNo" id="branchPostNo" title="이름" class="inputType2" value="<%=TextUtil.exchangeEscapeNvl(bDTO.getBranchPostNo())%>" onclick="sample6_execDaumPostcode();">
									<a href="#" class="btn_active_small"  onclick="sample6_execDaumPostcode();">우편번호</a>
								</td>
							</tr>
							<tr>
								<td>
									<input type="text" name="branchAddress" id="branchAddress" title="이름" class="inputType5" value="<%=TextUtil.exchangeEscapeNvl(bDTO.getBranchAddress())%>">
									<input type="text" name="branchAddressDetail" id="branchAddressDetail" title="이름" class="inputType5" value="<%=TextUtil.exchangeEscapeNvl(bDTO.getBranchAddressDetail())%>">
									나머지주소
								</td>
							</tr>
						</tbody>
					</table>
				</form>
				</div>

				<div class="btn_area">
					<a href="#" id="submitLink" class="btn_active" onclick="branchReg();">수정</a>
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
