<%@page import="com.cl.util.TextUtil"%>
<%@page import="com.cl.util.CmmUtil"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.cl.dto.BranchDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	List<BranchDTO> bList = (List<BranchDTO>)request.getAttribute("bList");
	if(bList == null) bList = new ArrayList<>();
	String bySeach =CmmUtil.nvl((String)request.getAttribute("bySearch"));
	//페이징 처리를 위한 변수계산 
	//리스트를 10개로 나누어서 10개씩 한페이지에 나오게한다.
	int pageCnt = bList.size() / 10 + 1;
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
<script type="text/javascript" src="/public/js/common.js"></script>
<script type="text/javascript" src="/public/js/contents.js"></script>
<script type="text/javascript" src="/public/js/jquery.form.js"></script>
<script type="text/javascript" src="/public/js/jquery.rss.js"></script>

<!--[if lt IE 9]>
	<script src="/js/html5.js"></script>
	<script src="/js/respond.js"></script>
<![endif]-->
<script type="text/javascript">
	var currPage = 0;
	var pageCnt = <%=pageCnt%>;
	var currPageBtn = 5;
	function doSearch(){
		var searchArea = document.getElementById('searchArea');
		var searchWord = document.getElementById('searchWord');
		if(searchArea.value == "00"){
			alert('지역을 선택해 주세요.');
			searchArea.focus();
			return;
		}else if(searchWord.value == ""){
			alert('검색할 단어를 입력해 주세요.');
			searchWord.focus();
			return;
		}else{
			var form = document.createElement("form");
			form.setAttribute("method", "Post"); // Get 또는 Post 입력
			form.setAttribute("action", "/Lmin/company/branchSearch.do");
			
			var hiddenField = document.createElement("input");
			hiddenField.setAttribute("type", "hidden");
			hiddenField.setAttribute("name", "searchArea");
			hiddenField.setAttribute("value", searchArea.value);
			form.appendChild(hiddenField);
			 
			hiddenField = document.createElement("input");
			hiddenField.setAttribute("type", "hidden");
			hiddenField.setAttribute("name", "searchWord");
			hiddenField.setAttribute("value", searchWord.value);
			form.appendChild(hiddenField);
			
			document.body.appendChild(form);
			 
			form.submit();
		}
	}
	
	function changePage(pageNum, pageBtnId){
		currPage = pageNum-1;
		$('a.psyPageBtn').css("background-color", "#ffffff");
		$('a.psyPageBtn').css('color', "#555");
		$('#' + pageBtnId).css('background-color', "#205e9f");
		$('#' + pageBtnId).css('color', "#fff");
		for(var i = 0; i<= pageCnt; i++){
			$('li.'  + i).hide();
		}
		$('li.' + (pageNum-1)).show();
		
	}
	
	function prePage(){
		console.log("currPageBtn : " + currPageBtn);
		if(currPageBtn <= 5){
			alert('첫 페이지 입니다.');
			return;
		}else{
			currPageBtn -=5;
			for(var i = 1;i<=pageCnt;i++){
				$('#pageBtn' + i).hide();
			}
			console.log("currPageBtn : " + currPageBtn);
			for(var i = currPageBtn; i> currPageBtn-5; i--){
				$('#pageBtn' + i).show();
			}
			for(var i = 0; i<= pageCnt; i++){
				$('li.'  + i).hide();
			}
			$('li.' + (currPageBtn-1)).show();
			$('a.psyPageBtn').css("background-color", "#ffffff");
			$('a.psyPageBtn').css('color', "#555");
			$('#pageBtn' + currPageBtn).css('background-color', "#205e9f");
			$('#pageBtn' + currPageBtn).css('color', "#fff");
		}
	}
	
	function nextPage(){
		if(currPageBtn >= pageCnt){
			alert("마지막 페이지입니다.");
			return;
		}else{
			for(var i = 1;i<=pageCnt;i++){
				$('#pageBtn' + i).hide();
			}
			for(var i = currPageBtn + 1; i< currPageBtn + 6; i++){
				$('#pageBtn' + i).show();
			}
			for(var i = 0; i<= pageCnt; i++){
				$('li.'  + i).hide();
			}
			$('li.' + currPageBtn).show();
			$('a.psyPageBtn').css("background-color", "#ffffff");
			$('a.psyPageBtn').css('color', "#555");
			$('#pageBtn' + (currPageBtn + 1)).css('background-color', "#205e9f");
			$('#pageBtn' + (currPageBtn + 1)).css('color', "#fff");
			currPageBtn += 5;

		}
	}
	
	function firstPage(){
		currPageBtn = 5;
		currPage = 0;
		$('a.psyPageBtn').css("background-color", "#ffffff");
		$('a.psyPageBtn').css('color', "#555");
		$('#pageBtn1').css('background-color', "#205e9f");
		$('#pageBtn1').css('color', "#fff");
		for(var i = 0; i<= pageCnt; i++){
			$('li.'  + i).hide();
		}
		$('li.' + 0).show();
		for(var i = 1;i<=pageCnt;i++){
			$('#pageBtn' + i).hide();
		}
		for(var i = 1; i<= 5; i++){
			$('#pageBtn' + i).show();
		}
	}
	
	function lastPage(){
		console.log("pageCnt : " + pageCnt);
		currPage = pageCnt -1;
		$('a.psyPageBtn').css("background-color", "#ffffff");
		$('a.psyPageBtn').css('color', "#555");
		$('#pageBtn' + pageCnt).css('background-color', "#205e9f");
		$('#pageBtn' + pageCnt).css('color', "#fff");
		for(var i = 1;i<=pageCnt;i++){
			$('#pageBtn' + i).hide();
		}
		if(pageCnt % 5 == 0){
			for(var i = pageCnt; i > pageCnt -5; i--){
				$('#pageBtn' + i).show();
			}
			
		}else{
			for(var i = pageCnt; i%5!=0; i--){
				$('#pageBtn' + i).show();
			}
		}
		for(var i = 0; i<= pageCnt; i++){
			$('li.'  + i).hide();
		}
		$('li.'  + currPage).show();
		currPageBtn = pageCnt;
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
		$('#pageBtn1').css('background-color', "#205e9f");
		$('#pageBtn1').css('color', "#fff");
	});

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
						<li id="MO71000"><a href="javascript:goMenu('../inquiry/inquiry_list.jsp', 'MO71000');">납부조회</a></li>
						<li id="MO71200"><a href="javascript:goMenu('../appli/appli_form.jsp', 'MO71200');">가입신청</a></li>
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
						<li id="MN71000"><a href="javascript:goMenu('../inquiry/inquiry_list.jsp', 'MN71000');">납부조회</a></li>
						<li id="MN71200"><a href="javascript:goMenu('../appli/appli_form.jsp', 'MN71200');">가입신청</a></li>
					</ul>
				</nav>
			</div> <!-- // pcLnbWrap -->

			<!-- 메뉴 영역 -->

			<div class="contents"> <!-- 페이지별 ID none -->
				<h4 class="smallTit">전국지ddd사안내</h4>

				<div class="boardType2">
					<table summary="">
						<caption></caption>
						<colgroup>
							<col width="100%">
						</colgroup>
						<tbody>
							<tr>
								<td>
									<select id="searchArea" name="telAbleEndTime" title="" class="inputType3">
										<option value="00">지역명</option>
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
									지사명
									<input type="text" name="name" id="searchWord" title="" class="inputType6" style="" maxlength="25">

									<a href="#" class="btn_active_small" onclick="doSearch()">검색</a>
								</td>
							</tr>
						</tbody>
					</table>
                </div>

				<br/><br/>
				<ul class="boradType4">
				<%if("y".equals(bySeach)){//검색으로 들어올 경우
					if(bList.size() == 0){%>
						<li>
						<p class="num"></p>
						<div class="info">
							<p class="txt"></p>
							<p class="txt1"><!-- 박성진수정 -->
								검색 결과가 없습니다.
							</p>
							<p class="txt2">
								<span class="bar">&nbsp;</span>
								<span></span>
								<span class="bar"></span>
								<span class="count"></span>
						</p>
						</div>
						</li>
					
					<%}else{
						for(int i = 0; i< bList.size();i++){ 
							BranchDTO bDTO = bList.get(i);
							if(i < 10){//페이지 처리를 위해 처음 10개만 출력하고 나머지는 display:none;%>
							<li class="<%=i/10%>">
								<p class="num"><%=CmmUtil.nvl(bDTO.getRowNum()) %></p>
								<div class="info">
									<p class="txt"><%=TextUtil.exchangeEscapeNvl(bDTO.getBranchName()) %></p>
									<p class="txt1"><!-- 박성진수정 -->
										<a href="/Lmin/company/branchDetail.do?branchNo=<%=CmmUtil.nvl(bDTO.getBranchNo())%>"><%=TextUtil.exchangeEscapeNvl(bDTO.getBranchAddress()) + " " + TextUtil.exchangeEscapeNvl(bDTO.getBranchAddressDetail()) %></a>
									</p>
									<p class="txt2">
										<%=TextUtil.exchangeEscapeNvl(bDTO.getBranchOfficerName()) %><span class="bar">&nbsp;|</span>
										<span><%=TextUtil.exchangeEscapeNvl(bDTO.getBranchTelNo()) %></span>
										<span class="bar">|</span>
										<span class="count"><%=TextUtil.exchangeEscapeNvl(bDTO.getBranchAreaCode()) %></span>
									</p>
								</div>
							</li>
						<%}else{%>
							<li class="<%=i/10%>" style="display:none;">
								<p class="num"><%=CmmUtil.nvl(bDTO.getRowNum()) %></p>
								<div class="info">
									<p class="txt"><%=TextUtil.exchangeEscapeNvl(bDTO.getBranchName()) %></p>
									<p class="txt1"><!-- 박성진수정 -->
										<a href="/Lmin/company/branchDetail.do?branchNo=<%=CmmUtil.nvl(bDTO.getBranchNo())%>"><%=TextUtil.exchangeEscapeNvl(bDTO.getBranchAddress()) + " " + TextUtil.exchangeEscapeNvl(bDTO.getBranchAddressDetail()) %></a>
									</p>
									<p class="txt2">
										<%=TextUtil.exchangeEscapeNvl(bDTO.getBranchOfficerName()) %><span class="bar">&nbsp;|</span>
										<span><%=TextUtil.exchangeEscapeNvl(bDTO.getBranchTelNo()) %></span>
										<span class="bar">|</span>
										<span class="count"><%=TextUtil.exchangeEscapeNvl(bDTO.getBranchAreaCode()) %></span>
									</p>
								</div>
							</li>
						<%}
						}
					  }%>
				<%}else{//그냥 리스트 뽑을때 검색 말고
					for(int i = 0; i< bList.size(); i++){
						BranchDTO bDTO = bList.get(i);
						if(i<10){//페이지 처리를 위해 처음 10개만 출력하고 나머지는 display:none;%>
							<li class="<%=i/10%>">
								<p class="num"><%=CmmUtil.nvl(bDTO.getRowNum()) %></p>
								<div class="info">
									<p class="txt"><%=TextUtil.exchangeEscapeNvl(bDTO.getBranchName()) %></p>
									<p class="txt1"><!-- 박성진수정 -->
										<a href="/Lmin/company/branchDetail.do?branchNo=<%=CmmUtil.nvl(bDTO.getBranchNo())%>"><%=TextUtil.exchangeEscapeNvl(bDTO.getBranchAddress()) + " " + TextUtil.exchangeEscapeNvl(bDTO.getBranchAddressDetail()) %></a>
									</p>
									<p class="txt2">
										<%=TextUtil.exchangeEscapeNvl(bDTO.getBranchOfficerName()) %><span class="bar">&nbsp;|</span>
										<span><%=TextUtil.exchangeEscapeNvl(bDTO.getBranchTelNo()) %></span>
										<span class="bar">|</span>
										<span class="count"><%=TextUtil.exchangeEscapeNvl(bDTO.getBranchAreaCode()) %></span>
									</p>
								</div>
							</li>
						<%}else{%>
							<li class="<%=i/10%>" style="display:none;">
								<p class="num"><%=CmmUtil.nvl(bDTO.getRowNum()) %></p>
								<div class="info">
									<p class="txt"><%=TextUtil.exchangeEscapeNvl(bDTO.getBranchName()) %></p>
									<p class="txt1"><!-- 박성진수정 -->
										<a href="/Lmin/company/branchDetail.do?branchNo=<%=CmmUtil.nvl(bDTO.getBranchNo())%>"><%=TextUtil.exchangeEscapeNvl(bDTO.getBranchAddress()) + " " + TextUtil.exchangeEscapeNvl(bDTO.getBranchAddressDetail()) %></a>
									</p>
									<p class="txt2">
										<%=TextUtil.exchangeEscapeNvl(bDTO.getBranchOfficerName()) %><span class="bar">&nbsp;|</span>
										<span><%=TextUtil.exchangeEscapeNvl(bDTO.getBranchTelNo()) %></span>
										<span class="bar">|</span>
										<span class="count"><%=TextUtil.exchangeEscapeNvl(bDTO.getBranchAreaCode()) %></span>
									</p>
								</div>
							</li>
						<%}
					} 
				  }%>
				</ul>
				<a href="/Lmin/company/branchWriteView.do" class="btn_active_small" style="float:right;">전국 지사 등록</a>

				<!-- pageArea -->
				<div class="pageArea">
					<a href='#' class='btnFirst' onclick="firstPage();"><span>처음</span></a> <a href='#' class='btnPrev' onclick="prePage();"><span>이전</span></a>
					<%for(int i = 1; i<= pageCnt; i++){ 
					    String pageBtn = "pageBtn" + i;
					    if(i<6){%>
						<a href="#" id="<%=pageBtn%>" onclick="changePage('<%=i%>', '<%=pageBtn%>');" class="psyPageBtn"><%=i%></a>
						<%}else{ %>
						<a href="#" style="display:none;" id="<%=pageBtn%>" onclick="changePage('<%=i%>', '<%=pageBtn%>');" class="psyPageBtn"><%=i%></a>
						<%} %>
					<%} %>
					<a href="#" class='btnNext' onclick="nextPage();"><span>다음</span></a> <a href="#" class='btnLast' onclick="lastPage();"><span>마지막</span></a>
				</div>
				<!-- // pageArea -->


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
