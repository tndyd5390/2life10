<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.cl.util.CmmUtil"%>
<%@page import="com.cl.util.TextUtil"%>
<%@page import="com.cl.util.AES256Util"%>
<%@page import="com.cl.dto.RegulationDTO"%>
<%@include file="/WEB-INF/view/include/inc_header.jsp"%>
<%
	RegulationDTO rDTO = (RegulationDTO)request.getAttribute("rDTO");
	if(rDTO == null) rDTO = new RegulationDTO();
%>

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
	
	function goList(){
		location.href="/regulation/regulationList.do";
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
						<strong><button type="button" class="select" id="subtitle">상조관련법규</button></strong>
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
							<li id="MO60100"><a href="javascript:goMenu('/notice/noticeList.do', 'MO60100');">공지사항</a></li>
                            <li id="MO60200"><a href="javascript:goMenu('/qna/qnaList.do', 'MO60200');">자주하는질문</a></li>
                            <li id="MO60300"><a href="javascript:goMenu('/counsel/counselWrite.do', 'MO60300');">1:1상담</a></li>
                            <li id="MO60400"><a href="javascript:goMenu('/infomation/infomation_a.do', 'MO60400');">주요정보고시사항</a></li>
                            <li id="MO60500"><a href="javascript:goMenu('/regulation/regulationList.do', 'MO60500');">상조관련법규</a></li>
                            <li id="MO60600"><a href="javascript:goMenu('/agreement/agreementList.do', 'MO60600');">이용약관</a></li>
                            <li id="MO60700"><a href="javascript:goMenu('/inquiry/inquiryList.do', 'MO60700');">납부조회</a></li>
                            <li id="MO60800"><a href="javascript:goMenu('/appli/appliForm.do', 'MO60800');">가입상담신청</a></li>
					</ul>
				</nav>
			</div> <!-- // pcLnbWrap -->

			<!-- 메뉴 영역 -->

			<div class="contents"> <!-- 페이지별 ID none -->
				<h3 class="smallTit">상조관련법규</h3>

				<!-- boardView -->
				<form action="" id="" name="" method="post">
				<input type="hidden" id="" name="" value=""/>
				<input type="hidden" id="" name="" value=""/>
			
				<article class="boardView">
					<header class="boardTit">
						<h3><%=TextUtil.exchangeEscapeNvl(rDTO.getRegulationTitle()) %></h3>
						<p class="txt">
							<span class="date"><%=CmmUtil.nvl(rDTO.getRegDt()) %></span>
							<span class="hits">조회수 <%=CmmUtil.nvl(rDTO.getRegulationViewCnt()) %></span>
							<span class="writer"><%=AES256Util.strDecode(CmmUtil.nvl(rDTO.getMemberName())) %></span>
						</p>
					</header>
					<article class="boardCont">
						<div id="ckContent">
								<div class="editArea">								
								<p><span style='font-family: "나눔고딕코딩",NanumGothicCoding,Sans-serif; font-size: 12pt;'>
								<%=TextUtil.replaceBr(TextUtil.exchangeEscapeNvl(rDTO.getRegulationContents())) + "<br>" %>
								<%
								if(!CmmUtil.nvl(rDTO.getRegulationFileName()).equals("")){
								%>
									<img src="<%="/file/regulation/img/" + CmmUtil.nvl(rDTO.getRegulationFileName()) %>" alt="상조관련법규 이미지" />
								<%
								}
								%>
								</span>&nbsp;</p>
								</div>				
						</div>
					</article>
				</article>
				<!-- // newsList -->
				</form>
				<br/><br/>
				<!-- btnArea -->
				<div class="btnArea">
					<button type="button" class="btnDefaultForm" id="listBtn" onclick="goList();">목록</button>
				</div>
				<!-- // btnArea -->


			</div> <!-- // contents -->


		</div>
	</div> <!-- // contentsWrap -->

<!--#include file="../include/inc_footer.jsp"-->
<%@include file="../include/inc_footer.jsp"%>
