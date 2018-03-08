<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/view/include/inc_header.jsp"%>
<!--#include file="../include/inc_header.jsp"-->

	<div id="contentsWrap">
		<div class="container">
			<div class="conTitWrap">
				<h2>자주하는질문</h2>
				<div class="location">
					<span class="home">홈</span>
					<span>고객센터</span>
					<strong>자주하는질문</strong>
				</div>
			</div> <!-- // conTitWrap -->
			<!-- 메뉴 영역 -->
			



<script type="text/javascript">
	$(function() {
		//메뉴 제어 
		var lnb = $(".pcLnbWrap ul li a");
		var menuId = "MN60200";
		var mbId = "MO60200";
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
						<strong><button type="button" class="select" id="subtitle">고객센터</button></strong>
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

			<div id="qna" class="contents"> <!-- 페이지별 ID none -->
				<h3 class="smallTit">자주하는질문</h3>

				<div class="accordionList">
					<ul>
							
							<li class="question">
								<a href="javascript:" class="accoTit">
									<span class="mark">질문</span>
									<span class="sort">[기업정보]</span>
									<span class="tit">1.크리스찬상조 회원이란 </span>
								</a>
								<div class="accoCon">
									<span class="mark">답변</span>
									<p>당사의 상품에 대한 서비스를 제공받기 위해 매월 일정액의 회비를 불입하는 사람을 말합니다. 
									회원이 매월 일정한 금액을 일정기간 동안 적립함으로서 당사에 행사서비스 제공을 청구할 권리를 갖게 되고 
									당사는 회원의 신청에 따라 행사서비스를 제공합니다.</p>
								</div>
							</li>
							
							<li class="question">
								<a href="javascript:" class="accoTit">
									<span class="mark">질문</span>
									<span class="sort">[이용안내]</span>
									<span class="tit">2. 회원이 되려면 </span>
								</a>
								<div class="accoCon">
									<span class="mark">답변</span>
									<p>회원이 되려면 당사가 정한 회원 가입신청서에 직접 필요사항을 기재, 서명 날인하고 1회 이상의 회비를 납입한 후, 소정의 절차가 완료되면 회원증서 및 약관을 교부해 드립니다. </p>
								</div>
							</li>
							
							<li class="question">
								<a href="javascript:" class="accoTit">
									<span class="mark">질문</span>
									<span class="sort">[이용안내]</span>
									<span class="tit">3. 당사 회원이 되면 어떤 혜택을 받을 수 있나요? </span>
								</a>
								<div class="accoCon">
									<span class="mark">답변</span>
									<p>당사의 회원이 되면 모든 행사에 대하여 사전에 안심하고 준비를 할 수 있으며 
									평소 행사 부분에 대한 궁금한 사항을 언제든지 문의, 상담할 수 있습니다. 
									또한 한 번 가입한 회원은 물가상승에 관계없이 계약한 시점의 상품(웨딩, 돌, 칠순, 장례) 
									그대로 서비스를 제공 받을 수 있습니다. </p>
								</div>
							</li>
							
							<li class="question">
								<a href="javascript:" class="accoTit">
									<span class="mark">질문</span>
									<span class="sort">[이용안내]</span>
									<span class="tit">4. 가입하였는데, 회원증은 어떻게 받을 수 있나요? </span>
								</a>
								<div class="accoCon">
									<span class="mark">답변</span>
									<p>가입하시면 회원증은 1주일 이내 우편으로 발송됩니다.</p>
								</div>
							</li>
							
							<li class="question">
								<a href="javascript:" class="accoTit">
									<span class="mark">질문</span>
									<span class="sort">[이용안내]</span>
									<span class="tit">5. 회비 납부 도중에 행사를 요청할 수 있나요? </span>
								</a>
								<div class="accoCon">
									<span class="mark">답변</span>
									<p>가능합니다. 회비의 납입회수에 관계없이 가입금액 그대로의 행사를 진행해드리며, 
									미납입금액은 행사 종료와 동시에 일괄 납입 후 계약이 종료됩니다. </p>
								</div>
							</li>
														
							<li class="question">
								<a href="javascript:" class="accoTit">
									<span class="mark">질문</span>
									<span class="sort">[이용안내]</span>
									<span class="tit">6. 만기 완납후에는 어떻게 합니까? </span>
								</a>
								<div class="accoCon">
									<span class="mark">답변</span>
									<p>만기 완납 후에도 권리는 계속 보장되며, 추가비용 없이 행사를 언제든지 요청할 수 있습니다.</p>
								</div>
							</li>
							
							<li class="question">
								<a href="javascript:" class="accoTit">
									<span class="mark">질문</span>
									<span class="sort">[이용안내]</span>
									<span class="tit">7. 자동이체(CMS)를 이용하여 회비를 납부하면, 납부확인은?</span>
								</a>
								<div class="accoCon">
									<span class="mark">답변</span>
									<p>통장 계좌에서 회비가 인출되면 통장 적요란에 회사이름과 횟수가 기재됩니다. 
									예를들어 ,[크리012회분]이라고 표기되어있으면, 내용은 크리스찬상조에서 12회차 회비를 인출했다는 뜻입니다.(12월이 아님)</p>
								</div>
							</li>
							
							<li class="question">
								<a href="javascript:" class="accoTit">
									<span class="mark">질문</span>
									<span class="sort">[이용안내]</span>
									<span class="tit">8. 연체가 되었는데 어떻게 하죠? </span>
								</a>
								<div class="accoCon">
									<span class="mark">답변</span>
									<p>회원님께서 개인사정 때문에 연체를 하시는 경우가 있으십니다. 
									연체는 연체 다음달이라도 회비를 납부하시면 별도의 추가 수수료는 없습니다.</p>
								</div>
							</li>
							
							<li class="question">
								<a href="javascript:" class="accoTit">
									<span class="mark">질문</span>
									<span class="sort">[이용안내]</span>
									<span class="tit">9. 회비를 납부한 횟수와 총 금액을 알고 싶습니다. </span>
								</a>
								<div class="accoCon">
									<span class="mark">답변</span>
									<p>회원님께서 가입하신 내역은 전산으로 처리되므로 안심하셔도 됩니다. 
									회원님께서 자동이체(CMS)로 납부하신 회비는 금융결제원을 통하여 안전하게 당사로 입금됩니다. 
									입금 확인 기간은 보통 2~3일 정도 소요됩니다. 
									회원님께서는 회원번호를 알고 계시면(회원증에 표기) 회원님의 회비 납부내역을 

									'고객센터>납부조회' 를 통하여 빠르고 편리하게 찾으실 수 있습니다. 
									또한, 회원님의 편의를 위하여 회비를 완납하신 후 완납 확인을 원하시면, 회비 완납 증명서를 발송하여 드립니다.</p>
								</div>
							</li>
							
							<li class="question">
								<a href="javascript:" class="accoTit">
									<span class="mark">질문</span>
									<span class="sort">[이용안내]</span>
									<span class="tit">10. 회비는 어떻게 납부하면 됩니까? </span>
								</a>
								<div class="accoCon">
									<span class="mark">답변</span>
									<p>회비를 납부하는 방법은 자동이체(CMS)와 무통장입금방법으로 납부하실 수 있습니다. 
									CMS는 자동이체와 같은 방법으로 금융결제원을 통해 회원님 통장에서 직접 회비가 인출되는 방식 입니다. 
									무통장입금은 회원님께서 크리스찬상조 계좌로 입금을 해주시는 방법입니다. 
									무통장입금계좌 : 우리은행 1006-901-284068 예금주: 크리스찬상조㈜ 
									※ 입금하신 후 반드시 본사(1644-4491)로 연락주십시오. </p>
								</div>
							</li>
							
						
					</ul>
				</div>

			</div> <!-- // contents -->


		</div>
	</div> <!-- // contentsWrap -->

<!--#include file="../include/inc_footer.jsp"-->
<%@include file="/WEB-INF/view/include/inc_footer.jsp"%>
