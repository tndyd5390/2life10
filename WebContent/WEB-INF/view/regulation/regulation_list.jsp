<%@page import="com.cl.util.CmmUtil"%>
<%@page import="com.cl.util.TextUtil"%>
<%@page import="com.cl.util.PageUtil"%>
<%@page import="com.cl.dto.RegulationDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	HashMap<String, Object> hMap = (HashMap) request.getAttribute("hMap");
	int pageBtnSplit = 5;
	
	List<RegulationDTO> rList = (List<RegulationDTO>) hMap.get("list");
%>
<%@include file="/WEB-INF/view/include/inc_header.jsp"%>
<!--#include file="../include/inc_header.jsp"-->

	<div id="contentsWrap">
		<div class="container">
			<div class="conTitWrap">
				<h2>상조관련법규</h2>
				<div class="location">
					<span class="home">홈</span>
					<span>고객센터</span>
					<strong>상조관련법규</strong>
				</div>
			</div> <!-- // conTitWrap -->
			<!-- 메뉴 영역 -->
			



<script type="text/javascript">
	$(function() {
		//메뉴 제어 
		var lnb = $(".pcLnbWrap ul li a");
		var menuId = "MN60500";
		var mbId = "MO60500";
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
                        <strong><button type="button" class="select">회사소개</button></strong>
                        <ul>
                            <li><a href="javascript:goMenu('/company/overView.do', '');">회사소개</a></li>
                            <li><a href="javascript:goMenu('/info/proInfo.do', '');">상조상품특징</a></li>
                            <li><a href="javascript:goMenu('/funeral/funeralMark.do', '');">장례상품</a></li>
                            <li><a href="javascript:goMenu('/marry/marryMark.do', '');">웨딩상품</a></li>
                            <li><a href="javascript:goMenu('/cruise/cruiseMark.do', '');">크루즈상품</a></li>
                            <li><a href="javascript:goMenu('/notice/noticeList.do', '');">고객센터</a></li>
                        </ul>
                    </div>
                    <div class="flexItem4"> <!-- .select 버튼 클릭시 다중클래스 on 추가 -->
                        <strong><button type="button" class="select" id="subtitle">상담사조회</button></strong>
                        <ul>
                            <li id="MO10100"><a href="javascript:goMenu('/company/overView.do', 'MO10100');">인사말</a></li>
                            <li id="MO10200"><a href="javascript:goMenu('/company/organ.do', 'MO10200');">조직도및연혁</a></li>
                            <li id="MO10300"><a href="javascript:goMenu('/company/branchList.do', 'MO10300');">전국지사안내</a></li>
                            <li id="MO10400"><a href="javascript:goMenu('/company/adviceList.do', 'MO10400');">상담사조회</a></li>
                            <li id="MO10500"><a href="javascript:goMenu('/company/cyberList.do', 'MO10500');">사이버홍보실</a></li>
                            <li id="MO10600"><a href="javascript:goMenu('/company/road.do', 'MO10600');">오시는길</a></li>
                        </ul>
                    </div>

                </nav>
            </div> <!-- // moLnbWrap -->

            <div class="pcLnbWrap">
                <nav>
                    <ul class="pcLnb">
                            <li id="MO10100"><a href="javascript:goMenu('/company/overView.do', 'MO10100');">인사말</a></li>
                            <li id="MO10200"><a href="javascript:goMenu('/company/organ.do', 'MO10200');">조직도및연혁</a></li>
                            <li id="MO10300"><a href="javascript:goMenu('/company/branchList.do', 'MO10300');">전국지사안내</a></li>
                            <li id="MO10400"><a href="javascript:goMenu('/company/adviceList.do', 'MO10400');">상담사조회</a></li>
                            <li id="MO10500"><a href="javascript:goMenu('/company/cyberList.do', 'MO10500');">사이버홍보실</a></li>
                            <li id="MO10600"><a href="javascript:goMenu('/company/road.do', 'MO10600');">오시는길</a></li>
                    </ul>
                </nav>
            </div> <!-- // pcLnbWrap -->

			<!-- 메뉴 영역 -->

			<div class="contents"> <!-- 페이지별 ID none -->
				<h3 class="smallTit">상조관련법규</h3>

				<div class="boardType2">
				<form action="/Lmin/regulation/regulationList.do" id="f" method="post">
				<input type="hidden" name="page" id="page">
					<table summary="">
						<caption>회원가입</caption>
						<colgroup>
							<col width="100%">
						</colgroup>
						<tbody>
							<tr>
								<td>
									<select id="searchBox" name="searchBox" class="inputType3">
										<option value="00" <%=CmmUtil.select("00", CmmUtil.nvl((String) hMap.get("searchBox")))%>>전체</option>
										<option value="01" <%=CmmUtil.select("01", CmmUtil.nvl((String) hMap.get("searchBox")))%>>제목</option>
										<option value="02" <%=CmmUtil.select("02", CmmUtil.nvl((String) hMap.get("searchBox")))%>>글쓴이</option>
									</select>
									<input type="text" name="search" id="search" class="inputType1" value="<%=CmmUtil.nvl((String) hMap.get("search"))%>" maxlength="25">
									<a href="#" class="btn_active_small" onclick="searchRegulation();">검색</a>
								</td>
							</tr>
						</tbody>
					</table>
					</form>
                </div>

				<br/><br/>
				<ul class="boradType5">
				<%
				if(rList.size()!=0){
					for(RegulationDTO rDTO : rList){
				%>
					<li>
						<p class="num"><%=TextUtil.exchangeEscapeNvl(rDTO.getRowNum()) %></p>
						<div class="info">
							<p class="txt1"><!-- 박성진수정 -->
								<a href="/Lmin/regulation/regulationDetail.do?regulationNo=<%=CmmUtil.nvl(rDTO.getRegulationNo())%>"><%=TextUtil.exchangeEscapeNvl(rDTO.getRegulationTitle()) %></a>
							</p>
							<p class="txt2">
								<%=TextUtil.exchangeEscapeNvl(rDTO.getMemberId()) %><span class="bar">&nbsp;|</span>
								<span><%=TextUtil.exchangeEscapeNvl(rDTO.getRegDt()) %></span>
								<span class="bar">|</span>
								<span class="count"><%=TextUtil.exchangeEscapeNvl(rDTO.getRegulationViewCnt()) %></span>
							</p>
						</div>
					</li>
				
				<%
					}
				}
				%>
					<!-- <li>
						<p class="num">[공지]</p>
						<div class="info">
							<p class="txt1">박성진수정
								<a href="javascript:selectBoardDtl('480')">통신판매업신고증</a>
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
								<a href="javascript:selectBoardDtl('480')">통신판매업신고증</a>
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
								<a href="javascript:selectBoardDtl('480')">통신판매업신고증</a>
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
								<a href="javascript:selectBoardDtl('480')">통신판매업신고증</a>
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
								<a href="javascript:selectBoardDtl('480')">통신판매업신고증</a>
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
				<a href="/Lmin/regulation/regulationRegView.do" class="btn_active_small" style="float:right;">상조관련법규등록</a>

				<!-- pageArea -->
				<div class="pageArea">
					<%=PageUtil.frontPaging(hMap, pageBtnSplit) %>
				</div>
				<!-- // pageArea -->


			</div> <!-- // contents -->


		</div>
	</div> <!-- // contentsWrap -->

<!--#include file="../include/inc_footer.jsp"-->
<%@include file="/WEB-INF/view/include/inc_footer.jsp"%>
