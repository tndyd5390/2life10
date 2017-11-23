<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/view/include/inc_header.jsp"%>
<!--#include file="../include/inc_header.jsp"-->

	<div id="contentsWrap">
		<div class="container">
			<div class="conTitWrap">
				<h2>로그인</h2>
				<div class="location">
					<span class="home">홈</span>
					<span>로그인</span>
					<strong>로그인</strong>
				</div>
			</div> <!-- // conTitWrap -->
			<!-- 메뉴 영역 -->
			



<script type="text/javascript">
	$(function() {
		//메뉴 제어 
		var lnb = $(".pcLnbWrap ul li a");
		var menuId = "MN70100";
		var mbId = "MO70100";
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
	
	function doSubmit(){
		var id = $("#id");
		var pwd = $("#password");
		
		if(id.val()==""){
			alert("아이디를 입력하세요.");
			id.focus();
			return false;
		}else if(pwd.val()==""){
			alert("패스워드를 입력하세요.");
			pwd.focus();
			return false;
		}else{
			f.submit();
			return true;
		}
	}

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
						<strong><button type="button" class="select" id="subtitle">로그인</button></strong>
						<ul>
							<li id="MO70100"><a href="javascript:goMenu('../login/login.jsp', 'MO70100');">로그인</a></li>
                            <li id="MO70200"><a href="javascript:goMenu('../member/join_step.jsp', 'MO70200');">회원가입</a></li>
                            <li id="MO70300"><a href="javascript:goMenu('../member/find_id.jsp', 'MO70300');">아이디찾기</a></li>
                            <li id="MO70400"><a href="javascript:goMenu('../member/find_pass.jsp', 'MO70400');">패스워드찾기</a></li>
						</ul>
					</div>
								
				</nav>
			</div> <!-- // moLnbWrap -->

			<div class="pcLnbWrap">
				<nav>
					<ul class="pcLnb">
						<li id="MN70100"><a href="javascript:goMenu('../login/login.jsp', 'MN70100');">로그인</a></li>
                        <li id="MN70200"><a href="javascript:goMenu('../member/join_step.jsp', 'MN70200');">회원가입</a></li>
                        <li id="MN70300"><a href="javascript:goMenu('../member/find_id.jsp', 'MN70300');">아이디찾기</a></li>
                        <li id="MN70400"><a href="javascript:goMenu('../member/find_pass.jsp', 'MN70400');">패스워드찾기</a></li>
					</ul>
				</nav>
			</div> <!-- // pcLnbWrap -->

			<!-- 메뉴 영역 -->

			<div class="contents"> <!-- 페이지별 ID none -->
				<h3 class="smallTit">로그인</h3>

                <form name="f" id="f" method="post" action="/member/loginProc.do">
                    <div class="loginDiv">
                        <div class="inputArea">
                            <div class="areaDiv">
                                <div class="pBox">
                                    <div class="inputDiv">
                                        <label for="id">아이디</label>
                                        <input type="text" id="id" name="id" value="" title="아이디" class="lginInput idChk">
                                        <label for="password">패스워드</label>
                                        <input type="password" id="password" name="password" value="" title="비밀번호" class="lginInput">
                                    </div>
                                    <a href="javascript:doSubmit();" id="submit" class="loginBt">로그인</a>
                                </div>

                                <div class="srchArea">
                                    <p class="txt">아이디, 비밀번호를 잊으셨나요?</p>
                                    <div class="bt">
                                        <a href="../member/find_id.jsp" class="whtBt">아이디 찾기</a>
                                        <a href="../member/find_pass.jsp" class="whtBt">비밀번호 찾기</a>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="joinArea">
                            <div class="areaDiv">
                                <p class="txt"><strong>아직 크리스찬상조(주) 회원이 아니신가요?</strong><br>회원이 되시면 다양한 서비스 이용이 가능합니다.</p>
                                <a href="../member/joinStep.do" class="whtBt">회원가입</a>
                            </div>
                        </div>
                    </div>
                </form>

			</div> <!-- // contents -->


		</div>
	</div> <!-- // contentsWrap -->

<!--#include file="../include/inc_footer.jsp"-->
<%@include file="/WEB-INF/view/include/inc_footer.jsp"%>
