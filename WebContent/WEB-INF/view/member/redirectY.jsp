<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String msg = (String)request.getAttribute("msg");
	String url = (String)request.getAttribute("url");
	String mNo = (String)request.getAttribute("memberNo");
%>    

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>redirect</title>
<script type="text/javascript">
	alert("<%=msg%>");
	location.href="<%=url%>?mNo=<%=mNo%>";
</script>
</head>
<body>
</body>
</html>