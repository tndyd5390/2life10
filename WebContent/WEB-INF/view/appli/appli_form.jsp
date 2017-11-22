<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!--#include file="../include/inc_header.jsp"-->
<%@include file="../include/inc_header.jsp"%>
<!--#include file="../include/inc_header.jsp"-->

	<div id="contentsWrap">
		<div class="container">
			<div class="conTitWrap">
				<h2>가입신청</h2>
				<div class="location">
					<span class="home">홈</span>
					<span>고객센터</span>
					<strong>가입신청</strong>
				</div>
			</div> <!-- // conTitWrap -->
			<!-- 메뉴 영역 -->
			



<script type="text/javascript">
	$(function() {
		//메뉴 제어 
		var lnb = $(".pcLnbWrap ul li a");
		var menuId = "MN60800";
		var mbId = "MO60800";
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
						<strong><button type="button" class="select" id="subtitle">상조관련법규</button></strong>
						<ul>
							<li id="MO60100"><a href="javascript:goMenu('../notice/notice_list.jsp', 'MO60100');">공지사항</a></li>
                            <li id="MO60200"><a href="javascript:goMenu('../qna/qna_list.jsp', 'MO60200');">자주하는질문</a></li>
                            <li id="MO60300"><a href="javascript:goMenu('../counsel/counsel_list.jsp', 'MO60300');">1:1상담</a></li>
                            <li id="MO60400"><a href="javascript:goMenu('../infomation/infomation_a.jsp', 'MO60400');">주요정보고시사항</a></li>
                            <li id="MO60500"><a href="javascript:goMenu('../regulation/regulation_list.jsp', 'MO60500');">상조관련법규</a></li>
                            <li id="MO60600"><a href="javascript:goMenu('../agreement/agreement_list.jsp', 'MO60600');">이용약관</a></li>
                            <li id="MO60700"><a href="javascript:goMenu('../inquiry/inquiry_list.jsp', 'MO60700');">납부조회</a></li>
                            <li id="MO60800"><a href="javascript:goMenu('../appli/appli_list.jsp', 'MO60800');">가입신청</a></li>
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

			<div id="agreebox" class="contents"> <!-- 페이지별 ID none -->

				<div class="businessIntro">
					<h3 class="subTit">가입신청</h3>
				</div>

				<h3 class="smallTit">
				    부금약관
				    <div class="common_checkbox">
				        <input type="checkbox" id="agree" class="inp_checkbox"><label class="inp_label" for="agree">동의합니다.</label>
                    </div>
				</h3>

				<article class="wrap">

					<section>
						<h4 class="blueTit">제1조(목적 등) </h4>
						<ul class="numList">
							<li>이 계약은 크리스찬상조(주)(이하“회사”라 한다)의 회원으로 가입한 사람이 매월 일정액의 납부의무를 지고 회사는 가정의례 발생 시 약정된 물품과 서비스(이하 ‘상조서비스'라 한다)를 	제공하는 의무를 지는 것을 목적으로 하며 금전이나 금리의 지급을 대상으로 하지 않는다.</li>
						</ul>
					</section>

					<section>
						<h4 class="blueTit">제2조(회원의  가입)</h4>
						<ul class="numList">
							<li>회사로부터 상조서비스를  제공받을 수 있는 회원으로 가입하고자 하는 사람은 회원 가입신청서에 필요한 사항을 기재하고 기명날인 또는 서명한 후 이를 회사에 제출하여야 하며, 가입자는 가입과 동시에 가입상품에 따른 1회 이상의 납입금을 납부 하여야 한다. 이는 전자거래 또는 통신매체를 통하여 가입하는 경우에도 마찬가지이며 기명날인 및 서명은 녹취록으로 대체할 수 있다.</li>
							<li>회사는 가입하고자 하는 사람이 가입하기 전 약관을 교부하고 약관의 중요한 내용을 설명하여야 하며, 직접 또는 모집인을 통하여 가입자가 납입한 납입금의 영수증을 발급하여야 한다.</li>
							<li>가입절차를 완료한 회원에 대하여 회사는 지체 없이 회원 증서를 교부한다.</li>
							<li>회원이 회원 증서를 분실하여 회사에 재교부를 신청한 때에는 회사는 회원 증서를 재발행 하여 교부하고 실비수준의 수수료 5,000원을 받을 수 있으며, 이 경우 이미 교부된 회원증 서는  무효가 된다.</li>
						</ul>
					</section>

					<section>
						<h4 class="blueTit">제3조(단체회원의  가입)</h4>
						<ul class="numList">
							<li>제2조는 법인 기타 단체의 명의로 복수의 인원이 집단으로 가입할 경우에도 준용한다.</li>
							<li>단체의 구성원 중 상조서비스 대상이 되는 회원에 대한 개별적인 가입이 힘들거나, 개별적  인 회원 자격을 인정할 필요가 없을 때에는 회사는 해당 단체의 구성원에게 포괄적인 회원 자격을 인정할 수도 있다.</li>
							<li>포괄적인 회원자격은 소속단체별로 가입구좌수에 따른 상조서비스를 이용할 수 있음을 의미하며, 선택권은  소속단체 대표가 행사한다.</li>
						</ul>
					</section>

					<section>
						<h4 class="blueTit">제4조(철회권의  행사)</h4>
						<ul class="numList">
							<li>직접 회사를 방문하여 회원에  가입하지 않고 모집인을 통하여 회원에 가입하거나, 전자거 래 또는 통신매체를 이용하여 가입한 경우 회원은  약관을 받은 날부터 14일 이내에 계약철 회권을 행사할 수 있다. 단, 약관 및 회원 증서를 교부받지 못하였을 경우에는 계약일로부 터 3개월  이내에 계약철회권을 행사할 수 있다.</li>
							<li>제 1항의 회원가입계약에 대한 철회의 의사표시를 서면으로 하는 경우에는 서면을 발송한  날에 그 효력이 발생한다.</li>
							<li>제1항과 제2항에 따라 계약을 철회한 회원에  대하여 회사는 납입금을 철회일로부터 3영업 일 이내에 반환하며, 회원은  상조서비스를 이용할 수 있는 자격을 상실한다. 단, 회사가 3영 업일 내에 반환하지 않을 경우에는 납입금에 대해 연24%의 지연이자를  지급한다.</li>
						</ul>
					</section>

					<section>
						<h4 class="blueTit">제5조(회원의  월납입금 납부의무)</h4>
						<ul class="numList">
							<li>회원은 이 계약에 따라  가입 시에 정한 월납입금을 매월 약정한 기일에 납부하여야 한다. </li>
							<li>제 1항의 회원가입계약에 대한 철회의 의사표시를 서면으로 하는 경우에는 서면을 발송한  날에 그 효력이 발생한다.</li>
							<li>가입상품에 따른 월납입금, 납입회수는 다음과 같다.
								<br/><br/>	
								<div class="tableBasicList">
									<table class="defaultTable">
										<caption></caption>
										<colgroup>
											<col style="width:auto%;">
											<col style="width:24%;">
											<col style="width:24%;">
											<col style="width:20%;">
										</colgroup>
										<head>
											<tr>
												<th scope="row">상품명</th>
												<th scope="row">상품금액</th>
												<th scope="row">월납입금</th>
												<th scope="row">납입횟수</th>
											</tr>
										</head>
										<tbody>
											<tr>
												<td>260상품</td>
												<td>2,600,000원</td>
												<td>26,000원</td>
												<td>100회</td>
											</tr>
											<tr>
												<td>390상품</td>
												<td>3,900,000원</td>
												<td>30,000원</td>
												<td>130회</td>
											</tr>
											<tr>
												<td>480상품</td>
												<td>4,800,000원</td>
												<td>40,000원</td>
												<td>120회</td>
											</tr>
											<tr>
												<td>프라임상품</td>
												<td>3,500,000원</td>
												<td>35,000원</td>
												<td>100회</td>
											</tr>
										</tbody>
									</table>
								</div>
							</li>
							<li>회원은 원칙적으로 은행지로  또는 계좌이체를 통하여 월납입금을 납부하며, 모집인을 통하 거나 직접 회사에 납부할 수 있다.</li>
							<li>회사의 월납입금 납부 증빙내역에 이의가 있는 회원은 영수증을 첨부하여 잘못된 내역의 정정을 요구할 수 있다.</li>
							<li>제3항에 따라 회원이 모집인을 통하거나 직접 회사에 월납입금을 납부할 경우 회사는 영수  증을 발행하며, 제4항의 영수증은 은행지로 또는 계좌이체를  통하여 납부한 경우 지로영수 증, 거래원장, 입금확인서도  그에 갈음할 수 있다.</li>
							<li>회원은 언제든지 회사의 월납입금납부증빙내역에 대해 확인을 요구할 수 있다.</li>
						</ul>
					</section>

					<section>
						<h4 class="blueTit">제6조(선납할인  및 모집수당 할인)</h4>
						<ul class="numList">
							<li>회원이 납입금의 전부 또는  일부를 선납할 경우, 회사는 미리 약정한 비율로 총납입금을 할 인 할 수 있다.</li>
							<li>회원이 모집인을 통하지 않고 전자거래 등 회사와 직접 거래함으로써 모집수당이 절약될 경우 회사는 미리 약정한 비율로 총납입금을  할인 할 수 있다.</li>
						</ul>
					</section>

					<section>
						<h4 class="blueTit">제7조(비용의  추가부담) - 삭제(적용되지않음)</h4>
						<ul class="numList">
							<li>회사는 회원이 가입 후 아래 기간 이내에 상조서비스를 제공할 경우에는 기재된 비용을 추가 로 받을  수 있다.</li>
						</ul>
					</section>

					<section>
						<h4 class="blueTit">제8조(잔여  납부금의 납부)</h4>
						<ul class="numList">
							<li>회원이 월부금의 완납이전에 상조서비스를 제공받을 때에는 사후에 잔여납부금을 일시에 납 부하여야 한다.</li>
						</ul>
					</section>

					<section>
						<h4 class="blueTit">제9조(주소변경  통보의무)</h4>
						<ul class="numList">
							<li>회원이 주소 및 연락처가  변경된 경우에는 회원은 15일 이내에 회사로 이를 통보하여야 한다.</li>
							<li>회원이 주소 및 연락처의 변경을 통보하지 않은 경우에는 회사는 종전에 신고 된 주소 및 연락처로 통지함으로써 통지의무를 면하게  된다.</li>
						</ul>
					</section>

					<section>
						<h4 class="blueTit">제10조(상조서비스의  이용)</h4>
						<ul class="numList">
							<li>회원본인과 배우자, 회원 및 그 배우자의 직계존속, 회원의 직계 비속은 상조 서비스를  이 용할 권리를 갖는다.</li>
							<li>회원은 계약체결 시 상조서비스의 이용자와 상조서비스의 내용을 미리 정할 수 있으며, 이  경우 회사의 동의를 얻어 변경할 수 있다.</li>
							<li>회원은 계약체결 후 가입 상품금액보다 많은 상품금액의 상조서비스를 이용하고자 할 경우 에는 이용에 앞서 회사와 협의하여 추가비용을  결정하고 변경할 수 있다. </li>
							<li>상조서비스는 원칙적으로 1구좌당 1회에 한한다. 단, 회사가 납입금 범위 내에서 상품금액 이 적은 상조서비스를 2회 이상 이용할 수 있게 하는 경우에는 예외로 한다.</li>
						</ul>
					</section>

					<section>
						<h4 class="blueTit">제11조(단체계약과  상조서비스)</h4>
						<ul class="numList">
							<li>법인 또는 단체의 대표가  구성원들을 위하여 상조서비스 이용계약을 체결한 경우, 그 단체 의 구성원들은 가입된 구좌수 만큼 상조서비스를  이용 할 수 있다.</li>
							<li>구성원에게 이용권 및 이용서비스를 부여하는 것은 계약에서 합의된 내용에 따라 소속단체 장 대표가 결정한다.</li>
						</ul>
					</section>

					<section>
						<h4 class="blueTit">제12조(상조서비스의  제공지역)</h4>
						<ul class="numList">
							<li>회사가 제공하는 상조서비스는  계약 시에 예정된 지역에서 제공함을 원칙으로 하며, 회사의 사정으로 서비스 제공지역을 변경하고자 하는  경우에는 적용일을 명시하여 변경지역과 그 적용일로부터 2월 전에 해당지역 회원에게 통지하여야 한다.(단, 도서지역을 제외한 국내 전 지역에 서비스 제공)</li>
							<li>이사등 회원의 사정으로 상조서비스가 제공되어야 할 지역에 변경이 생긴 경우에는 회사는 이에 협력하여야 한다.</li>
							<li>회사가 서비스 지역을 변경함으로써 상조서비스를 제공받을 수 없게 된 회원은 계약을 해지 할 수 있다. 이 경우 회사는 회원의 신청일로부터 10일 이내에 회원이 납부한  납입금 전액과 납입금에 대하여 각각 그 받은 날부터 신청일 까지 상사법정이율(연6%)을 가산하여 반환하 며, 지연 시 제14조 제1항에 따른 지연이자를 지급하여야 한다.</li>
						</ul>
					</section>

					<section>
						<h4 class="blueTit">13조(상조서비스의  내용)</h4>
						<ul class="numList">
							<li>상조서비스는 계약 시에  상품별로 확정한 내용대로 제공되어야 한다. 단, 회사는 확정된  물 품 중 시간의 경과로 인한 단종, 품절 등 대상품목의 물품을 제공할 수 없는 경우에는 계약 시의  확정된 물품과 실질적으로 동등한 물품으로 대체할 수 있다.</li>
							<li>제1항의 회사가 제공하는 상품별 상조서비스의 내용은 회원증서에 명시하여 교부한다. </li>
						</ul>
					</section>

					<section>
						<h4 class="blueTit">제14조(회원의  채무불이행 효과)</h4>
						<ul class="numList">
							<li>회원이 정당한 사유 없이  월납입금의 납부를 지연한 경우에는 그 지연일수에 0.05%의 지연 이자율을 적용한 지연이자를 지급하여야  한다. 단, 지연이자율은 연24%를 초과할 수 없다.</li>
							<li>회원이 3회 이상 월납입금의 납부를 연체한 경우 회사는 서면으로 월납입금의 납부를 최고  하고, 회원이 최고의 통지를 받은 날부터 14일 이내에 연체된  월 납입금을 납부 하지 않을 경우에 회사는 계약을 해지할 수 있다.</li>
							<li>제2항에 따라 계약이 해지된 경우 회원은 제15조 2항에 따라 해약 환급금을 청구 할 수 있다.</li>
							<li>제3항의 규정에 의한 해약환급금은 회원이 계약의 해지통지를 받은 날부터 5년 이내에 청구 하여야 한다.</li>
						</ul>
					</section>
				
				</article>
				<br/>
				<ul class="radioArea">
					<li><input type="radio" id="agree1" name="agree" value="Y"> <label for="agree1">동의</label></li>
					<li><input type="radio" id="agree2" name="agree" value="N"> <label for="agree2">동의하지 않음</label></li>
				</ul>

				<br/><br/>
				<h3 class="smallTit">가입상품선택</h3>
				<form id="frm" method="post">
                    <div class="boardType2">
                        <table summary="">
                            <caption>회원가입</caption>
                            <colgroup>
                                <col width="20%">
                                <col width="80%">
                            </colgroup>
                            <tbody>
                                <tr>
                                    <th scope="row">상품선택</th>
                                    <td>
                                        <input type="radio" id="agree1" name="agree" value="Y"> <label for="agree1">260상품</label>
										<input type="radio" id="agree1" name="agree" value="Y"> <label for="agree1">390상품</label>
										<input type="radio" id="agree1" name="agree" value="Y"> <label for="agree1">480상품</label>
										<input type="radio" id="agree1" name="agree" value="Y"> <label for="agree1">프라임(350)상품</label>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row">계약구좌</th>
                                    <td>
                                        <input type="radio" id="agree1" name="agree" value="Y"> <label for="agree1">1구좌</label>
										<input type="radio" id="agree1" name="agree" value="Y"> <label for="agree1">2구좌</label>
										<input type="radio" id="agree1" name="agree" value="Y"> <label for="agree1">3구좌</label>
										<input type="radio" id="agree1" name="agree" value="Y"> <label for="agree1">4구좌</label>
										<input type="radio" id="agree1" name="agree" value="Y"> <label for="agree1">5구좌</label>
                                    </td>
                                </tr>
							</tbody>
                        </table>
                    </div>

					<br/><br/>
					<h3 class="smallTit">가입자정보입력</h3>
					<div class="boardType2">
						<table summary="">
							<caption>회원가입</caption>
							<colgroup>
								<col width="20%">
								<col width="80%">
							</colgroup>
							<tbody>
								<tr>
									<th scope="row">가입자명</th>
									<td>
										<input type="text" name="name" value="" title="이름" class="inputType1" style="" maxlength="25">
									</td>
								</tr>
								<tr>
									<th scope="row">자택전화</th>
									<td>
										<select id="telAbleEndTime" name="telAbleEndTime" title="" class="inputType3">
                                            <option value="00">02</option>
                                            <option value="01">031</option>
                                        </select>
										-
										<input type="text" name="name" value="" title="이름" class="inputType2" style="" maxlength="5">
										-
										<input type="text" name="name" value="" title="이름" class="inputType2" style="" maxlength="5">
									</td>
								</tr>
								<tr>
									<th scope="row">휴대전화</th>
									<td>
										<select id="telAbleEndTime" name="telAbleEndTime" title="" class="inputType3">
                                            <option value="00">010</option>
                                            <option value="01">011</option>
                                        </select>
										-
										<input type="text" name="name" value="" title="이름" class="inputType2" style="" maxlength="5">
										-
										<input type="text" name="name" value="" title="이름" class="inputType2" style="" maxlength="5">
									</td>
								</tr>
								<tr>
									<th scope="row" rowspan="2">주소</th>
									<td>
										<input type="text" name="name" value="" title="이름" class="inputType2" style="" maxlength="5">
										-
										<input type="text" name="name" value="" title="이름" class="inputType2" style="" maxlength="5">
										<a href="#" class="btn_active_small">우편번호</a>
									</td>
								</tr>
								<tr>
									<td>
										<input type="text" name="name" value="" title="이름" class="inputType5" style="" maxlength="5">
										나머지주소
									</td>
								</tr>
								<tr>
									<th scope="row">가입유형</th>
									<td>
										<select id="telAbleEndTime" name="telAbleEndTime" title="" class="inputType3">
                                            <option value="00">TV광고</option>
                                            <option value="01">영업사원</option>
                                        </select>
									</td>
								</tr>
							</tbody>
						</table>
					</div>

					<br/><br/>
					<h3 class="smallTit">CMS신청</h3>
					<div class="boardType2">
						<table summary="">
							<caption>회원가입</caption>
							<colgroup>
								<col width="20%">
								<col width="80%">
							</colgroup>
							<tbody>
								<tr>
									<th scope="row">예금계좌</th>
									<td>
										<input type="radio" id="agree1" name="agree" value="Y"> <label for="agree1">본인계좌</label>
										<input type="radio" id="agree1" name="agree" value="Y"> <label for="agree1">타인계좌</label>
									</td>
								</tr>
								<tr>
									<th scope="row">예금주</th>
									<td>
										<input type="text" name="name" value="" title="이름" class="inputType2" style="" maxlength="5">
									</td>
								</tr>
								<tr>
									<th scope="row">은행명</th>
									<td>
										<select id="telAbleEndTime" name="telAbleEndTime" title="" class="inputType3">
                                            <option value="00">은행명</option>
                                            <option value="01">국민은행</option>
                                        </select>
									</td>
								</tr>
								<tr>
									<th scope="row">계좌번호</th>
									<td>
										<input type="text" name="name" value="" title="이름" class="inputType5" style="" maxlength="5">
									</td>
								</tr>
								<tr>
									<th scope="row">이체일자</th>
									<td>
										<input type="radio" id="agree1" name="agree" value="Y"> <label for="agree1">5일</label>
										<input type="radio" id="agree1" name="agree" value="Y"> <label for="agree1">10일</label>
										<input type="radio" id="agree1" name="agree" value="Y"> <label for="agree1">15일</label>
										<input type="radio" id="agree1" name="agree" value="Y"> <label for="agree1">20일</label>
										<input type="radio" id="agree1" name="agree" value="Y"> <label for="agree1">25일</label>
									</td>
								</tr>
							</tbody>
						</table>
					</div>


                    <div class="btn_area">
                        <a href="#" id="submitLink" class="btn_active">가입신청</a>
                        <a href="#" id="btnCancel" class="btn_cancel">취소</a>
                    </div>
                </form>
			</div> <!-- // contents -->


		</div>
	</div> <!-- // contentsWrap -->

<%@include file="../include/inc_footer.jsp"%>
