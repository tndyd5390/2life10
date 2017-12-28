<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include/inc_header.jsp" %>
<script type="text/javascript" src="/public/js/jquery-ui.min.js"></script>
<link type="text/css" rel="stylesheet" href="/public/css/jquery-ui.theme.min.css" />

	<div id="contentsWrap">
		<div class="container">
			<div class="conTitWrap">
				<h2>웨딩상품</h2>
				<div class="location">
					<span class="home">홈</span>
					<span>웨딩상품</span>
					<strong>웨딩상품</strong>
				</div>
			</div> <!-- // conTitWrap -->
			<!-- 메뉴 영역 -->
			



<script type="text/javascript">
	$(function() {
		//메뉴 제어 
		var lnb = $(".pcLnbWrap ul li a");
		var menuId = "MN40200";
		var mbId = "MO40200";
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
		
		$(document).tooltip({
			items:'[data-photo]',
			tooltipClass : "my-tooltip",
			content:function(){
				var img = $(this).data('photo');
				return "<img src='/public/img/conts/marry/"+img+".jpg' width='100%'>";
			}
		})
		$(".ui-helper-hidden-accessible").hide();
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
                        <strong><button type="button" class="select" id="subtitle">웨딩상품</button></strong>
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
                            <li id="MO40100"><a href="javascript:goMenu('/marry/marryMark.do', 'MN40100');">웨딩상품특징</a></li>
                            <li id="MO40200"><a href="javascript:goMenu('/marry/marryList_d.do', 'MN40200');">웨딩상품</a></li>
                    </ul>
                </nav>
            </div> <!-- // pcLnbWrap -->

			<!-- 메뉴 영역 -->

			<div id="pro_info" class="contents"> <!-- 페이지별 ID -->

				<div class="defaultTab">
				    <strong class="select">
                        <button type="button">프라임(350)상품</button>
                    </strong>
					<ul>
						<li class="tab04 active"><a href="javascript:goMenu('/marry/marryList_d.do', 'MN40200');">프라임(350)상품</a></li>
						<li class="tab01"><a href="javascript:goMenu('/marry/marryList_a.do', 'MN40200');">웨딩240</a></li>
						<li class="tab02"><a href="javascript:goMenu('/marry/marryList_b.do', 'MN40200');">웨딩360</a></li>
						<li class="tab03"><a href="javascript:goMenu('/marry/marryList_c.do', 'MN40200');">웨딩480</a></li>
					</ul>
				</div>
				
				<header class="contInfoArea">
					<p class="img"><img src="/public/img/conts/img_pro_b_p350.png" alt="프라임(350)상품 안내이미지" /></p>
					<div class="area">
						<h3 class="contTit"><span>프라임(350)상품</span></h3>
						<p class="subTxt">월 35,000원 X 100회 (3,500,000원)</p>
						<ul class="defaultGrayDotList mt-10">
							<li>새로이 시작하는 아름다운 순간!</li>
							<li>크리스찬상조 웨딩사업부가 행복한 추억을 간직할 수 있도록 도와드리겠습니다.</li>
							<li>리허설촬영 및 본식진행 시 웨딩드레스 및 스튜디오 등</li>
						</ul>
						<br/>
						<a href="/appli/appliForm.do" class="btnDefault">가입신청</a>
						<a href="/counsel/counselWrite.do" class="btnDefault">상담신청</a>
						
					</div>
				</header>

				<div class="tableBasicList">
					<table class="defaultTable">
						<caption>장례240</caption>
						<colgroup>
							<col style="width:18%;" />
							<col style="width:12%;" />
							<col style="width:18%;" />
							<col style="width:auto%;" />
						</colgroup>
						<thead>
							<tr>
								<th scope="col">구분</th>
								<th scope="col" colspan="2">상품</th>
								<th scope="col">내용</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>환급서비스</td>
								<td colspan="2">만기환급률 100%</td>
								<td class="alignL">만기완납 1년후 헤약시 실납입금액 100%환급</td>
							</tr>
							<tr>
								<td>인력지원</td>
								<td colspan="2" data-photo="101">웨딩플래너 1명</td>
								<td class="alignL">전문 웨딩플래너를 통해 웨딩계획과 업체선정에 도움을 드립니다.</td>
							</tr>
							<tr>
								<td rowspan="5">리허설촬영</td>
								<td colspan="2" data-photo="102">신부드레스</td>
								<td class="alignL">메인드레스2벌, 파티복1벌</td>
							</tr>
							<tr>
								<td colspan="2" data-photo="103">신랑예복</td>
								<td class="alignL">제공(대여)</td>
							</tr>
							<tr>
								<td colspan="2" data-photo="104">사진</td>
								<td class="alignL">11R20P 앨범1권</td>
							</tr>
							<tr>
								<td colspan="2" data-photo="105">액자</td>
								<td class="alignL">20R 액자1개, 9관 갤러리 액자</td>
							</tr>
							<tr>
								<td colspan="2" data-photo="106">헤어/메이크업</td>
								<td class="alignL">제공(신랑/신부)</td>
							</tr>
							<tr>
								<td rowspan="9">웨딩본식</td>
								<td colspan="2" data-photo="107">신부드레스</td>
								<td class="alignL">제공(대여)</td>
							</tr>
							<tr>
								<td colspan="2" data-photo="108">신랑예복</td>
								<td class="alignL">제공(대여)</td>
							</tr>
							<tr>
								<td rowspan="3">사진</td>
								<td data-photo="104">신랑신부</td>
								<td class="alignL">11R30P 앨범1권</td>
							</tr>
							<tr>
								<td data-photo="104">신랑혼주</td>
								<td class="alignL">11R10P 앨범1권</td>
							</tr>
							<tr>
								<td data-photo="104">신부혼주</td>
								<td class="alignL">11R10P 앨범1권</td>
							</tr>
							<tr>
								<td colspan="2" data-photo="106">헤어/메이크업</td>
								<td class="alignL">제공(신랑/신부)</td>
							</tr>
							<tr>
								<td colspan="2" data-photo="109">부케</td>
								<td class="alignL">부케/부토니아/코사지</td>
							</tr>
							<tr>
								<td colspan="2" data-photo="110">폐백의상</td>
								<td class="alignL">제공(대여)</td>
							</tr>
							<tr>
								<td colspan="2" data-photo="111">혼구용품</td>
								<td class="alignL">혼인서약서, 성혼선언문, 방명록, 축지, 장갑 등</td>
							</tr>
						</tbody>
					</table>
				</div>
				<br/><br/>
				<strong class="blueTit">참고사항</strong>
				<article>
					<section>
						<ul class="nonumList">
							<li>주례, 폐백음식, 청접장 및 예식 도우미 비용은 별도입니다.</li>
							<li>납입도중 행사발생시 나머지 부금액을 행사 종료와 동시에 완납해야 합니다.
							<br/>(단, 웨딩상품이용시 총 납입금이 50회미만일 경우 중도금(계약금)이 발생됩니다. )</li>
							<li>상품 중, 일부 품목을 회원님께서 개인으로 준비 또는 개인사정으로 사용할 수 없는 상품에 대하여 현금으로 반환되지 않습니다.</li>
							<li>지역의 특성과 문화에 따라 상품의 내용에 차이가 있을 수 있으며, 같은 가격대에서 다른 상품으로 호환이 가능합니다.</li>
							<li>각 상품은 드레스, 스튜디오, 및 메이크업 등 업체의 차이가 있습니다.</li>
							<li>사진/앨범의 담위 : 5R은 5X7인치, 8R은 8X10인치, 11R은 11X14인치, 20R은 20X24인치이며, P는 페이지 약자입니다.</li>
						</ul>
					</section>
				</article>

			</div> <!-- // contents -->


		</div>
	</div> <!-- // contentsWrap -->

<%@ include file="/WEB-INF/view/include/inc_footer.jsp" %>