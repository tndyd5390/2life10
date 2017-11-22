<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../include/inc_header.jsp"%>
<!--#include file="../include/inc_header.jsp"-->

	<div id="contentsWrap">
		<div class="container">
			<div class="conTitWrap">
				<h2>상조상품특징</h2>
				<div class="location">
					<span class="home">홈</span>
					<span>상품안내</span>
					<strong>상조상품특징</strong>
				</div>
			</div> <!-- // conTitWrap -->
			<!-- 메뉴 영역 -->
			



<script type="text/javascript">
	$(function() {
		//메뉴 제어 
		var lnb = $(".pcLnbWrap ul li a");
		var menuId = "MN20100";
		var mbId = "MO20100";
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
							<li><a href="javascript:goMenu('../company/overview.jsp', '');">회사소개</a></li>
							<li><a href="javascript:goMenu('../info/pro_info.jsp', '');">상조상품안내</a></li>
							<li><a href="javascript:goMenu('../funeral/funeral_mark.jsp', '');">장례상품</a></li>
							<li><a href="javascript:goMenu('../marry/marry_mark.jsp', '');">웨딩상품</a></li>
							<li><a href="javascript:goMenu('../cruise/cruise_mark.jsp', '');">크루즈상품</a></li>
							<li><a href="javascript:goMenu('../notice/notice_list.jsp', '');">고객센터</a></li>
						</ul>
					</div>
					<div class="flexItem4"> <!-- .select 버튼 클릭시 다중클래스 on 추가 -->
						<strong><button type="button" class="select" id="subtitle">상조상품특징</button></strong>
						<ul>
							<li id="MO20100"><a href="javascript:goMenu('../info/pro_info.jsp', 'MO20100');">상조상품특징</a></li>
							<li id="MO20200"><a href="javascript:goMenu('../info/join_step.jsp', 'MO20200');">가입절차</a></li>
							<li id="MO20300"><a href="javascript:goMenu('../info/catalogue.jsp', 'MO20300');">웹카다로그</a></li>
							<li id="MO20400"><a href="javascript:goMenu('../info/end_pro.jsp', 'MO20400');">단종상품안내</a></li>
						</ul>
					</div>
								
				</nav>
			</div> <!-- // moLnbWrap -->

			<div class="pcLnbWrap">
				<nav>
					<ul class="pcLnb">
						<li id="MN20100"><a href="javascript:goMenu('../info/pro_info.jsp', 'MN20100');">상조상품특징</a></li>
						<li id="MN20200"><a href="javascript:goMenu('../info/join_step.jsp', 'MN20200');">가입절차</a></li>
						<li id="MN20300"><a href="javascript:goMenu('../info/catalogue.jsp', 'MN20300');">웹카다로그</a></li>
						<li id="MN20400"><a href="javascript:goMenu('../info/end_pro.jsp', 'MN20400');">단종상품안내</a></li>
					</ul>
				</nav>
			</div> <!-- // pcLnbWrap -->

			<!-- 메뉴 영역 -->

			<div id="pro_info" class="contents"> <!-- 페이지별 ID -->
				<div class="businessIntro">
					<h3 class="subTit">크리스찬상조부금이란?</h3>
				</div>
				
				<div class="businessUnit">
					<li class="unitTit">
						<div class="imgWrap">
							<p class="moImg"><img src="../public/img/conts/img_proinfo_mo01.png" alt="크리스찬상조부금이미지" /></p>
							<p class="pcImg"><img src="../public/img/conts/img_proinfo_pc01.png" alt="크리스찬상조부금이미지" /></p>
						</div>
						<div class="txtWrap">
							<strong>정성을 다하는 장의서비스</strong>
							<p>고객께서 미리 납입하시는 일정부금으로 가정의 행사를 미리 준비하여 활용할 수 있도록 만들어진 경제적 상품입니다.</p>
						</div>
					</li>
				</div>
				<br/><br/>
				<div class="businessIntro">
					<h3 class="subTit">크리스찬상조부금서비스 이용안내</h3>
					<p><strong>고객께서 미리 납입하시는 일정부금으로 가정의 행사를 미리 준비하여 활용할 수 있도록 만들어진 경제적 상품입니다.</strong></p>
				</div>
				<br/><br/>

				<strong class="blueTit">물가보상 효과에 따른 비용을 절약하실 수 있습니다.</strong>
				<ul class="defaultGrayDotList mt-10">
					<li>가입 후 10년이 지나 행사를 치르셔도 한 번 계약하신 상품의 계약금액, 상품내용은 변하지 않습니다.</li>
				</ul>
				<br/><br/>
				<strong class="blueTit">장기분납 제도로 경제적 부담이 없습니다.</strong>
				<ul class="defaultGrayDotList mt-10">
					<li>부담없는 월 불입금으로 크리스찬상조의 다양한 상품을 언제라도 이용하실 수 있습니다.</li>
					<li>만기 전 언제라도 이용하실 수 있으며, 만기완납 후에도 권리는 계속 보장됩니다.</li>
				</ul>
				<br/><br/>
				<strong class="blueTit">전국 네트워크망을 갖추고 있습니다.</strong>
				<ul class="defaultGrayDotList mt-10">
					<li>전국 어디서나 즉시 출동하여 행사를 진행해 드립니다.</li>
				</ul>
				<br/><br/>
				<strong class="blueTit">가족 중 한분만 가입하셔도 가입자의 명의에 상관없이 이용가능합니다.</strong>
				<ul class="defaultGrayDotList mt-10">
					<li>장례/웨딩 서비스는 회원의 요청으로 누구에게나 양도할 수 있고 양수인은 행사 발생시 사용할 수 있습니다.</li>
				</ul>
				<br/><br/>
				<strong class="blueTit">든든한 회사, 믿음이 가는 회사 - 크리스찬상조가 있습니다.</strong>
				<ul class="defaultGrayDotList mt-10">
					<li>크리스찬상조는 고객보호를 위한 안정장치로 공제 계약 등 상조회원 보호를 위한 모든 조치를 다하고 있습니다.</li>
				</ul>
				<br/><br/>
				<strong class="blueTit">만기후 100% 전액환급</strong>
				<ul class="defaultGrayDotList mt-10">
					<li>100회, 120회 만기완납 1년 후 회원 요청시 실납입금액의 전액을 환급해드리며, 60회차는 만기완납 5년 후 전액을 환급하여 드립니다. (2011년 1월 가입자부터 적용되며, 회원가입시 뒷면 약관에 명시하였습니다.)</li>
				</ul>
				<br/><br/>

			</div> <!-- // contents -->


		</div>
	</div> <!-- // contentsWrap -->

<!--#include file="../include/inc_footer.jsp"-->
<%@include file="../include/inc_footer.jsp"%>
