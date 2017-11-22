<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../include/inc_header.jsp"%>
<!--#include file="../include/inc_header.jsp"-->

	<div id="contentsWrap">
		<div class="container">
			<div class="conTitWrap">
				<h2>크루즈일정</h2>
				<div class="location">
					<span class="home">홈</span>
					<span>크루즈상품</span>
					<strong>크루즈일정</strong>
				</div>
			</div> <!-- // conTitWrap -->
			<!-- 메뉴 영역 -->
			



<script type="text/javascript">
	$(function() {
		//메뉴 제어 
		var lnb = $(".pcLnbWrap ul li a");
		var menuId = "MN50300";
		var mbId = "MO50300";
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

			<div id="cruise_sch" class="contents"> <!-- 페이지별 ID -->

				<section>
					<h3 class="contTit">
						<span>선사</span>
						로얄캐리비안 마리너호
					</h3>
					<div class="dashList">
					    <ul>
                            <li>날짜 : 2018년 3월 11일 (일) ~ 2018년 3월 16일 (금) </li>
                            <li>상품 : 동남아 크루즈 4박 6일 (싱가포르, 말레이시아, 태국)</li>
                            <li>인원 : 1명</li>
                            <li>캐빈 : 내측</li>
                            <li>비고 : 불포함사항 : 기타부대비용 및 선상팁</li>
                        </ul>
                    </div>
					<div class="imgWrap">
					    <img src="../public/img/conts/img_c_01.png" alt="크루즈이미지" />
					    <div class="btn_area">
					        <button type="button" class="btnSearch">일정다운로드</button>
                        </div>
					</div>
				</section>

				<section>
					<h3 class="contTit">
						<span>선사</span>
						로얄캐리비안 마리너호
					</h3>
					<div class="dashList">
                        <ul>
                            <li>날짜 : 2018년 3월 11일 (일) ~ 2018년 3월 16일 (금) </li>
                            <li>상품 : 동남아 크루즈 4박 6일 (싱가포르, 말레이시아, 태국)</li>
                            <li>인원 : 1명</li>
                            <li>선사 : 로얄캐리비안 마리너호</li>
                            <li>캐빈 : 내측</li>
                            <li>비고 : 불포함사항 : 기타부대비용 및 선상팁</li>
                        </ul>
                    </div>
					<div class="imgWrap">
					    <img src="../public/img/conts/img_c_02.png" alt="크루즈이미지" />
					    <div class="btn_area">
                            <button type="button" class="btnSearch">일정다운로드</button>
                        </div>
                    </div>
				</section>

				<section>
					<h3 class="contTit">
						<span>선사</span>
						로얄캐리비안 마리너호
					</h3>
					<div class="dashList">
                        <ul>
                            <li>날짜 : 2018년 3월 11일 (일) ~ 2018년 3월 16일 (금) </li>
                            <li>상품 : 동남아 크루즈 4박 6일 (싱가포르, 말레이시아, 태국)</li>
                            <li>인원 : 1명</li>
                            <li>캐빈 : 내측</li>
                            <li>비고 : 불포함사항 : 기타부대비용 및 선상팁</li>
                        </ul>
                    </div>
					<div class="imgWrap">
					    <img src="../public/img/conts/img_c_03.png" alt="크루즈이미지" />
					    <div class="btn_area">
                            <button type="button" class="btnSearch">일정다운로드</button>
                        </div>
                    </div>
				</section>

				<br/><br/>
				<!-- pageArea -->
				<div class="pageArea">
					<a href='#none' class='btnFirst'><span>처음</span></a> <a href='#' class='btnPrev'><span>이전</span></a><strong>1</strong><a href="javascript:goPage('2','15')" >2</a><a href="javascript:goPage('3','15')" >3</a><a href="javascript:goPage('4','15')" >4</a><a href="javascript:goPage('5','15')" >5</a><a href="javascript:goPage('2','15')" class='btnNext'><span>다음</span></a> <a href="javascript:goPage('19','15')" class='btnLast'><span>마지막</span></a>
				</div>
				<!-- // pageArea -->

			</div> <!-- // contents -->


		</div>
	</div> <!-- // contentsWrap -->

<!--#include file="../include/inc_footer.jsp"-->
<%@include file="../include/inc_footer.jsp"%>
