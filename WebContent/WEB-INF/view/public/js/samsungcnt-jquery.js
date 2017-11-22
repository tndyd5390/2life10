/****************************************
 * COMMON JQUERY  DEV
 * ( 2015-04-09 ) 
 ****************************************/

//AJAX
(function($){
	
	/******************************************************************************
	*	Code Item Create Element Util 
	*	사용방법 : $(selector).codeItemUtil(Selected Value, option);
	*	@return :
	*******************************************************************************/
	$.fn.codeItemUtil = function(chkParam, options){
		var element = $(this).attr("id"), self = this;
		var settings = {
				url : "", 			// request URL
				paramData : {}, 	// request Parameter
				addConditionQry : "", // 추가 조건 Query
				type : "default",	// Element Type 
				firstName : "All", // type이 select인 경우 첫번째 Option 지정명
				firstValue : "", // type이 select인 경우 첫번째 Option 지정 Value
				firstView : true, //firstName을 생서할지 여부
				exceptValue : "", // 검색된 것 중 제외시킬 값 지정(여러건 일 경우 ',' 구분)
				textField : "",		// DB Search Field(Element Label Title)
				valueField : "",	// DB Search Field(Element Value)
				fieldId : "",		// Element Name and ID
				onclick : "",		// onclick function
				fieldClass : "",
				fieldFor : "",
				loadcomplete : function(){} // DOM이 Load된 후 실행할 함수 지정
		};
		settings = $.extend(settings, options);
		settings.paramData["addConditionQry"] = settings.addConditionQry;
		settings.paramData["onclick"] = settings.onclick;
		
		if(settings.onclick != ""){
			settings.onclick = "onClick='"+ settings.onclick+"'";
		}
		
		function idxOf(arr, str){
			var rslt = -1;
			for(var i=0; i < arr.length; i++){
				if(arr[i] == str){
					rslt = i;
				}
			}
			return rslt;
		}
		var except = [];
		if(settings.exceptValue != ""){
			except = settings.exceptValue.split(",");
		}
		
		var returnDate= '{"list":[';
		$.ajax({
			 url : settings.url,
			 type : "POST",
			 data : settings.paramData
		})
		.done(function ( data ) {
			
			var jsonObj = $.parseJSON(data);
			if(settings.type == "select"){
				$("#"+element).empty().data('options'); 
			}
			if(jsonObj.count > 0){
				if(settings.type == "select" && settings.firstView){
					if(chkParam == settings.firstValue){
						$("<option />", {value:settings.firstValue, text:settings.firstName}).appendTo("#"+element).attr("selected", true);
					}else{
						$("<option />", {value:settings.firstValue, text:settings.firstName}).appendTo("#"+element);
					}
				}
				
				$.each(jsonObj.list, function(index, item){
					var txt = "", val = "";
					$.each(item, function(key, value){
						if(key == settings.valueField){val = value;}
						if(key == settings.textField){txt = value;}
					});
					if(idxOf(except, val) == -1){
						
						if(settings.type == "select"){
							if(chkParam == val){
								$("<option />", {value:val, text:txt}).appendTo("#"+element).attr("selected", true);
							}else{
								$("<option />", {value:val, text:txt}).appendTo("#"+element);
							}
						}else if(settings.type == "checkbox" || settings.type == "radio"){
							if(settings.type == "checkbox"){
								var input = "<input type='checkbox' class='"+settings.fieldClass+"' id='"+settings.fieldId+"["+index+"]' name='"+settings.fieldId+"' value='"+val+"' "+settings.onclick+" /> <label for='"+settings.fieldId+"["+index+"]'>"+txt+"</label>";
							}
							else{
								var input = "<input type='radio' class='"+settings.fieldClass+"' id='"+settings.fieldId+"_"+index+"' name='"+settings.fieldId+"' value='"+val+"' "+settings.onclick+" /> <label style='margin-right:10px;' for='"+settings.fieldId+"_"+index+"'>"+txt+"</label>";
							}
							$(input).appendTo("#"+element);
							if(chkParam == val){
								$("#"+settings.fieldId+"_"+index).attr("checked", true);
							}
						}
						returnDate += $.JSONtoString(item)+",";
					}
				});
				returnDate = returnDate.substr(0,returnDate.length-1);
			}
			returnDate += ']}';
		})
		.complete(function(){//$.parseJSON(returnDate)
			var selectVal = "";
			if(settings.type == "select"){
				if($("#"+element+" option:selected").val() == ""){
					selectVal = $("#"+element+" option:eq(0)").val();
				}else{
					selectVal = $("#"+element+" option:selected").val();
				}
				if($("#"+element+" option").length < 1){
					$("<option />", {value:settings.firstValue, text:settings.firstName}).appendTo("#"+element);
				}
			}else{
				selectVal =  $("input[name='"+settings.fieldId+"']:checked").val();
			}
			settings.loadcomplete(selectVal, $.parseJSON(returnDate));
		})
		.error(function(){alert("페이지에 필요한 요소가 생성되지 않았습니다.");});
		return this;	
	},
	
	$.codeItemJsonData = function(options){
		var settings = {
				url : "", 			// request URL
				paramData : {}, 	// request Parameter
				addConditionQry : "", // 추가 조건 Query
				exceptValue : "", // 검색된 것 중 제외시킬 값 지정(여러건 일 경우 ',' 구분)
				textField : "",		// DB Search Field(Element Label Title)
				valueField : "",	// DB Search Field(Element Value)
				loadcomplete : function(){} // 검색 완료 후 실행할 함수 지정
		};
		settings = $.extend(settings, options);
		settings.paramData["addConditionQry"] = settings.addConditionQry;
		function idxOf(arr, str){
			var rslt = -1;
			for(var i=0; i < arr.length; i++){
				if(arr[i] == str){
					rslt = i;
				}
			}
			return rslt;
		}
		var except = [];
		if(settings.exceptValue != ""){
			except = settings.exceptValue.split(",");
		}
		
		var returnDate= '{"list":[';
		$.ajax({
			 url : settings.url,
			 type : "POST",
			 data : settings.paramData
		})
		.done(function ( data ) {
			
			var jsonObj = $.parseJSON(data);
			if(jsonObj.count > 0){
				
				$.each(jsonObj.list, function(index, item){
					var txt = "", val = "";
					$.each(item, function(key, value){
						if(key == settings.valueField){val = value;}
						if(key == settings.textField){txt = value;}
					});
					if(idxOf(except, val) == -1){
						returnDate += $.JSONtoString(item)+",";
						
					}
				});
				returnDate = returnDate.substr(0,returnDate.length-1);
				
			}
			returnDate += ']}';
		})
		.complete(function(){//$.parseJSON(returnDate)
			settings.loadcomplete($.parseJSON(returnDate));
		})
		.error(function(){alert("페이지에 필요한 요소가 생성되지 않았습니다.");});
		return this;
	},
	
	$.JSONtoString = function(object){
		var results = [];
	    for (var property in object) {
	        var value = object[property];
	        if (value)
	            results.push('"'+property.toString() + '" : "' + value + '"');
	        }
	                 
	        return '{' + results.join(', ') + '}';
	},
	
	$.fn.loadingCompleteArea = function(){
		var element = $("<div id='load_element' />").width($(this).width())
						.append("<div id='ajaxLoadingBoxForPopticle'>"
								+ "<img src='/dchimg/common/loading1.gif' style='position:relative; top:80px; left:15px;' />"
								+ "<p style='padding:90px 0 0 40px;'>loading...</p>"
								+ "</div>");
		$(element).insertAfter(this);
		return this;
	},
	
	$.fn.loadingCompleteClear = function(){
		$(this).parent().find("div[id='load_element']").remove();
	},
	
	$.numberHyphen = function(str){
		var regExp = /[^0-9-]/g;
		return regExp.test(str);
	},
	
	$.juminCheck = function(str){
		var regExp = /^(?:[0-9]{2}(?:0[1-9]|1[0-2])(?:0[1-9]|[1,2][0-9]|3[0,1]))[1-6][0-9]{6}$/;
		return regExp.test(str);
	};
})(jQuery);
	

