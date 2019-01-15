<%@ page import = "com.cl.util.SessionUtil" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
			<div class="moLnbWrap">
				<nav class="flexContainer">
					<div class="flexItem3">
						<strong><button type="button" class="select">관리자모드</button></strong>
						<ul>
							<li><a href="javascript:goMenu('', '');">관리자모드</a></li>
						</ul>
					</div>
					<div class="flexItem4"> <!-- .select 버튼 클릭시 다중클래스 on 추가 -->
						<strong><button type="button" class="select" id="subtitle">고객센터</button></strong>
						<ul>
						<!-- <li id="MO70100"><a href="javascript:goMenu('/Lmin/company/branchList.do', 'MO70100');">전국지사안내</a></li>
						<li id="MO70200"><a href="javascript:goMenu('/Lmin/company/adviceList.do', 'MO70200');">상담사조회</a></li> -->
						<li id="MO70300"><a href="javascript:goMenu('/Lmin/company/cyber.do', 'MO70300');">사이버홍보실</a></li>
						<li id="MO70400"><a href="javascript:goMenu('/Lmin/funeral/funeralInfoList.do', 'MO70400');">전국장례시설안내</a></li>
						<li id="MO70500"><a href="javascript:goMenu('/Lmin/funeral/funeralNoticeList.do', 'M760500');">부고알림</a></li>
						<li id="MO70600"><a href="javascript:goMenu('/Lmin/cruise/cruiseScheduleList.do', 'MO70600');">크루즈일정</a></li>
						<li id="MO70700"><a href="javascript:goMenu('/Lmin/notice/noticeList.do', 'MO70700');">공지사항</a></li>
						<li id="MO70800"><a href="javascript:goMenu('/Lmin/counsel/counselList.do', 'MO70800');">1:1상담</a></li>
						<li id="MO70900"><a href="javascript:goMenu('/Lmin/regulation/regulationList.do', 'MO0900');">상조관련법규</a></li>
						<li id="MO71200"><a href="javascript:goMenu('/Lmin/appli/appliList.do', 'MO71200');">가입신청</a></li>
						<li id="MO71300"><a href="javascript:goMenu('/Lmin/member/memberList.do', 'MO71300');">회원정보</a></li>
						<li id="MO71400"><a href="javascript:goMenu('/Lmin/catalogue/catalogueList.do', 'MO71400');">카타로그</a></li>
						<li id="MO71400"><a href="javascript:goMenu('/Lmin/inquiry/inquiryInfoInput.do', 'MO71400');">납부조회</a></li>
						<li id="MO71400"><a href="javascript:goMenu('/clState.do', 'MO71400');">홈페이지 방문자수 분석</a></li>
						<% if(SessionUtil.getSessionInfo("memberAuth").equals("CEO")){%>
						<li id="MO71500"><a href="javascript:goMenu('/Lmin/analysis/analysisList.do', 'MO71500');">데이터분석</a></li>
						<% } %>
						</ul>
					</div>
								
				</nav>
			</div> <!-- // moLnbWrap -->

			<div class="pcLnbWrap">
				<nav>
					<ul class="pcLnb">
						<!-- <li id="MO70100"><a href="javascript:goMenu('/Lmin/company/branchList.do', 'MO70100');">전국지사안내</a></li>
						<li id="MO70200"><a href="javascript:goMenu('/Lmin/company/adviceList.do', 'MO70200');">상담사조회</a></li> -->
						<li id="MO70300"><a href="javascript:goMenu('/Lmin/company/cyber.do', 'MO70300');">사이버홍보실</a></li>
						<li id="MO70400"><a href="javascript:goMenu('/Lmin/funeral/funeralInfoList.do', 'MO70400');">전국장례시설안내</a></li>
						<li id="MO70500"><a href="javascript:goMenu('/Lmin/funeral/funeralNoticeList.do', 'M760500');">부고알림</a></li>
						<li id="MO70600"><a href="javascript:goMenu('/Lmin/cruise/cruiseScheduleList.do', 'MO70600');">크루즈일정</a></li>
						<li id="MO70700"><a href="javascript:goMenu('/Lmin/notice/noticeList.do', 'MO70700');">공지사항</a></li>
						<li id="MO70800"><a href="javascript:goMenu('/Lmin/counsel/counselList.do', 'MO70800');">1:1상담</a></li>
						<li id="MO70900"><a href="javascript:goMenu('/Lmin/regulation/regulationList.do', 'MO0900');">상조관련법규</a></li>
						<li id="MO71200"><a href="javascript:goMenu('/Lmin/appli/appliList.do', 'MO71200');">가입신청</a></li>
						<li id="MO71300"><a href="javascript:goMenu('/Lmin/member/memberList.do', 'MO71300');">회원정보</a></li>
						<li id="MO71400"><a href="javascript:goMenu('/Lmin/catalogue/catalogueList.do', 'MO71400');">카타로그</a></li>
						<li id="MO71400"><a href="javascript:goMenu('/Lmin/inquiry/inquiryInfoInput.do', 'MO71400');">납부조회</a></li>
						<li id="MO71400"><a href="javascript:goMenu('/clState.do', 'MO71400');">홈페이지 방문자수 분석</a></li>
						<% if(SessionUtil.getSessionInfo("memberAuth").equals("CEO")){%>
						<li id="MO71500"><a href="javascript:goMenu('/Lmin/analysis/analysisList.do', 'MO71500');">데이터분석</a></li>
						<% } %>
						
					</ul>
				</nav>
			</div> <!-- // pcLnbWrap -->
