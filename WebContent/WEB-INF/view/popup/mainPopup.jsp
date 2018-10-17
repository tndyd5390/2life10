<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.cl.util.CmmUtil" %>
<%@ page import="com.cl.util.TextUtil" %>
<%@ page import="com.cl.util.AES256Util" %>
<%@ page import="com.cl.dto.NoticeDTO" %>
<%
	NoticeDTO nDTO = (NoticeDTO) request.getAttribute("nDTO");
	
	if(nDTO == null){
		nDTO = new NoticeDTO();
	}

%>
<html lang="ko">
<head>
<title>:크리스찬상조(주):</title>
<style>
.my-tooltip{
	max-width:300px;
}

@media screen and (max-width:800px){
	.my-tooltip{
		max-width:150px;
	}
}


#counsel .psyBtnDefaultForm {
    width: 160px;
    margin-right: 0;
    padding: 15px 30px;
}
.btnArea a, .btnArea button {
    margin-right: 6px;
}
.psyBtnDefaultForm, a.psyBtnDefaultForm {
    display: inline-block;
    padding: 10px 15px;
    background-color: #105d99;
    font-size: 1.5rem;
    color: #fff;
    border: none;
    border-radius: 3px;
    margin-top: 5px;
}



</style>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />
<link type="text/css" rel="stylesheet" href="/public/css/default.css" />
<link type="text/css" rel="stylesheet" href="/public/css/layout_kor.css" />
<link type="text/css" rel="stylesheet" href="/public/css/sub_kor.css" />
<script type="text/javascript" src="/public/js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="/public/js/TweenMax.min.js"></script>
<script type="text/javascript" src="/public/js/common.js"></script>
<script type="text/javascript" src="/public/js/contents.js"></script>
<script type="text/javascript" src="/public/js/jquery.form.js"></script>
<script type="text/javascript" src="/public/js/jquery.rss.js"></script>
<!-- DataTables CSS -->
<link href="/public/datatables-plugins/dataTables.bootstrap.css" rel="stylesheet">
<!-- DataTables Responsive CSS -->
<link href="/public/datatables-responsive/dataTables.responsive.css" rel="stylesheet">
<!-- DataTables JavaScript -->
<!--[if lt IE 9]>
	<script src="/js/html5.js"></script>
	<script src="/js/respond.js"></script>
<![endif]-->
<script type="text/javascript">

	function closePopup(){
		if($("#doNotOpenToday").prop("checked")){
			//쿠키 설정해서 하루동안 팝업 안열리도록
			$.ajax({
				url : '/popup/setCookieOneDay.do',
				method : 'post',
				success : function(result){
					window.close();
				},
   				error:function (xhr, ajaxOptions, thrownError){
   					if(x.status==0){
			            alert('네트워크가 정상적으로 동작하지 않습니다.');
			            alert('네트워크 상태를 확인 하거나 업체에게 문의해 주세요.')
			            }else if(x.status==404){
			            alert('페이지를 찾을수가 없습니다. 지금은 주문을 받을 수 없습니다. 업체에게 문의하세요.');
			            }else if(x.status==500){
			            alert('서버에서 오류가 발생했습니다. 지금은 주문을 받을 수 없습니다. 업체에게 문의하세요.');
			            }else if(e=='parsererror'){
			            alert('json파싱에 실패했습니다.');
			            }else if(e=='timeout'){
			            alert('응답 요청 시간이 지났습니다.');
			            }else {
			            alert('Unknow Error.n'+x.responseText);
			            }
			   	}
			});
		}else{
			window.close();
		}
	}
</script>
<body>
<!--#include file="../include/inc_header.jsp"-->

	<div id="contentsWrap">
		<div class="container">
			<div class="conTitWrap">
				<h2>공지사항</h2>
				<div class="location">
					<span class="home">홈</span>
					<span>고객센터</span>
					<strong>공지사항</strong>
				</div>
			</div> <!-- // conTitWrap -->
			<!-- 메뉴 영역 -->
			



<script type="text/javascript">
</script>

			<!-- 메뉴 영역 -->

			<div class="contents"> <!-- 페이지별 ID none -->
				<!-- boardView -->
			
				<article class="boardView">
					<header class="boardTit">
						<h3><%=CmmUtil.nvl(nDTO.getNoticeTitle())%></h3>
					</header>
					<article class="boardCont">
						<div id="ckContent">
						<%if(CmmUtil.nvl(nDTO.getNoticeNo()).equals("33")){%>
							<a href="/file/notice/file/name.hwp">개명신청서 다운로드(한글)</a><br><br>
							<a href="/file/notice/file/name.docx">개명신청서 다운로드(워드)</a><br><br>
							<a href="/file/notice/file/transfer.hwp">양도양수신청서 다운로드(한글)</a><br><br>
							<a href="/file/notice/file/transfer.docx">양도양수신청서 다운로드(워드)</a><br><br>
							<a href="/file/notice/file/cancel.hwp">해약신청서 다운로드(한글)</a><br><br>
							<a href="/file/notice/file/cancel.docx">해약신청서 다운로드(워드)</a><br><br><br><br>
						<%}%>
								<div class="editArea">								
								<p><%=TextUtil.replaceBr(TextUtil.exchangeEscapeNvl(nDTO.getNoticeContents())) %></p>
								<%
								if(!CmmUtil.nvl(nDTO.getNoticeFileName()).equals("")){
								%>
									<img src="<%="/file/notice/img/" + CmmUtil.nvl(nDTO.getNoticeFileName()) %>" alt="공지사항 이미지" />
								<%
								}
								%>
								
								</div>				
						</div>
					</article>
				</article>
				<!-- // newsList -->
				<br/><br/>
				<!-- btnArea -->
				<div class="btnArea">
					<input type="checkbox" name="doNotOpenToday" id="doNotOpenToday">오늘 하루 열지 않기
					<button type="button" class="btnDefaultForm" id="listBtn" onclick="closePopup();" style="float:right; margin-top:0px;">닫기</button>
				</div>
				<!-- // btnArea -->

			</div> <!-- // contents -->


		</div>
	</div> <!-- // contentsWrap -->

<!--#include file="../include/inc_footer.jsp"-->
</body>
</html>