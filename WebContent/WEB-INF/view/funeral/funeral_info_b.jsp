<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/view/include/inc_header.jsp"%>
<!--#include file="../include/inc_header.jsp"-->

	<div id="contentsWrap">
		<div class="container">
			<div class="conTitWrap">
				<h2>장례정보</h2>
				<div class="location">
					<span class="home">홈</span>
					<span>장례상품</span>
					<strong>장례정보</strong>
				</div>
			</div> <!-- // conTitWrap -->
			<!-- 메뉴 영역 -->
			



<script type="text/javascript">
$(function() {
	//메뉴 제어 
	var lnb = $(".pcLnbWrap ul li a");
	var menuId = "MN30300";
	var mbId = "MO30300";
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
                        <strong><button type="button" class="select" id="subtitle">장례정보</button></strong>
                        <ul>
							<li id="MO30100"><a href="javascript:goMenu('/funeral/funeralMark.do', 'MO30100');">장례상품특징</a></li>
							<li id="MO30200"><a href="javascript:goMenu('/funeral/funeralList_b.do', 'MO30200');">장례상품</a></li>
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
							<li id="MN30200"><a href="javascript:goMenu('/funeral/funeralList_b.do', 'MN30200');">장례상품</a></li>
							<li id="MN30300"><a href="javascript:goMenu('/funeral/funeralInfo_a.do', 'MN30300');">장례정보</a></li>
							<li id="MN30400"><a href="javascript:goMenu('/funeral/funeralNoticeList.do', 'MN30400');">부고알림</a></li>
                    </ul>
                </nav>
            </div> <!-- // pcLnbWrap -->

			<!-- 메뉴 영역 -->

			<div id="pro_info" class="contents"> <!-- 페이지별 ID -->

				<div class="defaultTab">
				    <strong class="select">
                        <button type="button">장례구비서류 및 행정절차</button>
                    </strong>
					<ul>
						<li class="tab01"><a href="javascript:goMenu('/funeral/funeralInfo_a.do', 'MN30300');">기독교장례 및 추도예매</a></li>
                        <li class="tab02 active"><a href="javascript:goMenu('/funeral/funeralInfo_b.do', 'MN30300');">장례구비서류 및 행정절차</a></li>
                        <li class="tab03"><a href="javascript:goMenu('/funeral/funeralInfoList.do', 'MN30300');">전국장례시설안내</a></li>
                        <li class="tab04"><a href="javascript:goMenu('/funeral/funeralInfo_c.do', 'MN30300');">관련사이트</a></li>
					</ul>
				</div>
				
				<div class="businessIntro">
					<h3 class="subTit">장례시 구비서류</h3>
				</div>
				<br/>
				
				<strong class="blueTit">병사 및 자연사인 경우</strong>
				<ul class="defaultGrayDotList mt-10">
					<li>필요서류 : 사망진단서(시체검안서) 7통</li>
					<li>제출서 : 주민등록지 관할 읍, 면, 동사무소, 국민건강보험공단, 장지(공원묘지, 화장장)</li>
					<li>발급처 : 병원(담당의사), 응급실</li>
				</ul>
				<br/><br/>
				<strong class="blueTit">변사 및 사고사인 경우</strong>
				<ul class="defaultGrayDotList mt-10">
					<li>반드시 관할경찰서에 사고접수 하여야 함</li>
					<li>필요서류 : 사망진단서(시체검안서) 7통</li>
					<li>추가서류 : 검사지휘서(사체인도확인서) 2통</li>
					<li>발급처 : 병원 및 관할경찰서</li>
					<li>제출서 : 주민등록지 관할 읍, 면, 동사무소, 국민건강보험공단, 장지(공원묘지, 화장장)</li>
				</ul>
				<br/><br/>
				<strong class="blueTit">사망진단서 용도</strong>
				<ul class="defaultGrayDotList mt-10">
					<li>해당 읍, 면, 동사무소 사망신고시(30일이내) 1통</li>
					<li>매장, 화장용 1통</li>
					<li>국민건강보험공단 1통</li>
					<li>기타(보험회사 보관용) 1통(직장, 학교는 복사본 가능)<br/>* 보험회사 상품 가입시, 1구좌에 2통 추가</li>
				</ul>
				<br/><br/>
				<strong class="blueTit">공원묘지에 안장시 준비서류</strong>
				<ul class="defaultGrayDotList mt-10">
					<li>사망진단서 1통</li>
					<li>주민등록등본 1통</li>
				</ul>
				<br/><br/>
				<strong class="blueTit">화장장의 경우 준비서류</strong>
				<ul class="defaultGrayDotList mt-10">
					<li>사망진단서 1통</li>
					<li>주민등록등본 1통</li>
					<li>화장장 관할지 수입인지(해당시 화장요금)</li>
				</ul>
				<br/><br/>
				
				
				<div class="businessIntro">
					<h3 class="subTit">장례 후 확인사항</h3>
				</div>
				<br/>
				
				<strong class="blueTit">사망신고 및 호적정리</strong><br/>
				<strong class="blueTit2">구비서류</strong>
				<ul class="defaultGrayDotList mt-10">
					<li>사망신고서 2부(시,읍,면,동사무소에 비치)</li>
					<li>사망진단서(검안서), 검사필증</li>
				</ul>
				<br/><br/>
				<strong class="blueTit2">신고기한</strong>
				<ul class="defaultGrayDotList mt-10">
					<li>사망일로부터 30일 이내</li>
				</ul>
				<br/><br/>

				<strong class="blueTit">재산상속</strong><br/>
				<strong class="blueTit2">법원 상속지분에 의한 재산상속</strong>
				<ul class="defaultGrayDotList mt-10">
					<li>망인제적등본, 말소주민등록초본 각1부</li>
					<li>망인자녀 모두의 호적등본, 주민등록 초본 각1부</li>
					<li>인감도장 및 인감증명 1부</li>
					<li>상속재산 등기부등본 1부</li>
					<li>토지대장, 개별 공시지가확인원 각1부</li>
				</ul>
				<br/><br/>
				<strong class="blueTit2">협의분할에 의한 재산상속</strong>
				<ul class="defaultGrayDotList mt-10">
					<li>위 구비서류 중 인감 증명 제외</li>
				</ul>
				<br/><br/>

				<strong class="blueTit">각종보험</strong><br/>
				<strong class="blueTit2">가입보험료 청구</strong>
				<ul class="defaultGrayDotList mt-10">
					<li>해당 보험회사별 관련 구비서류</li>
				</ul>
				<br/><br/>

				<strong class="blueTit">차량소유자상속이전</strong><br/>
				<strong class="blueTit2">차량이전</strong>
				<ul class="defaultGrayDotList mt-10">
					<li>망인제적등본1부</li>
					<li>상속인 및 상속포기인 인감증명 각1부</li>
					<li>상속인 주민등록등본 1부 및 신분증</li>
					<li>자동차등록증</li>
					<li>책임보험영수증</li>
					<li>자동차세 완납증명 1부(대리인신고시 상속인 인감증명서 첨부위임장 작성)</li>
				</ul>
				<br/><br/>
				<strong class="blueTit2">신고기한</strong>
				<ul class="defaultGrayDotList mt-10">
					<li>2개월이내</li>
				</ul>
				<br/><br/>

				<strong class="blueTit">국민연금</strong><br/>
				<strong class="blueTit2">국민연금 가입자 연금수령인 명의변경</strong>
				<ul class="defaultGrayDotList mt-10">
					<li>사망진단서(검안서) 1부</li>
					<li>수급자 주민등록등본 1부, 신분증, 통장사본</li>
					<li>망인 주민등록 말소등본, 제적등본 1부</li>
				</ul>
				<br/><br/>
				<strong class="blueTit2">대리인신고</strong>
				<ul class="defaultGrayDotList mt-10">
					<li>수급자의 인감증명 1부, 인감도장지참</li>
				</ul>
				<br/><br/>
			</div> <!-- // contents -->


		</div>
	</div> <!-- // contentsWrap -->

<!--#include file="../include/inc_footer.jsp"-->
<%@include file="/WEB-INF/view/include/inc_footer.jsp"%>
