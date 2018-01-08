<%@page import="java.util.ArrayList"%>
<%@page import="com.cl.dto.TestDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<TestDTO> tList = (List<TestDTO>)request.getAttribute("tList");
	if(tList == null) tList = new ArrayList();
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
for(TestDTO t : tList){
	out.println(t.getMemberName());
}
%>
</body>
</html>