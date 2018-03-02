<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.cl.util.CmmUtil" %>
<%@ page import="com.cl.util.TextUtil" %>
<%@ page import="com.cl.util.PageUtil" %>
<%@ page import="com.cl.util.AES256Util" %>
<%@ page import="com.cl.util.SessionUtil" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.HashMap" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>관리자모드-크리스찬라이프</title>

<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />
<link type="text/css" rel="stylesheet" href="/public/css/default.css" />
<link type="text/css" rel="stylesheet" href="/public/css/layout_kor.css" />
<link type="text/css" rel="stylesheet" href="/public/css/sub_kor.css" />
<link type="text/css" rel="stylesheet" href="/public/js/toast/tui-grid.css" />
<script type="text/javascript" src="/public/js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="/public/js/TweenMax.min.js"></script>
<script type="text/javascript" src="/public/js/common.js"></script>
<script type="text/javascript" src="/public/js/contents.js"></script>
<script type="text/javascript" src="/public/js/jquery.form.js"></script>
<script type="text/javascript" src="/public/js/jquery-ui.min.js"></script>
<script type="text/javascript" src="/public/js/jquery.rss.js"></script>
<script type="text/javascript" src="/public/js/toast/underscore-min.js"></script>
<script type="text/javascript" src="/public/js/toast/backbone-min.js"></script>
<script type="text/javascript" src="/public/js/toast/tui-code-snippet.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
<script src="https://cdn.rawgit.com/emn178/Chart.PieceLabel.js/master/build/Chart.PieceLabel.min.js"></script>
<script type="text/javascript" src="/public/js/toast/tui-grid.js"></script>

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
			<!-- heaer 인쿠르드 -->
			<!--#include file="../include/inc_header.jsp"-->
			<%@include file="/WEB-INF/view/include/inc_header.jsp"%>
		</div>
	</div> <!-- // header -->

	<div id="contentsWrap">
		<div class="container">
			<div class="conTitWrap">
				<h2>CEO / 데이터분석</h2>
				<div class="location">
					<span class="home">홈</span>
					<span>CEO</span>
					<strong>데이터분석</strong>
				</div>
			</div> <!-- // conTitWrap -->
			<!-- 메뉴 영역 -->
			



