<%@page import="com.cl.util.CmmUtil"%>
<%@page import="com.cl.util.TextUtil"%>
<%@page import="com.cl.util.PageUtil"%>
<%@page import="com.cl.util.AES256Util"%>
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
	

	function goDetail(rNo){
		var f = $("#f");
		var regulationNo = $("#regulationNo");
		f.attr("action", "/regulation/regulationDetail.do");
		regulationNo.val(rNo);
		f.submit();	
	}
	

	function doSubmit(){
		var f = $("#f");
		var search = $('#search');
		
		if(search.val()==""){
			alert("검색어를 입력하세요.");
			search.focus();
			return false;
		}else{
			f.attr("action", "/regulation/regulationList.do");
			f.submit();
		}
	}
	
	function goPage(page, lastPage){
		var f = $("#f");
		$("#page").val(page);
		f.submit();
	};

</script>

<form action="#" name="menuFrm" method="post">
	<input type="hidden" name="menuNum"/>
</form>	

			<div class="moLnbWrap">
                <nav class="flexContainer">
                    <div class="flexItem3">
                        <strong><button type="button" class="select">고객센터</button></strong>
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
							<li id="MO60100"><a href="javascript:goMenu('/notice/noticeList.do', 'MO60100');">공지사항</a></li>
                            <li id="MO60200"><a href="javascript:goMenu('/qna/qnaList.do', 'MO60200');">자주하는질문</a></li>
                            <li id="MO60300"><a href="javascript:goMenu('/counsel/counselWrite.do', 'MO60300');">1:1상담</a></li>
                            <li id="MO60400"><a href="javascript:goMenu('/infomation/infomation_a.do', 'MO60400');">주요정보고시사항</a></li>
                            <li id="MO60500"><a href="javascript:goMenu('/regulation/regulationList.do', 'MO60500');">상조관련법규</a></li>
                            <li id="MO60600"><a href="javascript:goMenu('/agreement/agreementList.do', 'MO60600');">이용약관</a></li>
                            <li id="MO60700"><a href="javascript:goMenu('/inquiry/inquiryList.do', 'MO60700');">납부조회</a></li>
                            <li id="MO60800"><a href="javascript:goMenu('/appli/appliForm.do', 'MO60800');">가입상담신청</a></li>
                        </ul>
                    </div>

                </nav>
            </div> <!-- // moLnbWrap -->

            <div class="pcLnbWrap">
                <nav>
                    <ul class="pcLnb">
							<li id="MN60100"><a href="javascript:goMenu('/notice/noticeList.do', 'MO60100');">공지사항</a></li>
                            <li id="MN60200"><a href="javascript:goMenu('/qna/qnaList.do', 'MO60200');">자주하는질문</a></li>
                            <li id="MN60300"><a href="javascript:goMenu('/counsel/counselWrite.do', 'MO60300');">1:1상담</a></li>
                            <li id="MN60400"><a href="javascript:goMenu('/infomation/infomation_a.do', 'MO60400');">주요정보고시사항</a></li>
                            <li id="MN60500"><a href="javascript:goMenu('/regulation/regulationList.do', 'MO60500');">상조관련법규</a></li>
                            <li id="MN60600"><a href="javascript:goMenu('/agreement/agreementList.do', 'MO60600');">이용약관</a></li>
                            <li id="MN60700"><a href="javascript:goMenu('/inquiry/inquiryList.do', 'MO60700');">납부조회</a></li>
                            <li id="MN60800"><a href="javascript:goMenu('/appli/appliForm.do', 'MO60800');">가입상담신청</a></li>
                    </ul>
                </nav>
            </div> <!-- // pcLnbWrap -->

			<!-- 메뉴 영역 -->

			<div class="contents"> <!-- 페이지별 ID none -->
				<h3 class="smallTit">상조관련법규</h3>

				<div class="boardType2">
				<form action="/regulation/regulationList.do" id="f" method="post">
				<input type="hidden" name="page" id="page">
				<input type="hidden" name="regulationNo" id="regulationNo">
					<table summary="">
						<caption>상조관련법규</caption>
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
									<a href="javasciprt:doSubmit();" class="btn_active_small">검색</a>
								</td>
							</tr>
						</tbody>
					</table>
					</form>
                </div>

				<br/><br/>
				<div class="boradType5">
					<div class="title">
						<span class="num">번호</span>
						<div class="info">
							<span class="txt1">제목</span>
							<span class="txt2">
								<span class="writer">작성자</span>
								<span class="date">등록일</span>
								<span class="count">조회수</span>
							</span>
						</div>
					</div>
				<ul>
				<%
				if(rList.size()!=0){
					for(RegulationDTO rDTO : rList){
				%>
					<li>
						<p class="num"><%=TextUtil.exchangeEscapeNvl(rDTO.getRowNum()) %></p>
						<div class="info">
							<p class="txt1"><!-- 박성진수정 -->
								<a href="javascript:goDetail(<%=CmmUtil.nvl(rDTO.getRegulationNo())%>);"><%=TextUtil.exchangeEscapeNvl(rDTO.getRegulationTitle()) %></a>
							</p>
							<p class="txt2">
								<span class="writer"><%=AES256Util.strDecode(CmmUtil.nvl(rDTO.getMemberName())) %></span>
								<span class="date"><%=TextUtil.exchangeEscapeNvl(rDTO.getRegDt()) %></span>
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