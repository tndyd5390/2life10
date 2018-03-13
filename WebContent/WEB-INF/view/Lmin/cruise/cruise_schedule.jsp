<%@page import="com.cl.util.CmmUtil"%>
<%@page import="com.cl.util.TextUtil"%>
<%@page import="com.cl.util.PageUtil"%>
<%@page import="com.cl.dto.CruiseDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	HashMap<String, Object> hMap = (HashMap) request.getAttribute("hMap");
	int pageBtnSplit = 5;
	int nowPage = Integer.parseInt(CmmUtil.nvl((String)hMap.get("nowPage")));
	List<CruiseDTO> cList = (List<CruiseDTO>) hMap.get("list");
	
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
function changeOrder(){
	location.href="/Lmin/cruise/cruiseChangeOrder.do";
}
function doDelete(cruiseNo, imgFileNo, scheFileNo){
	
	if(confirm('해당 크루즈 상품을 삭제하시겠습니까?')){
		var form = document.createElement("form");
		form.setAttribute("method", "Post"); // Get 또는 Post 입력
		form.setAttribute("action", "/Lmin/cruise/deleteCruise.do");
		
		var hiddenField = document.createElement("input");
		hiddenField.setAttribute("type", "hidden");
		hiddenField.setAttribute("name", "cruiseNo");
		hiddenField.setAttribute("value", cruiseNo);
		form.appendChild(hiddenField);
		
		hiddenField = document.createElement("input");
		hiddenField.setAttribute("type", "hidden");
		hiddenField.setAttribute("name", "cruiseImgFileNo");
		hiddenField.setAttribute("value", imgFileNo);
		form.appendChild(hiddenField);
		
		hiddenField = document.createElement("input");
		hiddenField.setAttribute("type", "hidden");
		hiddenField.setAttribute("name", "cruiseScheFileNo");
		hiddenField.setAttribute("value", scheFileNo);
		form.appendChild(hiddenField);
		
		document.body.appendChild(form);
		form.submit();
	}
	 
}
function goPage(page, lastPage){
	var form = document.createElement('form');
	form.setAttribute("method", "Post"); // Get 또는 Post 입력
	form.setAttribute("action", "/Lmin/cruise/cruiseScheduleList.do");
	
	var hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "page");
	hiddenField.setAttribute("value", page);
	form.appendChild(hiddenField);
	
	document.body.appendChild(form);
	form.submit();
};
function downloadSche(cruiseNo){
	location.href="/Lmin/cruise/cruiseDownloadSche.do?cruiseNo=" + cruiseNo;
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
			<%@include file="/WEB-INF/view/include/inc_header.jsp"%>

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

				<%
				if(cList.size() != 0){
					for(CruiseDTO cDTO : cList){
				%>
				<section>
					<h3 class="contTit">
						<span>상품</span>
						<%=TextUtil.exchangeEscapeNvl(cDTO.getCruiseName()) %>
					</h3>
					<div class="dashList">
					    <ul>
                            <li>날짜 : <%=CmmUtil.nvl(cDTO.getCruiseStartDay())%> ~ <%=CmmUtil.nvl(cDTO.getCruiseEndDay())%> </li>
                            <li>선사 : <%=TextUtil.exchangeEscapeNvl(cDTO.getCruiseShipName()) %></li>
                            <li>인원 : <%=TextUtil.exchangeEscapeNvl(cDTO.getCruiseAccomodation()) %>명</li>
                            <li>상품가 : <%=TextUtil.addComma(TextUtil.exchangeEscapeNvl(cDTO.getCruisePrice())) %>원</li>
                            <li>캐빈 : <%=TextUtil.exchangeEscapeNvl(cDTO.getCruiseCabinCode()) %></li>
                            <%
                            if(!"".equals(CmmUtil.nvl(cDTO.getCruiseEtc()))){
                            %>
                            <li>비고 : <%=TextUtil.exchangeEscapeNvl(cDTO.getCruiseEtc()) %></li>
                            <%
                            }
                            %>
                        </ul>
                    </div>
					<div class="imgWrap">
					    <img src="<%="/file/cruise/img/" + CmmUtil.nvl(cDTO.getCruiseImgFileName()) %>" style="height:205px;" alt="크루즈이미지" />
					    <div class="btn_area">
					        <button type="button" class="btnSearch" onclick="downloadSche(<%=CmmUtil.nvl(cDTO.getCruiseNo())%>);">일정다운로드</button>
                        </div>
					</div>
					<a href="/Lmin/cruise/updateCruiseView.do?cruiseNo=<%=CmmUtil.nvl(cDTO.getCruiseNo()) %>" class="btn_active_small" style="float:right; margin-left: 10px;">수정</a>
					<a href="#" class="btn_active_small" style="float:right;" onclick="doDelete('<%=CmmUtil.nvl(cDTO.getCruiseNo())%>', '<%=CmmUtil.nvl(cDTO.getCruiseImgFileNo() + "")%>', '<%=CmmUtil.nvl(cDTO.getCruiseScheFileNo() + "")%>')">삭제</a>
				</section>
				<%
					}
				}
				%>
				<!-- <section>
					<h3 class="contTit">
						<span>선사</span>
						로얄캐리비안 마리너호
					</h3>
					<div class="dashList">
                        <ul>
                            <li>날짜 : 2018년 3월 11일 (일) ~ 2018년 3월 16일 (금) </li>
                            <li>상품 : 동남아 크루즈 4박 6일 (싱가포르, 말레이시아, 태국)</li>
                            <li>인원 : 1명</li>
                            <li>선사 : 로얄캐리비안 마리너호</li>
                            <li>캐빈 : 내측</li>
                            <li>비고 : 불포함사항 : 기타부대비용 및 선상팁</li>
                        </ul>
                    </div>
					<div class="imgWrap">
					    <img src="../../public/img/conts/img_c_02.png" alt="크루즈이미지" />
					    <div class="btn_area">
                            <button type="button" class="btnSearch">일정다운로드</button>
                        </div>
                    </div>
				</section>
				<section>
					<h3 class="contTit">
						<span>선사</span>
						로얄캐리비안 마리너호
					</h3>
					<div class="dashList">
                        <ul>
                            <li>날짜 : 2018년 3월 11일 (일) ~ 2018년 3월 16일 (금) </li>
                            <li>상품 : 동남아 크루즈 4박 6일 (싱가포르, 말레이시아, 태국)</li>
                            <li>인원 : 1명</li>
                            <li>캐빈 : 내측</li>
                            <li>비고 : 불포함사항 : 기타부대비용 및 선상팁</li>
                        </ul>
                    </div>
					<div class="imgWrap">
					    <img src="../../public/img/conts/img_c_03.png" alt="크루즈이미지" />
					    <div class="btn_area">
                            <button type="button" class="btnSearch">일정다운로드</button>
                        </div>
                    </div>
				</section> -->
				<a href="/Lmin/cruise/cruiseSchduleWriteView.do" class="btn_active_small" style="float:right;">크루즈 일정 등록</a>
				<%if(cList.size()>=2 || nowPage > 1){%>
					<a href="javascript:changeOrder();" class="btn_active_small" style="float:right; margin-right: 10px;">크루즈 일정 정렬</a>
				<%} %>
				<br/><br/>
				<!-- pageArea -->
				<div class="pageArea">
					<%= PageUtil.frontPaging(hMap, pageBtnSplit)%>
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