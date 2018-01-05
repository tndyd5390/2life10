<%@page import="com.cl.dto.NoticeDTO"%>
<%@page import="com.cl.util.CmmUtil"%>
<%@page import="com.cl.util.TextUtil"%>
<%@page import="com.cl.dto.RegulationDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	NoticeDTO nDTO = (NoticeDTO)request.getAttribute("nDTO");
	if(nDTO == null) nDTO = new NoticeDTO();
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
		var file = document.querySelector('#noticeFile');
		var filelist = file.files;
		var reader = new FileReader();
		reader.readAsDataURL(filelist[0]);
		console.log(reader.onload);
		reader.onload = function(){
			document.querySelector('#preview').src = reader.result;
		}
	}
}
function uploadFile(){
	$('#ajaxform').ajaxForm({ 
		beforeSubmit: function (data, frm, opt) {
			 if($("#noticeFile").val() == ""){
				 alert('파일을 선택해 주세요'); return false; 
			 }else{
				 return true;
			 }
		}, 
		success: function(data){
			if(data != 0){
				var contents = "";
				contents += "<th scope='row'>이미지</th>";
				contents += "<td><img src='/file/notice/img/" + data + "'>";
				contents += "<a href='#' id='submitLink' class='btn_active' onclick='doChangeImg();'>변경</a>";
				contents += "<a href='#' id='btnCancel' class='btn_cancel' onclick='updateImgNull();'>삭제</a></td>";
				opener.document.getElementById('noticeImgTr').innerHTML = contents;
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
<img id="preview" alt="" src="https://dummyimage.com/600x600/#A4A4A/fff&text=이미지+미리보기" style="width: 600px" style="height:600px">
<form id="ajaxform" action="/Lmin/notice/noticeImgChange.do" method="post" enctype="multipart/form-data" >
	<input type="hidden" name="noticeNo" value="<%=CmmUtil.nvl(nDTO.getNoticeNo()) %>">
	<input type="hidden" name="preFileNo" value="<%=CmmUtil.nvl(nDTO.getNoticeFileNo()) %>">
	<input type="hidden" name="preFilePath" value="<%=CmmUtil.nvl(nDTO.getNoticeFilePath()) %>">
	<input type="hidden" name="preFileName" value="<%=CmmUtil.nvl(nDTO.getNoticeFileName()) %>"> 
	<input type="file" name="noticeFile" class="inputType1" id="noticeFile" onchange="fileCheck(this, ['jpg', 'jpeg', 'png']);"/>
	<a href="javascript:uploadFile();" class="btn_active">등록</a>
</form>
</body>
</html>
