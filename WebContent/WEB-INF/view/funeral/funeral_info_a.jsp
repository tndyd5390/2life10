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
							<li id="MO30200"><a href="javascript:goMenu('/funeral/funeralList_a.do', 'MO30200');">장례상품</a></li>
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
							<li id="MN30200"><a href="javascript:goMenu('/funeral/funeralList_a.do', 'MN30200');">장례상품</a></li>
							<li id="MN30300"><a href="javascript:goMenu('/funeral/funeralInfo_a.do', 'MN30300');">장례정보</a></li>
							<li id="MN30400"><a href="javascript:goMenu('/funeral/funeralNoticeList.do', 'MN30400');">부고알림</a></li>
                    </ul>
                </nav>
            </div> <!-- // pcLnbWrap -->

			<!-- 메뉴 영역 -->

			<div id="pro_info" class="contents"> <!-- 페이지별 ID -->

				<div class="defaultTab">
				    <strong class="select">
                        <button type="button">기독교장례 및 추도예배</button>
                    </strong>
					<ul>
						<li class="tab01 active"><a href="javascript:goMenu('/funeral/funeralInfo_a.do', 'MN30300');">기독교장례 및 추도예매</a></li>
                        <li class="tab02"><a href="javascript:goMenu('/funeral/funeralInfo_b.do', 'MN30300');">장례구비서류 및 행정절차</a></li>
                        <li class="tab03"><a href="javascript:goMenu('/funeral/funeralInfoList.do', 'MN30300');">전국장례시설안내</a></li>
                        <li class="tab04"><a href="javascript:goMenu('/funeral/funeralInfo_c.do', 'MN30300');">관련사이트</a></li>
					</ul>
				</div>
				
				<header class="contInfoArea">
					<p class="img"><img src="../public/img/conts/img_funeral_info.png" alt="기독교장례 이미지" /></p>
					<div class="area">
						<h3 class="contTit"><span>기독교장례란?</span></h3>
						<p>기독교식 장례는 시신의 수시부터 하관에 이르기까지 모든 의식과 절차가 목사님의 집례아래 이루어진다.
						운명을 하면 찬송과 기도로 고인의 영혼을 하나님께 맡기는 뜻의 예배를 드리며 목사님의 집례로 예배를 드리고,
						기독교식 장례는 곡을 하지 않고, 제사음식을 차리지 않으며 배례(절)을 하지 않는다.<br/>
						또 조석에 전과 상식(上食)을 올리지 않는다. 영결식 전날 성도들은 염습 및 입관을 마치고 목사님의 집례로
						입관예배를 드린다.<br/>
						영결식은 영구를 교회에서 안치하거나 상가에서 간단하게 행하는 경우가 있으며, 분향대신 영전에 헌화를 한다.</p>
					</div>
				</header>

				<br/><br/>
				
				<strong class="blueTit">임종예배</strong>
				<ul class="defaultGrayDotList mt-10">
					<li>기독교식 장례는 운명하는 사람의 영혼을 찬송과 기도속에서 하나님께 맡기는 것으로 목사님의 집례 아래 진행된다.</li>
					<li>성도가 임종하면 담임목사님께 가장 먼저 연락을 하고 목사님 집례 임종예배를 드리고 장례 일정 및 제반사항을 의논하며 분향을 하지 않고 헌화를 한다. 제사상차림과 곡은 하지 않고 경건한 마음과 분위기 가운데 장례를 진행한다.</li>
				</ul>
				<br/><br/>
				<strong class="blueTit">입관예배</strong>
				<ul class="defaultGrayDotList mt-10">
					<li>입관은 유가족들이 모두 모인 자리에서 시신의 수시부터 염습, 입관예배를 목사님의 집례로 진행하며 입관 후 입관예배를 드린다. 상복은 보통 남자는 검은색 계통의 양복에 완장을 착용하고, 여자는 흰색이나 검은색 치마저고리로 입는다.</li>
				</ul>
				<br/><br/>
				<strong class="blueTit">발인예배</strong>
				<ul class="defaultGrayDotList mt-10">
					<li>출관식은 조문객들에게 하나님의 사랑과 공의를 인정하게 하고, 인간의 유한성과 무능함을 깨닫게 하는 좋은 기회가 됩니다.
					모든 예식이 그러하겠지만 출관식은 더욱 그러합니다. 그러므로 고인의 모든 흔적(모습)이 집을 떠나는 마지막 순간이기 때문에 예식에 있어서 분명한 목적이 있어야 합니다.
					첫째로는 모든 순서를 통해 하나님께 영광을 돌리는 기회가 되어야 하고, 
					둘째로는 유족을 위로하고 소망을 주어야 하며,
					섯째는 이 예식에 참석하는 분들에게 신앙의 확신과 선교의 기회가 되어야 한다는 사실을 기억하면서 예식이 진행되어져야 합니다.</li>
				</ul>
				<br/><br/>
				<strong class="blueTit">하관예배</strong>
				<ul class="defaultGrayDotList mt-10">
					<li>하관식은 죽은 사람을 흙으로 돌려보내고 산 사람끼리 돌아와야 하는 슬픔의 절정을 이루는 순간이기 때문에 격려와 용기를 주어 새로운 결심과 각오를 가지고 돌아오도록 해야 합니다. 그리스도의 재림과 세상의 종말과 심판이 있음을 강조하면서, 무덤이 인생의 끝이 아니라 주님의 재림때 성도는 부활의 소망이 있다는 사실과 고인이 영광과 평안의 세계로 옮겨갔다는 것을 말씀을 통해 확신하게 하고 위로 받게 하며 안정시켜 주어야 합니다.</li>
					<li>하관식이 끝나면 취토(取土)를 하게 되는데, 취토는 열어놓았던 횡대를 다시 덮고 관 위에 흙을 덮는 것을 말합니다.
					흙이 관 위에서 떨어지는 소리를 듣는 순간이 가장 슬프기 때문에 식순에 넣으면 취토를 할 때 유족들이 울음을 터뜨리기 때문에 식을 마치고 행하는 것이 좋습니다. 취토 전에 꽃이 있으면 먼저 헌화한 후에 할 수도 있으며, 그 순서가 주례자가 먼저한 후에 유족, 친척, 친지, 조문객 순으로 합니다. 취토할때의 기도문은 다음과 같습니다.</li>
				</ul>
				<br/><br/>
				<p class="txt">이제 우리는 고 000씨의 육신을 땅에 안장합니다.
				<br>
				그러나 주님께서 재림하실 때 하늘에 속한 영화로운 몸으로 부활할 것을 믿으면서 소망가운데 살기로 다짐하겠습니다.</p>
				<br/><br/>
				<div class="businessIntro">
					<h3 class="subTit">추도예배</h3>
				</div>
				<br/>
				<strong class="blueTit">의의</strong>
				<ul class="defaultGrayDotList mt-10">
					<li>추도예배란 돌아가신 분을 추모하고 그의 신앙을 계승하기 위하여 유가족 및 친지, 그리고 지인들이 함께 모여 드리는 예배를 말합니다.
					이 추도예배를 통해 돌아가신 분을 기억하며 추모하고 유족들간의 위로와 친교를 다지며 신앙을 더욱 돈독히 하는 계기로 삼는다면 영적으로나 도덕적으로 또는 사회 윤리적 차원까지도 부족함없이 유익을 많이 얻을 수 있을 것입니다.</li>
				</ul>
				<br/><br/>
				<strong class="blueTit">준비</strong>
				<ul class="defaultGrayDotList mt-10">
					<li>고인의 사진을 상 위에 놓고 촛불과 꽃으로 장식합니다. (사진이 없는 경우에도 지방은 쓰지 않습니다. 단, 고인이 쓰시던 성경책을 상 위에 놓습니다.)</li>
					<li>가족들이 그 앞에 둘러앉고 집례자는 상 옆에 앉거나 서서 인도합니다.</li>
					<li>예배순서의 성경말씀과 찬송, 귀영(고인을 회상하는 가족들의 신앙적 간구/기원)을 미리 여러 장 준비하여 참석자에게 배부합니다.</li>
					<li>목사님(교역자)이 오시지 못할 경우에는 이 순서에 따라 가족 중 한 분이 예배를 인도하도록 합니다.</li>
				</ul>
				<br/><br/>
				<strong class="blueTit">예배순서</strong>
				<ul class="defaultGrayDotList mt-10">
					<li>묵도 (성경말씀 봉독/시편23편) / 사도신경</li>
					<li>찬송 (514장, 543장)</li>
					<li>성경봉독</li>
					<li>약력소개 (별세한 이의 약력, 행적, 유춘, 성품 등 별세한 이에 대한 인상 깊었던 일들이 가족이나 친척 또는 친지 중에서 말하게 합니다.)</li>
					<li>설교</li>
					<li>기도</li>
					<li>찬송 (305장이나 376장)</li>
					<li>축도</li>
				</ul>
				<br/><br/>
				<strong class="blueTit">기도문</strong>
				<p class="txt">인간의 생사를 주관하시는 하나님 아버지, 슬픔과 절망의 어두운 그늘 속에서도 우리가 예수 그리스도의 은혜와 성령의 인도하심으로 믿음과 희망을 가지고 살게 하심을 감사드립니다.</p>
				<p class="txt">오늘은 하나님께서 일찍이 고 000성도님(어른, 선생님)을 하나님 나라로 불러가신 날이어서 유족들과 고인과 관계된 모든 이들이 함께 모여 예배를 드립니다. 용서의 하나님 아버지, 우리가 고인을 통한 그 뜻을 펴지 못한 우리의 부족함을 고백합니다.</p>
				<p class="txt">우리 각자가 그리스도 안에서 고인에게 다하지 못한 모든 정을 생각하며 우리의 부족을 고백하오니 용서하여 주옵소서. 자비로우신 하나님 아버지, 여기의 우리들, 죽은이나 산 이들 모두에게 하늘의 영원한 복을 허락 하옵소서. 그리하여 우리로 하여금 우리 주 예수 그리스도 안에서 성령의 인도하심을 받아 고인의 삶을 영원히 이어가며 하나님의 뜻을 이 땅위에 널리 펴는 새로운 은혜를 베풀어 주옵소서.</p>
				<p class="txt">예수님의 이름으로 기도하옵니다. 아멘</p>

			</div> <!-- // contents -->


		</div>
	</div> <!-- // contentsWrap -->

<!--#include file="../include/inc_footer.jsp"-->
<%@include file="../include/inc_footer.jsp"%>
