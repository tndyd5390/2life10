<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../include/inc_header.jsp"%>
<!--#include file="../include/inc_header.jsp"-->

	<div id="contentsWrap">
		<div class="container">
			<div class="conTitWrap">
				<h2>공지사항</h2>
				<div class="location">
					<span class="home">홈</span>
					<span>고객센터</span>
					<strong>공지사항</strong>
				</div>
			</div> <!-- // conTitWrap -->
			<!-- 메뉴 영역 -->
			



<script type="text/javascript">
	$(function() {
		//메뉴 제어 
		var lnb = $(".pcLnbWrap ul li a");
		var menuId = "MN60100";
		var mbId = "MO60100";
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
							<li><a href="javascript:goMenu('../company/overview.jsp', '');">회사안내</a></li>
							<li><a href="javascript:goMenu('../info/pro_info.jsp', '');">상조상품안내</a></li>
							<li><a href="javascript:goMenu('../funeral/funeral_mark.jsp', '');">장례상품</a></li>
							<li><a href="javascript:goMenu('../marry/marry_mark.jsp', '');">웨딩상품</a></li>
							<li><a href="javascript:goMenu('../cruise/cruise_mark.jsp', '');">크루즈상품</a></li>
							<li><a href="javascript:goMenu('../notice/notice_list.jsp', '');">고객센터</a></li>
						</ul>
					</div>
					<div class="flexItem4"> <!-- .select 버튼 클릭시 다중클래스 on 추가 -->
						<strong><button type="button" class="select" id="subtitle">고객센터</button></strong>
						<ul>
							<li id="MO60100"><a href="javascript:goMenu('../notice/notice_list.jsp', 'MO60100');">공지사항</a></li>
                            <li id="MO60200"><a href="javascript:goMenu('../qna/qna_list.jsp', 'MO60200');">자주하는질문</a></li>
                            <li id="MO60300"><a href="javascript:goMenu('../counsel/counsel_list.jsp', 'MO60300');">1:1상담</a></li>
                            <li id="MO60400"><a href="javascript:goMenu('../infomation/infomation_a.jsp', 'MO60400');">주요정보고시사항</a></li>
                            <li id="MO60500"><a href="javascript:goMenu('../regulation/regulation_list.jsp', 'MO60500');">상조관련법규</a></li>
                            <li id="MO60600"><a href="javascript:goMenu('../agreement/agreement_list.jsp', 'MO60600');">이용약관</a></li>
                            <li id="MO60700"><a href="javascript:goMenu('../inquiry/inquiry_list.jsp', 'MO60700');">납부조회</a></li>
                            <li id="MO60800"><a href="javascript:goMenu('../appli/appli_form.jsp', 'MO60800');">가입신청</a></li>
						</ul>
					</div>
								
				</nav>
			</div> <!-- // moLnbWrap -->

			<div class="pcLnbWrap">
				<nav>
					<ul class="pcLnb">
						<li id="MN60100"><a href="javascript:goMenu('../notice/notice_list.jsp', 'MN60100');">공지사항</a></li>
                        <li id="MN60200"><a href="javascript:goMenu('../qna/qna_list.jsp', 'MN60200');">자주하는질문</a></li>
                        <li id="MN60300"><a href="javascript:goMenu('../counsel/counsel_list.jsp', 'MN60300');">1:1상담</a></li>
                        <li id="MN60400"><a href="javascript:goMenu('../infomation/infomation_a.jsp', 'MN60400');">주요정보고시사항</a></li>
                        <li id="MN60500"><a href="javascript:goMenu('../regulation/regulation_list.jsp', 'MN60500');">상조관련법규</a></li>
                        <li id="MN60600"><a href="javascript:goMenu('../agreement/agreement_list.jsp', 'MN60600');">이용약관</a></li>
                        <li id="MN60700"><a href="javascript:goMenu('../inquiry/inquiry_list.jsp', 'MN60700');">납부조회</a></li>
                        <li id="MN60800"><a href="javascript:goMenu('../appli/appli_form.jsp', 'MN60800');">가입신청</a></li>
					</ul>
				</nav>
			</div> <!-- // pcLnbWrap -->

			<!-- 메뉴 영역 -->

			<div class="contents"> <!-- 페이지별 ID none -->
				<h3 class="smallTit">공지사항</h3>
				
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
										<option value="00">전체</option>
										<option value="01">제목</option>
									</select>
									<input type="text" name="name" value="" title="" class="inputType1" style="" maxlength="25">

									<a href="#" class="btn_active_small">검색</a>
								</td>
							</tr>
						</tbody>
					</table>
                </div>

				<br/><br/>
				<ul class="boradType5">
					<li>
						<p class="num">[공지]</p>
						<div class="info">
							<p class="txt1"><!-- 박성진수정 -->
								<a href="javascript:selectBoardDtl('480')">2017년 한국상조공제조합 공제계약증서</a>
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
							<p class="txt1"><!-- 박성진수정 -->
								<a href="javascript:selectBoardDtl('480')">2017년 한국상조공제조합 공제계약증서</a>
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
							<p class="txt1"><!-- 박성진수정 -->
								<a href="javascript:selectBoardDtl('480')">2017년 한국상조공제조합 공제계약증서</a>
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
							<p class="txt1"><!-- 박성진수정 -->
								<a href="javascript:selectBoardDtl('480')">2017년 한국상조공제조합 공제계약증서</a>
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
							<p class="txt1"><!-- 박성진수정 -->
								<a href="javascript:selectBoardDtl('480')">2017년 한국상조공제조합 공제계약증서</a>
							</p>
							<p class="txt2">
								관리자<span class="bar">&nbsp;|</span>
								<span>2017-10-10</span>
								<span class="bar">|</span>
								<span class="count">625</span>
							</p>
						</div>
					</li>
				</ul>



				<!-- pageArea -->
				<div class="pageArea">
					<a href='#none' class='btnFirst'><span>처음</span></a> <a href='#' class='btnPrev'><span>이전</span></a><strong>1</strong><a href="javascript:goPage('2','15')" >2</a><a href="javascript:goPage('3','15')" >3</a><a href="javascript:goPage('4','15')" >4</a><a href="javascript:goPage('5','15')" >5</a><a href="javascript:goPage('2','15')" class='btnNext'><span>다음</span></a> <a href="javascript:goPage('19','15')" class='btnLast'><span>마지막</span></a>
				</div>
				<!-- // pageArea -->


			</div> <!-- // contents -->


		</div>
	</div> <!-- // contentsWrap -->

<!--#include file="../include/inc_footer.jsp"-->
<%@include file="../include/inc_footer.jsp"%>
