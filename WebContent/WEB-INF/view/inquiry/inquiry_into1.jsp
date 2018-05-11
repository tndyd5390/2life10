<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="../include/inc_header.jsp" %>

	<div id="contentsWrap">
		<div class="container">
			<div class="conTitWrap">
				<h2>납부조회</h2>
				<div class="location">
					<span class="home">홈</span>
					<span>고객센터</span>
					<strong>납부조회</strong>
				</div>
			</div> <!-- // conTitWrap -->
			<!-- 메뉴 영역 -->
			



<script type="text/javascript">
	$(function() {
		//메뉴 제어 
		var lnb = $(".pcLnbWrap ul li a");
		var menuId = "MN60700";
		var mbId = "MO60700";
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
						<strong><button type="button" class="select">고객센터</button></strong>
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
						<strong><button type="button" class="select" id="subtitle">납부조회</button></strong>
						<ul>
							<li id="MO60100"><a href="javascript:goMenu('../notice/notice_list.jsp', 'MO60100');">공지사항</a></li>
                            <li id="MO60200"><a href="javascript:goMenu('../qna/qna_list.jsp', 'MO60200');">자주하는질문</a></li>
                            <li id="MO60300"><a href="javascript:goMenu('../counsel/counsel_list.jsp', 'MO60300');">1:1상담</a></li>
                            <li id="MO60400"><a href="javascript:goMenu('../infomation/infomation_a.jsp', 'MO60400');">주요정보고시사항</a></li>
                            <li id="MO60500"><a href="javascript:goMenu('../regulation/regulation_list.jsp', 'MO60500');">상조관련법규</a></li>
                            <li id="MO60600"><a href="javascript:goMenu('../agreement/agreement_list.jsp', 'MO60600');">이용약관</a></li>
                            <li id="MO60700"><a href="javascript:goMenu('../inquiry/inquiry_list.jsp', 'MO60700');">납부조회</a></li>
                            <li id="MO60800"><a href="javascript:goMenu('../appli/appli_form.jsp', 'MO60800');">가입상담신청</a></li>
						</ul>
					</div>
								
				</nav>
			</div> <!-- // moLnbWrap -->

			<div class="pcLnbWrap">
				<nav>
					<ul class="pcLnb">
						<li id="MN60100"><a href="javascript:goMenu('../notice/notice_list.jsp', 'MN60100');">공지사항</a></li>
                        <li id="MN60200"><a href="javascript:goMenu('../qna/qna_list.jsp', 'MN60200');">자주하는질문</a></li>
                        <li id="MN60300"><a href="javascript:goMenu('../counsel/counsel_list.jsp', 'MN60300');">1:1상담</a></li>
                        <li id="MN60400"><a href="javascript:goMenu('../infomation/infomation_a.jsp', 'MN60400');">주요정보고시사항</a></li>
                        <li id="MN60500"><a href="javascript:goMenu('../regulation/regulation_list.jsp', 'MN60500');">상조관련법규</a></li>
                        <li id="MN60600"><a href="javascript:goMenu('../agreement/agreement_list.jsp', 'MN60600');">이용약관</a></li>
                        <li id="MN60700"><a href="javascript:goMenu('../inquiry/inquiry_list.jsp', 'MN60700');">납부조회</a></li>
                        <li id="MN60800"><a href="javascript:goMenu('../appli/appli_form.jsp', 'MN60800');">가입상담신청</a></li>
					</ul>
				</nav>
			</div> <!-- // pcLnbWrap -->

			<!-- 메뉴 영역 -->

			<div class="contents"> <!-- 페이지별 ID none -->
				<h3 class="smallTit">납부조회</h3>

				<form name="frm" method="post">
                    <div class="intoDiv">
                        <div class="inputArea">
                            <div class="areaDiv">
                                <div class="pBox">
                                    <div class="inputDiv">
                                        <label for="id" class="t1">생년월일YYMMDD</label>
                                        <input type="text" id="id" value="" title="생년월일" class="lginInput idChk">
                                        <label for="password" class="t2">휴대폰번호뒷4자리</label>
                                        <input type="password" id="password" name="휴대폰번호뒷4자리" value="" title="비밀번호" class="lginInput">
										<label for="name" class="t3">회원이름</label>
                                        <input type="name" id="name" name="회원이름" value="" title="비밀번호" class="lginInput">
                                    </div>
                                    <a href="" id="submit" class="loginBt">조회하기</a>
                                </div>

                                <div class="srchArea">
                                    <p class="txt">회원이 간편하게 납입내역을 조회 할 수 있습니다.</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>

			</div> <!-- // contents -->


		</div>
	</div> <!-- // contentsWrap -->

<%@ include file="../include/inc_footer.jsp" %>