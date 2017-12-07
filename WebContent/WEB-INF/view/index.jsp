<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.cl.util.CmmUtil" %>
<%@ page import="com.cl.util.TextUtil" %>
<%@ page import="com.cl.util.AES256Util" %>
<%@ page import="com.cl.dto.FuneralNoticeDTO" %>
<%@ page import="com.cl.dto.NoticeDTO" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.HashMap" %>
<%

	HashMap<String, Object> hMap = (HashMap<String,Object>) request.getAttribute("hMap");
	
	List<NoticeDTO> nList = (List<NoticeDTO>) hMap.get("nList");
	List<FuneralNoticeDTO> fList = (List<FuneralNoticeDTO>) hMap.get("fList");
	
%>

<!DOCTYPE html>
<html lang="ko">
<head>
<title>크리스찬라이프</title>

<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />
<link type="text/css" rel="stylesheet" href="/public/css/default.css"/>
<link type="text/css" rel="stylesheet" href="/public/css/layout_kor.css"/>
<link type="text/css" rel="stylesheet" href="/public/css/main_kor.css" />
<link rel="stylesheet" type="text/css" href="/public/css/jquery.bxslider.css"/>
<script type="text/javascript" src="/public/js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="/public/js/TweenMax.min.js"></script>
<script type="text/javascript" src="/public/js/common.js"></script>
<script type="text/javascript" src="/public/js/jquery.bxslider.js"></script>
<script type="text/javascript" src="/public/js/contents.js"></script>
<script type="text/javascript" src="/public/js/jquery.form.js"></script>
<body>
<form id="frm" name="frm">
	<input type="hidden" id="seqNum" name="seqNum" >
</form>
<form action="#" name="menuFrm" method="post">
	<input type="hidden" name="menuNum"/>
</form>	
<div id="skipnavi">
	<a href="#contentsWrap">본문 바로가기</a>
