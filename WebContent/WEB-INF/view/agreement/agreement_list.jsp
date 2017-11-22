<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!--#include file="../include/inc_header.jsp"-->
<%@include file="../include/inc_header.jsp"%>
	<div id="contentsWrap">
		<div class="container">
			<div class="conTitWrap">
				<h2>이용약관</h2>
				<div class="location">
					<span class="home">홈</span>
					<span>고객센터</span>
					<strong>이용약관</strong>
				</div>
			</div> <!-- // conTitWrap -->
			<!-- 메뉴 영역 -->
<script type="text/javascript">
	$(function() {
		//메뉴 제어 
		var lnb = $(".pcLnbWrap ul li a");
		var menuId = "MN60600";
		var mbId = "MO60600";
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
							<li><a href="javascript:goMenu('../notice/notice_form.jsp', '');">고객센터</a></li>
						</ul>
					</div>
					<div class="flexItem4"> <!-- .select 버튼 클릭시 다중클래스 on 추가 -->
						<strong><button type="button" class="select" id="subtitle">이용약관</button></strong>
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

			<div id="agreement" class="contents"> <!-- 페이지별 ID none -->
				<h3 class="smallTit">이용약관</h3>

				<!-- 제 1장 총칙 -->
				<article>

					<!--
					<h3 class="smallTit">제 1장 총칙</h3>
					<section>
						<h4 class="blueTit">제1조(목적 등) </h4>
						<p class="txt">아이웨버 테스트 약관</p>
					</section>
					-->

					<section>
						<h4 class="blueTit">제1조(목적 등) </h4>
						<ul class="numList">
							<li>크리스찬상조(주) (www.4christitan.co.kr) 이용자 약관(이하 "본 약관"이라 합니다)은 이용자가 크리스찬상조 주식회사(이하 "크리스찬상조(주)‘이라 합니다)에서 제공하는 인터넷 관련 서비스(이하 "서비스"라 합니다)를 이용함에 있어 이용자와 "크리스찬상조(주)"의 권리, 의무 및 책임사항을 규정함을 목적으로 합니다.</li>
							<li>이용자가 되고자 하는 자가 "크리스찬상조(주)"가 정한 소정의 절차를 거쳐서 "가입하기" 단추를 누르면 본 약관에 동의하는 것으로 간주합니다. 본 약관에 정하는 이외의 이용자와 "크리스찬상조(주)"의 권리, 의무 및 책임사항에 관해서는 대한민국의 관련 법령과 상관습에 의합니다.</li>
						</ul>
					</section>

					<section>
						<h4 class="blueTit">제2조(이용자의 정의) </h4>
						<ul class="numList">
							<li>"이용자"란 "크리스찬상조(주) 웹사이트" 에 접속하여 본 약관에 따라 "크리스찬상조(주)" 웹회원으로 가입하여 "크리스찬상조(주)"가 제공하는 상조회원(본인)정보를 열람할 수 있는 권리를 포함한 기타 권리와 의무가 생성되는 자를 말합니다.</li>
							<li>크리스찬상조(주) 웹사이트의 "이용자"는 크리스찬상조(주) 상품에 가입한 상조회원으로 제한합니다.</li>
						</ul>
					</section>

					<section>
						<h4 class="blueTit">제3조(웹회원 가입)</h4>
						<ul class="numList">
							<li>이용자가 되고자 하는 자는 "크리스찬상조(주)"가 정한 가입 양식에 따라 웹회원정보를 기입하고 "확인" 단추를 누르는 방법으로 웹회원 가입을 신청합니다.</li>
							<li> “크리스찬상조(주)"는 제1항과 같이 웹회원으로 가입할 것을 신청한 자가 다음 각 호에 해당하지 않는 한 신청한 자를 웹회원으로 등록합니다.
								<ul class="roundNumList">
									<li>① 가입신청자가 본 약관 제6조에 의하여 이전에 웹회원자격을 상실한 적이 있는 경우.</li>
									<li>② 등록 내용에 허위, 기재누락, 오기가 있는 경우 (모든 가입신청자는 반드시 실명으로 본인의 이름과 주민번호, 이메일 주소를 제공하여야 하나, 그러하지 아니한 경우)</li>
									<li>③ 쓰기 권한을 주기에 현저히 지장이 있다고 판단되는 경우</li>
									<li>④ 조19세 미만</li>
								</ul>
							</li>
							<li>웹회원가입계약의 성립시기는 가입 양식에 기입한 고객명 및 주민(사업자)번호를 통해 크리스찬상조(주) 상조회원으로 확인되는 시점으로 합니다.</li>
							<li>웹회원은 제1항의 웹회원정보 기재 내용에 변경이 발생한 경우, 즉시 변경사항을 정정하여 기재하여야 합니다. </li>
						</ul>
					</section>

					<section>
						<h4 class="blueTit">제4조(권한의 제공)</h4>
						<ul class="numList">
							<li>"크리스찬상조(주)"는 이용자에게 아래와 같은 서비스를 제공합니다.
								<ul class="roundNumList">
									<li>① 상조회원열람(본인)</li>
									<li>② 이벤트가 있을 시) 이벤트 참여권</li>
									<li>③ 기타 "크리스찬상조(주)"가 향후 개발하거나 다른 회사와의 협력계약 등을 통해 웹회원들에게 제공할 일체의 서비스 등</li>
								</ul>
							</li>
							<li>웹회원가입계약의 성립시기는 가입 양식에 기입한 고객명 및 주민(사업자)번호를 통해 크리스찬상조(주) 상조회원으로 확인되는 시점으로 합니다.</li>
							<li>웹회원은 제1항의 웹회원정보 기재 내용에 변경이 발생한 경우, 즉시 변경사항을 정정하여 기재하여야 합니다. </li>
						</ul>
					</section>

					<section>
						<h4 class="blueTit">제5조(서비스의 중단)  </h4>
						<ul class="numList">
							<li>"크리스찬상조(주)"는 컴퓨터 등 정보통신설비의 보수점검, 교체 및 고장, 통신의 두절 등의 사유가 발생한 경우에는 서비스의 제공을 일시적으로 중단할 수 있고, 새로운 서비스로의 교체 기타 "크리스찬상조(주)"가 적절하다고 판단하는 사유에 기하여 현재 제공되는 서비스를 완전히 중단할 수 있습니다.</li>
							<li>제1항에 의한 서비스 중단의 경우에는 "크리스찬상조(주)"는 제7조 제2항에서 정한 방법으로 이용자에게 통지합니다. 다만, "크리스찬상조(주)"가 통제할 수 없는 사유로 인한 서비스의 중단(시스템 관리자의 고의, 과실이 없는 디스크 장애, 시스템 다운 등)으로 인하여 사전 통지가 불가능한 경우에는 그러하지 아니합니다. </li>
						</ul>
					</section>

					<section>
						<h4 class="blueTit">제6조(이용자 탈퇴 및 자격 상실 등) </h4>
						<ul class="numList">
							<li>이용자는 "크리스찬상조(주)"에 언제든지 자신의 웹회원 등록을 말소해 줄 것(이용자 탈퇴)을 요청할 수 있으며 위 요청을 받은 즉시 해당 이용자의 웹회원 등록 말소를 위한 절차를 밟습니다.</li>
							<li>이용자가 다음 각 호의 사유에 해당하는 경우, "크리스찬상조(주)"는 이용자의 웹회원자격을 적절한 방법으로 제한 및 정지, 상실시킬 수 있습니다.
								<ul class="roundNumList">
									<li>① 다른 사람의 "서비스" 이용을 방해하거나 그 정보를 도용하는 등 전자거래질서를 위협하는 경우</li>
									<li>② "서비스"를 이용하여 법령과 본 약관이 금지하거나 공서양속에 반하는 행위를 하는 경우 </li>
									<li>③ 욕설 기타 욕설에 준하는 표현을 쓸 경우 1회 경고 , 재차 그런 표현을 쓸 경우에는 무조건 등록 말소</li>
								</ul>
							</li>
							
							<li>"크리스찬상조(주)"가 이용자의 웹회원자격을 상실시키기로 결정한 경우에는 웹회원등록을 말소합니다. 이 경우 이용자인 웹회원에게 웹회원등록 말소 전에 이를 통지하지만 해명의 기회는 주지않습니다.</li>
						</ul>
					</section>

					<section>
						<h4 class="blueTit">제7조(이용자의 개인정보보호) </h4>
						<ul class="numList">
							<li>"크리스찬상조(주)"는 관련법령이 정하는 바에 따라서 이용자 등록정보를 포함한 이용자의 개인정보를 보호하기 위하여 노력합니다. 이용자의 개인정보보호에 관해서는 관련법령 및 "크리스찬상조(주)"가 정하는 "개인정보보호정책"에 정한 바에 의합니다. </li>
						</ul>
					</section>

					<section>
						<h4 class="blueTit">제8조("크리스찬상조(주)"의 의무)  </h4>
						<ul class="numList">
							<li>"크리스찬상조(주)"는 법령과 본 약관이 금지하거나 공서양속에 반하는 행위를 하지 않으며 본 약관이 정하는 바에 따라 지속적이고, 안정적으로 서비스를 제공하기 위해서 노력합니다. </li>
							<li> "크리스찬상조(주)"는 이용자가 안전하게 인터넷 서비스를 이용할 수 있도록 이용자의 개인정보(신용정보 포함)보호를 위한 보안 시스템을 구축합니다.</li>
							<li>"크리스찬상조(주)“는 이용자가 원하지 않는 영리목적의 광고성 전자우편을 발송하지 않습니다. 
							단,웹회원에 대한 공식적 통지는 크리스찬상조(주)에 제출한 전자 우편주소로 할 수 있습니다. </li>
						</ul>
					</section>

					<section>
						<h4 class="blueTit">제9조(이용자의 ID 및 비밀번호에 대한 의무)</h4>
						<ul class="numList">
							<li> "크리스찬상조(주)"가 관계법령, "개인정보보호정책"에 의해서 그 책임을 지는 경우를 제외하고, 자신의 ID와 비밀번호에 관한 관리책임은 각 이용자에게 있습니다.as ② 이용자는 자신의 ID 및 비밀번호를 제3자에게 이용하게 해서는 안됩니다.</li>
							<li>이용자는 자신의 ID 및 비밀번호를 제3자에게 이용하게 해서는 안됩니다.</li>
							<li>이용자는 자신의 ID 및 비밀번호를 도난당하거나 제3자가 사용하고 있음을 인지한 경우에는 바로 "크리스찬상조(주)"에 통보하고 "크리스찬상조(주)"의 안내가 있는 경우에는 그에 따라야 합니다. </li>
						</ul>
					</section>

					<section>
						<h4 class="blueTit">제10조(이용자의 의무) </h4>
						<ul class="numList">
							<li>이용자는 다음 각 호의 행위를 하여서는 안됩니다.
								<ul class="roundNumList">
									<li>① 웹회원가입신청 또는 변경시 허위내용을 등록하는 행위</li>
									<li>② "크리스찬상조(주)"에 게시된 정보를 변경하는 행위</li>
									<li>③  "크리스찬상조(주)" 기타 제3자의 인격권 또는 지적재산권을 침해하거나 업무를 방해하는 행위</li>
									<li>④ 다른 웹회원의 ID를 도용하는 행위 </li>
									<li>⑤ 정크메일(junk mail), 스팸메일(spam mail), 행운의 편지(chain letters), 피라미드 조직에 가입할 것을 권유하는 메일, 외설 또는 폭력적인 메시지, 화상, 음성 등이 담긴 메일을 보내거나 기타 공서양속에 반하는 정보를 공개 또는게시하는 행위. </li>
									<li>⑥ 관련 법령에 의하여 그 전송 또는 게시가 금지되는 정보(컴퓨터 프로그램 등)의 전송 또는 게시하는 행위</li>
									<li>⑦ 크리스찬상조(주)의 관리자를 가장하거나 사칭하여 또는 타인의 명의를 모용하여 글을 게시하거나 메일을 발송하는 행위</li>
									<li>⑧ 컴퓨터 소프트웨어, 하드웨어, 전기통신 장비의 정상적인 가동을 방해, 파괴할 목적으로 고안된 소프트웨어 바이러스, 기타 다른 컴퓨터 코드, 파일, 프로그램을 포함하고 있는 자료를 게시하거나 전자우편으로 발송하는 행위</li>
									<li>⑨ 스토킹(stalking) 등 다른 이용자를 괴롭히는 행위</li>
									<li>⑩ 다른 이용자에 대한 개인정보를 그 동의 없이 수집,저장,공개하는 행위</li>
									<li>⑪ 불특정 다수의 자를 대상으로 하여 광고 또는 선전을 게시하거나 스팸메일을 전송하는 등의 방법으로 "크리스찬상조(주)"의 서비스를 이용하여 영리목적의 활동을 하는 행위</li>
									<li>⑫ "크리스찬상조(주)"가 제공하는 서비스에 정한 약관 기타 서비스 이용에 관한 규정을 위반하는 행위</li>
								</ul>
							</li>
							<li>제1항에 해당하는 행위를 한 이용자가 있을 경우 "크리스찬상조(주)"는 본 약관 제6조 제2, 3항에서 정한 바에 따라 이용자의 웹회원자격을 적절한 방법으로 제한 및 정지, 상실시킬 수 있습니다.</li>
							<li>이용자는 그 귀책사유로 인하여 "크리스찬상조(주)"나 다른 이용자가 입은 손해를 배상할 책임이 있습니다.</li>
						</ul>
					</section>

					<section>
						<h4 class="blueTit">제11조(공개게시물의 삭제)  </h4>
						<ul class="numList">
							<li>이용자의 공개게시물의 내용이 다음 각 호에 해당하는 경우 "크리스찬상조(주)"는 이용자에게 사전 통지 없이 해당 공개게시물을 삭제할 수 있고, 해당 이용자의 웹회원 자격을 제한, 정지 또는 상실시킬 수 있습니다. 
								<ul class="roundNumList">
									<li>① 다른 이용자 또는 제3자를 비방하거나 중상 모략으로 명예를 손상시키는 내용</li>
									<li>② 공서양속에 위반되는 내용의 정보, 문장, 도형 등을 유포하는 내용</li>
									<li>③ 범죄행위와 관련이 있다고 판단되는 내용</li>
									<li>④ 다른 이용자 또는 제3자의 저작권 등 기타 권리를 침해하는 내용</li>
									<li>⑤ 기타 관계 법령에 위배된다고 판단되는 내용 </li>
								</ul>
							</li>
						</ul>
					</section>

					<section>
						<h4 class="blueTit">제12조(저작권의 귀속 및 이용제한)</h4>
						<ul class="numList">
							<li>"크리스찬상조(주)"가 작성한 저작물에 대한 저작권 기타 지적재산권은 "크리스찬상조(주)"에 귀속합니다. </li>
						</ul>
					</section>

					<section>
						<h4 class="blueTit">제13조(약관의 개정) </h4>
						<ul class="numList">
							<li>"크리스찬상조(주)"는 정보통신망이용촉진등에관한법률 등 관련법을 위배하지 않는 범위에서 본 약관을 개정할 수 있습니다. </li>
						</ul>
					</section>

					<section>
						<h4 class="blueTit">제14조(재판관할) </h4>
						<ul class="numList">
							<li>"크리스찬상조(주)"와 이용자간에 발생한 서비스 이용에 관한 분쟁에 대하여는 대한민국 법을 적용하며, 본 분쟁으로 인한 소는 민사소송법상의 관할을 가지는 대한민국의 법원에 제기합니다. </li>
						</ul>
					</section>

					<section>
						<h4 class="blueTit">부 칙</h4>
						<p class="txt">본 약관은 2005년 04월 01일부터 시행합니다.</p>
					</section>

				</article>
				<!-- // 제 1장 총칙 -->


			</div> <!-- // contents -->


		</div>
	</div> <!-- // contentsWrap -->
<%@include file="../include/inc_footer.jsp"%>
<!--#include file="../include/inc_footer.jsp"-->