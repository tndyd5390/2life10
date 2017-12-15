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
<%@include file="/WEB-INF/view/include/inc_header.jsp"%>
<!--#include file="../include/inc_header.jsp"-->

	<div id="contentsWrap">
		<div class="container">
			<div class="conTitWrap">
				<h2>장례정보</h2>
				<div class="location">
					<span class="home">홈</span>
					<span>장례상품</span>
					<strong>장례정보</strong>
				</div>
			</div> <!-- // conTitWrap -->
			<!-- 메뉴 영역 -->
			



<script type="text/javascript">
	$(function() {
		//메뉴 제어 
		var lnb = $(".pcLnbWrap ul li a");
		var menuId = "MN10200";
		var mbId = "MO10200";
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

			<div class="moLnbWrap">
				<nav class="flexContainer">
					<div class="flexItem3">
						<strong><button type="button" class="select">장례상품</button></strong>
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
						<strong><button type="button" class="select" id="subtitle">장례상품</button></strong>
						<ul>
							<li id="MO30100"><a href="javascript:goMenu('/funeral/funeralMark.do', 'MO30100');">장례상품특징</a></li>
							<li id="MO30200"><a href="javascript:goMenu('/funeral/funeralList_a.do', 'MO30200');">장례상품</a></li>
							<li id="MO30300"><a href="javascript:goMenu('/funeral/funeralInfo_a.do', 'MO30300');">장례정보</a></li>
							<li id="MO30400"><a href="javascript:goMenu('/funeral/funeralNoticeList.do', 'MO30400');">부고알림</a></li>
						</ul>
					</div>
								
				</nav>
			</div> <!-- // moLnbWrap -->

			<div class="pcLnbWrap">
				<nav>
					<ul class="pcLnb">
							<li id="MN30100"><a href="javascript:goMenu('/funeral/funeralMark.do', 'MN30100');">장례상품특징</a></li>
							<li id="MN30200"><a href="javascript:goMenu('/funeral/funeralList_a.do', 'MN30200');">장례상품</a></li>
							<li id="MN30300"><a href="javascript:goMenu('/funeral/funeralInfo_a.do', 'MN30300');">장례정보</a></li>
							<li id="MN30400"><a href="javascript:goMenu('/funeral/funeralNoticeList.do', 'MN30400');">부고알림</a></li>
					</ul>
				</nav>
			</div> <!-- // pcLnbWrap -->

			<!-- 메뉴 영역 -->

			<div id="pro_info" class="contents"> <!-- 페이지별 ID -->

				<div class="defaultTab">
				    <strong class="select">
                        <button type="button">전국장례시설안내</button>
                    </strong>
					<ul>
						<li class="tab01"><a href="javascript:goMenu('/funeral/funeralInfo_a.do', 'MN30300');">기독교장례 및 추도예매</a></li>
                        <li class="tab02"><a href="javascript:goMenu('/funeral/funeralInfo_b.do', 'MN30300');">장례구비서류 및 행정절차</a></li>
                        <li class="tab03 active"><a href="javascript:goMenu('/funeral/funeralInfoList.do', 'MN30300');">전국장례시설안내</a></li>
                        <li class="tab04"><a href="javascript:goMenu('/funeral/funeralInfo_c.do', 'MN30300');">관련사이트</a></li>
					</ul>
				</div>

				<div class="boardType2">
					<form name="f" id="f" method="post" action="/funeral/funeralInfoList.do">
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

				<div class="businessIntro">
					<h3 class="subTit">전국 장례시설 안내</h3>
				</div>
				<br/>
				
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
						<%if(fuList.size()>0){%>
						<%for(FuneralInfoDTO fDTO : fuList){%>
							<tr>
								<td><%=CmmUtil.nvl(fDTO.getRownum())%></td>
								<td><%=CmmUtil.nvl(fDTO.getFuneralInfoCode())%></td>
								<td>
								<a href="/Lmin/funeral/funeralInfoDetail.do?fNo=<%=CmmUtil.nvl(fDTO.getFuneralInfoNo())%>">
								<%=CmmUtil.nvl(fDTO.getFuneralInfoName())%></a>
								</td>
								<td><%=TextUtil.exchangeEscapeNvl(fDTO.getFuneralAddress())%> <%=TextUtil.exchangeEscapeNvl(fDTO.getFuneralAddressDetail())%></td>
								<td><%=CmmUtil.nvl(fDTO.getFuneralInfoTelNo())%></td>
							</tr>
						<%}%>
						<%} %>
						</tbody>
					</table>
				</div>

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
