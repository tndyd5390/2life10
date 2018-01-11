<%@page import="com.cl.util.CmmUtil"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.cl.dto.InquiryDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include/inc_header.jsp" %>
<%
	Map<String, Object> map = (Map<String, Object>)request.getAttribute("totalInquiry");
	List<InquiryDTO> iList = (List<InquiryDTO>)map.get("iList");
	if(iList == null) iList = new ArrayList();
	InquiryDTO iDTO = (InquiryDTO)map.get("iDTO");
	if(iDTO == null) iDTO = new InquiryDTO();
%>
	<div id="contentsWrap">
		<div class="container">
			<div class="conTitWrap">
				<h2>납부조회</h2>
				<div class="location">
					<span class="home">홈</span>
					<span>고객센터</span>
					<strong>납부조회</strong>
				</div>
			</div> <!-- // conTitWrap -->
			<!-- 메뉴 영역 -->
			



<script type="text/javascript">
	$(function() {
		//메뉴 제어 
		var lnb = $(".pcLnbWrap ul li a");
		var menuId = "MN60700";
		var mbId = "MO60700";
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
						<strong><button type="button" class="select" id="subtitle">주요정보고시사항</button></strong>
						<ul>
							<li id="MO60100"><a href="javascript:goMenu('/notice/noticeList.do', 'MO60100');">공지사항</a></li>
                            <li id="MO60200"><a href="javascript:goMenu('/qna/qnaList.do', 'MO60200');">자주하는질문</a></li>
                            <li id="MO60300"><a href="javascript:goMenu('/counsel/counselWrite.do', 'MO60300');">1:1상담</a></li>
                            <li id="MO60400"><a href="javascript:goMenu('/infomation/infomation_a.do', 'MO60400');">주요정보고시사항</a></li>
                            <li id="MO60500"><a href="javascript:goMenu('/regulation/regulationList.do', 'MO60500');">상조관련법규</a></li>
                            <li id="MO60600"><a href="javascript:goMenu('/agreement/agreementList.do', 'MO60600');">이용약관</a></li>
                            <li id="MO60700"><a href="javascript:goMenu('/inquiry/inquiryList.do', 'MO60700');">납부조회</a></li>
                            <li id="MO60800"><a href="javascript:goMenu('/appli/appliForm.do', 'MO60800');">가입신청</a></li>
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
                            <li id="MN60800"><a href="javascript:goMenu('/appli/appliForm.do', 'MO60800');">가입신청</a></li>
					</ul>
				</nav>
			</div> <!-- // pcLnbWrap -->

			<!-- 메뉴 영역 -->

			<div class="contents"> <!-- 페이지별 ID none -->
				<h3 class="smallTit">납부조회</h3>

				<div class="tableBasicList">
					<table class="defaultTable">
						<caption></caption>
						<colgroup>
							<col style="width:20%;">
							<col style="width:30%;">
							<col style="width:20%;">
							<col style="width:30%;">
						</colgroup>
						<tbody>
							<tr>
								<th scope="row">회원번호</th>
								<td><%=CmmUtil.nvl(iDTO.getMemberNo()) %></td>
								<th scope="row">회원성명</th>
								<td><%=CmmUtil.nvl(iDTO.getMemberName()) %></td>
							</tr>
							<tr>
								<th scope="row">주민등록번호</th>
								<td><%=CmmUtil.nvl(iDTO.getMemberRrn()) + "******" %></td>
								<th scope="row">성별</th>
								<td><%=CmmUtil.nvl(iDTO.getSex()) %></td>
							</tr>
							<tr>
								<th scope="row">상품종류</th>
								<td><%=CmmUtil.nvl(iDTO.getItem()) %></td>
								<th scope="row">나이</th>
								<td><%=CmmUtil.nvl(iDTO.getAge()) %></td>
							</tr>
							<tr>
								<th scope="row">만기계약금</th>
								<td><%=CmmUtil.nvl(iDTO.getFullPayment()) + "원" %></td>
								<th scope="row">월부금액</th>
								<td><%=CmmUtil.nvl(iDTO.getPaymentMoney()) + "원" %></td>
							</tr>
							<tr>
								<th scope="row">가입일자</th>
								<td><%=CmmUtil.nvl(iDTO.getRegDt()) %></td>
								<th scope="row">불입종별</th>
								<td><%=CmmUtil.nvl(iDTO.getPaymentMethod()) %></td>
							</tr>
							<tr>
								<th scope="row">불입방법</th>
								<td><%=CmmUtil.nvl(iDTO.getPaymentRoute()) %></td>
								<th scope="row">관리구분</th>
								<td><%=CmmUtil.nvl(iDTO.getClassification()) %></td>
							</tr>
							<tr>
								<th scope="row">불입횟수</th>
								<td><%=CmmUtil.nvl(iDTO.getLastPaymentCount()) %></td>
								<th scope="row">연체</th>
								<td>-</td>
							</tr>
							<tr>
								<th scope="row">불입총금액</th>
								<td><%=CmmUtil.nvl(iDTO.getTotalPayment()) %></td>
								<th scope="row">영업사원</th>
								<td><%=CmmUtil.nvl(iDTO.getSalesPerson()) %></td>
							</tr>
							<tr>
								<th scope="row">집주소</th>
								<td colspan="3"><%=CmmUtil.nvl(iDTO.getAddr()) %></td>
							</tr>
							<tr>
								<th scope="row">발송처주소</th>
								<td colspan="3">-</td>
							</tr>
							<tr>
								<th scope="row">집전화번호</th>
								<%
								if("".equals(CmmUtil.nvl(iDTO.getTelNo()) )){
								%>
								<td>-</td>
								<%
								}else{
								%>
								<td><%=CmmUtil.nvl(iDTO.getTelNo()) %></td>
								<%
								}
								%>
								<th scope="row">발송처전화</th>
								<td>-</td>
							</tr>
						</tbody>
					</table>
				</div>
			
				<div class="tableBasicList">
					<table class="defaultTable">
						<caption></caption>
						<colgroup>
							<col style="width:auto%;">
							<col style="width:30%;">
							<col style="width:30%;">
							<col style="width:30%;">
						</colgroup>
						<head>
							<tr>
								<th scope="row">No</th>
								<th scope="row">예정납입</th>
								<th scope="row">실제납입</th>
								<th scope="row">납입방법</th>
							</tr>
						</head>
						<tbody>
						<%
						for(int i = 0; i< iList.size(); i++){
							InquiryDTO dto = iList.get(i);
						%>
							<tr>
								<td><%= (i + 1) %></td>
								<td><%=CmmUtil.nvl(dto.getPaymentDay()) %></td>
								<td><%=CmmUtil.nvl(dto.getRealPaymentDay()) %></td>
								<td><%=CmmUtil.nvl(dto.getPaymentRoute()) %></td>
							</tr>
							
						<%
						}
						%>
						<!-- 	<tr>
								<td>1</td>
								<td>2012.12</td>
								<td>2012.12.17</td>
								<td>자동이체</td>
							</tr>
							<tr>
								<td>1</td>
								<td>2012.12</td>
								<td>2012.12.17</td>
								<td>자동이체</td>
							</tr>
							<tr>
								<td>1</td>
								<td>2012.12</td>
								<td>2012.12.17</td>
								<td>자동이체</td>
							</tr>
							<tr>
								<td>1</td>
								<td>2012.12</td>
								<td>2012.12.17</td>
								<td>자동이체</td>
							</tr>
							<tr>
								<td>1</td>
								<td>2012.12</td>
								<td>2012.12.17</td>
								<td>자동이체</td>
							</tr>
							<tr>
								<td>1</td>
								<td>2012.12</td>
								<td>2012.12.17</td>
								<td>자동이체</td>
							</tr>
							<tr>
								<td>1</td>
								<td>2012.12</td>
								<td>2012.12.17</td>
								<td>자동이체</td>
							</tr>
							<tr>
								<td>1</td>
								<td>2012.12</td>
								<td>2012.12.17</td>
								<td>자동이체</td>
							</tr>
							<tr>
								<td>1</td>
								<td>2012.12</td>
								<td>2012.12.17</td>
								<td>자동이체</td>
							</tr> -->
						</tbody>
					</table>
				</div>

			</div> <!-- // contents -->


		</div>
	</div> <!-- // contentsWrap -->

<%@ include file="/WEB-INF/view/include/inc_footer.jsp" %>