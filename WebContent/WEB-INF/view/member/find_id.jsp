<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/view/include/inc_header.jsp"%>
<!--#include file="../include/inc_header.jsp"-->

	<div id="contentsWrap">
		<div class="container">
			<div class="conTitWrap">
				<h2>아이디찾기</h2>
				<div class="location">
					<span class="home">홈</span>
					<span>로그인</span>
					<strong>아이디찾기</strong>
				</div>
			</div> <!-- // conTitWrap -->
			<!-- 메뉴 영역 -->
			



<script type="text/javascript">
	$(function() {
		//메뉴 제어 
		var lnb = $(".pcLnbWrap ul li a");
		var menuId = "MN70300";
		var mbId = "MO70300";
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
		
		//메일 셀렉트박스 제어
		$("#emailBox").change(function(){
			if($(this).val()=="direct"){
				$("#email2").val("");
			}else{
				$("#email2").val($(this).val())
			}
		});

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
                            <li><a href="javascript:goMenu('/company/overView.do', '');">회사소개</a></li>
                            <li><a href="javascript:goMenu('/info/proInfo.do', '');">상조상품특징</a></li>
                            <li><a href="javascript:goMenu('/funeral/funeralMark.do', '');">장례상품</a></li>
                            <li><a href="javascript:goMenu('/marry/marryMark.do', '');">웨딩상품</a></li>
                            <li><a href="javascript:goMenu('/cruise/cruiseMark.do', '');">크루즈상품</a></li>
                            <li><a href="javascript:goMenu('/notice/noticeList.do', '');">고객센터</a></li>
						</ul>
					</div>
					<div class="flexItem4"> <!-- .select 버튼 클릭시 다중클래스 on 추가 -->
						<strong><button type="button" class="select" id="subtitle">로그인</button></strong>
						<ul>
							<li id="MO70100"><a href="javascript:goMenu('/member/login.do', 'MO70100');">로그인</a></li>
                            <li id="MO70200"><a href="javascript:goMenu('/member/joinStep.do', 'MO70200');">회원가입</a></li>
                            <li id="MO70300"><a href="javascript:goMenu('/member/findId.do', 'MO70300');">아이디찾기</a></li>
                            <li id="MO70400"><a href="javascript:goMenu('/member/findPass.do', 'MO70400');">패스워드찾기</a></li>
						</ul>
					</div>
								
				</nav>
			</div> <!-- // moLnbWrap -->

			<div class="pcLnbWrap">
				<nav>
					<ul class="pcLnb">
							<li id="MN70100"><a href="javascript:goMenu('/member/login.do', 'MN70100');">로그인</a></li>
                            <li id="MN70200"><a href="javascript:goMenu('/member/joinStep.do', 'MN70200');">회원가입</a></li>
                            <li id="MN70300"><a href="javascript:goMenu('/member/findId.do', 'MN70300');">아이디찾기</a></li>
                            <li id="MN70400"><a href="javascript:goMenu('/member/findPass.do', 'MN70400');">패스워드찾기</a></li>
					</ul>
				</nav>
			</div> <!-- // pcLnbWrap -->

			<!-- 메뉴 영역 -->

			<div class="contents"> <!-- 페이지별 ID none -->
				<h3 class="smallTit">아이디찾기</h3>

                <div class="boardType2">
					<table summary="">
						<caption>회원가입</caption>
						<colgroup>
							<col width="20%">
							<col width="80%">
						</colgroup>
						<tbody>
							<tr>
								<th scope="row">성명</th>
								<td>
									<input type="text" name="name" id="name" value="" title="이름" class="inputType1" style="" maxlength="25">
								</td>
							</tr>
							<tr>
								<th scope="row">이메일 주소</th>
								<td>
									<input type="text" name="email1" value="" title="이름" class="inputType2" style=""> @
									<input type="text" name="email2" value="" title="이름" class="inputType2" style="">
									<select id="emailBox" name="emailBox" title="" class="inputType2">
										<option value="">선택하세요</option>
										<option value="nate.com">nate.com</option>
										<option value="hotmail.com">hotmail.com</option>
										<option value="yahoo.co.kr">yahoo.co.kr</option>
										<option value="naver.com">naver.com</option>
										<option value="paran.com">paran.com</option>
										<option value="dreamwiz.com">dreamwiz.com</option>
										<option value="hanafos.com">hanafos.com</option>
										<option value="lycos.co.kr">lycos.co.kr</option>
										<option value="korea.com">korea.com</option>
										<option value="unitel.co.kr">unitel.co.kr</option>
										<option value="hanmail.net">hanmail.net</option>
										<option value="gmail.com">gmail.com</option>
										<option value="google.com">google.com</option>
										<option value="empal.com">empal.com</option>
										<option value="freechal.com">freechal.com</option>
										<option value="empas.com">empas.com</option>
										<option value="direct">직접입력</option>
									</select>
								</td>
							</tr>
						</tbody>
					</table>
				</div>

				<div class="btn_area">
					<a href="#" id="submitLink" class="btn_active">아이디찾기</a>
					<a href="#" id="btnCancel" class="btn_cancel">취소</a>
				</div>

			</div> <!-- // contents -->


		</div>
	</div> <!-- // contentsWrap -->

<!--#include file="../include/inc_footer.jsp"-->
<%@include file="../include/inc_footer.jsp"%>
