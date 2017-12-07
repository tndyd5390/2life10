<%@page import="com.cl.util.PageUtil"%>
<%@page import="com.cl.util.TextUtil"%>
<%@page import="com.cl.dto.CyberDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.cl.util.CmmUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	HashMap<String, Object> hMap = (HashMap) request.getAttribute("hMap");
	int pageBtnSplit = 5;
	
	List<CyberDTO> cList = (List<CyberDTO>) hMap.get("list");
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
			
			<!-- heaer 인쿠르드 -->
			<!--#include file="../include/inc_header.jsp"-->
			<%@include file="../include/inc_header.jsp"%>
		</div>
	</div> <!-- // header -->

	<div id="contentsWrap">
		<div class="container">
			<div class="conTitWrap">
				<h2>관리자/사이버홍보실</h2>
				<div class="location">
					<span class="home">홈</span>
					<span>관리자모드</span>
					<strong>사이버홍보실</strong>
				</div>
			</div> <!-- // conTitWrap -->
			<!-- 메뉴 영역 -->
			



<script type="text/javascript">
	$(function() {
		//메뉴 제어 
		var lnb = $(".pcLnbWrap ul li a");
		var menuId = "MN70300";
		var mbId = "MO70300";
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
				<h3 class="smallTit">사이버홍보실</h3>

				<div class="boardType2">
					<table summary="">
						<caption></caption>
						<colgroup>
							<col width="100%">
						</colgroup>
						<tbody>
							<tr>
								<td>
									<select id="telAbleEndTime" name="telAbleEndTime" title="" class="inputType3">
										<option value="00" <%=CmmUtil.select("00", CmmUtil.nvl((String) hMap.get("searchBox")))%>>전체</option>
										<option value="01" <%=CmmUtil.select("01", CmmUtil.nvl((String) hMap.get("searchBox")))%>>제목</option>
										<option value="02" <%=CmmUtil.select("02", CmmUtil.nvl((String) hMap.get("searchBox")))%>>글쓴이</option>
									</select>
									<input type="text" name="name" value="" title="" class="inputType1" style="" maxlength="25">

									<a href="#" class="btn_active_small">검색</a>
								</td>
							</tr>
						</tbody>
					</table>
                </div>

				<br/><br/>
				<ul class="boradType5">
				<%
				if(cList.size() != 0){
					for(CyberDTO cDTO : cList){
				%>	
					<li>
						<p class="num"><%=CmmUtil.nvl(cDTO.getRowNum()) %></p>
						<div class="info">
							<p class="txt1"><!-- 박성진수정 -->
								<a href="javascript:selectBoardDtl('480')"><%=TextUtil.exchangeEscapeNvl(cDTO.getCyberTitle()) %></a>
							</p>
							<p class="txt2">
								<%=TextUtil.exchangeEscapeNvl(cDTO.getMemberId()) %><span class="bar">&nbsp;|</span>
								<span><%=TextUtil.exchangeEscapeNvl(cDTO.getRegDT()) %></span>
								<span class="bar">|</span>
								<span class="count"><%=CmmUtil.nvl(cDTO.getCyberViewCnt()) %></span>
							</p>
						</div>
					</li>
				<%	
					}
				}
				%>
					<!-- <li>
						<p class="num">1</p>
						<div class="info">
							<p class="txt1">박성진수정
								<a href="javascript:selectBoardDtl('480')">크리스찬상조 실제 장례 행사 영상자료</a>
							</p>
							<p class="txt2">
								관리자<span class="bar">&nbsp;|</span>
								<span>2017-10-10</span>
								<span class="bar">|</span>
								<span class="count">625</span>
							</p>
						</div>
					</li>
					<li>
						<p class="num">1</p>
						<div class="info">
							<p class="txt1">박성진수정
								<a href="javascript:selectBoardDtl('480')">크리스찬상조 실제 장례 행사 영상자료</a>
							</p>
							<p class="txt2">
								관리자<span class="bar">&nbsp;|</span>
								<span>2017-10-10</span>
								<span class="bar">|</span>
								<span class="count">625</span>
							</p>
						</div>
					</li>
					<li>
						<p class="num">1</p>
						<div class="info">
							<p class="txt1">박성진수정
								<a href="javascript:selectBoardDtl('480')">크리스찬상조 실제 장례 행사 영상자료</a>
							</p>
							<p class="txt2">
								관리자<span class="bar">&nbsp;|</span>
								<span>2017-10-10</span>
								<span class="bar">|</span>
								<span class="count">625</span>
							</p>
						</div>
					</li>
					<li>
						<p class="num">1</p>
						<div class="info">
							<p class="txt1">박성진수정
								<a href="javascript:selectBoardDtl('480')">크리스찬상조 실제 장례 행사 영상자료</a>
							</p>
							<p class="txt2">
								관리자<span class="bar">&nbsp;|</span>
								<span>2017-10-10</span>
								<span class="bar">|</span>
								<span class="count">625</span>
							</p>
						</div>
					</li>
					<li>
						<p class="num">1</p>
						<div class="info">
							<p class="txt1">박성진수정
								<a href="javascript:selectBoardDtl('480')">크리스찬상조 실제 장례 행사 영상자료</a>
							</p>
							<p class="txt2">
								관리자<span class="bar">&nbsp;|</span>
								<span>2017-10-10</span>
								<span class="bar">|</span>
								<span class="count">625</span>
							</p>
						</div>
					</li> -->
				</ul>
				<a href="/Lmin/company/cyberWrite.do" class="btn_active_small" style="float:right;">사이버 홍보 등록</a>
				
				<!-- pageArea -->
				<div class="pageArea">
					<%=PageUtil.frontPaging(hMap, pageBtnSplit) %>
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