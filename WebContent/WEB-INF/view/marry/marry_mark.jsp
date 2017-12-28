<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include/inc_header.jsp" %>

	<div id="contentsWrap">
		<div class="container">
			<div class="conTitWrap">
				<h2>웨딩상품특징</h2>
				<div class="location">
					<span class="home">홈</span>
					<span>웨딩상품</span>
					<strong>웨딩상품특징</strong>
				</div>
			</div> <!-- // conTitWrap -->
			<!-- 메뉴 영역 -->
			



<script type="text/javascript">
	$(function() {
		//메뉴 제어 
		var lnb = $(".pcLnbWrap ul li a");
		var menuId = "MN40100";
		var mbId = "MO40100";
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
						<strong><button type="button" class="select">웨딩상품</button></strong>
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
						<strong><button type="button" class="select" id="subtitle">웨딩상품특징</button></strong>
						<ul>
                            <li id="MO40100"><a href="javascript:goMenu('/marry/marryMark.do', 'MN40100');">웨딩상품특징</a></li>
                            <li id="MO40200"><a href="javascript:goMenu('/marry/marryList_d.do', 'MN40200');">웨딩상품</a></li>
						</ul>
					</div>
								
				</nav>
			</div> <!-- // moLnbWrap -->

			<div class="pcLnbWrap">
				<nav>
					<ul class="pcLnb">
                            <li id="MN40100"><a href="javascript:goMenu('/marry/marryMark.do', 'MN40100');">웨딩상품특징</a></li>
                            <li id="MN40200"><a href="javascript:goMenu('/marry/marryList_d.do', 'MN40200');">웨딩상품</a></li>
					</ul>
				</nav>
			</div> <!-- // pcLnbWrap -->

			<!-- 메뉴 영역 -->

			<div id="pro_info" class="contents"> <!-- 페이지별 ID -->

				<div class="businessIntro">
					<h3 class="subTit">크리스찬상조 웨딩상품은</h3>
					<p><strong>가입시 회원이 매월 일정한 금액을 일정기간 불입하면서, 웨딩진행을 하실 때, 크리스찬상조 웨딩사업부를 통해 고객에게 맞는 드레스, 스튜디오 등을 선택하여 리허설 촬영 및 본식 진행을 합니다.</strong></p>
				</div>
				<br/><br/>

				<div class="businessIntro">
					<h3 class="subTit">웨딩진행과정</h3>
				</div>

				<div class="businessUnit">
					<li class="unitTit">
						<div class="imgWrap">
							<p class="moImg"><img src="/public/img/conts/img_marry_mo01.png" alt="웨딩진행과정" /></p>
							<p class="pcImg"><img src="/public/img/conts/img_marry_pc01.png" alt="웨딩진행과정" /></p>
						</div>
						<div class="txtWrap">
							<strong>2014년 가입자부터는 프라임(350)상품만 웨딩서비스 이용이 가능합니다.</strong>
							<p></p>
						</div>
					</li>
				</div>
				<br/><br/>

				<div class="businessIntro">
					<h3 class="subTit">STUDIO & DRESS & MAKE-UP</h3>
				</div>
				<ul class="defaultGrayDotList mt-10">
					<li>결혼을 앞둔 신부에게 중요한 드레스와 스튜디오!</li>
					<li>국내 유명 디자이너삽과 명품드레스 등 레벨에 따라 다양한 드레스 업체가 있어서 선택의 폭이 큽니다.</li>
					<li>서울 및 각 지역의 최고의 스튜디오, 드레스샵, 메이크업샵을 이용할 수 있습니다.</li>
				</ul>

				<div class="businessUnit">
					<li class="unitTit">
						<div class="imgWrap">
							<p class="moImg"><img src="/public/img/conts/img_marry_mo02.png" alt="STUDIO & DRESS & MAKE-UP" /></p>
							<p class="pcImg"><img src="/public/img/conts/img_marry_pc02.png" alt="STUDIO & DRESS & MAKE-UP" /></p>
						</div>
					</li>
				</div>

			</div> <!-- // contents -->


		</div>
	</div> <!-- // contentsWrap -->

<%@ include file="/WEB-INF/view/include/inc_footer.jsp" %>