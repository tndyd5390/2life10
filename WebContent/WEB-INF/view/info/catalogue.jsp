<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/view/include/inc_header.jsp"%>
<!--#include file="../include/inc_header.jsp"-->

	<div id="contentsWrap">
		<div class="container">
			<div class="conTitWrap">
				<h2>웹카다로그</h2>
				<div class="location">
					<span class="home">홈</span>
					<span>상품안내</span>
					<strong>웹카다로그</strong>
				</div>
			</div> <!-- // conTitWrap -->
			<!-- 메뉴 영역 -->
			



<script type="text/javascript">
	$(function() {
		//메뉴 제어 
		var lnb = $(".pcLnbWrap ul li a");
		var menuId = "MN20300";
		var mbId = "MO20300";
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
                            <li><a href="javascript:goMenu('/company/overView.do', '');">회사소개</a></li>
                            <li><a href="javascript:goMenu('/info/proInfo.do', '');">상조상품특징</a></li>
                            <li><a href="javascript:goMenu('/funeral/funeralMark.do', '');">장례상품</a></li>
                            <li><a href="javascript:goMenu('/marry/marryMark.do', '');">웨딩상품</a></li>
                            <li><a href="javascript:goMenu('/cruise/cruiseMark.do', '');">크루즈상품</a></li>
                            <li><a href="javascript:goMenu('/notice/noticeList.do', '');">고객센터</a></li>
                        </ul>
                    </div>
                    <div class="flexItem4"> <!-- .select 버튼 클릭시 다중클래스 on 추가 -->
                        <strong><button type="button" class="select" id="subtitle">웹카다로그</button></strong>
                        <ul>
                            <li id="MO20100"><a href="javascript:goMenu('/info/proInfo.do', 'MO20100');">상조상품특징</a></li>
                            <li id="MO20200"><a href="javascript:goMenu('/info/joinStep.do', 'MO20200');">가입절차</a></li>
                            <li id="MO20300"><a href="javascript:goMenu('/info/catalogue.do', 'MO20300');">웹카다로그</a></li>
                            <li id="MO20400"><a href="javascript:goMenu('/info/endPro.do', 'MO20400');">단종상품안내</a></li>
                        </ul>
                    </div>

                </nav>
            </div> <!-- // moLnbWrap -->

            <div class="pcLnbWrap">
                <nav>
                    <ul class="pcLnb">
                            <li id="MO20100"><a href="javascript:goMenu('/info/proInfo.do', 'MO20100');">상조상품특징</a></li>
                            <li id="MO20200"><a href="javascript:goMenu('/info/joinStep.do', 'MO20200');">가입절차</a></li>
                            <li id="MO20300"><a href="javascript:goMenu('/info/catalogue.do', 'MO20300');">웹카다로그</a></li>
                            <li id="MO20400"><a href="javascript:goMenu('/info/endPro.do', 'MO20400');">단종상품안내</a></li>
                    </ul>
                </nav>
            </div> <!-- // pcLnbWrap -->

			<!-- 메뉴 영역 -->

			<div id="catalogue" class="contents">
				
				<header class="contInfoArea">
					<p class="img"><img src="/public/img/conts/img_cata_01.png" alt="크리스찬상조 카다로그 이미지" /></p>
					<div class="area">
						<h3 class="contTit"><span>크리스찬상조</span>상품 웹 카다로그</h3>
						<p class="txt">다양한 상품을 확인하세요.</p>
						
						<a href="/downloadFile.do?fileSeqNum=eykinhybdvik" class="btnDefault">2017 장례상품 카다로그</a>
						
					</div>
				</header>

                <div class="boardType2">
                    <table summary="">
                        <caption>카다로그</caption>
                        <colgroup>
                            <col width="20%">
                            <col width="80%">
                        </colgroup>
                        <tbody>
                            <tr>
                                <th scope="row">2014년</th>
                                <td>
                                    <a href="/downloadFile.do?fileSeqNum=eykinhybdvik" class="btn_cancel_small"><span class="iconDownLoad"></span>장례상품 카다로그</a>
                                    <span class="txt">(260/390/480상품 내용)</span>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row">2014년</th>
                                <td>
                                    <a href="/downloadFile.do?fileSeqNum=eykinhybdvik" class="btn_cancel_small"><span class="iconDownLoad"></span>프라임상품 카다로그</a>
                                    <span class="txt">(350상품 내용)</span>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                				
								
			</div> <!-- // contents -->

		</div>
	</div> <!-- // contentsWrap -->

<!--#include file="../include/inc_footer.jsp"-->
<%@include file="/WEB-INF/view/include/inc_footer.jsp"%>
