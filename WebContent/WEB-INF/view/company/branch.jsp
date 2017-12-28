<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.cl.util.PageUtil"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.cl.util.TextUtil"%>
<%@page import="com.cl.util.CmmUtil"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.cl.dto.BranchDTO"%>
<%@page import="java.util.List"%>
<%
	HashMap<String, Object> hMap = (HashMap) request.getAttribute("hMap");
	int pageBtnSplit = 5;
	
	List<BranchDTO> bList = (List<BranchDTO>) hMap.get("list");
%>

<%@include file="/WEB-INF/view/include/inc_header.jsp"%>
<!--#include file="../include/inc_header.jsp"-->

	<div id="contentsWrap">
		<div class="container">
			<div class="conTitWrap">
				<h2>전국지사안내</h2>
				<div class="location">
					<span class="home">홈</span>
					<span>회사소개</span>
					<strong>전국지사안내</strong>
				</div>
			</div> <!-- // conTitWrap -->
			<!-- 메뉴 영역 -->
			



<script type="text/javascript">
	$(function() {
		//메뉴 제어 
		var lnb = $(".pcLnbWrap ul li a");
		var menuId = "MN10300";
		var mbId = "MO10300";
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
	function doSearch(){
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
	}

</script>

<form action="#" name="menuFrm" method="post">
	<input type="hidden" name="menuNum"/>
</form>	

			<div class="moLnbWrap">
                <nav class="flexContainer">
                    <div class="flexItem3">
                        <strong><button type="button" class="select">회사소개</button></strong>
                        <ul>
                            <li><a href="javascript:goMenu('../company/overview.jsp', '');">회사소개</a></li>
                            <li><a href="javascript:goMenu('../info/pro_info.jsp', '');">상조상품특징</a></li>
                            <li><a href="javascript:goMenu('../funeral/funeral_mark.jsp', '');">장례상품</a></li>
                            <li><a href="javascript:goMenu('../marry/marry_mark.jsp', '');">웨딩상품</a></li>
                            <li><a href="javascript:goMenu('../cruise/cruise_mark.jsp', '');">크루즈상품</a></li>
                            <li><a href="javascript:goMenu('../notice/notice_list.jsp', '');">고객센터</a></li>
                        </ul>
                    </div>
                    <div class="flexItem4"> <!-- .select 버튼 클릭시 다중클래스 on 추가 -->
                        <strong><button type="button" class="select" id="subtitle">전국지사안내</button></strong>
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
                            <li id="MN10100"><a href="javascript:goMenu('/company/overView.do', 'MO10100');">인사말</a></li>
                            <li id="MN10200"><a href="javascript:goMenu('/company/organ.do', 'MO10200');">조직도및연혁</a></li>
                            <li id="MN10300"><a href="javascript:goMenu('/company/branchList.do', 'MO10300');">전국지사안내</a></li>
                            <li id="MN10400"><a href="javascript:goMenu('/company/adviceList.do', 'MO10400');">상담사조회</a></li>
                            <li id="MN10500"><a href="javascript:goMenu('/company/cyberList.do', 'MO10500');">사이버홍보실</a></li>
                            <li id="MN10600"><a href="javascript:goMenu('/company/road.do', 'MO10600');">오시는길</a></li>
                    </ul>
                </nav>
            </div> <!-- // pcLnbWrap -->

			<!-- 메뉴 영역 -->

			<div class="contents"> <!-- 페이지별 ID none -->
				<h4 class="smallTit">전국지사안내</h4>
				<form action="/company/branchList.do" method="post" id="f">
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
									<select id="telAbleEndTime" name="telAbleEndTime" title="" class="inputType3">
										<option value="1" <%=CmmUtil.select("001", CmmUtil.nvl((String) hMap.get("searchBox")))%>>전체</option>
										<option value="2" <%=CmmUtil.select("서울특별시", CmmUtil.nvl((String) hMap.get("searchBox")))%>>서울특별시</option>
										<option value="3" <%=CmmUtil.select("부산광역시", CmmUtil.nvl((String) hMap.get("searchBox")))%>>부산광역시</option>
										<option value="4" <%=CmmUtil.select("대구광역시", CmmUtil.nvl((String) hMap.get("searchBox")))%>>대구광역시</option>
										<option value="5" <%=CmmUtil.select("인천광역시", CmmUtil.nvl((String) hMap.get("searchBox")))%>>인천광역시</option>
										<option value="6" <%=CmmUtil.select("광주광역시", CmmUtil.nvl((String) hMap.get("searchBox")))%>>광주광역시</option>
										<option value="7" <%=CmmUtil.select("대전광역시", CmmUtil.nvl((String) hMap.get("searchBox")))%>>대전광역시</option>
										<option value="8" <%=CmmUtil.select("울산광역시", CmmUtil.nvl((String) hMap.get("searchBox")))%>>울산광역시</option>
										<option value="9" <%=CmmUtil.select("경기도", CmmUtil.nvl((String) hMap.get("searchBox")))%>>경기도</option>
										<option value="10" <%=CmmUtil.select("강원도", CmmUtil.nvl((String) hMap.get("searchBox")))%>>강원도</option>
										<option value="11" <%=CmmUtil.select("충청북도", CmmUtil.nvl((String) hMap.get("searchBox")))%>>충청북도</option>
										<option value="12" <%=CmmUtil.select("충청남도", CmmUtil.nvl((String) hMap.get("searchBox")))%>>충청남도</option>
										<option value="13" <%=CmmUtil.select("전라북도", CmmUtil.nvl((String) hMap.get("searchBox")))%>>전라북도</option>
										<option value="14" <%=CmmUtil.select("전라남도", CmmUtil.nvl((String) hMap.get("searchBox")))%>>전라남도</option>
										<option value="15" <%=CmmUtil.select("경상북도", CmmUtil.nvl((String) hMap.get("searchBox")))%>>경상북도</option>
										<option value="16" <%=CmmUtil.select("경상남도", CmmUtil.nvl((String) hMap.get("searchBox")))%>>경상남도</option>
										<option value="17" <%=CmmUtil.select("제주특별자치도", CmmUtil.nvl((String) hMap.get("searchBox")))%>>제주특별자치도</option>									</select>
									지사명
									<input type="text" name="search" id="search" class="inputType1" value="<%=CmmUtil.nvl((String) hMap.get("search"))%>" maxlength="25">

									<a href="#" class="btn_active_small" onclick="doSearch()">검색</a>
								</td>
							</tr>
						</tbody>
					</table>
                </div>

				<br/><br/>
				<ul class="boradType4">
						<%
						if(bList.size()!=0){
							for(BranchDTO bDTO : bList){
						%>
						<li>
							<p class="num"><%=CmmUtil.nvl(bDTO.getRowNum()) %></p>
							<div class="info">
								<p class="txt"><%=TextUtil.exchangeEscapeNvl(bDTO.getBranchName()) %></p>
								<p class="txt1"><!-- 박성진수정 -->
									<a href="#"><%=TextUtil.exchangeEscapeNvl(bDTO.getBranchAddress()) + " " + TextUtil.exchangeEscapeNvl(bDTO.getBranchAddressDetail()) %></a>
								</p>
								<p class="txt2">
									<%=TextUtil.exchangeEscapeNvl(bDTO.getBranchOfficerName()) %><span class="bar">&nbsp;|</span>
									<span><%=TextUtil.exchangeEscapeNvl(bDTO.getBranchTelNo()) %></span>
									<span class="bar">|</span>
									<span class="count"><%=TextUtil.exchangeEscapeNvl(bDTO.getBranchAreaCode()) %></span>
								</p>
							</div>
						</li>
						<%
							}
						}else{%>
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
						<%
						}
						%>
				</ul>



				<!-- pageArea -->
				<div class="pageArea">
					<%= PageUtil.frontPaging(hMap, pageBtnSplit)%>
				</div>
				<!-- // pageArea -->
			</form>
			</div> <!-- // contents -->
		</div>
	</div> <!-- // contentsWrap -->

<!--#include file="../include/inc_footer.jsp"-->
<%@include file="/WEB-INF/view/include/inc_footer.jsp"%>
