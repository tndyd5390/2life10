<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include/inc_header.jsp" %>

	<div id="contentsWrap">
		<div class="container">
			<div class="conTitWrap">
				<h2>주요정보고시사항</h2>
				<div class="location">
					<span class="home">홈</span>
					<span>고객센터</span>
					<strong>주요정보고시사항</strong>
				</div>
			</div> <!-- // conTitWrap -->
			<!-- 메뉴 영역 -->
			



<script type="text/javascript">
	$(function() {
		//메뉴 제어 
		var lnb = $(".pcLnbWrap ul li a");
		var menuId = "MN60400";
		var mbId = "MO60400";
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

			<div id="agreement" class="contents"> <!-- 페이지별 ID none -->
				<h3 class="smallTit">주요정보고시사항</h3>



				<!-- 주요정보고시사항 -->
				<article>

					<section>
						<p class="txt">당사는 2009.4.28 공정거래위원회의 "중요표기,광고사항고시"에 의거하여 아래와 같이 고시합니다.<br/>목적:소비자 피해방지 및 합리적 상품선택을 할 수 있도록 정보제공.</p>
					</section>

					<section>
						<h4 class="blueTit">1.중도 해약 환급금에 대한 환급기준 및 환급시기.</h4>
						<ul class="nonumList">
							<li>중도 해약 환급금에 대한 환급기준은 공정거래 위원회가 승인한 상조업 표준약관에 따라 환급 가능하며 환급금액은 신청일로부터 제3영업일 이내에 수령 할 수 있습니다.</li>
						</ul>
					</section>

					<section>
						<h4 class="blueTit">2.소비자 분쟁시 해결기준.</h4>
						<ul class="nonumList">
							<li>공정거래 위원회 소비자 분쟁 해결기준에 따릅니다.</li>
							<li>청약(계약)철회 환급금은 신청일로 부터 제3영업일 이내에 수령 할 수 있습니다.</li>
						</ul>
					</section>

					<section>
						<h4 class="blueTit">3.구체적인 제공물품 및 서비스내용.</h4>
						<ul class="nonumList">
							<li>수의,관,장의차량,인력정보등 구체적인 제공물품 및 서비스 내용은 홈페이지의 상품소개란에 자세히 소개되어 있습니다.
								<ul class="roundNumList">
									<li>① 관:재질-오동(3~6cm), 원산지-중국, 제조-한국</li>
									<li>② 수의:원단-대마/저마(원산지-중국), 제조방법-기계직, 제조-대한민국</li>
									<li>③ 차량:링컨, 캐딜락-2013년식형 리무진/장의버스:상품별 차등 (왕복 200km 또는 전국 무료 제공)</li>
									<li>④ 인력:장례지도사 1명(입관시 2명)/도우미2~6명(상품별 차등 제공 :1일 10시간기준)</li>
								</ul>
							</li>
						</ul>
					</section>

					<section>
						<h4 class="blueTit">4.상조관련자산, 총 고객 환급 의무액 (2017년 12월 기준).</h4>
						<div class="tableBasicList">
							<table class="defaultTable">
								<caption></caption>
								<colgroup>
									<col style="width:auto%;">
									<col style="width:50%;">
								</colgroup>
								<head>
									<tr>
										<th scope="row">총 고객 환급 의무액</th>
										<th scope="row">상조관련자산</th>
									</tr>
								</head>
								<tbody>
									<tr>
										<td>1,228,600만원</td>
										<td>1,464,361만원</td>
									</tr>
									<tr>
										<td colspan="2">*현대회계법인의 회계감사를 받았음</td>
									</tr>
								</tbody>
							</table>
						</div>
					</section>

					<section>
						<h4 class="blueTit">5.고객 불입금에 대한 관리방법.</h4>
						<ul class="nonumList">
							<li>고객 불입금의 50%는 한국상조공제조합에 소비자피해보상을 위한 공제계약(선수금보전)을 체결하고 있습니다.</li>
						</ul>
					</section>

					<section>
						<h4 class="blueTit">6.크리스찬상조 회계감사보고서.</h4>

					</section>

				</article>
				<!-- // 주요정보고시사항 -->

				<div class="btn_area">
					<a href="/file/auditing/auditing.pdf" id="submitLink" class="btn_active">회계감사보고서 다운로드</a>
				</div>
			

			</div> <!-- // contents -->


		</div>
	</div> <!-- // contentsWrap -->

<%@ include file="/WEB-INF/view/include/inc_footer.jsp" %>