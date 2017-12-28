<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/view/include/inc_header.jsp"%>
<!--#include file="../include/inc_header.jsp"-->

	<div id="contentsWrap">
		<div class="container">
			<div class="conTitWrap">
				<h2>오시는길</h2>
				<div class="location">
					<span class="home">홈</span>
					<span>회사소개</span>
					<strong>오시는길</strong>
				</div>
			</div> <!-- // conTitWrap -->
			<!-- 메뉴 영역 -->
			



<script type="text/javascript">
	$(function() {
		//메뉴 제어 
		var lnb = $(".pcLnbWrap ul li a");
		var menuId = "MN10600";
		var mbId = "MO10600";
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
                        <strong><button type="button" class="select">회사소개</button></strong>
                        <ul>
                            <li><a href="javascript:goMenu('/company/overView.do', '');">회사소개</a></li>
                            <li><a href="javascript:goMenu('../info/pro_info.jsp', '');">상조상품특징</a></li>
                            <li><a href="javascript:goMenu('../funeral/funeral_mark.jsp', '');">장례상품</a></li>
                            <li><a href="javascript:goMenu('../marry/marry_mark.jsp', '');">웨딩상품</a></li>
                            <li><a href="javascript:goMenu('../cruise/cruise_mark.jsp', '');">크루즈상품</a></li>
                            <li><a href="javascript:goMenu('../notice/notice_list.jsp', '');">고객센터</a></li>
                        </ul>
                    </div>
                    <div class="flexItem4"> <!-- .select 버튼 클릭시 다중클래스 on 추가 -->
                        <strong><button type="button" class="select" id="subtitle">오시는길</button></strong>
                        <ul>
                            <li id="MO10100"><a href="javascript:goMenu('/company/overView.do', 'MO10100');">인사말</a></li>
                            <li id="MO10200"><a href="javascript:goMenu('/company/organ.do', 'MO10200');">조직도및연혁</a></li>
                            <li id="MO10300"><a href="javascript:goMenu('/company/branchList.do', 'MO10300');">전국지사안내</a></li>
                            <li id="MO10400"><a href="javascript:goMenu('/company/adviceList.do', 'MO10400');">상담사조회</a></li>
                            <li id="MO10500"><a href="javascript:goMenu('/company/cyberList.do', 'MO10500');">사이버홍보실</a></li>
                            <li id="MO10600"><a href="javascript:goMenu('/company/road.do', 'MO10600');">오시는길</a></li>
                        </ul>
                    </div>

                </nav>
            </div> <!-- // moLnbWrap -->

            <div class="pcLnbWrap">
                <nav>
                    <ul class="pcLnb">
                            <li id="MN10100"><a href="javascript:goMenu('/company/overView.do', 'MO10100');">인사말</a></li>
                            <li id="MN10200"><a href="javascript:goMenu('/company/organ.do', 'MO10200');">조직도및연혁</a></li>
                            <li id="MN10300"><a href="javascript:goMenu('/company/branchList.do', 'MO10300');">전국지사안내</a></li>
                            <li id="MN10400"><a href="javascript:goMenu('/company/adviceList.do', 'MO10400');">상담사조회</a></li>
                            <li id="MN10500"><a href="javascript:goMenu('/company/cyberList.do', 'MO10500');">사이버홍보실</a></li>
                            <li id="MN10600"><a href="javascript:goMenu('/company/road.do', 'MO10600');">오시는길</a></li>
                    </ul>
                </nav>
            </div> <!-- // pcLnbWrap -->

			<!-- 메뉴 영역 -->

			<div id="road" class="contents"> <!-- 페이지별 ID -->
				<div class="defaultTabCon">

					<h3 class="smallTit">오시는길</h3>
							
					<ul class="addrArea">
						<li><strong>주소</strong> <span>서울특별시 강남구 선릉로 115길 3 1F(논현동268-2 1F) </span></li>
						<li><strong>전화</strong> <span>1644-4491 (02-556-8652 / 02-501-9132 / 02-541-6372)</span></li>
						<li><strong>팩스</strong> <span>02-556-4439</span></li>
					</ul>
					<!-- mapArea -->
					<!-- <div class="mapArea" id="map_view1">크리스찬라이프 지도영역</div> -->
					<!--
					<!-- 1. 약도 노드 -->
					<div id="map" align="center">
					<div id="daumRoughmapContainer1514267214116" class="root_daum_roughmap root_daum_roughmap_landing" style="width:90%; height:auto;"></div>
					
					<!-- 2. 설치 스크립트 -->
					<script charset="UTF-8" class="daum_roughmap_loader_script" src="https://spi.maps.daum.net/imap/map_js_init/roughmapLoader.js"></script>
					
					<!-- 3. 실행 스크립트 -->
					<script charset="UTF-8">
						new daum.roughmap.Lander({
							"timestamp" : "1514267214116",
							"key" : "m3oe"
						}).render();
					</script>
					</div>
				</div>

			</div> <!-- // contents -->


		</div>
	</div> <!-- // contentsWrap -->

<!--#include file="../include/inc_footer.jsp"-->
<%@include file="/WEB-INF/view/include/inc_footer.jsp"%>
