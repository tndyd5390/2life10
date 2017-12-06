<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include/inc_header.jsp" %>

	<div id="contentsWrap">
		<div class="container">
			<div class="conTitWrap">
				<h2>크루즈상품특징</h2>
				<div class="location">
					<span class="home">홈</span>
					<span>크루즈상품</span>
					<strong>크루즈상품특징</strong>
				</div>
			</div> <!-- // conTitWrap -->
			<!-- 메뉴 영역 -->
			



<script type="text/javascript">
	$(function() {
		//메뉴 제어 
		var lnb = $(".pcLnbWrap ul li a");
		var menuId = "MN50100";
		var mbId = "MO50100";
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
						<strong><button type="button" class="select">크루즈상품</button></strong>
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
						<strong><button type="button" class="select" id="subtitle">장례상품</button></strong>
						<ul>
							<li id="MO50100"><a href="javascript:goMenu('/cruise/cruiseMark.do', '');">크루즈상품특징</a></li>
							<li id="MO50200"><a href="javascript:goMenu('/cruise/cruisePro.do', '');">크루즈성지순례상품</a></li>
							<li id="MO50300"><a href="javascript:goMenu('/cruise/cruiseScheduleList.do', '');">크루즈일정</a></li>
						</ul>
					</div>
								
				</nav>
			</div> <!-- // moLnbWrap -->

			<div class="pcLnbWrap">
				<nav>
					<ul class="pcLnb">
							<li id="MO50100"><a href="javascript:goMenu('/cruise/cruiseMark.do', '');">크루즈상품특징</a></li>
							<li id="MO50200"><a href="javascript:goMenu('/cruise/cruisePro.do', '');">크루즈성지순례상품</a></li>
							<li id="MO50300"><a href="javascript:goMenu('/cruise/cruiseScheduleList.do', '');">크루즈일정</a></li>
					</ul>
				</nav>
			</div> <!-- // pcLnbWrap -->

			<!-- 메뉴 영역 -->

			<div id="pro_info" class="contents"> <!-- 페이지별 ID -->

				<div class="businessUnit">
					<li class="unitTit">
						<div class="imgWrap">
							<p class="moImg"><img src="/public/img/conts/img_cruise_2mo01.png" alt="크루즈여행이미지" /></p>
							<p class="pcImg"><img src="/public/img/conts/img_cruise_2pc01.png" alt="크루즈여행이미지" /></p>
						</div>
						<div class="txtWrap">
							<strong>최고급 시설을 갖춘 거대한 선박을 타고</strong>
							<p>낭만적인 여행을 즐기는 크루즈 여행은 영화속에서 보던 타이타닉을 실제로 경험할 수 있는 럭셔리 여행입니다.</p>
						</div>
					</li>
				</div>
				<br/><br/>
				<div class="businessIntro">
					<h3 class="subTit">크루즈여행이란?</h3>
					<p><strong>크루즈 여행의 가장 큰 매력은 이동 수단과 여행지가 결합된 형태로 기항지 이동시간 동안에도 격조 높은 선실과 선상 시설을 갖춘 전 세계 프리미엄 급 이상의 크루즈를 이용하여 다양한 엔터테인먼트를 즐기며 세계적으로 아름답고 놀라운 정박지에서의 고품격 여행을 즐기실 수 있다는 점입니다.</strong></p>
				</div>
				<br/><br/>

				<div class="businessIntro">
					<h3 class="subTit">크루즈여행의 장점</h3>
					<p><strong>패키지 일정에 따라 단체로 같은 스케줄로 움직이지 않고 각 기항지에서의 관광을 즐기실 수 있으며, 관광을 하지 않을 경우 선내의 다양한 프로그램을 이용하여 편하게 쉬거나, 자유롭게 쇼핑 및 다양한 레스토랑에서의 식사를 마음껏 즐기실 수 있습니다.</strong></p>
				</div>
				<br/><br/>

				<strong class="blueTit">상상을 초월하는 시설과 다양한 프로그램 Entertainment</strong>
				<ul class="defaultGrayDotList mt-10">
					<li>크루즈 여행에서의 큰 매력은 최고의 시설과 다양한 선내 프로그램에서 느낄 수 있는 즐거움입니다.</li>
					<li>공연, 미니골프장, 카지노, 키즈 전용광간(어린이/청소년 프로그램), 수영장, 스파 & 피트니스센터, 선상 프로그램 등 다양한 선내 액티비티 시설과 인기 있는 선상 프로그램을 가족 혹은 친구들과 함께 즐기며 평생토록 잊혀지지 않는 소중한 추억을 남길 수 있습니다.</li>
				</ul>
				<br/><br/>
				<div class="businessUnit">
					<li class="unitTit">
						<div class="imgWrap">
							<p class="moImg"><img src="/public/img/conts/img_cruise_mo02.png" alt="다양한 프로그램 Entertainment 이미지" /></p>
							<p class="pcImg"><img src="/public/img/conts/img_cruise_pc02.png" alt="다양한 프로그램 Entertainment 이미지" /></p>
						</div>
					</li>
				</div>
				<br/><br/>
				<strong class="blueTit">즐거운 음식의 향연 Restaurant</strong>
				<ul class="defaultGrayDotList mt-10">
					<li>크루즈 여행에서는 세계 각국의 음식이 무제한 제공됩니다.</li>
					<li>스낵 카페, 정찬 레스토랑, 룸서비스, 뷔페 레스토랑에서 주방장이 엄선한 다양한 메뉴를 즐길 수 있습니다.</li>
					<li>세계적인 유명 요리와 완벽한 서비스! 환상적인 맛의 세계로 여러분을 초대합니다.</li>
				</ul>
				<br/><br/>
				<div class="businessUnit">
					<li class="unitTit">
						<div class="imgWrap">
							<p class="moImg"><img src="/public/img/conts/img_cruise_mo03.png" alt="즐거운 음식의 향연 Restaurant 이미지" /></p>
							<p class="pcImg"><img src="/public/img/conts/img_cruise_pc03.png" alt="즐거운 음식의 향연 Restaurant 이미지" /></p>
						</div>
					</li>
				</div>
			</div> <!-- // contents -->


		</div>
	</div> <!-- // contentsWrap -->

<%@ include file="/WEB-INF/view/include/inc_footer.jsp" %>