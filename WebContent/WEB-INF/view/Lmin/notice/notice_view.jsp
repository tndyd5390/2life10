<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.cl.util.CmmUtil" %>
<%@ page import="com.cl.util.TextUtil" %>
<%@ page import="com.cl.util.AES256Util" %>
<%@ page import="com.cl.dto.NoticeDTO" %>
<%
	NoticeDTO nDTO = (NoticeDTO) request.getAttribute("nDTO");
	
	if(nDTO == null){
		nDTO = new NoticeDTO();
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
					<strong>공지사항</strong>
				</div>
			</div> <!-- // conTitWrap -->
			<!-- 메뉴 영역 -->
			



<script type="text/javascript">
	$(function() {
		//메뉴 제어 
		var lnb = $(".pcLnbWrap ul li a");
		var menuId = "MN70700";
		var mbId = "MO70700";
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
		var f = $("#f");
		f.attr("action", "/Lmin/notice/noticeUpdate.do");
		f.submit();
	}
	function goList(){
		location.href="/Lmin/notice/noticeList.do";
	}
	
	function doDelete(){
		var f = $("#f");
		var nNo = '<%=CmmUtil.nvl(nDTO.getNoticeNo())%>';
		
		if(confirm("삭제 하시겠습니까?")){
			$("#nNo").val(nNo);
			f.attr("action", "/Lmin/notice/noticeDeleteProc.do");
			f.submit();
			return true;
		}else{
			return false;
		}
	}
</script>

<form action="#" name="menuFrm" method="post">
	<input type="hidden" name="menuNum"/>
</form>	
			<%@include file="/WEB-INF/view/Lmin/include/navBar.jsp" %>

			<!-- 메뉴 영역 -->

			<div class="contents"> <!-- 페이지별 ID none -->
				<h3 class="smallTit">공지사항</h3>
				<br/><br/>
				<!-- boardView -->
				<form id="f" name="f" method="post" action="/Lmin/notice/noticeUpdate.do" >
				<input type="hidden" id="nNo" name="nNo" value="<%=CmmUtil.nvl(nDTO.getNoticeNo())%>"/>
				<article class="boardView">
					<header class="boardTit">
						<h3><%=CmmUtil.nvl(nDTO.getNoticeTitle())%></h3>
						<p class="txt">
							<span class="date"><%=CmmUtil.nvl(nDTO.getRegDt()) %></span>
							<span class="hits">조회수 <%=CmmUtil.nvl(nDTO.getNoticeViewCnt()) %></span>
							<span class="writer"><%=AES256Util.strDecode(CmmUtil.nvl(nDTO.getMemberName()))%></span>
						</p>
					</header>
					<article class="boardCont">
						<div id="ckContent">
								<div class="editArea">								
								<p><%=TextUtil.replaceBr(TextUtil.exchangeEscapeNvl(nDTO.getNoticeContents())) %></p>
								<%
								if(!CmmUtil.nvl(nDTO.getNoticeFileName()).equals("")){
								%>
									<img src="<%="/file/notice/img/" + CmmUtil.nvl(nDTO.getNoticeFileName()) %>" alt="공지사항 이미지" />
								<%
								}
								%>
								</div>				
						</div>
					</article>
				</article>
				<!-- // newsList -->
				</form>
				<br/><br/>
				<!-- btnArea -->
				<div class="btnArea">
					<button type="button" class="btnDefaultForm" id="listBtn" onclick="return doSubmit();">수정</button>
					<button type="button" class="btnDefaultForm" id="listBtn" onclick="return doDelete();">삭제</button>
					<button type="button" class="btnDefaultForm" id="listBtn" onclick="goList();">목록</button>
				</div>
				<!-- // btnArea -->

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