</div>
<div class="wrap">
	<div class="header">
        <div class="container">

        <script type="text/javascript">
        $(document).ready(function() {

            $("#searchTextBtn").click(function(){

                fn_searchText();
            });

            if ($("#searchText").val() != ""){
                $(".searchArea").show();
            };
            if ($("#searchText").val() == ""){
                $(".searchArea").hide();
            };
            
        });

        function fn_searchText(){
            var searchText = $("#searchText").val();
            if("" == searchText){
                alert("검색어를 입력해주세요");
                return;
            }

            var searchFrm = document.searchFrm;
            searchFrm.action = "/search.do";
            searchFrm.submit();
        }
        
        
        function goNDT(nNo){
        	var f = $("#f");
        	var noticeNo = $("#nNo");
        	noticeNo.val(nNo);
        	f.attr("action", "/notice/noticeDetail.do");
        	f.submit();
        }
        </script>
            <!-- heaer 인쿠르드 -->
            <!--#include file="include/inc_mheader.jsp"-->
			<%@include file="/WEB-INF/view/include/inc_mheader.jsp" %>
        </div>
    </div> <!-- // header -->
	
	
	<form name="f" id="f" method="post" action="">
		<input type="hidden" name="nNo" id="nNo">
	</form>
	
	<div class="main">
		<div class="visualWrap">
                <div class="slide-nav">
                    <div class="travel"><p class="txt"><strong>[즐거운 여행]</strong> 크리스찬상조(주)</p></div>
                    <div class="wedding"><p class="txt"><strong>[기쁨을 함께]</strong> 크리스찬상조(주)</p></div>
                    <div class="funeral"><p class="txt"><strong>[슬픔을 함께]</strong> 크리스찬상조(주)</p></div>
                </div>

                <div class="menu">
                    <button type="button" class="menu_travel on"><span class="blind">크루즈상품</span></button>
                    <button type="button" class="menu_wedding"><span class="blind">웨딩상품</span></button>
                    <button type="button" class="menu_funeral"><span class="blind">장례상품</span></button>
                </div>

                <div class="info">
                    <div class="notice">
                        <div class="tab">
                            <span type="button" class="tab_cell on">
                                <button type="button" class="tab_item">공지사항</button>
                                <a href="/notice/noticeList.do" class="btn_more">+</a>
                            </span>
                            <span type="button" class="tab_cell">
                                <button type="button" class="tab_item">부고알림</button>
                                <a href="/funeral/funeralNoticeList.do" class="btn_more">+</a>
                            </span>
                        </div>
                        <!-- 공지사항 -->
                        <div id="notice" class="list on">
                            <ul class="list_inner">
                            <%if(nList.size()>0){%>
								<%for(NoticeDTO nDTO : nList){%>
	                                <li><a href="javascript:goNDT('<%=CmmUtil.nvl(nDTO.getNoticeNo())%>')"><%=CmmUtil.nvl(nDTO.getNoticeTitle()) %></a></li>
								<%}%>                            	
                                <!-- <li><a href="#">공지 2</a></li>
                                <li><a href="#">공지 3</a></li> -->
                           	<%}%>
                            </ul>
                        </div>
                        <!-- 부고알림 -->
                        <div id="report" class="list">
                            <ul class="list_inner">
							 <%if(fList.size()>0){%>
								<%for(FuneralNoticeDTO fDTO : fList){%>
	                                <li><a href="#"><%=CmmUtil.nvl(fDTO.getFuneralNoticeName())%>소천 | <%=CmmUtil.nvl(fDTO.getFuneralNoticeDay())%> | <%=CmmUtil.nvl(fDTO.getFuneralNoticePlace()) %> | 회원 <%=CmmUtil.nvl(fDTO.getFuneralNoticeMember()) %></a></li>
								<%}%>                            	
                                <!-- <li><a href="#">공지 2</a></li>
                                <li><a href="#">공지 3</a></li> -->
                           	<%}%>                            
                           	</ul>
                        </div>
                    </div>
                    <div class="customer">
                        <p class="center"><em>고객센터</em><strong>1644-4491</strong> <span>24시간 친절히 상담해드립니다.</span></p>
                        <a href="/apply/applyForm.do" class="btn_search"><span class="txt">가입신청</span></a>
                        <a href="/counsel/counselWrite.do" class="btn_member"><span class="txt">가입문의</span></a>
                    </div>
                </div>
            </div>
		</div>
		<script>
		    function menuAction(e) {
		    	var $this = $(e);
		    	var $el = $('.menu button');

		    	$el.removeClass('on');
		    	$this.addClass('on');
		    }
            var slider = $('.slide-nav').bxSlider({
                            auto: true,
                            autoStart: true,
                            autoControls: true,
                            pause: 3000,
                            stopAutoOnClick: false,
                            pager: true,
                            slideWidth: 1920,
                            onSlideBefore: function() {
                            	var num = slider.getCurrentSlide();
                                $(".slide-nav .txt").removeClass('on');
                            	$(".menu button").removeClass('on');

                                $(".menu button:nth-child(" + (num + 1)  + ")").addClass('on');
                            },
                            onSlideAfter: function() {
                            	$(".slide-nav .txt").addClass('on');

                            	slider.stopAuto();
                                setTimeout(function () {
                                    slider.startAuto();
                                }, 3000);
                            },
                            onSliderLoad: function() {
                            	$(".slide-nav .txt").addClass('on');
                            }
                          });

            $('.menu_travel').on('click', function(e) {
            	menuAction('.menu_travel');
            	slider.goToSlide(0);
            	return false;
            });
            $('.menu_wedding').on('click', function(e) {
                menuAction('.menu_wedding');
                slider.goToSlide(1);
                return false;
            });
            $('.menu_funeral').on('click', function(e) {
                menuAction('.menu_funeral');
                slider.goToSlide(2);
                return false;
            });

            var report = $('#report .list_inner').bxSlider({
                            mode: 'vertical',
                            auto: false,
                            autoControls: false,
                            stopAutoOnClick: false,
                            pager: false,
                            pause: 3000,
                            adaptiveHeight: true,
                            minSlides:3,
                            maxSlides:10,
                            moveSlides:1
                          });

            $('.info .tab_cell:first-child .tab_item').click(function() {
            	$('.info .tab_cell').removeClass('on');
            	$(this).parent().addClass('on');
            	$('#report').removeClass('on');
            	$('#notice').addClass('on')
            });
            $('.info .tab_cell:last-child .tab_item').click(function() {
                $('.info .tab_cell').removeClass('on');
                $(this).parent().addClass('on');
                $('#notice').removeClass('on');
                $('#report').addClass('on')
                report.startAuto();
            });
        </script>
	</div><!-- // main -->

	<div class="footer">
		<div class="container">

			<footer>
				<div class="footMenuWrap">
					<ul>
						<li><a href="#">채용정보</a></li>
						<li><a href="/infomation/infomation_a.do">주요정보고시사항</a></li>
						<li><a href="/company/road.do">오시는길</a></li>
						<li><a href="/agreement/agreementList.do">개인정보 취급방침</a></li>
					</ul>
				</div>

				<p class="copy">
					<small>크리스찬상조(주), 대표자 : 김현재, 서울시 강남구 논현동 268-2 1층, E-mail:cg4491@naver.com</small><br/>
					<small>대표전화:1644-4491, 팩스:02-556-4439, 통신판매신고번호:제2008-서울강남-1083호</small><br/>
					<small>Copyright (C) 2017 4christian.co.kr. All rights reserved</small>
				</p>

                <div class="familyWrap"> <!-- .btnFamily 버튼 클릭시 다중클래스 on 추가 -->
                    <section>
                        <h2><button type="button" class="btnFamily">FAMILY MAP</button></h2>
                        <div class="familyArea">
                            <div class="container">
                                <dl class="etc">
                                    <dt>기타</dt>
                                    <dd><a href="" target="_blank" title="새창">참조사이트1</a></dd>
                                    <dd><a href="" target="_blank" title="새창">참조사이트2</a></dd>
                                    <dd><a href="" target="_blank" title="새창">참조사이트3</a></dd>
                                    <dd><a href="" target="_blank" title="새창">참조사이트4</a></dd>
                                </dl>
                            </div>
                        </div>
                    </section>
                </div>
			</footer>
		</div>
	</div> <!-- // footer -->
</div> <!-- // wrap -->
<script>
$('.btnFamily').on('click', function() {
	$('.familyWrap').toggleClass('active');
})
</script>
</body>
</html>
