<%@page import="com.cl.util.CmmUtil"%>
<%@page import="com.cl.util.MathUtil"%>
<%@page import="com.cl.util.TextUtil"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.cl.dto.AdviceDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	List<AdviceDTO> aList = (List<AdviceDTO>)request.getAttribute("aList");
	int adviceRecordCnt = (int)request.getAttribute("adviceRecordCnt");//레코드 갯수
	int pageCnt = (int)request.getAttribute("pageCnt");//페이지 갯수
	int currPage = (int) request.getAttribute("currPage");
	if(aList == null) aList = new ArrayList<>();
	String searchName = CmmUtil.nvl((String)request.getAttribute("searchWord"));
	System.out.println(searchName);
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
	var currPage = <%=currPage%>;
	var pageCnt = <%=pageCnt%>;
	var searchWord = '<%=searchName%>';
	function firstPage(){
		if(currPage == 1){
			alert("첫 페이지 입니다.");
			return;
		}
		//location.href="/Lmin/company/adviceList.do?pageNum=1";
		var form = document.createElement("form");
		var adviceSearchName = document.getElementById('adviceSearchName').value;
		form.setAttribute("method", "Post"); // Get 또는 Post 입력
		form.setAttribute("action", "/Lmin/company/adviceSearch.do");
		
		var hiddenField = document.createElement("input");
		hiddenField.setAttribute("type", "hidden");
		hiddenField.setAttribute("name", "adviceSearchName");
		hiddenField.setAttribute("value", searchWord);
		form.appendChild(hiddenField);
		hiddenField = document.createElement("input");
		hiddenField.setAttribute("type", "hidden");
		hiddenField.setAttribute("name", "pageNum");
		hiddenField.setAttribute("value", "1");
		form.appendChild(hiddenField);
		document.body.appendChild(form);
		
		form.submit();
	}
	
	function lastPage(){
		if(currPage == pageCnt){
			alert("마지막 페이지 입니다.");
			return;
		}
		var form = document.createElement("form");
		var adviceSearchName = document.getElementById('adviceSearchName').value;
		form.setAttribute("method", "Post"); // Get 또는 Post 입력
		form.setAttribute("action", "/Lmin/company/adviceSearch.do");
		
		var hiddenField = document.createElement("input");
		hiddenField.setAttribute("type", "hidden");
		hiddenField.setAttribute("name", "adviceSearchName");
		hiddenField.setAttribute("value", searchWord);
		form.appendChild(hiddenField);
		
		hiddenField = document.createElement("input");
		hiddenField.setAttribute("type", "hidden");
		hiddenField.setAttribute("name", "pageNum");
		hiddenField.setAttribute("value", pageCnt);
		form.appendChild(hiddenField);
		document.body.appendChild(form);
		
		form.submit();
	}
	
	function nextPage(){
		if(currPage == pageCnt){
			alert("마지막 페이지 입니다.");
			return;
		}
		console.log(currPage);
		console.log(searchWord);
		currPage++;
		//location.href="/Lmin/company/adviceList.do?pageNum=" + currPage;
		var form = document.createElement("form");
		var adviceSearchName = document.getElementById('adviceSearchName').value;
		form.setAttribute("method", "Post"); // Get 또는 Post 입력
		form.setAttribute("action", "/Lmin/company/adviceSearch.do");
		
		var hiddenField = document.createElement("input");
		hiddenField.setAttribute("type", "hidden");
		hiddenField.setAttribute("name", "adviceSearchName");
		hiddenField.setAttribute("value", searchWord);
		form.appendChild(hiddenField);
		
		hiddenField = document.createElement("input");
		hiddenField.setAttribute("type", "hidden");
		hiddenField.setAttribute("name", "pageNum");
		hiddenField.setAttribute("value", currPage);
		form.appendChild(hiddenField);
		document.body.appendChild(form);
		
		form.submit();
	}
	
	function prePage(){
		if(currPage == 1){
			alert("첫 페이지 입니다.");
			return;
		}
		currPage--;
		//location.href="/Lmin/company/adviceList.do?pageNum=" + currPage;
		var form = document.createElement("form");
		var adviceSearchName = document.getElementById('adviceSearchName').value;
		form.setAttribute("method", "Post"); // Get 또는 Post 입력
		form.setAttribute("action", "/Lmin/company/adviceSearch.do");
		
		var hiddenField = document.createElement("input");
		hiddenField.setAttribute("type", "hidden");
		hiddenField.setAttribute("name", "adviceSearchName");
		hiddenField.setAttribute("value", searchWord);
		form.appendChild(hiddenField);
		
		hiddenField = document.createElement("input");
		hiddenField.setAttribute("type", "hidden");
		hiddenField.setAttribute("name", "pageNum");
		hiddenField.setAttribute("value", currPage);
		form.appendChild(hiddenField);
		document.body.appendChild(form);
		
		form.submit();
	}
	
	function adviceSearchPageMove(pageNum){
		var form = document.createElement("form");
		
		var adviceSearchName = document.getElementById('adviceSearchName').value;
		form.setAttribute("method", "Post"); // Get 또는 Post 입력
		form.setAttribute("action", "/Lmin/company/adviceSearch.do");
		
		var hiddenField = document.createElement("input");
		hiddenField.setAttribute("type", "hidden");
		hiddenField.setAttribute("name", "adviceSearchName");
		hiddenField.setAttribute("value", searchWord);
		form.appendChild(hiddenField);
		
		hiddenField = document.createElement("input");
		hiddenField.setAttribute("type", "hidden");
		hiddenField.setAttribute("name", "pageNum");
		hiddenField.setAttribute("value", pageNum);
		form.appendChild(hiddenField);
		document.body.appendChild(form);
		
		form.submit();
	}
	
	function adviceSearch(){
		
		var form = document.createElement("form");
		var adviceSearchName = document.getElementById('adviceSearchName').value;
		form.setAttribute("method", "Post"); // Get 또는 Post 입력
		form.setAttribute("action", "/Lmin/company/adviceSearch.do");
		
		var hiddenField = document.createElement("input");
		hiddenField.setAttribute("type", "hidden");
		hiddenField.setAttribute("name", "adviceSearchName");
		hiddenField.setAttribute("value", adviceSearchName);
		form.appendChild(hiddenField);
		document.body.appendChild(form);
		
		form.submit();
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
				<h2>관리자/상담사조회</h2>
				<div class="location">
					<span class="home">홈</span>
					<span>관리자모드</span>
					<strong>상담사조회</strong>
				</div>
			</div> <!-- // conTitWrap -->
			<!-- 메뉴 영역 -->
			



<script type="text/javascript">
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
				<h3 class="smallTit">상담사조회</h3>
				
				<div class="boardType2">
					<table summary="">
						<caption></caption>
						<colgroup>
							<col width="100%">
						</colgroup>
						<tbody>
							<tr>
								<td>
									상담사명
									<input type="text" id="adviceSearchName" class="inputType1" maxlength="25" value="<%=CmmUtil.nvl(searchName)%>">

									<a href="#" class="btn_active_small" onclick="adviceSearch();">검색</a>
								</td>
							</tr>
						</tbody>
					</table>
                </div>

				<br/><br/>
				<ul class="boradType4">
				<%
				for(int i = 0; i< aList.size(); i++){
					AdviceDTO aDTO = aList.get(i);
				%>
					<li>
						<p class="num"><%=TextUtil.exchangeEscapeNvl(aDTO.getAdviceNo()) %></p>
						<div class="info">
							<p class="txt"><%=TextUtil.exchangeEscapeNvl(aDTO.getAdviceName()) %></p>
							<p class="txt1"><!-- 박성진수정 -->
								<a href="/Lmin/company/adviceDetail.do?adviceNo=<%=TextUtil.exchangeEscapeNvl(aDTO.getAdviceNo())%>">
									<%=TextUtil.exchangeEscapeNvl(aDTO.getAdviceAddress() + " " + aDTO.getAdviceAddressDetail()) %>
								</a>
							</p>
							<p class="txt2">
								<span><%=TextUtil.exchangeEscapeNvl(aDTO.getAdvicePhoneNo()) %></span>
							</p>
						</div>
					</li>				
				<%
				} 
				%>
				</ul>
				<a href="/Lmin/company/adviceWriteView.do" class="btn_active_small" style="float:right;">상담사 등록</a>
				<!-- pageArea -->
				<div class="pageArea">
					<a href='#' class='btnFirst' onclick="firstPage();"><span>처음</span></a> 
					<a href='#' class='btnPrev' onclick="prePage();"><span>이전</span></a>
					<%
					int[] startAndEnd = MathUtil.pageRange(currPage, 5);
					for(int i = startAndEnd[0]; i<= startAndEnd[1] && i<= pageCnt; i++){
						if(currPage == i){
					%>
						<strong><%=i%></strong>
					<%
						}else{
					%>
						<a href="#" id="pageNum<%=i%>" onclick="adviceSearchPageMove(<%=i%>);"><%=i%></a>
					<%
						}
					}
					%>
					<a href="#" class='btnNext' onclick="nextPage();"><span>다음</span></a>
					<a href="#" class='btnLast' onclick="lastPage();"><span>마지막</span></a>
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
