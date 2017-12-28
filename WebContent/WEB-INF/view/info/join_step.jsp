<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/view/include/inc_header.jsp"%>
<!--#include file="../include/inc_header.jsp"-->

	<div id="contentsWrap">
		<div class="container">
			<div class="conTitWrap">
				<h2>가입절차</h2>
				<div class="location">
					<span class="home">홈</span>
					<span>상품안내</span>
					<strong>가입절차</strong>
				</div>
			</div> <!-- // conTitWrap -->
			<!-- 메뉴 영역 -->
			



<script type="text/javascript">
	$(function() {
		//메뉴 제어 
		var lnb = $(".pcLnbWrap ul li a");
		var menuId = "MN20200";
		var mbId = "MO20200";
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
                        <strong><button type="button" class="select">상조상품안내</button></strong>
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
                        <strong><button type="button" class="select" id="subtitle">가입절차</button></strong>
                        <ul>
                            <li id="MO20100"><a href="javascript:goMenu('/info/proInfo.do', 'MO20100');">상조상품특징</a></li>
                            <li id="MO20200"><a href="javascript:goMenu('/info/joinStep.do', 'MO20200');">가입절차</a></li>
                            <li id="MO20300"><a href="javascript:goMenu('/info/catalogue.do', 'MO20300');">웹카다로그</a></li>
                            <li id="MO20400"><a href="javascript:goMenu('/info/endPro.do', 'MO20400');">단종상품안내</a></li>
                        </ul>
                    </div>

                </nav>
            </div> <!-- // moLnbWrap -->

            <div class="pcLnbWrap">
                <nav>
                    <ul class="pcLnb">
                            <li id="MN20100"><a href="javascript:goMenu('/info/proInfo.do', 'MO20100');">상조상품특징</a></li>
                            <li id="MN20200"><a href="javascript:goMenu('/info/joinStep.do', 'MO20200');">가입절차</a></li>
                            <li id="MN20300"><a href="javascript:goMenu('/info/catalogue.do', 'MO20300');">웹카다로그</a></li>
                            <li id="MN20400"><a href="javascript:goMenu('/info/endPro.do', 'MO20400');">단종상품안내</a></li>
                    </ul>
                </nav>
            </div> <!-- // pcLnbWrap -->

			<!-- 메뉴 영역 -->

			<div id="" class="contents"> <!-- 페이지별 ID -->
				<div class="businessIntro">
					<h3 class="subTit">크리스찬상조 상품가입안내</h3>
				</div>
	
				<div class="businessUnit">
					<li class="unitTit">
						<div class="imgWrap">
							<p class="moImg"><img src="/public/img/conts/img_joinstep_mo01.png" alt="디자인플라자" /></p>
							<p class="pcImg"><img src="/public/img/conts/img_joinstep_pc01.png" alt="디자인플라자" /></p>
						</div>
						<div class="txtWrap">
							<strong>1644-4491</strong>
							<p>가입문의 및 상담</p>
						</div>
					</li>
				</div>
				<br/><br/>

				<div class="businessIntro">
					<h3 class="subTit">크리스찬상조 부금안내</h3>
				</div>
				<ul class="defaultGrayDotList mt-10">
					<li>불입횟수에 따라 불입금액을 선택하실 수 있습니다.</li>
					<li>금융결제원을 통한 CMS자동이체로 안전한 결제방법을 사용합니다.</li>
				</ul>
				<br/>
				<div class="tableBasicList">
					<table class="defaultTable">
						<caption>사업부문 별 SNS모음</caption>
						<colgroup>
							<col style="width:auto%;">
							<col style="width:16%;">
							<col style="width:24%;">
							<col style="width:20%;">
							<col style="width:15%;">
						</colgroup>
						<thead>
							<tr>
								<th scope="row" rowspan="2">계약및금액</th>
								<th scope="row" colspan="2">월부금액 및 불입횟수</th>
								<th scope="row" rowspan="2">불입방법</th>
								<th scope="row" rowspan="2" class="noline">제공행사</th>
							</tr>
							<tr>
								<th scope="row">단기납부</th>
								<th scope="row">장기납부</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>프라임(3,500,000원)</td>
								<td>-</td>
								<td>35,000원 x 100회</td>
								<td>자동이체</td>
								<td>장례</td>
							</tr>
							<tr>
								<td>260상품(2.600,000원)</td>
								<td>-</td>
								<td>26,000원 x 100회</td>
								<td>자동이체</td>
								<td>장례</td>
							</tr>
							<tr>
								<td>390상품(3.900,000원)</td>
								<td>-</td>
								<td>30,000원 x 130회</td>
								<td>자동이체</td>
								<td>장례</td>
							</tr>
							<tr>
								<td>480상품(4,800,000원)</td>
								<td>-</td>
								<td>40,000원 x 120회</td>
								<td>자동이체</td>
								<td>장례</td>
							</tr>
						</tbody>
					</table>
				</div>
				<p class="txt2">※ 크리스찬상조(주)는 공정거래위원회 표준약관을 시행하고 있습니다.</p>
				<br/><br/>
				<div class="businessIntro">
					<h3 class="subTit">행사발생시 제공서비스</h3>
				</div>
				
				<div class="businessUnit">
					<li class="unitTit">
						<div class="imgWrap">
							<p class="moImg"><img src="/public/img/conts/img_joinstep_mo02.png" alt="행사발생시 제공서비스" /></p>
							<p class="pcImg"><img src="/public/img/conts/img_joinstep_pc02.png" alt="행사발생시 제공서비스" /></p>
						</div>
					</li>
				</div>
				<br/><br/>

				<div class="tableBasicList">
					<table class="defaultTable">
						<caption>사업부문 별 SNS모음</caption>
						<colgroup>
							<col style="width:15%;">
							<col style="width:auto%;">
						</colgroup>
						<thead>
							<tr>
								<th scope="row">일정</th>
								<th scope="row">장례행사진행안내(24시간 대기)</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>임종전</td>
								<td class="alignL">1644-4491(고객센타)로 전화하셔서 행사장소,장례절차,사용상품 등 행사 전반에 대한 사전 상담을 받으시면 행사발생시 당황하지 않고 장례를 치를 수 있습니다.</td>
							</tr>
							<tr>
								<td>임종일</td>
								<td class="alignL">임종확인 > 사망확인 후 즉시 전화로 행사접수(1644-4491) > 장례지도사파견 > 제단장식, 상복제공, 도우미파견 </td>
							</tr>
							<tr>
								<td>2일차</td>
								<td class="alignL">입관(장례지도사2명진행) > 도우미파견</td>
							</tr>
							<tr>
								<td>3일차</td>
								<td class="alignL">미납금결제(납입도중장례발생시) > 발인 > 제공되는장의차량으로 담당자와 함께 장지동행 (왕복)</td>
							</tr>
						</tbody>
					</table>
				</div>

			</div> <!-- // contents -->


		</div>
	</div> <!-- // contentsWrap -->

<!--#include file="../include/inc_footer.jsp"-->
<%@include file="/WEB-INF/view/include/inc_footer.jsp"%>
