<%@page import="com.cl.util.CmmUtil"%>
<%@page import="com.cl.util.TextUtil"%>
<%@page import="com.cl.util.PageUtil"%>
<%@page import="com.cl.dto.CruiseDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<%
	HashMap<String, Object> hMap = (HashMap) request.getAttribute("hMap");
	int pageBtnSplit = 5;
	
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
function doOrderBy(){
	var form = document.getElementById('form');
	form.submit();
}

function goPage(page, lastPage){
	var f = $("#f");
	$("#page").val(page);
	f.submit();
};

function adviceSearch(){
	var f = $("#f");
	var search = $("#search");
	
	if(search.val() == ""){
		alert("검색어를 입력하세요.");
		search.focus();
		return false;
	}else{
		f.submit();
		return true;
	}
};
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
$( function() {
    $( "#sortable" ).sortable();
    $( "#sortable" ).disableSelection();
  } );
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

			<%@include file="/WEB-INF/view/Lmin/include/navBar.jsp" %>
			<!-- 메뉴 영역 -->

			<div class="contents"> <!-- 페이지별 ID none -->
				<h3 class="smallTit">크루즈 정렬</h3>
				
				<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  				<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
				<br/><br/>
				드래그하여 순서를 변경하세요.
				<form action="/Lmin/cruise/doOrderByCruise.do" method="post" id="form">
				<ul class="boradType4" id="sortable">
				<%
				if(cList.size()!=0){
					for(CruiseDTO cDTO : cList){
				%>
					<li>
						<p class="num"><%=TextUtil.exchangeEscapeNvl(cDTO.getCruiseNo()) %></p>
						<div class="info">
							<p class="txt"><%=TextUtil.exchangeEscapeNvl(cDTO.getCruiseName()) %></p>
							<p class="txt1"><!-- 박성진수정 -->
									<%=TextUtil.exchangeEscapeNvl(cDTO.getCruiseStartDay() + "~" + cDTO.getCruiseEndDay()) %>
							</p>
							<p class="txt2">
								<span></span>
							</p>
						</div>
						<input type="hidden" name="cruiseNo" value="<%=CmmUtil.nvl(cDTO.getCruiseNo()) %>">
					</li>
				<%
					}
				}
				%>			
				</ul>
				</form>
				<a href="javascript:doOrderBy();" class="btn_active_small" style="float:right;">정렬하기</a>
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