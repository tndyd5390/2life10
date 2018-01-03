<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.cl.util.CmmUtil"%>
<%@page import="com.cl.util.TextUtil"%>
<%@page import="com.cl.util.PageUtil"%>
<%@page import="com.cl.dto.CruiseDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%
	HashMap<String, Object> hMap = (HashMap) request.getAttribute("hMap");
	int pageBtnSplit = 5;
	
	List<CruiseDTO> cList = (List<CruiseDTO>) hMap.get("list");
	
%>
<%@ include file="/WEB-INF/view/include/inc_header.jsp" %>

	<div id="contentsWrap">
		<div class="container">
			<div class="conTitWrap">
				<h2>크루즈일정</h2>
				<div class="location">
					<span class="home">홈</span>
					<span>크루즈상품</span>
					<strong>크루즈일정</strong>
				</div>
			</div> <!-- // conTitWrap -->
			<!-- 메뉴 영역 -->
			



<script type="text/javascript">
	$(function() {
		//메뉴 제어 
		var lnb = $(".pcLnbWrap ul li a");
		var menuId = "MN50300";
		var mbId = "MO50300";
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
		var form = document.createElement('form');
		form.setAttribute("method", "Post"); // Get 또는 Post 입력
		form.setAttribute("action", "/cruise/cruiseScheduleList.do");
		
		var hiddenField = document.createElement("input");
		hiddenField.setAttribute("type", "hidden");
		hiddenField.setAttribute("name", "page");
		hiddenField.setAttribute("value", page);
		form.appendChild(hiddenField);
		
		document.body.appendChild(form);
		form.submit();
	};

	function downloadSche(cruiseNo){
		location.href="/cruise/cruiseDownloadSche.do?cruiseNo=" + cruiseNo;
	}

</script>

<form action="#" name="menuFrm" method="post">
	<input type="hidden" name="menuNum"/>
</form>	

			<div class="moLnbWrap">
				<nav class="flexContainer">
					<div class="flexItem3">
						<strong><button type="button" class="select">크루즈상품</button></strong>
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
							<li id="MO50100"><a href="javascript:goMenu('/cruise/cruiseMark.do', '');">크루즈상품특징</a></li>
							<li id="MO50200"><a href="javascript:goMenu('/cruise/cruisePro.do', '');">크루즈성지순례상품</a></li>
							<li id="MO50300"><a href="javascript:goMenu('/cruise/cruiseScheduleList.do', '');">크루즈일정</a></li>
						</ul>
					</div>
								
				</nav>
			</div> <!-- // moLnbWrap -->

			<div class="pcLnbWrap">
				<nav>
					<ul class="pcLnb">
							<li id="MN50100"><a href="javascript:goMenu('/cruise/cruiseMark.do', '');">크루즈상품특징</a></li>
							<li id="MN50200"><a href="javascript:goMenu('/cruise/cruisePro.do', '');">크루즈성지순례상품</a></li>
							<li id="MN50300"><a href="javascript:goMenu('/cruise/cruiseScheduleList.do', '');">크루즈일정</a></li>
					</ul>
				</nav>
			</div> <!-- // pcLnbWrap -->

			<!-- 메뉴 영역 -->

			<div id="cruise_sch" class="contents"> <!-- 페이지별 ID -->

				<%
				if(cList.size() != 0){
					for(CruiseDTO cDTO : cList){
				%>
				<section>
					<h3 class="contTit">
						<span>선사</span>
						<%=TextUtil.exchangeEscapeNvl(cDTO.getCruiseShipName()) %>
					</h3>
					<div class="dashList">
					    <ul>
                            <li>날짜 : <%=CmmUtil.nvl(cDTO.getCruiseStartDay())%> ~ <%=CmmUtil.nvl(cDTO.getCruiseEndDay())%> </li>
                            <li>상품 : <%=TextUtil.exchangeEscapeNvl(cDTO.getCruiseName()) %></li>
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
				</section>
				<%
					}
				}
				%>

				<br/><br/>
				<!-- pageArea -->
				<div class="pageArea">
					<%= PageUtil.frontPaging(hMap, pageBtnSplit)%>
				</div>
				<!-- // pageArea -->

			</div> <!-- // contents -->


		</div>
	</div> <!-- // contentsWrap -->

<%@ include file="/WEB-INF/view/include/inc_footer.jsp" %>