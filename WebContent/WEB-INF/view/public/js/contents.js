/** only number*/
$(document).ready(function() {

	$(".numPhn_1").keydown(function() {
		console.log(event.keyCode);
	    if ((event.keyCode >= 48 && event.keyCode <= 57 ) || (event.keyCode >= 96 && event.keyCode <= 105)  ) { //숫자키만 입력
	        return true;
	    } else {
	    	if(event.keyCode == 8){ //백스페이스 허용
	    		return true;
	    	}
	    	if(event.keyCode == 9){ //탭키 허용
	    		return true;
	    	}
	    	if(event.keyCode == 46){ //del 키 허용
	    		return true;
	    	}
	        event.returnValue = false;
	    }
	});

});

/* 메뉴이동 */
function goMenu(url, num) {
	$("[name=menuNum]").val(num);
	$("form[name=menuFrm]").attr("action", url);
	$("form[name=menuFrm]").submit();

}

/***오늘 / 1주일 / 15일 / 3개월**/
/**
 * 사용법
 * 화면 내 class="calendar" 가 두개 있어야 함
 * getDays(0) 오늘 셋팅
 * getDays(7) 1주일 셋팅
 * getDays(15) 15일 셋팅
 * getDays(90) 3개월 셋팅
 **/
function getDays(obj){
	var pre_day = "";
	var nex_day = "";
	var now = new Date();
	var year= now.getFullYear();
    var mon = (now.getMonth()+1)>9 ? ''+(now.getMonth()+1) : '0'+(now.getMonth()+1);
    var day = now.getDate()>9 ? ''+now.getDate() : '0'+now.getDate();

    var now2 = new Date(Date.parse(now) +obj * 1000 * 60 * 60 * 24);
    var year2 = now2.getFullYear();
    var mon2 = (now2.getMonth()+1)>9 ? ''+(now2.getMonth()+1) : '0'+(now2.getMonth()+1);
    var day2 = now2.getDate()>9 ? ''+now2.getDate() : '0'+now2.getDate();
    
    pre_day = year+mon+day;
    nex_day = year2+mon2+day2;
	
    $(".calendar").each(function(index){
    	if(index == 0){
    		$(this).val(pre_day);
    	}else if(index == 1){
    		$(this).val(nex_day);
    	}
    	
    });
     
}


/****날짜 데이터 (YYYYMMDD ) 형식을 validation 하는 function ****/
function getPropositionDate(data){
	
	if(data.length != 8 ){
		return false;
	}
	var _year = data.substr(0,4);
    var _month= data.substr(4,2);
    var _day = data.substr(6,2);
    
    data = _year+ "-" + _month+"-" + _day;
    var format = /^(19|20)\d{2}-(0[1-9]|1[012])-(0[1-9]|[12][0-9]|3[0-1])$/;
    if(data.search(format) == -1){
    	return false;
    }else{
    	return true;
    }
	
}

/****년도 데이터 (YYYY ) 형식을 validation 하는 function ****/
function getPropositionYear(data){
	
	if(data.length != 4 ){
		return false;
	}

	var format = /^(19|20)\d{2}/;
    if(data.search(format) == -1){
    	return false;
    }else{
    	return true;
    }
	
}

/***
 * 공통 팝업 function
 * */
function centerNewWin(url, name, width, height) {
	  var wi = screen.width - width;
	  var hi = screen.height - height;

	  if( wi < 0 ) wi = 0;
	  if( hi < 0 ) hi = 0;

	  var info = 'left=' + (wi/2) + ',top=' + (hi/2) + ',width='  + width + ',height=' + height + ',resizable=no,scrollbars=no,menubars=no,status=no,toolbar=no, location=no';
	  var newwin = window.open(url, name, info);
	  newwin.focus();
}

/**SNS Share function */
function fn_snsShare(snsType, url){
	var snsUrl = "";
	if(snsType=="facebook"){
		snsUrl = "https://www.facebook.com/sharer/sharer.php?u=" + url;
		centerNewWin(snsUrl, "SNS", "800", "600");
	}
	
}

/**구글맵 호출**/
function fn_googleMap(title , formId ,y_Line , x_Line ){

	var Y_point			= y_Line;		// Y 좌표
	var X_point			= x_Line;		// X 좌표
	var zoomLevel		= 16;						// 지도의 확대 레벨 : 숫자가 클수록 확대정도가 큼
	var markerTitle		= title;				// 현재 위치 마커에 마우스를 오버을때 나타나는 정보
	var markerMaxWidth	= 300;						// 마커를 클릭했을때 나타나는 말풍선의 최대 크기
	var myLatlng = new google.maps.LatLng(Y_point, X_point);
	var mapOptions = {zoom: zoomLevel,center: myLatlng,mapTypeId: google.maps.MapTypeId.ROADMAP}
	var map = new google.maps.Map(document.getElementById(formId), mapOptions);
	var marker = new google.maps.Marker({position: myLatlng,	map: map,title: markerTitle	});
	/*var infowindow = new google.maps.InfoWindow({content: contentString, maxWidth: markerMaxWidth	});
	google.maps.event.addListener(marker, 'click', function() {
		infowindow.open(map, marker);
	});*/
	
}

/**푸터 영역 팝업 호출 공통**/
function fn_SecurityReport(obj){
	var popUrl = "";
	if (obj == "KOR"){
		popUrl = "/securityReport.do";
	}else if (obj == "ENG"){
		popUrl = "/eng/securityReport.do";
	}
	
	centerNewWin(popUrl, "NEW", "800", "600");
}

function fn_Reception(){
	var popUrl = "/reception.do";
	centerNewWin(popUrl, "RECEPTION", "800", "345");
}

function fn_LegalNotice(obj){
	var popUrl = "";
	
	if (obj == "KOR"){
		popUrl = "/legalNotice.do";
	}else if (obj == "ENG"){
		popUrl = "/eng/legalNotice.do";
	}	
	
	centerNewWin(popUrl, "LegalNotice", "800", "600");
}	

function fn_Privacy(obj){
	var popUrl = "";
	
	if (obj == "KOR"){
		popUrl = "/privacy.do";
	}else if (obj == "ENG"){
		popUrl = "/eng/privacy.do";
	}	
	
	centerNewWin(popUrl, "privacy", "800", "600");
}	

/**푸터 영역 팝업 호출**/
