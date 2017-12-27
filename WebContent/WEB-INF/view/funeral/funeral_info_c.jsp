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
                        <button type="button">관련사이트</button>
                    </strong>
					<ul>
						<li class="tab01"><a href="javascript:goMenu('/funeral/funeralInfo_a.do', 'MN30300');">기독교장례 및 추도예매</a></li>
                        <li class="tab02"><a href="javascript:goMenu('/funeral/funeralInfo_b.do', 'MN30300');">장례구비서류 및 행정절차</a></li>
                        <li class="tab03"><a href="javascript:goMenu('/funeral/funeralInfoList.do', 'MN30300');">전국장례시설안내</a></li>
                        <li class="tab04 active"><a href="javascript:goMenu('/funeral/funeralInfo_c.do', 'MN30300');">관련사이트</a></li>
					</ul>
				</div>
				
				<div class="businessIntro">
					<h3 class="subTit">관련사이트</h3>
				</div>
				<br/>
				
				<div class="businessList">
					<ul class="imgType02">
						<li class="sector1">
							<div class="imgWrap">
								<p class="moImg"><img src="/public/img/conts/img_etc_mo01.png" alt="서울특별시" /></p>
								<p class="pcImg"><img src="/public/img/conts/img_etc_pc01.png" alt="서울특별시" /></p>
							</div>
							<a href="javascript:goMenu('/business/construction.do', 'MN10401');">서울특별시<span>바로가기</span></a>
						</li>
						<li class="sector2">
							<div class="imgWrap">
								<p class="moImg"><img src="/public/img/conts/img_etc_mo02.png" alt="사이버추모의집 이미지" /></p>
								<p class="pcImg"><img src="/public/img/conts/img_etc_pc02.png" alt="사이버추모의집 이미지" /></p>
							</div>
							<a href="javascript:goMenu('/business/trading.do', 'MN10402');">사이버추모의집<span>바로가기</span></a>
						</li>
						<li class="sector3">
							<div class="imgWrap">
								<p class="moImg"><img src="/public/img/conts/img_etc_mo03.png" alt="장묘공원 이미지" /></p>
								<p class="pcImg"><img src="/public/img/conts/img_etc_pc03.png" alt="장묘공원 이미지" /></p>
							</div>
							<a href="javascript:goMenu('/business/fashion.do', 'MN10403');">장묘공원<span>바로가기</span></a>
						</li>
						<li class="sector4">
							<div class="imgWrap">
								<p class="moImg"><img src="/public/img/conts/img_etc_mo04.png" alt="성남시 영생관리 사업소문 이미지" /></p>
								<p class="pcImg"><img src="/public/img/conts/img_etc_pc04.png" alt="성남시 영생관리 사업소 이미지" /></p>
							</div>
							<a href="javascript:goMenu('/business/resort.do', 'MN10404');">성남시 영생관리 사업소<span>바로가기</span></a>
						</li>
					</ul>
				</div>
				<br/><br/>
				<div class="businessList">
					<ul class="imgType02">
						<li class="sector1">
							<div class="imgWrap">
								<p class="moImg"><img src="/public/img/conts/img_etc_mo05.png" alt="건설부문 이미지" /></p>
								<p class="pcImg"><img src="/public/img/conts/img_etc_pc05.png" alt="건설부문 이미지" /></p>
							</div>
							<a href="javascript:goMenu('/business/construction.do', 'MN10401');">수원시 시설관리 공단<span>바로가기</span></a>
						</li>
						<li class="sector2">
							<div class="imgWrap">
								<p class="moImg"><img src="/public/img/conts/img_etc_mo06.png" alt="상사부문 이미지" /></p>
								<p class="pcImg"><img src="/public/img/conts/img_etc_pc06.png" alt="상사부문 이미지" /></p>
							</div>
							<a href="javascript:goMenu('/business/trading.do', 'MN10402');">보건복지부<span>바로가기</span></a>
						</li>
					</ul>
				</div>

			</div> <!-- // contents -->


		</div>
	</div> <!-- // contentsWrap -->

<!--#include file="../include/inc_footer.jsp"-->
<%@include file="/WEB-INF/view/include/inc_footer.jsp"%>
