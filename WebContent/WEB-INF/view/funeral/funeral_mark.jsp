<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/view/include/inc_header.jsp"%>
<!--#include file="../include/inc_header.jsp"-->

	<div id="contentsWrap">
		<div class="container">
			<div class="conTitWrap">
				<h2>장례상품특징</h2>
				<div class="location">
					<span class="home">홈</span>
					<span>장례상품</span>
					<strong>장례상품특징</strong>
				</div>
			</div> <!-- // conTitWrap -->
			<!-- 메뉴 영역 -->
			



<script type="text/javascript">
	$(function() {
		//메뉴 제어 
		var lnb = $(".pcLnbWrap ul li a");
		var menuId = "MN30100";
		var mbId = "MO30100";
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
                        <strong><button type="button" class="select" id="subtitle">장례상품특징</button></strong>
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

				<div class="businessUnit">
					<li class="unitTit">
						<div class="imgWrap">
							<p class="moImg"><img src="/public/img/conts/img_funeral_mo01.png" alt="장례상품특징이미지" /></p>
							<p class="pcImg"><img src="/public/img/conts/img_funeral_pc01.png" alt="장례상품특징이미지" /></p>
						</div>
						<div class="txtWrap">
							<strong>정성을 다하는 장의서비스</strong>
							<p>고객께서 미리 납입하시는 일정부금으로 가정의 행사를 미리 준비하여 활용할 수 있도록 만들어진 경제적 상품입니다.</p>
						</div>
					</li>
				</div>
				<br/><br/>
				<div class="businessIntro">
					<h3 class="subTit">크리스찬상조부금이란?</h3>
					<p><strong>가입 시 회원이 매월 일정한 금액을 일정기간 불입하면서, 장례발생 시 전화 한 통화로 계약된 내용의 서비스를 받게 되는 장례토탈서비스 상품입니다.</strong></p>
				</div>
				<br/><br/>
				
				<div class="businessIntro">
					<h3 class="subTit">크리스찬상조는?</h3>
				</div>
				<strong class="blueTit">양심에 기초한 가격을 책정했습니다.</strong>
				<ul class="defaultGrayDotList mt-10">
					<li>장례가 발생한 소비자들은 경황이 없어서 많은 장례비용을 지불하게 됩니다.</li>
					<li>크리스찬상조는 장례용품을 양심대로 거품없이 제공하고 있으며, 세월이 지나도 그 가격 그대로 물가보상이 되기 때문에 더 저렴하게 이용하실 수 있습니다.</li>
				</ul>
				<br/><br/>
				<strong class="blueTit">가족처럼 모십니다.</strong>
				<ul class="defaultGrayDotList mt-10">
					<li>장례가 발생하면 전국 어디서나 1644-4491로 전화 주십시오.</li>
					<li>복잡하고 까다로운 장례절차를 크리스찬상조가 처음부터 끝까지 친절하게 진행하여 드립니다.</li>
				</ul>
				<br/><br/>
				<strong class="blueTit">최상의 서비스를 제공합니다.</strong>
				<ul class="defaultGrayDotList mt-10">
					<li>장례도우미가 파견되어 장례진행은 물론 문상객 접대 등 많은 일손을 도우며 모든 일에 최선을 다해 섬깁니다.</li>
				</ul>
				<br/><br/>
				<div class="businessIntro">
					<h3 class="subTit">물가인상에 따른 추가비용 없음</h3>
				</div>
				<br/>
				<ul class="defaultGrayDotList mt-10">
					<li>전국 어디서든 즉시 출동</li>
					<li>어느 누구에게나 양도, 양수 가능</li>
					<li>365일 24시간 콜센타 운영</li>
					<li>내 가족처럼 모시는 친철한 인력서비스</li>
				</ul>
				<br/><br/>
				<div class="businessIntro">
					<h3 class="subTit">장례진행과정</h3>
				</div>

				<div class="businessUnit">
					<li class="unitTit">
						<div class="imgWrap">
							<p class="moImg"><img src="/public/img/conts/img_funeral_mo02.png" alt="장례진행과정 이미지" /></p>
							<p class="pcImg"><img src="/public/img/conts/img_funeral_pc02.png" alt="장례진행과정 이미지" /></p>
						</div>
					</li>
				</div>
				
			</div> <!-- // contents -->


		</div>
	</div> <!-- // contentsWrap -->

<!--#include file="../include/inc_footer.jsp"-->
<%@include file="/WEB-INF/view/include/inc_footer.jsp"%>
