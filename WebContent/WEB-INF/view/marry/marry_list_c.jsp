<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="../include/inc_header.jsp" %>

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
							<li><a href="javascript:goMenu('../company/overview.jsp', '');">회사안내</a></li>
							<li><a href="javascript:goMenu('../info/pro_info.jsp', '');">상조상품안내</a></li>
							<li><a href="javascript:goMenu('../funeral/funeral_mark.jsp', '');">장례상품</a></li>
							<li><a href="javascript:goMenu('../marry/marry_mark.jsp', '');">웨딩상품</a></li>
							<li><a href="javascript:goMenu('../cruise/cruise_mark.jsp', '');">크루즈상품</a></li>
							<li><a href="javascript:goMenu('../notice/notice_list.jsp', '');">고객센터</a></li>
						</ul>
					</div>
                    <div class="flexItem4"> <!-- .select 버튼 클릭시 다중클래스 on 추가 -->
                        <strong><button type="button" class="select" id="subtitle">웨딩상품</button></strong>
                        <ul>
                            <li id="MO40100"><a href="javascript:goMenu('../marry/marry_mark.jsp', 'MN40100');">웨딩상품특징</a></li>
                            <li id="MO40200"><a href="javascript:goMenu('../marry/marry_list_d.jsp', 'MN40200');">웨딩상품</a></li>
                        </ul>
                    </div>

                </nav>
            </div> <!-- // moLnbWrap -->

            <div class="pcLnbWrap">
                <nav>
                    <ul class="pcLnb">
                        <li id="MN40100"><a href="javascript:goMenu('../marry/marry_mark.jsp', 'MN40100');">웨딩상품특징</a></li>
                        <li id="MN40200"><a href="javascript:goMenu('../marry/marry_list_d.jsp', 'MN40200');">웨딩상품</a></li>
                    </ul>
                </nav>
            </div> <!-- // pcLnbWrap -->

			<!-- 메뉴 영역 -->

			<div id="pro_info" class="contents"> <!-- 페이지별 ID -->

				<div class="defaultTab">
				    <strong class="select">
                        <button type="button">웨딩480</button>
                    </strong>
					<ul>
						<li class="tab04"><a href="javascript:goMenu('../marry/marry_list_d.jsp', 'MN40200');">프라임(350)상품</a></li>
						<li class="tab01"><a href="javascript:goMenu('../marry/marry_list_a.jsp', 'MN40200');">웨딩240</a></li>
                        <li class="tab02"><a href="javascript:goMenu('../marry/marry_list_b.jsp', 'MN40200');">웨딩360</a></li>
                        <li class="tab03 active"><a href="javascript:goMenu('../marry/marry_list_c.jsp', 'MN40200');">웨딩480</a></li>
					</ul>
				</div>
				
				<header class="contInfoArea">
					<p class="img"><img src="../public/img/conts/img_pro_b_480.png" alt="웨딩480 안내이미지" /></p>
					<div class="area">
						<h3 class="contTit"><span>웨딩480</span></h3>
						<p class="subTxt">월 40,000원 X 120회 (4,800,000원)</p>
						<ul class="defaultGrayDotList mt-10">
							<li>새로이 시작하는 아름다운 순간!</li>
							<li>크리스찬상조 웨딩사업부가 행복한 추억을 간직할 수 있도록 도와드리겠습니다.</li>
							<li>리허설촬영 및 본식진행 시 웨딩드레스 및 스튜디오 등 / 비디오촬영</li>
						</ul>
						<br/>
						<a href="/downloadFile.do?fileSeqNum=eykinhybdvik" class="btnDefault">가입신청</a>
						<a href="/downloadFile.do?fileSeqNum=eykinhybdvik" class="btnDefault">상담신청</a>
						
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
								<td colspan="2">웨딩플래너 1명</td>
								<td class="alignL">전문 웨딩플래너를 통해 웨딩계획과 업체선정에 도움을 드립니다.</td>
							</tr>
							<tr>
								<td rowspan="5">리허설촬영</td>
								<td colspan="2">신부드레스</td>
								<td class="alignL">메인드레스2벌, 파티복1벌</td>
							</tr>
							<tr>
								<td colspan="2">신랑예복</td>
								<td class="alignL">제공(대여)</td>
							</tr>
							<tr>
								<td colspan="2">사진</td>
								<td class="alignL">11R20P 앨범1권</td>
							</tr>
							<tr>
								<td colspan="2">액자</td>
								<td class="alignL">20R 액자1개, 9관 갤러리 액자</td>
							</tr>
							<tr>
								<td colspan="2">헤어/메이크업</td>
								<td class="alignL">제공(신랑/신부)</td>
							</tr>
							<tr>
								<td rowspan="11">웨딩본식</td>
								<td colspan="2">신부드레스</td>
								<td class="alignL">제공(대여)</td>
							</tr>
							<tr>
								<td colspan="2">신랑예복</td>
								<td class="alignL">제공(대여)</td>
							</tr>
							<tr>
								<td rowspan="3">사진</td>
								<td>신랑신부</td>
								<td class="alignL">11R30P 앨범1권</td>
							</tr>
							<tr>
								<td>신랑혼주</td>
								<td class="alignL">11R10P 앨범1권</td>
							</tr>
							<tr>
								<td>신부혼주</td>
								<td class="alignL">11R10P 앨범1권</td>
							</tr>
							<tr>
								<td colspan="2">헤어/메이크업</td>
								<td class="alignL">제공(신랑/신부)</td>
							</tr>
							<tr>
								<td colspan="2">비디오</td>
								<td class="alignL">DVD 3개</td>
							</tr>
							<tr>
								<td colspan="2">부케</td>
								<td class="alignL">부케/부토니아/코사지</td>
							</tr>
							<tr>
								<td colspan="2">폐백의상</td>
								<td class="alignL">제공(대여)</td>
							</tr>
							<tr>
								<td colspan="2">혼구용품</td>
								<td class="alignL">혼인서약서, 성혼선언문, 방명록, 축지, 장갑 등</td>
							</tr>
							<tr>
								<td colspan="2">폐백음식</td>
								<td class="alignL">기본품목제공</td>
							</tr>
						</tbody>
					</table>
				</div>

			</div> <!-- // contents -->


		</div>
	</div> <!-- // contentsWrap -->

<%@ include file="../include/inc_footer.jsp" %>