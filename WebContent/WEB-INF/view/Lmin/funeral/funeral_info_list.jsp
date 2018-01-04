<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.cl.dto.CodeDTO" %>
<%@ page import="com.cl.dto.FuneralInfoDTO" %>
<%@ page import="com.cl.util.CmmUtil" %>
<%@ page import="com.cl.util.PageUtil" %>
<%@ page import="com.cl.util.TextUtil" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.List" %>
<%
	HashMap<String, Object> hMap = (HashMap) request.getAttribute("hMap");
	HashMap<String ,List<CodeDTO>> hashMap = (HashMap) request.getAttribute("hashMap");
	List<CodeDTO> fList = hashMap.get("funeralList");
	List<CodeDTO> gList = hashMap.get("geoList");
	int pageBtnSplit = 5;
	
	List<FuneralInfoDTO> fuList = (List<FuneralInfoDTO>) hMap.get("list");
	
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
				<h2>관리자/전국장례시설안내</h2>
				<div class="location">
					<span class="home">홈</span>
					<span>관리자모드</span>
					<strong>전국장례시설안내</strong>
				</div>
			</div> <!-- // conTitWrap -->
			<!-- 메뉴 영역 -->
			



<script type="text/javascript">
	$(function() {
		//메뉴 제어 
		var lnb = $(".pcLnbWrap ul li a");
		var menuId = "MN70400";
		var mbId = "MO70400";
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
	
	function goPage(page, lastPage){
		var f = $("#f");
		$("#page").val(page);
		f.submit();
	};
	
	function doSubmit(){
		var f = $("#f");
		f.submit();
	}
</script>

<form action="#" name="menuFrm" method="post">
	<input type="hidden" name="menuNum"/>
</form>	
			<%@include file="/WEB-INF/view/Lmin/include/navBar.jsp" %>

			<!-- 메뉴 영역 -->

			<div id="pro_info" class="contents"> <!-- 페이지별 ID -->
				
				<div class="boardType2">
				<form name="f" id="f" method="post" action="/Lmin/funeral/funeralInfoList.do">
				<input type="hidden" name="page" id="page">
					<table summary="">
						<caption></caption>
						<colgroup>
							<col width="100%">
						</colgroup>
						<tbody>
							<tr>
								<td>
									<select id="geoCode" name="searchBox" title="" class="inputType3">
										<option value="00">지역명</option>
									<% for(CodeDTO cDTO : gList){ %>
										<option value='<%=CmmUtil.nvl(cDTO.getCodeId())%>' <%=CmmUtil.select(cDTO.getCodeId(), (String)hMap.get("searchBox")) %>><%=CmmUtil.nvl(cDTO.getCodeName())%></option>
									<% } %>
									</select>
									<select id="funeral" name="search" title="" class="inputType5">
										<option value="00">구분명</option>
									<% for(CodeDTO cDTO : fList){ %>
										<option value='<%=CmmUtil.nvl(cDTO.getCodeId())%>' <%=CmmUtil.select(cDTO.getCodeId(), (String)hMap.get("search")) %>><%=CmmUtil.nvl(cDTO.getCodeName())%></option>
									<% } %>
									</select>
									<a href="javascript:doSubmit();" class="btn_active_small">검색</a>
								</td>
							</tr>
						</tbody>
					</table>
				</form>
                </div>

				<br/><br/>			
				<div class="tableBasicList">
					<table class="defaultTable">
						<caption></caption>
						<colgroup>
							<col style="width:10%;">
							<col style="width:16%;">
							<col style="width:20%;">
							<col style="width:auto%;">
							<col style="width:20%;">
						</colgroup>
						<thead>
							<tr>
								<th scope="row">번호</th>
								<th scope="row">구분</th>
								<th scope="row">식장명</th>
								<th scope="row">지역(식장주소)</th>
								<th scope="row">전화번호</th>
							</tr>
						</thead>
						<tbody>
						<%for(FuneralInfoDTO fDTO : fuList){%>
							<tr>
								<td><%=CmmUtil.nvl(fDTO.getRownum())%></td>
								<td><%=CmmUtil.nvl(fDTO.getFuneralInfoCode())%></td>
								<td>
								<a href="/Lmin/funeral/funeralInfoDetail.do?fNo=<%=CmmUtil.nvl(fDTO.getFuneralInfoNo())%>">
								<%=TextUtil.exchangeEscapeNvl(fDTO.getFuneralInfoName())%></a>
								</td>
								<td><%=TextUtil.exchangeEscapeNvl(fDTO.getFuneralAddress())%> <%=TextUtil.exchangeEscapeNvl(fDTO.getFuneralAddressDetail())%></td>
								<td><%=CmmUtil.nvl(fDTO.getFuneralInfoTelNo())%></td>
							</tr>
						<%}%>
						<!--<tr>
								<td>319</td>
								<td>병원 장례식장</td>
								<td>성모병원</td>
								<td>경남 김해시 삼정동 615-6</td>
								<td>055-336-4475</td>
							</tr>
							<tr>
								<td>319</td>
								<td>병원 장례식장</td>
								<td>성모병원</td>
								<td>경남 김해시 삼정동 615-6</td>
								<td>055-336-4475</td>
							</tr>
							<tr>
								<td>319</td>
								<td>병원 장례식장</td>
								<td>성모병원</td>
								<td>경남 김해시 삼정동 615-6</td>
								<td>055-336-4475</td>
							</tr>
							<tr>
								<td>319</td>
								<td>병원 장례식장</td>
								<td>성모병원</td>
								<td>경남 김해시 삼정동 615-6</td>
								<td>055-336-4475</td>
							</tr>
							<tr>
								<td>319</td>
								<td>병원 장례식장</td>
								<td>성모병원</td>
								<td>경남 김해시 삼정동 615-6</td>
								<td>055-336-4475</td>
							</tr>
							<tr>
								<td>319</td>
								<td>병원 장례식장</td>
								<td>성모병원</td>
								<td>경남 김해시 삼정동 615-6</td>
								<td>055-336-4475</td>
							</tr>
							<tr>
								<td>319</td>
								<td>병원 장례식장</td>
								<td>성모병원</td>
								<td>경남 김해시 삼정동 615-6</td>
								<td>055-336-4475</td>
							</tr>
							<tr>
								<td>319</td>
								<td>병원 장례식장</td>
								<td>성모병원</td>
								<td>경남 김해시 삼정동 615-6</td>
								<td>055-336-4475</td>
							</tr>
							<tr>
								<td>319</td>
								<td>병원 장례식장</td>
								<td>성모병원</td>
								<td>경남 김해시 삼정동 615-6</td>
								<td>055-336-4475</td>
							</tr>-->
						</tbody>
					</table>
				</div>
				<a href="/Lmin/funeral/funeralInfoWrite.do" class="btn_active_small" style="float:right;">장례시설 등록</a>
				
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
