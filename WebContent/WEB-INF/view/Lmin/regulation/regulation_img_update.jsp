<%@page import="com.cl.util.CmmUtil"%>
<%@page import="com.cl.util.TextUtil"%>
<%@page import="com.cl.dto.RegulationDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	RegulationDTO rDTO = (RegulationDTO)request.getAttribute("rDTO");
	if(rDTO == null) rDTO = new RegulationDTO();
%>
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
$(function(){ 
	$('#ajaxform').ajaxForm({ 
		beforeSubmit: function (data, frm, opt) {
			 if($("#regulationFile").val() == ""){
				 alert('파일을 선택해 주세요'); return false; 
			 }else{
				 return true;
			 }
		}, 
		success: function(data){
			if(data != 0){
				var contents = "";
				contents += "<th scope='row'>이미지</th>";
				contents += "<td><img src='/regulationFile/" + data + "'>";
				contents += "<a href='#' id='submitLink' class='btn_active' onclick='doChangeImg();'>변경</a>";
				contents += "<a href='#' id='btnCancel' class='btn_cancel' onclick='updateImgNull();'>삭제</a></td>";
				opener.document.getElementById('regulationImgTr').innerHTML = contents;
				window.close();
			}else{
				alert("변경 실패!!");
			}
		},
		error: function(){ 
			alert("에러발생!!"); 
		} 
	}); 
});


function fileCheck(fileName, permissibleExtension){
	var result = 0;
	var fileExtension = fileName.value.slice(fileName.value.indexOf(".") + 1).toLowerCase();
	var alertStr = permissibleExtension[0];
	for(var i = 0; i<permissibleExtension.length; i++){
		if(fileExtension == permissibleExtension[i]){
			result++;
		}
		if(i>=1){
			alertStr += ", " + permissibleExtension[i];
		}
	}
	if(result == 0){
		alert(alertStr + " 파일만 업로드 가능합니다.");
		$(fileName).val("");
	}
}

</script>
<body>
<form id="ajaxform" action="/Lmin/regulation/regulationImgChange.do" method="post" enctype="multipart/form-data">
	<input type="hidden" name="regulationNo" value="<%=CmmUtil.nvl(rDTO.getRegulationNo()) %>">
	<input type="hidden" name="preFileNo" value="<%=CmmUtil.nvl(rDTO.getRegulationFileNo()) %>">
	<input type="hidden" name="preFilePath" value="<%=CmmUtil.nvl(rDTO.getRegulationFilePath()) %>">
	<input type="hidden" name="preFileName" value="<%=CmmUtil.nvl(rDTO.getRegulationFileName()) %>"> 
	<input type="file" name="regulationFile" id="regulationFile" onchange="fileCheck(this.value, ['jpg', 'jpeg', 'png']);"/> 
	<input type="submit" value="Submit" /> 
</form>
</body>
</html>
