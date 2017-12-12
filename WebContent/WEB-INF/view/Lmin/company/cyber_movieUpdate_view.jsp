<%@page import="com.cl.dto.CyberDTO"%>
<%@page import="com.cl.util.CmmUtil"%>
<%@page import="com.cl.util.TextUtil"%>
<%@page import="com.cl.dto.RegulationDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	CyberDTO cDTO = (CyberDTO)request.getAttribute("cDTO");
	if(cDTO == null) cDTO = new CyberDTO();
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
	}else{
		var file = document.querySelector('#cyberFile');
		var filelist = file.files;
		var reader = new FileReader();
		reader.readAsDataURL(filelist[0]);
		console.log(reader.result);
		reader.onload = function(){
			var video = document.getElementsByTagName('video')[0];
		    var sources = video.getElementsByTagName('source')[0];
		    sources.src = reader.result;
		    video.load();
		}
	}
}
function uploadFile(){
	$('#ajaxform').ajaxForm({ 
		beforeSubmit: function (data, frm, opt) {
			 if($("#cyberFile").val() == ""){
				 alert('파일을 선택해 주세요'); return false; 
			 }else{
				 return true;
			 }
		}, 
		success: function(data){
			if(data != 0){
				var contents = "";
				contents += "<th scope='row'>동영상</th>";
				contents += "<td><video width='320' height='240' controls>";
				contents += "<source src='/cyberFile/" + + "' type='video/" + + "'>";
				contents += "<a href='javascript:cyberMovieUpdate();' id='submitLink' class='btn_active'>동영상 수정</a></td>";
				opener.document.getElementById('cyberMovieTr').innerHTML = contents;
				window.close();
			}else{
				alert("변경 실패!!");
			}
		},
		error: function(){ 
			alert("에러발생!!"); 
		} 
	}).submit();
}
</script>
<body>
<video width="320" height="240" controls>
	<source id="preview" src="/cyberFile/<%=CmmUtil.nvl(cDTO.getCyberFileName()) %>" type="video/<%=TextUtil.getFileExtension(cDTO.getCyberFileName())%>">
</video>
<form id="ajaxform" action="/Lmin/company/cyberMovieUpdateProc.do" method="post" enctype="multipart/form-data" >
	<input type="hidden" name="cyberNo" value="<%=CmmUtil.nvl(cDTO.getCyberNo()) %>">
	<input type="hidden" name="preFileNo" value="<%=CmmUtil.nvl(cDTO.getCyberFileNo()) %>">
	<input type="hidden" name="preFilePath" value="<%=CmmUtil.nvl(cDTO.getCyberFilePath()) %>">
	<input type="hidden" name="preFileName" value="<%=CmmUtil.nvl(cDTO.getCyberFileName()) %>"> 
	<input type="file" name="cyberFile" class="inputType1" id="cyberFile" onchange="fileCheck(this, ['mp4', 'avi']);"/>
	<a href="javascript:uploadFile();" class="btn_active">등록</a>
</form>
</body>
</html>
