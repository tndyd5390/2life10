<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/view/include/inc_header.jsp"%>
<!--#include file="../include/inc_header.jsp"-->
<script type="text/javascript" src="/public/js/jquery-ui.min.js"></script>
<link type="text/css" rel="stylesheet" href="/public/css/jquery-ui.theme.min.css" />
	<div id="contentsWrap">
		<div class="container">
			<div class="conTitWrap">
				<h2>장례상품</h2>
				<div class="location">
					<span class="home">홈</span>
					<span>장례상품</span>
					<strong>장례상품</strong>
				</div>
			</div> <!-- // conTitWrap -->
			<!-- 메뉴 영역 -->

<script type="text/javascript">
	$(function() {
		//메뉴 제어 
		var lnb = $(".pcLnbWrap ul li a");
		var menuId = "MN30200";
		var mbId = "MO30200";
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
				return "<img src='/public/img/conts/funeral/"+img+".jpg' width='100%'>";
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
                        <strong><button type="button" class="select" id="subtitle">장례상품</button></strong>
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
						<button type="button">장례 260</button>
					</strong>
					<ul>
						<li class="tab01 active"><a href="/funeral/funeralList_a.do">장례 260</a></li>
						<li class="tab02"><a href="/funeral/funeralList_b.do">장례 390</a></li>
						<li class="tab03"><a href="/funeral/funeralList_c.do">장례 480</a></li>
						<li class="tab04"><a href="/funeral/funeralList_d.do">프라임(350)상품</a></li>
					</ul>
				</div>
				
				<header class="contInfoArea">
					<p class="img"><img src="../public/img/conts/img_pro_a_260.png" alt="장례 260 안내이미지" /></p>
					<div class="area">
						<h3 class="contTit"><span>장례260</span></h3>
						<p class="subTxt">월 26,000원 X 100회 (2,600,000원)</p>
						<ul class="defaultGrayDotList mt-10">
							<li>-캐딜락리무진 또는 장의버스 택일 (왕복200Km제공</li>
							<li>-수의, 관, 꽃바구니 2개 제공</li>
							<li>-장례지도사 3일간 장례 진행, 도우미 2명</li>
						</ul>
						<br/>
						<a href="/appli/appliForm.do" class="btnDefault">가입신청</a>
						<a href="/counsel/counselWrite.do" class="btnDefault">상담신청</a>
					</div>
				</header>

				<div class="tableBasicList">
					<table class="defaultTable">
						<caption>장례260</caption>
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
								<td rowspan="2">인력지원</td>
								<td colspan="2" data-photo="101">장례전문지도사 2명</td>
								<td class="alignL">장례진행의 제반절차를 예법에 따라 장례진행</td>
							</tr>
							<tr>
								<td colspan="2" data-photo="102">장례전문도우미 2명</td>
								<td class="alignL">장례기간 중 -> 10시간/1일 봉사<br/>-장례기간 중 총2명(총20시간)</td>
							</tr>
							<tr>
								<td rowspan="6">고인용품 및<br/>입관 수시용품</td>
								<td rowspan="2" data-photo="103">관</td>
								<td>화장시</td>
								<td class="alignL">오동나무 0.5치</td>
							</tr>
							<tr>
								<td>매장시</td>
								<td class="alignL">오동나무 1.5치</td>
							</tr>
							<tr>
								<td colspan="2" data-photo="104">수의</td>
								<td class="alignL">저마</td>
							</tr>
							<tr>
								<td colspan="2" data-photo="104">도포,원삼</td>
								<td class="alignL">저마</td>
							</tr>
							<tr>
								<td colspan="2" data-photo="105">멧베(탈관시)</td>
								<td class="alignL">탈관시 제공</td>
							</tr>
							<tr>
								<td colspan="2" data-photo="106">받침대, 베게, 수세포, 관보, 명정, 결관포,한지, 탈지면, 알코올, 예단, 습신, 보공 등</td>
								<td class="alignL">규격품 제공</td>
							</tr>
							<tr>
								<td>빈소용품</td>
								<td colspan="2" data-photo="107">액자리본,명패,양초,부의록</td>
								<td class="alignL">제공</td>
							</tr>
							<tr>
								<td>꽃장식</td>
								<td colspan="2" data-photo="108">영정 및 제단</td>
								<td class="alignL">꽃바구니2개</td>
							</tr>
							<tr>
								<td rowspan="8">의전용품<br/>(현대식/전통식 중 택일)</td>
								<td rowspan="3">현대식</td>
								<td data-photo="109">남상복 대여</td>
								<td class="alignL">3벌 (상,하의검정색 정장, Y셔츠, 넥타이포함)</td>
							</tr>
							<tr>
								<td data-photo="110">여성복 대여</td>
								<td class="alignL">10벌</td>
							</tr>
							<tr>
								<td data-photo="111">완장</td>
								<td class="alignL">필요량제공</td>
							</tr>
							<tr>
								<td rowspan="5">전통식</td>
								<td data-photo="112">굴건제복</td>
								<td class="alignL">직계상주 제공</td>
							</tr>
							<tr>
								<td data-photo="112">두루마기</td>
								<td class="alignL">10벌</td>
							</tr>
							<tr>
								<td data-photo="112">중단</td>
								<td class="alignL">10벌</td>
							</tr>
							<tr>
								<td data-photo="112">치마저고리</td>
								<td class="alignL">10벌</td>
							</tr>
							<tr>
								<td data-photo="112">두건,행전 등</td>
								<td class="alignL">필요량제공</td>
							</tr>
							<tr>
								<td>발인용품</td>
								<td colspan="2" data-photo="113">운구용장갑, 선도차리본</td>
								<td class="alignL">제공</td>
							</tr>
							<tr>
								<td>장의차량</td>
								<td colspan="2" data-photo="114">캐딜락리무진 또는 장의버스 중 택일</td>
								<td class="alignL">택일(왕복200Km이내)</td>
							</tr>
							<tr>
								<td rowspan="5">서비스</td>
								<td colspan="2" data-photo="115">고인운구 전용차량</td>
								<td class="alignL">24시간 앰블런스 대기(관내무료)</td>
							</tr>
							<tr>
								<td colspan="2" data-photo="116">예약</td>
								<td class="alignL">화장장 예약</td>
							</tr>
							<tr>
								<td colspan="2" data-photo="116">알선</td>
								<td class="alignL">납골,산역(장지행사)</td>
							</tr>
							<tr>
								<td colspan="2" data-photo="116">화장지원</td>
								<td class="alignL">납골당의뢰시 할인 및 유골함 제공</td>
							</tr>
							<tr>
								<td colspan="2" data-photo="116">행정안내</td>
								<td class="alignL">각종행정절차안내<br/>필요한서류 안내</td>
							</tr>
						</tbody>
					</table>
				</div>
							<article class="businessUnit">
					<ul>
						<li class="unit01">
							<div class="imgWrap"><img src="/public/img/conts/fu_img_01.jpg" alt="장례전문지도사" /></div>
							<div class="txtWrap">
								<strong>장례전문지도사</strong>
							</div>
						</li>
						<li class="unit02">
							<div class="imgWrap"><img src="/public/img/conts/fu_img_02.jpg" alt="오동나무관" /></div>
							<div class="txtWrap">
								<strong>오동나무관</strong>
							</div>
						</li>
						<li class="unit03">
							<div class="imgWrap"><img src="/public/img/conts/fu_img_03.jpg" alt="수의" /></div>
							<div class="txtWrap">
								<strong>수의</strong>
							</div>
						</li>
					</ul>
				</article> <!-- // businessUnit -->

				<article class="businessUnit">
					<ul>
						<li class="unit01">
							<div class="imgWrap"><img src="/public/img/conts/fu_img_04.jpg" alt="멧베" /></div>
							<div class="txtWrap">
								<strong>멧베</strong>
							</div>
						</li>
						<li class="unit02">
							<div class="imgWrap"><img src="/public/img/conts/fu_img_05.jpg" alt="현대식의전복" /></div>
							<div class="txtWrap">
								<strong>현대식의전복</strong>
							</div>
						</li>
						<li class="unit03">
							<div class="imgWrap"><img src="/public/img/conts/fu_img_06.jpg" alt="전통식의전복" /></div>
							<div class="txtWrap">
								<strong>전통식의전복</strong>
							</div>
						</li>
					</ul>
				</article> <!-- // businessUnit -->

				<article class="businessUnit">
					<ul>
						<li class="unit01">
							<div class="imgWrap"><img src="/public/img/conts/fu_img_07.jpg" alt="발인용품" /></div>
							<div class="txtWrap">
								<strong>발인용품</strong>
							</div>
						</li>
						<li class="unit02">
							<div class="imgWrap"><img src="/public/img/conts/fu_img_08.jpg" alt="빈소용품" /></div>
							<div class="txtWrap">
								<strong>빈소용품</strong>
							</div>
						</li>
						<li class="unit03">
							<div class="imgWrap"><img src="/public/img/conts/fu_img_09.jpg" alt="헌화" /></div>
							<div class="txtWrap">
								<strong>헌화</strong>
							</div>
						</li>
					</ul>
				</article> <!-- // businessUnit -->

				<article class="businessUnit">
					<ul>
						<li class="unit01">
							<div class="imgWrap"><img src="/public/img/conts/fu_img_10.jpg" alt="꽃바구니" /></div>
							<div class="txtWrap">
								<strong>꽃바구니</strong>
							</div>
						</li>
						<li class="unit02">
							<div class="imgWrap"><img src="/public/img/conts/fu_img_11.jpg" alt="캐디락리무진,장의버스" /></div>
							<div class="txtWrap">
								<strong>캐디락리무진,장의버스</strong>
							</div>
						</li>
						<li class="unit03">
							<div class="imgWrap"><img src="/public/img/conts/fu_img_12.jpg" alt="고인운구전용차량" /></div>
							<div class="txtWrap">
								<strong>고인운구전용차량</strong>
							</div>
						</li>
					</ul>
				</article> <!-- // businessUnit -->

			</div> <!-- // contents -->


		</div>
	</div> <!-- // contentsWrap -->

<!--#include file="../include/inc_footer.jsp"-->
<%@include file="../include/inc_footer.jsp"%>
