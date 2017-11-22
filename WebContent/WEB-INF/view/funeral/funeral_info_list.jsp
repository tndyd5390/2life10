<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../include/inc_header.jsp"%>
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
						<strong><button type="button" class="select">장례상품</button></strong>
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
							<li id="MO10100"><a href="javascript:goMenu('../funeral/funeral_mark.jsp', 'MO10100');">장례상품특징</a></li>
							<li id="MO11100"><a href="javascript:goMenu('../funeral/funeral_list_a.jsp', 'MO11100');">장례상품</a></li>
							<li id="MO10200"><a href="javascript:goMenu('../funeral/funeral_info_a.jsp', 'MO10200');">장례정보</a></li>
							<li id="MO10300"><a href="javascript:goMenu('../funeral/funeral_notice.jsp', 'MO10300');">부고알림</a></li>
						</ul>
					</div>
								
				</nav>
			</div> <!-- // moLnbWrap -->

			<div class="pcLnbWrap">
				<nav>
					<ul class="pcLnb">
						<li id="MO10100"><a href="javascript:goMenu('../funeral/funeral_mark.jsp', '');">장례상품특징</a></li>
						<li id="MO11100"><a href="javascript:goMenu('../funeral/funeral_list_a.jsp', '');">장례상품</a></li>
						<li id="MO10200"><a href="javascript:goMenu('../funeral/funeral_info_a.jsp', '');">장례정보</a></li>
						<li id="MO10300"><a href="javascript:goMenu('../funeral/funeral_notice.jsp', '');">부고알림</a></li>
					</ul>
				</nav>
			</div> <!-- // pcLnbWrap -->

			<!-- 메뉴 영역 -->

			<div id="pro_info" class="contents"> <!-- 페이지별 ID -->

				<div class="defaultTab">
				    <strong class="select">
                        <button type="button">전국장례시설안내</button>
                    </strong>
					<ul>
						<li class="tab01"><a href="javascript:goMenu('../funeral/funeral_info_a.jsp', 'MN30300');">기독교장례 및 추도예매</a></li>
                        <li class="tab02"><a href="javascript:goMenu('../funeral/funeral_info_b.jsp', 'MN30300');">장례구비서류 및 행정절차</a></li>
                        <li class="tab03 active"><a href="javascript:goMenu('../funeral/funeral_info_list.jsp', 'MN30300');">전국장례시설안내</a></li>
                        <li class="tab04"><a href="javascript:goMenu('../funeral/funeral_info_c.jsp', 'MN30300');">관련사이트</a></li>
					</ul>
				</div>

				<div class="boardType2">
					<table summary="">
						<caption></caption>
						<colgroup>
							<col width="100%">
						</colgroup>
						<tbody>
							<tr>
								<td>
									<select id="telAbleEndTime" name="telAbleEndTime" title="" class="inputType3">
										<option value="00">지역명</option>
										<option value="01">서울</option>
										<option value="02">경기</option>
									</select>
									<select id="telAbleEndTime" name="telAbleEndTime" title="" class="inputType5">
										<option value="00">식장명</option>
										<option value="01">병원 장례식장</option>
										<option value="02">전문 장례식장</option>
									</select>

									<a href="#" class="btn_active_small">검색</a>
								</td>
							</tr>
						</tbody>
					</table>
                </div>
				<br/><br/>

				<div class="businessIntro">
					<h3 class="subTit">전국 장례시설 안내</h3>
				</div>
				<br/>
				
				<div class="tableBasicList">
					<table class="defaultTable">
						<caption></caption>
						<colgroup>
							<col style="width:10%;">
							<col style="width:16%;">
							<col style="width:20%;">
							<col style="width:auto%;">
							<col style="width:20%;">
						</colgroup>
						<thead>
							<tr>
								<th scope="row">번호</th>
								<th scope="row">구분</th>
								<th scope="row">식장명</th>
								<th scope="row">지역(식장주소)</th>
								<th scope="row">전화번호</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>319</td>
								<td>병원 장례식장</td>
								<td>성모병원</td>
								<td>경남 김해시 삼정동 615-6</td>
								<td>055-336-4475</td>
							</tr>
							<tr>
								<td>319</td>
								<td>병원 장례식장</td>
								<td>성모병원</td>
								<td>경남 김해시 삼정동 615-6</td>
								<td>055-336-4475</td>
							</tr>
							<tr>
								<td>319</td>
								<td>병원 장례식장</td>
								<td>성모병원</td>
								<td>경남 김해시 삼정동 615-6</td>
								<td>055-336-4475</td>
							</tr>
							<tr>
								<td>319</td>
								<td>병원 장례식장</td>
								<td>성모병원</td>
								<td>경남 김해시 삼정동 615-6</td>
								<td>055-336-4475</td>
							</tr>
							<tr>
								<td>319</td>
								<td>병원 장례식장</td>
								<td>성모병원</td>
								<td>경남 김해시 삼정동 615-6</td>
								<td>055-336-4475</td>
							</tr>
							<tr>
								<td>319</td>
								<td>병원 장례식장</td>
								<td>성모병원</td>
								<td>경남 김해시 삼정동 615-6</td>
								<td>055-336-4475</td>
							</tr>
							<tr>
								<td>319</td>
								<td>병원 장례식장</td>
								<td>성모병원</td>
								<td>경남 김해시 삼정동 615-6</td>
								<td>055-336-4475</td>
							</tr>
							<tr>
								<td>319</td>
								<td>병원 장례식장</td>
								<td>성모병원</td>
								<td>경남 김해시 삼정동 615-6</td>
								<td>055-336-4475</td>
							</tr>
							<tr>
								<td>319</td>
								<td>병원 장례식장</td>
								<td>성모병원</td>
								<td>경남 김해시 삼정동 615-6</td>
								<td>055-336-4475</td>
							</tr>
							<tr>
								<td>319</td>
								<td>병원 장례식장</td>
								<td>성모병원</td>
								<td>경남 김해시 삼정동 615-6</td>
								<td>055-336-4475</td>
							</tr>
						</tbody>
					</table>
				</div>

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
