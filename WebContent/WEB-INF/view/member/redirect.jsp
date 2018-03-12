<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String msg = (String)request.getAttribute("msg");
	String url = (String)request.getAttribute("url");
	
	System.out.println("리다이렉트 : " +msg);
	System.out.println("리다이렉트 : " +url);
%>    

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>redirect</title>
<script type="text/javascript">
	console.log(<%=msg%>);
	console.log(<%=msg%>);
	console.log(<%=msg%>);
	console.log(<%=msg%>);
	alert("<%=msg%>");
	location.href="<%=url%>";
</script>
</head>
<body>
</body>
</html>