//FORMAT
(function($){
	
$.browser={};(function(){
    jQuery.browser.msie=false;
    $.browser.version=0;if(navigator.userAgent.match(/MSIE ([0-9]+)\./)){
    $.browser.msie=true;jQuery.browser.version=RegExp.$1;}
})();
	
	
/******************************************************************************
*	Email 형식 체크
*	사용방법 : $.mailFrm("") or $.mailFrm($("#").val())
*	@return : true(맞는 형식) | false(잘못된 형식)
*******************************************************************************/
$.mailFrm = function(str){
	return ($.trim(str).match(/^[_\-\.0-9a-zA-Z]{3,}@[-.0-9a-zA-z]{2,}\.[a-zA-Z]{2,4}$/)) ? true : false;
},

/******************************************************************************
*	NUMBER 체크 
*	사용방법 : $.numberChk("") or $.numberChk($("#").val())
*	@return : true(맞는 형식) | false(잘못된 형식)
*******************************************************************************/
$.numberChk = function(str){
	var regExp =  /^[0-9]+$/;
	return regExp.test(str);
};
/*********************************************
 * NUMBER AND DOT 체크 
 * 사용방법 : $.numberdot("") or $.numberdot($("#").val())
 * 	@return : true(맞는 형식) | false(잘못된 형식)
 **********************************************/
$.numberdot = function(str){
	var regExp = /^[0-9.]+$/;
	return regExp.test(str);
},

/*********************************************
 * 숫자 + 영문 혼용 및 8~20자리 체크  
 * 사용법 : 파라미터 해당 value를 String 형태로 넣는다.
 * @return : true(맞는 형식) | false(잘못된 형식)
 *********************************************/
$.numEngChk = function (str) {
	var regExp =  /^[a-zA-Z0-9]{5,20}$/;
	return regExp.test(str);
}

/*********************************************
 * 숫자 + 영문 + 특수문자 혼용 및 8~20자리 체크  
 * 사용법 : 파라미터 해당 value를 String 형태로 넣는다.
 * @return : true(맞는 형식) | false(잘못된 형식)
 *********************************************/
$.pwChk = function (str) {
	var regExp = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,20}$/;
	return regExp.test(str);
}
	
})(jQuery);