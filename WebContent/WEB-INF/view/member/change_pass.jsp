<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/view/include/inc_header.jsp"%>

	<div id="contentsWrap">
		<div class="container">
			<div class="conTitWrap">
				<h2>패스워드수정</h2>
				<div class="location">
					<span class="home">홈</span>
					<span>회원</span>
					<strong>패스워드수정</strong>
				</div>
			</div> <!-- // conTitWrap -->
			<!-- 메뉴 영역 -->


<script type="text/javascript">
	$(function() {
		//메뉴 제어 
		var lnb = $(".pcLnbWrap ul li a");
		var menuId = "MN80200";
		var mbId = "MO80200";
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
		var f = $('#f');
		var exPass = $('#exPassword');
		var newPass = $('#newPassword');
		var passChk = $('#passwordChk');
		
		if(exPass.val==""){
			alert("기존비밀번호를 입력하세요.");
			exPass.focus();
			return;
		}else if(newPass.val==""){
			alert("변경할 비밀번호를 입력하세요.");
			newPass.focus();
			return;
		}else if(passChk.val==""){
			alert("비밀번호 확인을 입력하세요.");
			passChk.focus();
			return;
		}else if(newPass.val()!=passChk.val()){
			alert("비밀번호가 일치하지 않습니다.");
			passChk.focus();
			return;
		}else{
			f.attr("action", "/member/chgPassProc.do");
			f.submit();
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
							<li id="MO80200"><a href="javascript:goMenu('/member/chgPass.do', 'MO80200');">패스워드수정</a></li>
						</ul>
					</div>
								
				</nav>
			</div> <!-- // moLnbWrap -->

			<div class="pcLnbWrap">
				<nav>
					<ul class="pcLnb">
						<li id="MN80200"><a href="javascript:goMenu('/member/chgPass.do', 'MN80200');">패스워드수정</a></li>
					</ul>
				</nav>
			</div> <!-- // pcLnbWrap -->

			<!-- 메뉴 영역 -->

			<div class="contents"> <!-- 페이지별 ID none -->
				<h3 class="smallTit">패스워드수정</h3>

                <div class="boardType2">
                <form name="f" id="f" method="post" action="">
					<table summary="">
						<caption></caption>
						<colgroup>
							<col width="20%">
							<col width="80%">
						</colgroup>
						<tbody>
							<tr>
								<th scope="row">기존패스워드</th>
								<td>
									<input type="password" name="exPassword" class="inputType1" maxlength="12">
								</td>
							</tr>
							<tr>
								<th scope="row">신규패스워드</th>
								<td>
									<input type="password" name="newPassword" class="inputType1" maxlength="12">
								</td>
							</tr>
							<tr>
								<th scope="row">신규패스워드확인</th>
								<td>
									<input type="password" name="passwordChk" class="inputType1" maxlength="12">
								</td>
							</tr>
						</tbody>
					</table>
                </form>
				</div>

				<div class="btn_area">
					<a href="javascript:doSubmit();" id="submitLink" class="btn_active">수정</a>
					<a href="/main.do" id="btnCancel" class="btn_cancel">취소</a>
				</div>

			</div> <!-- // contents -->


		</div>
	</div> <!-- // contentsWrap -->

<!--#include file="../include/inc_footer.jsp"-->
<%@include file="/WEB-INF/view/include/inc_footer.jsp"%>
