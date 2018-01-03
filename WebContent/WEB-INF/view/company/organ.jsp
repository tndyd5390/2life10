<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/view/include/inc_header.jsp"%>
<!--#include file="../include/inc_header.jsp"-->

	<div id="contentsWrap">
		<div class="container">
			<div class="conTitWrap">
				<h2>조직도및연혁</h2>
				<div class="location">
					<span class="home">홈</span>
					<span>회사소개</span>
					<strong>조직도및연혁</strong>
				</div>
			</div> <!-- // conTitWrap -->
			<!-- 메뉴 영역 -->
			



<script type="text/javascript">
	$(function() {
		//메뉴 제어 
		var lnb = $(".pcLnbWrap ul li a");
		var menuId = "MN10200";
		var mbId = "MO10200";
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
						<strong><button type="button" class="select" id="subtitle">조직도및연혁</button></strong>
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

			<div id="organ" class="contents"> <!-- 페이지별 ID -->
				<div class="defaultTab">
					<strong class="select">
						<button type="button">전체</button>
					</strong>
					<ul>
						<li class="tab01 active"><a href="javascript:"><span class="bck">2017 ~ 2012</span></a></li>
						<li class="tab02"><a href="javascript:"><span class="bck">2011 ~ 2006</span></a></li>
					</ul>
				</div>

				<div class="defaultTabCon">
					<!-- 2017 ~2012 -->
					<article>
						<section>
							<h3 class="contTit">크리스찬상조(주) 새로운 도전</h3>
							<p>2017년 크리스찬상조가 새로운 도전을 시작합니다.</p>
						</section>
						<ul class="history">
							<li>
								<strong class="year">2015</strong>
								<ul class="details">
									<li>
										<strong class="month">02월</strong>
										<ul>
											<li>N+ 교회사역연구소 세미나 후원제휴</li>
										</ul>
									</li>
								</ul>
							</li>
							<li>
								<strong class="year">2014</strong>
								<ul class="details">
									<li>
										<strong class="month">01월</strong>
										<ul>
											<li>성경암송학교 세미나 후원</li>
										</ul>
									</li>
									<li>
										<strong class="month">04월</strong>
										<ul>
											<li>MD전도사관학교 세미나 후원</li>
										</ul>
									</li>
									<li>
										<strong class="month">06월</strong>
										<ul>
											<li>도형전도학교 세미나 후원</li>
										</ul>
									</li>
									<li>
										<strong class="month">07월</strong>
										<ul>
											<li>한국컴패션 정식 후원업체</li>
										</ul>
									</li>
									<li>
										<strong class="month">09월</strong>
										<ul>
											<li>부흥한국 전도 컴퍼런스 후원 업무제휴</li>
										</ul>
									</li>
									<li>
										<strong class="month">11월</strong>
										<ul>
											<li>한국소그룹목회연구소 세미나 후원</li>
										</ul>
									</li>
								</ul>
							</li>
							<li>
								<strong class="year">2013</strong>
								<ul class="details">
									<li>
										<strong class="month">02월</strong>
										<ul>
											<li>한국셀목회코칭연구소 업무제휴</li>
										</ul>
									</li>
									<li>
										<strong class="month">08월</strong>
										<ul>
											<li>JOY관계전도&변증전도 세미나 후원</li>
										</ul>
									</li>
									<li>
										<strong class="month">05월</strong>
										<ul>
											<li>아파트전도잔략연구소 세미나 후원</li>
										</ul>
									</li>
									<li>
										<strong class="month">11월</strong>
										<ul>
											<li>예심전도훈련원 세미나 후원</li>
										</ul>
									</li>
								</ul>
							</li>
							<li>
								<strong class="year">2012</strong>
								<ul class="details">
									<li>
										<strong class="month">07월</strong>
										<ul>
											<li>교회사역개발원 세미나 후원제휴</li>
											<li>두리하나선교원 후원</li>
										</ul>
									</li>
								</ul>
							</li>
						</ul>
					</article>
					<!-- 2011 ~2006 -->
					<article>
						<section>
							<h3 class="contTit">크리스찬라이프 새로운 도전</h3>
							<p>2017년 크리스찬라이프가 새로운 도전을 시작합니다.</p>
						</section>
						<ul class="history">	
							<li>
								<strong class="year">2011</strong>
								<ul class="details">
									<li>
										<strong class="month">02월</strong>
										<ul>
											<li>순복음강남교회 장례업무 협약체결</li>
										</ul>
									</li>
									<li>
										<strong class="month">03월</strong>
										<ul>
											<li>영남본부설립</li>
										</ul>
									</li>
								</ul>
							</li>
							<li>
								<strong class="year">2010</strong>
								<ul class="details">
									<li>
										<strong class="month">03월</strong>
										<ul>
											<li>전국 GA영업실시</li>
										</ul>
									</li>
									<li>
										<strong class="month">04월</strong>
										<ul>
											<li>한국상조공제조합 출자사로 참여</li>
										</ul>
									</li>
									<li>
										<strong class="month">09월</strong>
										<ul>
											<li>한국상조공제조합 정부인가 및 승인/가입</li>
										</ul>
									</li>
									<li>
										<strong class="month">11월</strong>
										<ul>
											<li>선불식 할부거래업등록</li>
										</ul>
									</li>
								</ul>
							</li>
							<li>
								<strong class="year">2009</strong>
								<ul class="details">
									<li>
										<strong class="month">04월</strong>
										<ul>
											<li>웨딩사업부발족 및 사업개시</li>
										</ul>
									</li>
									<li>
										<strong class="month">05월</strong>
										<ul>
											<li>전주지사설립</li>
										</ul>
									</li>
									<li>
										<strong class="month">11월</strong>
										<ul>
											<li>의정부지사설립</li>
										</ul>
									</li>
								</ul>
							</li>
							<li>
								<strong class="year">2008</strong>
								<ul class="details">
									<li>
										<strong class="month">04월</strong>
										<ul>
											<li>CTS 기독교 TV, CBS TV 광고 실시</li>
										</ul>
									</li>
									<li>
										<strong class="month">05월</strong>
										<ul>
											<li>극동방송 라디오광고 실시, 광주지사설립</li>
										</ul>
									</li>
									<li>
										<strong class="month">06월</strong>
										<ul>
											<li>대전지사설립, 여행사업부발족 및 사업개시</li>
										</ul>
									</li>
									<li>
										<strong class="month">07월</strong>
										<ul>
											<li>동서울지사설립</li>
										</ul>
									</li>
									<li>
										<strong class="month">08월</strong>
										<ul>
											<li>분당지사설립</li>
										</ul>
									</li>
									<li>
										<strong class="month">10월</strong>
										<ul>
											<li>목포지사설립</li>
										</ul>
									</li>
									<li>
										<strong class="month">11월</strong>
										<ul>
											<li>문경지사설립</li>
										</ul>
									</li>
								</ul>
							</li>
							<li>
								<strong class="year">2007</strong>
								<ul class="details">
									<li>
										<strong class="month">12월</strong>
										<ul>
											<li>공정거래위원회 표준약관사용</li>
										</ul>
									</li>
								</ul>
							</li>
							<li>
								<strong class="year">2006</strong>
								<ul class="details">
									<li>
										<strong class="month">05월</strong>
										<ul>
											<li>크리스찬상조설립 및 사업개시</li>
										</ul>
									</li>
									<li>
										<strong class="month">06월</strong>
										<ul>
											<li>금융결제원 CMS 자도이체실시</li>
										</ul>
									</li>
									<li>
										<strong class="month">07월</strong>
										<ul>
											<li>전산시스템 구축</li>
										</ul>
									</li>
								</ul>
							</li>
						</ul>
					</article>
				</div>
				<br/><br/>
				<section>
					<h3 class="contTit">조직도</h3>
				</section>
				<div class="businessUnit">
					<li class="unitTit">
						<div class="imgWrap">
							<p class="moImg"><img src="../public/img/conts/img_org_mo.jpg" alt="조직도 이미지" /></p>
							<p class="pcImg"><img src="../public/img/conts/img_org_pc.jpg" alt="조직도 이미지" /></p>
						</div>
					</li>
				</div>


			</div> <!-- // contents -->


		</div>
	</div> <!-- // contentsWrap -->

<!--#include file="../include/inc_footer.jsp"-->
<%@include file="/WEB-INF/view/include/inc_footer.jsp"%>
