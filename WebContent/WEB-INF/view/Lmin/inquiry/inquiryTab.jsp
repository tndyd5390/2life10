<%@page import="com.cl.dto.InquiryDTO"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.cl.util.CmmUtil" %>
<%@ page import="com.cl.util.TextUtil" %>
<%@ page import="com.cl.util.PageUtil" %>
<%@ page import="com.cl.util.AES256Util" %>
<%@ page import="com.cl.dto.NoticeDTO" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.HashMap" %>
<%
	List<Map<String, Object>> totalInquiry = (List<Map<String, Object>>)request.getAttribute("totalInquiry");
	if(totalInquiry == null) totalInquiry = new ArrayList();
	int tmp1 = 0, tmp2 = 0;
	
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
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
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
	
	function doInquiry(){
		var f = document.getElementById('f');
		if(f.name.value==''){
			alert('성명을 입력해 주세요.');
			f.name.focus();
			return;
		}else if(f.birthday.value == ''){
			alert("생년월일을 입력해 주세요");
			f.birthday.focus();
			return;
		}else if(f.phone.value == ''){
			alert('휴대폰 번호 뒷자리를 입력해주세요.');
			f.phone.focus();
			return;
		}else{
			f.submit();
		}
	}
</script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
$( function() {
    $( "#tabs" ).tabs();
});
</script>


<form action="#" name="menuFrm" method="post">
	<input type="hidden" name="menuNum"/>
</form>	
			<%@include file="/WEB-INF/view/Lmin/include/navBar.jsp" %>


			<!-- 메뉴 영역 -->

			<div class="contents"> <!-- 페이지별 ID none -->
				<h3 class="smallTit">납부조회</h3>
				<div id="tabs">
				  <ul>
				  <%
				  	for(Map<String, Object> tab : totalInquiry){
				  		tmp1++;
						InquiryDTO iDTO = (InquiryDTO)tab.get("iDTO");
				  %>
					    <li><a href="#<%=iDTO.getItem() + tmp1%>"><%=iDTO.getItem()%></a></li>
				  <%
				  	}
				  %>
				  </ul>
				  <%
				  	for(Map<String, Object> tab : totalInquiry){
				  		tmp2++;
						InquiryDTO iDTO = (InquiryDTO)tab.get("iDTO");
						List<InquiryDTO> iList = (List<InquiryDTO>)tab.get("iList");
						if(iList == null) iList = new ArrayList();
				  %>
					    <div id="<%=iDTO.getItem() + tmp2%>">
					    <div class="tableBasicList">
				    	<table class="defaultTable">
						<colgroup>
							<col style="width:20%;">
							<col style="width:30%;">
							<col style="width:20%;">
							<col style="width:30%;">
						</colgroup>
						<tbody>
							<tr>
								<th scope="row">회원번호</th>
								<td><%=CmmUtil.nvl(iDTO.getMemberNo()) %></td>
								<th scope="row">회원성명</th>
								<td><%=CmmUtil.nvl(iDTO.getMemberName()) %></td>
							</tr>
							<tr>
								<th scope="row">주민등록번호</th>
								<td><%=CmmUtil.nvl(iDTO.getMemberRrn()) + "******" %></td>
								<th scope="row">성별</th>
								<td><%=CmmUtil.nvl(iDTO.getSex()) %></td>
							</tr>
							<tr>
								<th scope="row">상품종류</th>
								<td><%=CmmUtil.nvl(iDTO.getItem()) %></td>
								<th scope="row">나이</th>
								<td><%=CmmUtil.nvl(iDTO.getAge()) %></td>
							</tr>
							<tr>
								<th scope="row">만기계약금</th>
								<td><%=TextUtil.addComma(CmmUtil.nvl(iDTO.getFullPayment())) + "원" %></td>
								<th scope="row">월부금액</th>
								<td><%=TextUtil.addComma(CmmUtil.nvl(iDTO.getPaymentMoney())) + "원" %></td>
							</tr>
							<tr>
								<th scope="row">가입일자</th>
								<td><%=CmmUtil.nvl(iDTO.getRegDt()) %></td>
								<th scope="row">불입종별</th>
								<td><%=CmmUtil.nvl(iDTO.getPaymentMethod()) %></td>
							</tr>
							<tr>
								<th scope="row">불입방법</th>
								<td><%=CmmUtil.nvl(iDTO.getPaymentRoute()) %></td>
								<th scope="row">관리구분</th>
								<td><%=CmmUtil.nvl(iDTO.getClassification()) %></td>
							</tr>
							<tr>
								<th scope="row">불입횟수</th>
								<td><%=CmmUtil.nvl(iDTO.getLastPaymentCount()) %></td>
								<th scope="row">연체</th>
								<td><%=CmmUtil.nvl(iDTO.getDelayPayCnt())%></td>
							</tr>
							<tr>
								<th scope="row">불입총금액</th>
								<td colspan="3"><%=TextUtil.addComma(CmmUtil.nvl(iDTO.getTotalPayment())) %></td>
							</tr>
							<tr>
								<th scope="row">집주소</th>
								<td colspan="3"><%=CmmUtil.nvl(iDTO.getAddr()) %></td>
							</tr>
							<tr>
								<th scope="row">집전화번호</th>
								<%
								if("".equals(CmmUtil.nvl(iDTO.getTelNo()) )){
								%>
								<td>-</td>
								<%
								}else{
								%>
								<td><%=CmmUtil.nvl(iDTO.getTelNo()) %></td>
								<%
								}
								%>
								<th scope="row">휴대폰</th>
								<%
								System.out.println("  ".equals(CmmUtil.nvl(iDTO.getPhoneNo())));
								if("".equals(CmmUtil.nvl(iDTO.getPhoneNo()).replaceAll(" ", ""))){
								%>
								<td>-</td>
								<%
								}else{
								%>
								<td><%=CmmUtil.nvl(iDTO.getPhoneNo()) %></td>
								<%
								}
								%>
							</tr>
						</tbody>
					</table>
					</div>
					<div class="tableBasicList">
					<table class="defaultTable">
						<caption></caption>
						<colgroup>
							<col style="width:20%;">
							<col style="width:40%;">
							<col style="width:40%;">
						</colgroup>
						<thead>
							<tr>
								<th scope="row">납입회차</th>
								<th scope="row">납입일자</th>
								<th scope="row">납입방법</th>
							</tr>
						</thead>
						<tbody>
						<%
						for(int i = 0; i< iList.size(); i++){
							InquiryDTO dto = iList.get(i);
						%>
							<tr>
								<td><%=CmmUtil.nvl(dto.getLastPaymentCount()) %></td>
								<td><%=CmmUtil.nvl(dto.getPaymentDay()) %></td>
								<td><%=CmmUtil.nvl(dto.getPaymentRoute()) %></td>
							</tr>
							
						<%
						}
						%>
						</tbody>
					</table>
					
				</div>
				  	</div>
				  <%
				  	}
				  %>
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
