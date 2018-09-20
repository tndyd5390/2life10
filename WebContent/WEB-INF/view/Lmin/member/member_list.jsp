<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.cl.util.CmmUtil" %>
<%@ page import="com.cl.util.TextUtil" %>
<%@ page import="com.cl.util.PageUtil" %>
<%@ page import="com.cl.util.AES256Util" %>
<%@ page import="com.cl.dto.MemberDTO" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.HashMap" %>
<%
	HashMap<String, Object> hMap = (HashMap<String, Object>) request.getAttribute("hMap");
	
	List<MemberDTO> mList = (List<MemberDTO>) hMap.get("list");
	
	
	String searchWord = CmmUtil.nvl((String)hMap.get("search"));
	String searchBox = CmmUtil.nvl((String)hMap.get("searchBox"));
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
			
			<!-- Header Include -->
			<%@include file="/WEB-INF/view/include/inc_header.jsp"%>

		</div>
	</div> <!-- // header -->

	<div id="contentsWrap">
		<div class="container">
			<div class="conTitWrap">
				<h2>관리자/회원정보</h2>
				<div class="location">
					<span class="home">홈</span>
					<span>관리자모드</span>
					<strong>회원정보</strong>
				</div>
			</div> <!-- // conTitWrap -->
			<!-- 메뉴 영역 -->
			
<script type="text/javascript">
	$(function() {
		//메뉴 제어 
		var lnb = $(".pcLnbWrap ul li a");
		var menuId = "MN71300";
		var mbId = "MO71300";
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
	
	function goDetail(mNo) {
		var f = $("#f");
		var memberNo = $("#mNo");
		f.attr("action", "/Lmin/member/memberDetail.do");
		memberNo.val(mNo);
		f.submit();
	};
	
	function goPage(page, lastPage){
		var f = $("#f");
		$("#page").val(page);
		f.submit();
	};
	
	function doSubmit(){
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

<form action="#" name="menuFrm" method="post">
	<input type="hidden" name="menuNum"/>
</form>	
			<%@include file="/WEB-INF/view/Lmin/include/navBar.jsp" %>


			<!-- 메뉴 영역 -->
			<input type="hidden" name="mNo" id="mNo">
			<div class="contents"> <!-- 페이지별 ID none -->
				<h3 class="smallTit">회원정보</h3>
				<form name="f" id="f" method="post" action="/Lmin/member/memberList.do">
				<input type="hidden" name="page" id="page">
				<div class="boardType2">
					<table summary="">
						<caption></caption>
						<colgroup>
							<col width="100%">
						</colgroup>
						<tbody>
							<tr>
								<td>
									<select id="searchBox" name="searchBox" class="inputType3">
										<option value="00" <%=CmmUtil.select("00", CmmUtil.nvl((String) hMap.get("searchBox")))%>>회원명</option>
										<option value="01" <%=CmmUtil.select("01", CmmUtil.nvl((String) hMap.get("searchBox")))%>>아이디</option>
										<option value="02" <%=CmmUtil.select("02", CmmUtil.nvl((String) hMap.get("searchBox")))%>>회원번호</option>
									</select>
									<%if(searchBox.equals("00")){ %>
									<input type="text" name="search" id="search" class="inputType1" value="<%=CmmUtil.nvl(AES256Util.strDecode(searchWord))%>" maxlength="25">
									<%}else{ %>
									<input type="text" name="search" id="search" class="inputType1" value="<%=CmmUtil.nvl((String)searchWord) %>" maxlength="25">
									<%} %>
									
									<a href="javascript:doSubmit();" class="btn_active_small">검색</a>
								</td>
							</tr>
						</tbody>
					</table>
                </div>
				</form>
				<div class="tableBasicList">
					<table class="defaultTable">
						<caption></caption>
						<colgroup>
							<col style="width:10%">
							<col style="width:auto%">
							<col style="width:27%">
							<col style="width:27%">
						</colgroup>
						<thead>
							<tr>
								<th scope="col">회원번호</th>
								<th scope="col">아이디</th>
								<th scope="col">회원명</th>
								<th scope="col">가입일</th>
							</tr>
						</thead>
						<tbody>
						<%if(mList.size() != 0) { %>
							<%for(MemberDTO mDTO : mList) { %>
							<tr>
								<td><%=CmmUtil.nvl(mDTO.getMemberNo()) %></td>
								<td class="alignL">																
									<a href="javascript:goDetail('<%=CmmUtil.nvl(mDTO.getMemberNo()) %>')">
									<%=CmmUtil.nvl(mDTO.getMemberId()) %>
									</a>								
								</td>
								<td><%=AES256Util.strDecode(CmmUtil.nvl(mDTO.getMemberName())) %></td>
								<td>
								<%=CmmUtil.nvl(mDTO.getRegDt()) %>
								</td>
							</tr>
							<% } %>
						<% } %>
						</tbody>						
					</table>
				</div>

				<!-- pageArea -->
				<div class="pageArea">
					<%=PageUtil.frontPaging(hMap, 5) %>
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
