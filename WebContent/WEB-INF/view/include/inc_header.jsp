<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>:크리스찬상조(주):</title>

<meta charset="utf-8" />
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

<!--[if lt IE 9]>
	<script src="/js/html5.js"></script>
	<script src="/js/respond.js"></script>
<![endif]-->
<script type="text/javascript">
</script>
<body>
<div id="skipnavi">
	<a href="#contentsWrap">본문 바로가기</a>
</div>
<div class="wrap">
	<div class="header">
		<div class="container">
			
			<header>
				<h1 class="logo">
					<a href="/index.jsp"><img src="/public/img/common/t_logo.png" alt="크리스찬라이프" /></a>
				</h1>

				<div class="topMenuWrap">
					<ul>
						<li><a href="../appli/appli_form.jsp">온라인가입신청</a></li>
						<li><a href="../member/login.do">로그인</a></li>
						<li><a href="../member/joinStep.do">회원가입</a></li>
					</ul>
				</div>

				<button type="button" class="btnMenuView"><span>전체메뉴 열기</span></button> <!-- .btnMenuView 클릭시 megaMenu에 다중클래스 open, .menuWrap .depth01 li:first-child에 클래스 on 추가 -->
				
				<div class="lnb">
					<div class="megaMenu">
						<div class="container">
							<section>
								<h2>전체메뉴</h2>
								<button type="button" class="btnMenuClose"><span>전체메뉴 닫기</span></button>
								<div class="menuWrap">
									<nav>
										<ul class="depth01">
											<li> <!-- 1depth: a에 클릭시 클래스 on 추가 -->
												<a href="javascript:">회사소개</a>
												<div class="depthWrap">
													<div class="depthArea">
														<div class="overviewArea">
															<aside>
																<strong><img src="/public/img/gnb/img_online.png" alt="온라인상품가입" /></strong>
																<div class="btnArea">
																	<a href="javascript:goMenu('/overview/info.do', 'MN10100');" class="btnDefault">바로가기<span class="iconGoArrow"></span></a>
																</div>
															</aside>
														</div>

														<div class="depth02">
															<ul class="sub_depth">
																<li><a href="javascript:goMenu('../company/overview.jsp', 'MN10100');">인사말</a></li>
																<li><a href="javascript:goMenu('../company/organ.jsp', 'MN10200');">조직도및연혁</a></li>
																<li><a href="javascript:goMenu('../company/branch.jsp', 'MN10300');">전국지사안내</a></li>
																<li><a href="javascript:goMenu('../company/advice.jsp', 'MN10400');">상담사조회</a></li>
																<li><a href="javascript:goMenu('../company/cyber.jsp', 'MN10500');">사이버홍보실</a></li>
																<li><a href="javascript:goMenu('../company/road.jsp', 'MN10600');">오시는길</a></li>
															</ul>
														</div>
													</div>
												</div>
											</li>
											<li>
												<a href="javascript:">상조상품안내</a>
												<div class="depthWrap">
													<div class="depthArea">
														<div class="depth02">
															<ul class="sub_depth">
																<li><a href="javascript:goMenu('../info/pro_info.jsp', 'MN20100');">상조상품특징</a></li>
																<li><a href="javascript:goMenu('../info/join_step.jsp', 'MN20200');">가입절차</a></li>
																<li><a href="javascript:goMenu('../info/catalogue.jsp', 'MN20300');">웹카다로그</a></li>
																<li><a href="javascript:goMenu('../info/end_pro.jsp', 'MN20400');">단종상품안내</a></li>
															</ul>
														</div>
													</div>
												</div>
											</li>
											<li>
												<a href="javascript:">장례상품</a>
												<div class="depthWrap">
													<div class="depthArea">
														<div class="depth02">
															<ul class="sub_depth">
																<li><a href="javascript:goMenu('../funeral/funeral_mark.jsp', 'MN30100');">장례상품특징</a></li>
																<li><a href="javascript:goMenu('../funeral/funeral_list_a.jsp', 'MN30200');">장례상품</a></li>
																<li><a href="javascript:goMenu('../funeral/funeral_info_a.jsp', 'MN30300');">장례정보</a></li>
																<li><a href="javascript:goMenu('../funeral/funeral_notice.jsp', 'MN30400');">부고알림</a></li>
															</ul>
														</div>
													</div>
												</div>
											</li>
											<li>
												<a href="javascript:">웨딩상품</a>
												<div class="depthWrap">
													<div class="depthArea">
														<div class="depth02">
															<ul class="sub_depth">
																<li><a href="javascript:goMenu('../marry/marry_mark.jsp', 'MN40100');">웨딩상품특징</a></li>
																<li><a href="javascript:goMenu('../marry/marry_list_d.jsp', 'MN40200');">웨딩상품</a></li>
															</ul>
														</div>
													</div>
												</div>
											</li>
											<li>
												<a href="javascript:">크루즈상품</a>
												<div class="depthWrap">
													<div class="depthArea">
														<div class="depth02">
															<ul class="sub_depth">
																<li><a href="javascript:goMenu('../cruise/cruise_mark.jsp', 'MN50200');">크루즈상품특징</a></li>
																<li><a href="javascript:goMenu('../cruise/cruise_pro.jsp', 'MN50200');">크루즈성지순례상품</a></li>
																<li><a href="javascript:goMenu('../cruise/cruise_schedule.jsp', 'MN50300');">크루즈일정</a></li>
															</ul>
														</div>
													</div>
												</div>
											</li>
											<li>
												<a href="javascript:">고객센터</a>
												<div class="depthWrap">
													<div class="depthArea">
														<div class="depth02">
															<ul class="sub_depth">
																<li><a href="javascript:goMenu('../notice/notice_list.jsp', 'MN60100');">공지사항</a></li>
																<li><a href="javascript:goMenu('../qna/qna_list.jsp', 'MN60200');">자주하는질문</a></li>
																<li><a href="javascript:goMenu('../counsel/counsel_list.jsp', 'MN60300');">1:1상담</a></li>
																<li><a href="javascript:goMenu('../infomation/infomation_a.jsp', 'MN60400');">주요정보고시사항</a></li>
																<li><a href="javascript:goMenu('../regulation/regulation_list.jsp', 'MN60500');">상조관련법규</a></li>
																<li><a href="javascript:goMenu('../agreement/agreement_list.jsp', 'MN60600');">이용약관</a></li>
																<li><a href="javascript:goMenu('../inquiry/inquiry_list.jsp', 'MN60700');">납부조회</a></li>
																<li><a href="javascript:goMenu('../appli/appli_form.jsp', 'MN60800');">가입신청</a></li>
															</ul>
														</div>
													</div>
												</div>
											</li>
										</ul>
									</nav>
								</div>
							</section>
						</div>
						<button type="button" class="btnGnbClose"><span>전체메뉴 닫기</span></button>
						<div class="dim"></div>
						<!--<div class="utility">-->
							<!--<ul>-->
								<!--<li class="eng"><a href="../index.jsp">Home</a></li>-->
								<!--<li><a href="../etc/sitemap.jsp">Sitemap</a></li>-->
							<!--</ul>-->
						<!--</div>-->
					</div>
				</div>
			</header>
		</div>
	</div> <!-- // header -->