<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="../include/inc_header.jsp" %>

	<div id="contentsWrap">
		<div class="container">
			<div class="conTitWrap">
				<h2>크루즈상품특징</h2>
				<div class="location">
					<span class="home">홈</span>
					<span>크루즈상품</span>
					<strong>크루즈성지순례상품</strong>
				</div>
			</div> <!-- // conTitWrap -->
			<!-- 메뉴 영역 -->
			



<script type="text/javascript">
	$(function() {
		//메뉴 제어 
		var lnb = $(".pcLnbWrap ul li a");
		var menuId = "MN50200";
		var mbId = "MO50200";
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
							<li><a href="javascript:goMenu('../company/overview.jsp', '');">회사안내</a></li>
							<li><a href="javascript:goMenu('../info/pro_info.jsp', '');">상조상품안내</a></li>
							<li><a href="javascript:goMenu('../funeral/funeral_mark.jsp', '');">장례상품</a></li>
							<li><a href="javascript:goMenu('../marry/marry_mark.jsp', '');">웨딩상품</a></li>
							<li><a href="javascript:goMenu('../cruise/cruise_mark.jsp', '');">크루즈상품</a></li>
							<li><a href="javascript:goMenu('../notice/notice_list.jsp', '');">고객센터</a></li>
						</ul>
					</div>
					<div class="flexItem4"> <!-- .select 버튼 클릭시 다중클래스 on 추가 -->
						<strong><button type="button" class="select" id="subtitle">장례상품</button></strong>
						<ul>
							<li id="MO50100"><a href="javascript:goMenu('../cruise/cruise_mark.jsp', '');">크루즈상품특징</a></li>
							<li id="MO50200"><a href="javascript:goMenu('../cruise/cruise_pro.jsp', '');">크루즈성지순례상품</a></li>
							<li id="MO50300"><a href="javascript:goMenu('../cruise/cruise_schedule.jsp', '');">크루즈일정</a></li>
						</ul>
					</div>
								
				</nav>
			</div> <!-- // moLnbWrap -->

			<div class="pcLnbWrap">
				<nav>
					<ul class="pcLnb">
						<li id="MN50100"><a href="javascript:goMenu('../cruise/cruise_mark.jsp', '');">크루즈상품특징</a></li>
						<li id="MN50200"><a href="javascript:goMenu('../cruise/cruise_pro.jsp', '');">크루즈성지순례상품</a></li>
						<li id="MN50300"><a href="javascript:goMenu('../cruise/cruise_schedule.jsp', '');">크루즈일정</a></li>
					</ul>
				</nav>
			</div> <!-- // pcLnbWrap -->

			<!-- 메뉴 영역 -->

			<div id="pro_info" class="contents"> <!-- 페이지별 ID -->

				<div class="businessUnit">
					<li class="unitTit">
						<div class="imgWrap">
							<p class="moImg"><img src="../public/img/conts/img_cruise_3mo01.png" alt="크루즈여행이미지" /></p>
							<p class="pcImg"><img src="../public/img/conts/img_cruise_3pc01.png" alt="크루즈여행이미지" /></p>
						</div>
						<div class="txtWrap">
							<strong>최고급 시설을 갖춘 거대한 선박을 타고</strong>
							<p>아름다운 지중해 나라들의 성지순례지를 탐방하는 최고급 크루즈 여행입니다.</p>
						</div>
					</li>
				</div>
				<br/><br/>
				<div class="businessIntro">
					<h3 class="subTit">크루즈성지순례란?</h3>
					<p><strong>크리스찬상조 크루즈는 각 기항지마다 크리스찬상조만의 성지순례장소를 선택하여 단독 일정으로 거룩한 성지순례지를 경험할 수 있는 최상의 성지순례상품입니다.</strong></p>
				</div>
				<br/><br/>

				<div class="businessIntro">
					<h3 class="subTit">크루즈성지순례의 장점</h3>
					<p><strong>크루즈여행은 교통수단과 여행지가 결합된 형태로 국경통과의 번거로움과 피곤한 과정이 적고, 여행 시 버스 이동 및 교통수단으로 인한 피로감이 줄어듭니다. 크루즈 여행에서는 세계 각국의 음식이 무제한 제공됩니다. 뷔페식으로 풍부한 선상식으로 기존 미흡한 식사부분을 보완하였습니다. 최고급 시설을 갖춘 선박을 타고 아름다운 기항지 여행은 물론, 휴양과 묵상을 함께 할 수 있는 시간이 충분합니다. 지중해 연안의 아름다운 해협을 접해볼 수 있는 특별한 일정을 준비하였으며, 기본일정 외 각 기항지마다 크리스찬상조만의 성지순례장소를 선택하여 단독으로 일정이 진행됩니다.</strong></p>
				</div>
				<br/><br/>

				<strong class="blueTit">최고급 크루즈여행으로 가능한 성지순례</strong>
				<ul class="defaultGrayDotList mt-10">
					<li>믿음의 선진들이 걸었던 발자취를 따라 여행하며 그 신앙을 본받고 그 땅에 역사한 복음을 되새겨보는 뜻 깊은 시간입니다.</li>
				</ul>
				<br/><br/>
				<div class="businessUnit">
					<li class="unitTit">
						<div class="imgWrap">
							<p class="moImg"><img src="../public/img/conts/img_cruise_mo04.png" alt="최고급 크루즈여행으로 가능한 성지순례 이미지" /></p>
							<p class="pcImg"><img src="../public/img/conts/img_cruise_pc04.png" alt="최고급 크루즈여행으로 가능한 성지순례 이미지" /></p>
						</div>
					</li>
				</div>
				<br/><br/>
				<strong class="blueTit">성지순례 크루즈 일정</strong>
				<ul class="defaultGrayDotList mt-10">
					<li>성지순례 뿐만 아니라 크루즈 여행의 장점 또한 빠짐 없이 제공되는 최고급 여행입니다.</li>
				</ul>
				<br/><br/>
				<div class="businessUnit">
					<li class="unitTit">
						<div class="imgWrap">
							<p class="moImg"><img src="../public/img/conts/img_cruise_mo05.png" alt="성지순례 크루즈 일정 이미지" /></p>
							<p class="pcImg"><img src="../public/img/conts/img_cruise_pc05.png" alt="성지순례 크루즈 일정 이미지" /></p>
						</div>
					</li>
				</div>
			</div> <!-- // contents -->


		</div>
	</div> <!-- // contentsWrap -->

<%@ include file="../include/inc_footer.jsp" %>