<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.cl.util.CmmUtil" %>
<%@ page import="com.cl.util.PageUtil" %>
<%@ page import="com.cl.util.TextUtil" %>
<%@ page import="com.cl.dto.FuneralNoticeDTO" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.HashMap" %>
<%
	HashMap<String, Object> hMap = (HashMap) request.getAttribute("hMap");
	List<FuneralNoticeDTO> fList = (List<FuneralNoticeDTO>) hMap.get("list");
	int pageBtnSplit = 5;

%>
<%@include file="/WEB-INF/view/include/inc_header.jsp"%>
<!--#include file="../include/inc_header.jsp"-->

	<div id="contentsWrap">
		<div class="container">
			<div class="conTitWrap">
				<h2>부고알림</h2>
				<div class="location">
					<span class="home">홈</span>
					<span>장례상품</span>
					<strong>부고알림</strong>
				</div>
			</div> <!-- // conTitWrap -->
			<!-- 메뉴 영역 -->
			



<script type="text/javascript">
	$(function() {
		//메뉴 제어 
		var lnb = $(".pcLnbWrap ul li a");
		var menuId = "MN30400";
		var mbId = "MO30400";
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
						<strong><button type="button" class="select" id="subtitle">부고알림</button></strong>
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

			<div class="contents"> <!-- 페이지별 ID none -->
				<h3 class="smallTit">부고알림</h3>
				<form name="f" id="f" method="post" action="/funeral/funeralNoticeList.do">
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
										<option value="00" <%=CmmUtil.select("00", CmmUtil.nvl((String) hMap.get("searchBox")))%>>전체</option>
										<option value="01" <%=CmmUtil.select("01", CmmUtil.nvl((String) hMap.get("searchBox")))%>>소천인</option>
										<option value="02" <%=CmmUtil.select("02", CmmUtil.nvl((String) hMap.get("searchBox")))%>>회원명</option>
									</select>
									<input type="text" name="search" id="search" class="inputType1" value="<%=CmmUtil.nvl((String) hMap.get("search"))%>" maxlength="25">
									<a href="javascript:doSubmit();" class="btn_active_small">검색</a>
								</td>
							</tr>
						</tbody>
					</table>
                </div>
				</form>
				<br/><br/>
				
				<div class="boradType6">
                    <div class="title">
                        <span class="num">부고</span>
                        <div class="info">
                            <span class="txt">회원명</span>
                            <span class="txt1">소천인</span>
                            <span class="txt2">
                                <span class="date">소천일</span>
                                <span class="count">장례식장명</span>
                            </span>
                        </div>
                    </div>
				<ul>
				<%if(fList.size()!=0){%>
				<%for(FuneralNoticeDTO fDTO : fList){%>
					<li>
						<p class="num">부고</p>
						<div class="info">
							<span class="txt">회원 <%=CmmUtil.nvl(fDTO.getFuneralNoticeMember()) %></span>
							<span class="txt1"><%=CmmUtil.nvl(fDTO.getFuneralNoticeName()) %>님 소천</span>
							<span class="txt2">
								<span class="date"><%=CmmUtil.nvl(fDTO.getFuneralNoticeDay()) %></span>
								<span class="count"><%=CmmUtil.nvl(fDTO.getFuneralNoticePlace()) %></span>
							</span>
						</div>
					</li>
				<%}%>
				<% }%>
				</ul>
				</div>

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
