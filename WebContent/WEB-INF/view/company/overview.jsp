<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/view/include/inc_header.jsp"%>
<!--#include file="../include/inc_header.jsp"-->

	<div id="contentsWrap">
		<div class="container">
			<div class="conTitWrap">
				<h2>인사말</h2>
				<div class="location">
					<span class="home">홈</span>
					<span>회사소개</span>
					<strong>인사말</strong>
				</div>
			</div> <!-- // conTitWrap -->
			<!-- 메뉴 영역 -->
			



<script type="text/javascript">

$(function() {
	//메뉴 제어 
	var lnb = $(".pcLnbWrap ul li a");
	var menuId = "MN10100";
	var mbId = "MO10100";
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
                            <li><a href="javascript:goMenu('/info/proInfo.do', '');">상조상품특징</a></li>
                            <li><a href="javascript:goMenu('/funeral/funeralMark.do', '');">장례상품</a></li>
                            <li><a href="javascript:goMenu('/marry/marryMark.do', '');">웨딩상품</a></li>
                            <li><a href="javascript:goMenu('/cruise/cruiseMark.do', '');">크루즈상품</a></li>
                            <li><a href="javascript:goMenu('/notice/noticeList.do', '');">고객센터</a></li>
                        </ul>
                    </div>
                    <div class="flexItem4"> <!-- .select 버튼 클릭시 다중클래스 on 추가 -->
                        <strong><button type="button" class="select" id="subtitle">인사말</button></strong>
                        <ul>
                            <li id="MO10100"><a href="javascript:goMenu('/company/overView.do', 'MO10100');">인사말</a></li>
                            <li id="MO10200"><a href="javascript:goMenu('/company/organ.do', 'MO10200');">조직도및연혁</a></li>
                            <!-- <li id="MO10300"><a href="javascript:goMenu('/company/branchList.do', 'MO10300');">전국지사안내</a></li>
                            <li id="MO10400"><a href="javascript:goMenu('/company/adviceList.do', 'MO10400');">상담사조회</a></li> -->
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
                            <!-- <li id="MN10300"><a href="javascript:goMenu('/company/branchList.do', 'MO10300');">전국지사안내</a></li>
                            <li id="MN10400"><a href="javascript:goMenu('/company/adviceList.do', 'MO10400');">상담사조회</a></li> -->
                            <li id="MN10500"><a href="javascript:goMenu('/company/cyberList.do', 'MO10500');">사이버홍보실</a></li>
                            <li id="MN10600"><a href="javascript:goMenu('/company/road.do', 'MO10600');">오시는길</a></li>
                    </ul>
                </nav>
            </div> <!-- // pcLnbWrap -->

			<!-- 메뉴 영역 -->

			<div id="info" class="contents"> <!-- 페이지별 ID -->
				<div class="imgWrap">
					<p class="moImg"><img src="/public/img/conts/img_overview_mo01.png" alt="인사말 이미지" /></p>
					<p class="pcImg"><img src="/public/img/conts/img_overview_pc01.png" alt="인사말 이미지" /></p>
				</div>

				<div class="ceo01">
					<p><strong class="pointColor">하나님사랑과 이웃사랑을 실천하는<br/>크리스찬상조를 방문 해 주셔서 감사합니다.</strong></p>

					<p>크리스찬상조는 기존의 가정의례서비스를 넘어 라이프사이클 전반을 서비스하는 고품격의 종합 이벤트 회사입니다.</p>

					<p>여러 소비자의 필요를 충족시키기 위해 다양한 삼품을 준비하여, 갑작스러운 큰 일이나 장기적인 계획을 가지고 준비해야 하는 일을 최고의 전문가들이 저렴하고 편리하게 최상의 서비스를 제공해드리는 회사입니다.</p>
					
					<p>항상 고객들의 작은 목소리에도 귀 기울이고 고객을 잘 이해하며 고객들이 가장 선호하는 기업이 되기위해 열심히 노력하겠습니다.</p>

					<p>감사합니다.<br/><br/></p>

					<p><strong class="pointColor">상조는 '서로돕는다'라는 의미로서,</strong><br/>미래에 필요한 용역서비스나 물품을 현 시점에서 작은 할부금 형식으로 구매하는 방식으로서, 상조회원들이 회비를 납부하여 대량구매, 원가절감 효과로 10년후 또는 20년후에라도 가입금액 그대로 혜택을 받을 수 있는 물가보상시스템입니다.<br/><br/></p>
					
					<div class="signArea">
						<p class="smallTit">크리스찬상조(주) 직원 일동</p>
					</div>
				</div>

			</div> <!-- // contents -->


		</div>
	</div> <!-- // contentsWrap -->

<!--#include file="../include/inc_footer.jsp"-->
<%@include file="/WEB-INF/view/include/inc_footer.jsp"%>
