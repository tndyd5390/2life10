<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.cl.util.CmmUtil"%>
<%@page import="com.cl.util.TextUtil"%>
<%@page import="com.cl.util.PageUtil"%>
<%@page import="com.cl.dto.CatalogueDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%
	List<CatalogueDTO> cList = (List<CatalogueDTO>) request.getAttribute("cList");
	
	if(cList == null){
		cList = new ArrayList<>();
	}
%>
<%@include file="/WEB-INF/view/include/inc_header.jsp"%>
<!--#include file="../include/inc_header.jsp"-->

	<div id="contentsWrap">
		<div class="container">
			<div class="conTitWrap">
				<h2>단종상품안내</h2>
				<div class="location">
					<span class="home">홈</span>
					<span>상품안내</span>
					<strong>단종상품안내</strong>
				</div>
			</div> <!-- // conTitWrap -->
			<!-- 메뉴 영역 -->
			



<script type="text/javascript">
	$(function() {
		//메뉴 제어 
		var lnb = $(".pcLnbWrap ul li a");
		var menuId = "MN20400";
		var mbId = "MO20400";
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
	
	
	function download(cNo){
		location.href="/catalogue/catalogueDownload.do?cNo=" + cNo;
	}

</script>

<form action="#" name="menuFrm" method="post">
	<input type="hidden" name="menuNum"/>
</form>	

			<div class="moLnbWrap">
                <nav class="flexContainer">
                    <div class="flexItem3">
                        <strong><button type="button" class="select">상조상품안내</button></strong>
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
                        <strong><button type="button" class="select" id="subtitle">단종상품안내</button></strong>
                        <ul>
                            <li id="MO20100"><a href="javascript:goMenu('/info/proInfo.do', 'MO20100');">상조상품특징</a></li>
                            <li id="MO20200"><a href="javascript:goMenu('/info/joinStep.do', 'MO20200');">가입절차</a></li>
                            <li id="MO20300"><a href="javascript:goMenu('/info/catalogue.do', 'MO20300');">웹카다로그</a></li>
                            <li id="MO20400"><a href="javascript:goMenu('/info/endPro.do', 'MO20400');">단종상품안내</a></li>
                        </ul>
                    </div>

                </nav>
            </div> <!-- // moLnbWrap -->

            <div class="pcLnbWrap">
                <nav>
                    <ul class="pcLnb">
                            <li id="MN20100"><a href="javascript:goMenu('/info/proInfo.do', 'MO20100');">상조상품특징</a></li>
                            <li id="MN20200"><a href="javascript:goMenu('/info/joinStep.do', 'MO20200');">가입절차</a></li>
                            <li id="MN20300"><a href="javascript:goMenu('/info/catalogue.do', 'MO20300');">웹카다로그</a></li>
                            <li id="MN20400"><a href="javascript:goMenu('/info/endPro.do', 'MO20400');">단종상품안내</a></li>
                    </ul>
                </nav>
            </div> <!-- // pcLnbWrap -->

			<!-- 메뉴 영역 -->
			<form name="f" id="f" method="post" action="#">
				<input type="hidden" name="cNo" id="cNo" value="">
			</form>
			<div id="" class="contents"> <!-- 페이지별 ID -->
				<div class="businessIntro">
					<h3 class="subTit">크리스찬상조 단종상품안내</h3>
				</div>
				<ul class="defaultGrayDotList mt-10">
					<li>크리스찬상조 단종상품 안내페이지 입니다.</li>
					<li>단종된 상품에 가입한 회원을 위한 페이지입니다.</li>
					<li>가입된 상품이 단종되었다해도 가입했던 상품내용과 금액 그대로 언제든지 이용가능하며, 신규가입만 받지 않습니다.</li>
				</ul>
				<br/><br/>
				<div class="tableBasicList">
					<table class="defaultTable">
						<caption>사업부문 별 SNS모음</caption>
						<colgroup>
							<col style="width:30%;">
							<col style="width:auto%;">
							<col style="width:15%;">
						</colgroup>
						<thead>
							<tr>
								<th scope="row">상품개시일</th>
								<th scope="row">상품명</th>
								<th scope="row">다운로드</th>
							</tr>
						</thead>
						<tbody>
							<%if(cList.size()>0){
								for(CatalogueDTO cDTO : cList){
							%>		
								<tr>
								<td><%=CmmUtil.nvl(cDTO.getCatalogueStart())%>~<%=CmmUtil.nvl(cDTO.getCatalogueEnd()) %></td>
								<td class="alignL"><%=CmmUtil.nvl(cDTO.getCatalogueName()) %> <%=CmmUtil.nvl(cDTO.getCatalogueContents()) %></td>
								<td><a href="javascript:download('<%=CmmUtil.nvl(cDTO.getCatalogueNo())%>')" class="btn_cancel_small"><span class="iconDownLoad"></span>다운로드</a></td>
								</tr>									
							<%	
								}
							} %>
							<!-- <tr>
								<td>2006.05.01~2008.03.31</td>
								<td class="alignL">장례 (골드)</td>
								<td>dn</td>
							</tr>
							<tr>
								<td>2008.04.01~2008.05.31</td>
								<td class="alignL">장례 (실속형,고급형)</td>
								<td>dn</td>
							</tr>
							<tr>
								<td>2008.06.01~2008.12.31</td>
								<td class="alignL">장례 / 성지순례 (실속형,고급형) </td>
								<td>dn</td>
							</tr> -->
						</tbody>
					</table>
				</div>

			</div> <!-- // contents -->


		</div>
	</div> <!-- // contentsWrap -->

<!--#include file="../include/inc_footer.jsp"-->
<%@include file="/WEB-INF/view/include/inc_footer.jsp"%>