<script type="text/javascript">
	var chartUrl = '/Lmin/analysis/stateAnalysis.do';

	$(function() {
		ajaxChart();
		
		//메뉴 제어 
		var lnb = $(".pcLnbWrap ul li a");
		var menuId = "MN70800";
		var mbId = "MO70800";
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
		
		$('#searchBox').change(function(){
			chartUrl = '/Lmin/analysis/'+$('#searchBox option:selected').val()+'Analysis.do';
			$('#small_title').text($('#searchBox option:selected').text());
			ajaxChart();
		});
	});

	function goPage(page, lastPage){
		var f = $("#f");
		$("#page").val(page);
		f.submit();
	};
	
	function addComma(x) {
	    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	};
	
	function addPer(x){
		return x.toString()+"%";
	}
	
	function ajaxChart(){
		var str = $('#searchBox option:selected').val();
		$.ajax({
			url : chartUrl,
			method : 'post',
			success : function(rslt){
				console.log(rslt);
				if(str == 'sex'){
					sexChart(rslt);
				}else if(str == 'age'){
					ageChart(rslt);
				}else if(str == 'reReg'){
					reRegChart(rslt);
				}else if(str == 'regYear'){
					regYearChart(rslt);
				}else if(str == 'state'){
					stateChart(rslt);
				}
			}
		});
	};

	function toastGrid(header, gridData){
		$('#grid').html('');		
		
		var instance = new tui.Grid({
		    el: $('#grid'), // Container element
		    scrollX: false,
		    scrollY: false,
		    columns: header,
		    data: gridData
		});
	};
	

	function stateChart(rslt){
		var label = new Array();
		var data1 = new Array();
		
		var gridHeader = new Array();
		var gridData = new Array();
		
		gridHeader.push({title : '지역', name : 'state', align:'center'});
		gridHeader.push({title : '가입자수', name : 'cnt',  align:'center'});
		$.each(rslt, function(key, value){
			label.push(value.state);
			data1.push(value.cnt);
			gridData.push({state : value.state, cnt : addComma(value.cnt)});
		});
		
		$('#chartArea').html("<canvas id='stateChart'></canvas>");
		var ctx1 = $('#stateChart').get(0).getContext('2d');

		var myChart = new Chart(ctx1, {
			type : 'bar',
			data : {
				datasets : [{
					label : '인원수',
					data : data1,
					backgroundColor:'rgb(54, 162, 235)'
				}],
				labels : label
			},
			options : {
				
			}
		});
		toastGrid(gridHeader, gridData);
	};
	
	function sexChart(rslt){
		var label = new Array();
		var data1 = new Array();
		
		var gridHeader = new Array();
		var gridData = new Array();
		
		gridHeader.push({title : '성별', name : 'sex', align:'center'});
		gridHeader.push({title : '인원수', name : 'cnt',  align:'center'});
		$.each(rslt, function(key, value){
			label.push(value.sex);
			data1.push(value.cnt);
			gridData.push({sex : value.sex, cnt : addComma(value.cnt)});
		});
		
		$('#chartArea').html("<center><canvas id='sexChart' style='max-width:500px; max-height:495px;'></canvas></center>");
		var ctx1 = $('#sexChart').get(0).getContext('2d');

		var myChart = new Chart(ctx1, {
			type : 'pie',
			data : {
				datasets : [{
					data : data1,
	                backgroundColor: [
	                	'rgb(54, 162, 235)',
	                	'rgb(222, 83, 71)'
	                ]
				}],
				labels : label
			},
			options : {
			  pieceLabel: {
				    render: 'value',
				    fontSize: 14,
				    fontStyle: 'bold',
				    fontColor: '#000',
				    fontFamily: '"Lucida Console", Monaco, monospace'
			  }
			},
			
		});
		
		toastGrid(gridHeader, gridData);
	};
	
	function ageChart(rslt){
		var label = new Array();
		var male = new Array();
		var female = new Array();
		
		var gridHeader = new Array();
		var gridData = new Array();
		
		gridHeader.push({title : '연령대', name : 'age', align:'center'});
		gridHeader.push({title : '남자', name : 'm', align:'right'});
		gridHeader.push({title : '여자', name : 'f',align:'right'});
		gridHeader.push({title : '총합', name : 'cnt',align:'right'});
		
		$.each(rslt, function(key, value){
			if(value.age == '0'){
				label.push('영유아');
				male.push(value.m);
				female.push(value.f);
				gridData.push({age : '영유아', m : addComma(value.m), f : addComma(value.f), cnt : addComma(value.cnt)});
				
			}else{
				label.push(value.age + '대');
				male.push(value.m);
				female.push(value.f);
				gridData.push({age : value.age+"대", m : addComma(value.m), f : addComma(value.f), cnt : addComma(value.cnt)});
			}
		});
		
		$('#chartArea').html("<canvas id='ageChart'></canvas>");
		var ctx1 = $('#ageChart').get(0).getContext('2d');
		
		var myChart = new Chart(ctx1, {
			type : 'bar',
			data : {
				datasets : [{
					label : '남자',
					data : male,
					backgroundColor:'rgb(54, 162, 235)'
				},{
					label : '여자',
					data : female,
					backgroundColor:'rgb(222, 83, 71)'
        			
				}],
				labels : label
			},
			options : {
				scales : {
					xAxes : [{
						stacked : true
					}],
					yAxes : [{
						stacked : true
					}]
				}
			}
		});
		toastGrid(gridHeader, gridData);
	};
	
	function reRegChart(rslt){
		var label = new Array();
		var data1 = new Array();
		
		var gridHeader = new Array();
		var gridData = new Array();
		
		gridHeader.push({title : '총회원수(행사, 해지, 만기)', name : 'cnt', align:'center'});
		gridHeader.push({title : '재가입인원수', name : 'rereg',  align:'center'});
		gridHeader.push({title : '미가입인원수', name : 'notreg',  align:'center'});
		gridHeader.push({title : '재가입률', name : 'per',  align:'center'});
		label.push('재가입률');
		label.push('미가입률');
		$.each(rslt, function(key, value){
			data1.push(value.reReg);
			data1.push(value.notReg);
			gridData.push({cnt : addComma(value.cnt), rereg : addComma(value.reReg), notreg : addComma(value.notReg), per : addPer(value.per)});
		});
		
		$('#chartArea').html("<center><canvas id='reRegChart' style='max-width:500px; max-height:495px;'></canvas></center>");
		var ctx1 = $('#reRegChart').get(0).getContext('2d');

		var myPieChart = new Chart(ctx1, {
			type : 'pie',
			data : {
				datasets : [{
					data : data1,
	                backgroundColor: [
	                	'rgb(54, 162, 235)',
	                	'rgb(222, 83, 71)'
	                ]
				}],
				labels : label
			},
			options : {
				  pieceLabel: {
					    render: 'percentage',
					    fontSize: 14,
					    fontStyle: 'bold',
					    fontColor: '#000',
					    fontFamily: '"Lucida Console", Monaco, monospace'
				}
			},
		});
		
		toastGrid(gridHeader, gridData);
	};
	
	function regYearChart(rslt){
		var label = new Array();
		var data1 = new Array();
		
		var gridHeader = new Array();
		var gridData = new Array();
		
		gridHeader.push({title : '구분', name : 'years', align:'center'});
		gridHeader.push({title : '가입자수', name : 'cnt',  align:'center'});
		$.each(rslt, function(key, value){
			label.push(value.years);
			data1.push(value.cnt);
			gridData.push({years : value.years, cnt : addComma(value.cnt)});
		});
		
		$('#chartArea').html("<canvas id='regYearChart'></canvas>");
		var ctx1 = $('#regYearChart').get(0).getContext('2d');

		var myChart = new Chart(ctx1, {
			type : 'line',
			data : {
				datasets : [{
					label : '가입자수',
					data : data1,
	                backgroundColor: 
	                	'rgb(128, 179, 255)'
	                ,
	                borderColor: 'rgb(54, 162, 235)'
	                ,
	                fill : 'start'
				}],
				labels : label
			},
			options : {
				elements : {
					line : {
						tension : 0.000001
					}
				},
                'onClick' : function (evt, item) {
                	if(item.length>0){
	                    console.log(item._model);
	                    console.log(label[item.index]);
                	}
                }
		    }
		});
		toastGrid(gridHeader, gridData);
	};
