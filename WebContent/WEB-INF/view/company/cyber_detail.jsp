<%@page import="com.cl.util.PageUtil"%>
<%@page import="com.cl.util.TextUtil"%>
<%@page import="com.cl.util.CmmUtil"%>
<%@page import="com.cl.dto.CyberDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/view/include/inc_header.jsp"%>
<%
	CyberDTO cDTO = (CyberDTO)request.getAttribute("cDTO");
	if(cDTO == null) cDTO = new CyberDTO();
%>
<!--#include file="../include/inc_header.jsp"-->
<link href="//vjs.zencdn.net/5.19/video-js.min.css" rel="stylesheet">
<script src="//vjs.zencdn.net/5.19/video.min.js"></script>


	<div id="contentsWrap">
		<div class="container">
			<div class="conTitWrap">
				<h2>사이버홍보실</h2>
				<div class="location">
					<span class="home">홈</span>
					<span>회사소개</span>
					<strong>사이버홍보실</strong>
				</div>
			</div> <!-- // conTitWrap -->
			<!-- 메뉴 영역 -->
			



<script type="text/javascript">
	$(function() {
		//메뉴 제어 
		var lnb = $(".pcLnbWrap ul li a");
		var menuId = "MN10500";
		var mbId = "MO10500";
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
                        <strong><button type="button" class="select">회사소개</button></strong>
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
                        <strong><button type="button" class="select" id="subtitle">상담사조회</button></strong>
                        <ul>
                            <li id="MO10100"><a href="javascript:goMenu('/company/overView.do', 'MO10100');">인사말</a></li>
                            <li id="MO10200"><a href="javascript:goMenu('/company/organ.do', 'MO10200');">조직도및연혁</a></li>
                            <!-- <li id="MO10300"><a href="javascript:goMenu('/company/branchList.do', 'MO10300');">전국지사안내</a></li>
                            <li id="MO10400"><a href="javascript:goMenu('/company/adviceList.do', 'MO10400');">상담사조회</a></li> -->
                            <li id="MO10500"><a href="javascript:goMenu('/company/cyberList.do', 'MO10500');">사이버홍보실</a></li>
                            <li id="MO10600"><a href="javascript:goMenu('/company/road.do', 'MO10600');">오시는길</a></li>
                        </ul>
                    </div>

                </nav>
            </div> <!-- // moLnbWrap -->

            <div class="pcLnbWrap">
                <nav>
                    <ul class="pcLnb">
                            <li id="MO10100"><a href="javascript:goMenu('/company/overView.do', 'MO10100');">인사말</a></li>
                            <li id="MO10200"><a href="javascript:goMenu('/company/organ.do', 'MO10200');">조직도및연혁</a></li>
                            <!-- <li id="MO10300"><a href="javascript:goMenu('/company/branchList.do', 'MO10300');">전국지사안내</a></li>
                            <li id="MO10400"><a href="javascript:goMenu('/company/adviceList.do', 'MO10400');">상담사조회</a></li> -->
                            <li id="MO10500"><a href="javascript:goMenu('/company/cyberList.do', 'MO10500');">사이버홍보실</a></li>
                            <li id="MO10600"><a href="javascript:goMenu('/company/road.do', 'MO10600');">오시는길</a></li>
                    </ul>
                </nav>
            </div> <!-- // pcLnbWrap -->

			<!-- 메뉴 영역 -->

			<div class="contents"> <!-- 페이지별 ID none -->
				<h3 class="smallTit">사이버홍보실</h3>

				<div class="boardType2">
					<table summary="">
						<caption></caption>
						<colgroup>
							<col width="20%">
							<col width="80%">
						</colgroup>
						<tbody>
							<tr>
								<th scope="row">제목</th>
								<td>
									<%=TextUtil.exchangeEscapeNvl(cDTO.getCyberTitle()) %>
								</td>
							</tr>
							<%
							if(!"".equals(TextUtil.exchangeEscapeNvl(cDTO.getCyberContents()))){
							
							%>
							<tr>
								<th scope="row">내용</th>
								<td>
								
									<!-- <video width="320" height="240" controls> -->
									<video id="myvideo" class="video-js vjs-default-skin vjs-16-9 vjs-big-play-centered" controls data-setup='{"fluid": true}'>
										<source src="/file/cyber/movie/<%=CmmUtil.nvl(cDTO.getCyberFileName()) %>" type="video/<%=TextUtil.getFileExtension(cDTO.getCyberFileName())%>">
									</video>
									<br><br>
									<%=TextUtil.replaceBr(TextUtil.exchangeEscapeNvl(cDTO.getCyberContents())) %>
								</td>
							</tr>
							<%
							}
							%>
						</tbody>
					</table>
				</div>

				<div class="btn_area">
				
				</div>

			</div> <!-- // contents -->

		</div>
	</div> <!-- // contentsWrap -->

<!--#include file="../include/inc_footer.jsp"-->
<%@include file="/WEB-INF/view/include/inc_footer.jsp"%>