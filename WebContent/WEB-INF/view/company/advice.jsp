<%@page import="com.cl.util.PageUtil"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.cl.util.MathUtil"%>
<%@page import="com.cl.util.TextUtil"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.cl.dto.AdviceDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	HashMap<String, Object> hMap = (HashMap) request.getAttribute("hMap");
	if(hMap == null) hMap = new HashMap<>();
	int pageBtnSplit = 5;
	List<AdviceDTO> aList = (List<AdviceDTO>) hMap.get("list");
	if(aList == null) aList = new ArrayList<>();
%>
<%@include file="/WEB-INF/view/include/inc_header.jsp"%>
	<!--#include file="../include/inc_header.jsp"-->

	<div id="contentsWrap">
		<div class="container">
			<div class="conTitWrap">
				<h2>상담사조회</h2>
				<div class="location">
					<span class="home">홈</span>
					<span>회사소개</span>
					<strong>상담사조회</strong>
				</div>
			</div> <!-- // conTitWrap -->
			<!-- 메뉴 영역 -->
			



<script type="text/javascript">
	$(function() {
		//메뉴 제어 
		var lnb = $(".pcLnbWrap ul li a");
		var menuId = "MN10400";
		var mbId = "MO10400";
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

	function adviceSearch(){
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
				<h3 class="smallTit">상담사조회</h3>
				
				<div class="boardType2">
				<form name="f" id="f" method="post" action="/company/adviceList.do">
				<input type="hidden" name="page" id="page">
				
				</form>
					<table summary="">
						<caption></caption>
						<colgroup>
							<col width="100%">
						</colgroup>
						<tbody>
							<tr>
								<td>
									상담사명
									<input type="text" id="search" name="search" class="inputType1" maxlength="25">

									<a href="#" class="btn_active_small" onclick="adviceSearch();">검색</a>
								</td>
							</tr>
						</tbody>
					</table>
                </div>

				<br/><br/>
				<ul class="boradType4">
				<%
				if(aList.size()!=0){
					for(AdviceDTO aDTO : aList){
				%>
					<li>
						<p class="num"><%=TextUtil.exchangeEscapeNvl(aDTO.getRowNum()) %></p>
						<div class="info">
							<p class="txt"><%=TextUtil.exchangeEscapeNvl(aDTO.getAdviceName()) %></p>
							<p class="txt1"><!-- 박성진수정 -->
								<a href="#">
									<%=TextUtil.exchangeEscapeNvl(aDTO.getAdviceAddress() + " " + aDTO.getAdviceAddressDetail()) %>
								</a>
							</p>
							<p class="txt2">
								<span><%=TextUtil.exchangeEscapeNvl(aDTO.getAdvicePhoneNo()) %></span>
							</p>
						</div>
					</li>
				<%
					}
				}
				%>			
				</ul>
	


				<!-- pageArea -->
				<div class="pageArea">
				<%= PageUtil.frontPaging(hMap, pageBtnSplit)%>
				</div>
				<!-- // pageArea -->

			</div> <!-- // contents -->


		</div>
	</div> <!-- // contentsWrap -->

<!--#include file="../include/inc_footer.jsp"-->
<%@include file="/WEB-INF/view/include/inc_footer.jsp"%>