</script>

<form action="#" name="menuFrm" method="post">
	<input type="hidden" name="menuNum"/>
</form>	
			<%@include file="/WEB-INF/view/Lmin/include/navBar.jsp" %>
			<!-- 메뉴 영역 -->
			
			<div class="contents"> <!-- 페이지별 ID none -->
				<div class="boardType2">
					<table summary="">
						<caption></caption>
						<colgroup>
							<col width="100%">
						</colgroup>
						<tbody>
							<tr>
								<td>
									<select id="searchBox" name="searchBox" class="inputType3" style="width : 200px;">
										<option value="state">지역별(시,도)</option>
										<option value="sex">성별</option>
										<option value="age">연령대별</option>
										<option value="reReg">재가입율</option>
										<option value="regYear">연별가입자</option>
									</select>
								</td>
							</tr>
						</tbody>
						
					</table>
                </div>
                <br><br>
                
				<h3 class="smallTit" id="small_title">지역별(시,도)</h3>
				<div id="chartArea">
				
				</div>
				<br><br>
				<div id="grid"></div>
				<!-- // pageArea -->
			</div> <!-- // contents -->
		</div>
	</div> <!-- // contentsWrap -->

	<div class="footer">
		<div class="container">
			<footer>
				<div class="footMenuWrap">
					<ul>
						<li><a href="">채용정보</a></li>
						<li><a href="">주요정보고시사항</a></li>
						<li><a href="">오시는길</a></li>
						<li><a href="">개인정보 취급방침</a></li>
					</ul>
				</div>

				<p class="copy">
					<small>크리스찬라이프, 대표자 : 김현재, 서울시 강남구 논현동 268-2 1층, E-mail:cg4491@naver.com</small><br/>
					<small>대표전화:1644-4491, 팩스:02-556-4439, 통신판매신고번호:제2008-서울강남-1083호</small><br/>
					<small>Copyright (C) 2016 Samsung C&amp;T Corporation. All rights reserved</small>
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
</body>
</html>
