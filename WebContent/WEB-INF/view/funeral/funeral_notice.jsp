<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../include/inc_header.jsp"%>
<!--#include file="../include/inc_header.jsp"-->

	<div id="contentsWrap">
		<div class="container">
			<div class="conTitWrap">
				<h2>부고알림</h2>
				<div class="location">
					<span class="home">홈</span>
					<span>장례상품</span>
					<strong>부고알림</strong>
				</div>
			</div> <!-- // conTitWrap -->
			<!-- 메뉴 영역 -->
			



<script type="text/javascript">
	$(function() {
		//메뉴 제어 
		var lnb = $(".pcLnbWrap ul li a");
		var menuId = "MN30400";
		var mbId = "MO30400";
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
							<li><a href="javascript:goMenu('../company/overview.jsp', '');">회사소개</a></li>
							<li><a href="javascript:goMenu('../info/pro_info.jsp', '');">상조상품안내</a></li>
							<li><a href="javascript:goMenu('../funeral/funeral_mark.jsp', '');">장례상품</a></li>
							<li><a href="javascript:goMenu('../marry/marry_mark.jsp', '');">웨딩상품</a></li>
							<li><a href="javascript:goMenu('../cruise/cruise_mark.jsp', '');">크루즈상품</a></li>
							<li><a href="javascript:goMenu('../notice/notice_list.jsp', '');">고객센터</a></li>
						</ul>
					</div>
					<div class="flexItem4"> <!-- .select 버튼 클릭시 다중클래스 on 추가 -->
						<strong><button type="button" class="select" id="subtitle">부고알림</button></strong>
						<ul>
							<li id="MO30100"><a href="javascript:goMenu('../funeral/funeral_mark.jsp', 'MO30100');">장례상품특징</a></li>
							<li id="MO30200"><a href="javascript:goMenu('../funeral/funeral_list_a.jsp', 'MO30200');">장례상품</a></li>
							<li id="MO30300"><a href="javascript:goMenu('../funeral/funeral_info_a.jsp', 'MO30300');">장례정보</a></li>
							<li id="MO30400"><a href="javascript:goMenu('../funeral/funeral_notice.jsp', 'MO30400');">부고알림</a></li>
						</ul>
					</div>
								
				</nav>
			</div> <!-- // moLnbWrap -->

			<div class="pcLnbWrap">
				<nav>
					<ul class="pcLnb">
						<li id="MN30100"><a href="javascript:goMenu('../funeral/funeral_mark.jsp', 'MN30100');">장례상품특징</a></li>
						<li id="MN30200"><a href="javascript:goMenu('../funeral/funeral_list_a.jsp', 'MN30200');">장례상품</a></li>
						<li id="MN30300"><a href="javascript:goMenu('../funeral/funeral_info_a.jsp', 'MN30300');">장례정보</a></li>
						<li id="MN30400"><a href="javascript:goMenu('../funeral/funeral_notice.jsp', 'MN30400');">부고알림</a></li>
					</ul>
				</nav>
			</div> <!-- // pcLnbWrap -->

			<!-- 메뉴 영역 -->

			<div class="contents"> <!-- 페이지별 ID none -->
				<h3 class="smallTit">부고알림</h3>
				
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
										<option value="00">전체</option>
										<option value="01">소천인</option>
										<option value="02">회원명</option>
									</select>
									<input type="text" name="name" value="" title="" class="inputType1" style="" maxlength="25">

									<a href="#" class="btn_active_small">검색</a>
								</td>
							</tr>
						</tbody>
					</table>
                </div>

				<br/><br/>
				<ul class="boradType4">
					<li>
						<p class="num">부고</p>
						<div class="info">
							<p class="txt">회원 이설희</p>
							<p class="txt1"><!-- 박성진수정 -->
								<a href="javascript:selectBoardDtl('480')">박춘심님 소천</a>
							</p>
							<p class="txt2">
								소천일<span class="bar">&nbsp;:</span>
								<span>2017-11-09</span>
							</p>
						</div>
					</li>
					<li>
						<p class="num">부고</p>
						<div class="info">
							<p class="txt">회원 이설희</p>
							<p class="txt1"><!-- 박성진수정 -->
								<a href="javascript:selectBoardDtl('480')">박춘심님 소천</a>
							</p>
							<p class="txt2">
								소천일<span class="bar">&nbsp;:</span>
								<span>2017-11-09</span>
							</p>
						</div>
					</li>
					<li>
						<p class="num">부고</p>
						<div class="info">
							<p class="txt">회원 이설희</p>
							<p class="txt1"><!-- 박성진수정 -->
								<a href="javascript:selectBoardDtl('480')">박춘심님 소천</a>
							</p>
							<p class="txt2">
								소천일<span class="bar">&nbsp;:</span>
								<span>2017-11-09</span>
							</p>
						</div>
					</li>
					<li>
						<p class="num">부고</p>
						<div class="info">
							<p class="txt">회원 이설희</p>
							<p class="txt1"><!-- 박성진수정 -->
								<a href="javascript:selectBoardDtl('480')">박춘심님 소천</a>
							</p>
							<p class="txt2">
								소천일<span class="bar">&nbsp;:</span>
								<span>2017-11-09</span>
							</p>
						</div>
					</li>
					<li>
						<p class="num">부고</p>
						<div class="info">
							<p class="txt">회원 이설희</p>
							<p class="txt1"><!-- 박성진수정 -->
								<a href="javascript:selectBoardDtl('480')">박춘심님 소천</a>
							</p>
							<p class="txt2">
								소천일<span class="bar">&nbsp;:</span>
								<span>2017-11-09</span>
							</p>
						</div>
					</li>
				</ul>



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
