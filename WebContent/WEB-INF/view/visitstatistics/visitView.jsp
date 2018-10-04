<%@page import="java.util.Map"%>
<%@page import="com.cl.dto.VisitStatisticsDTO"%>
<%@page import="com.cl.dto.AppliDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.cl.util.CmmUtil" %>
<%@ page import="com.cl.util.TextUtil" %>
<%@ page import="com.cl.util.PageUtil" %>
<%@ page import="com.cl.util.AES256Util" %>
<%@ page import="com.cl.dto.CounselDTO" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.HashMap" %>
<%
	Map<String, Object> visitData = (Map<String, Object>)request.getAttribute("visitData");
	if(visitData == null) visitData = new HashMap<>();
	
	List<VisitStatisticsDTO> vList = (List<VisitStatisticsDTO>)visitData.get("visitAllList");
	System.out.println("vList.size : " + vList.size());
	if(vList == null) vList = new ArrayList<>();
	
	List<Map<String, String>> cntList = (List<Map<String, String>>)visitData.get("visitCnt");
	System.out.println("cntList.size : " + cntList.size());
	if(cntList == null) cntList = new ArrayList<>();
%>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>SB Admin 2 - Bootstrap Admin Theme</title>
    <link href="/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">
    <link href="/vendor/datatables-plugins/dataTables.bootstrap.css" rel="stylesheet">
    <link href="/vendor/datatables-responsive/dataTables.responsive.css" rel="stylesheet">
    <link href="/dist/css/sb-admin-2.css" rel="stylesheet">
    <link href="/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">


</head>

<body>

    <div id="wrapper">
        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Tables</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                           	 전체 접속 테이블
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <table width="100%" class="table table-striped table-bordered table-hover" id="table1">
                                <thead>
									<tr>
										<th>VISITID</th>
										<th>SEQ</th>
										<th>URL</th>
										<th>REG_DT</th>
										<th>IP</th>
									</tr>
								</thead>
								<tbody>
									<%
									for(VisitStatisticsDTO vDTO : vList){
									%>
									<tr>
										<td><%=CmmUtil.nvl(vDTO.getVisitId()) %></td>
										<td><%=CmmUtil.nvl(vDTO.getSeq()) %></td>
										<td><%=CmmUtil.nvl(vDTO.getUrl()) %></td>
										<td><%=CmmUtil.nvl(vDTO.getReg_dt()) %></td>
										<td><%=CmmUtil.nvl(vDTO.getIp()) %></td>
									</tr>
									<%
									}
									%>
								</tbody>
                            </table>
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div><div class="col-lg-6">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            	일별 접속 테이블(ip 중복 제거)
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover" id="table2">
                                    <thead>
										<tr>
											<th>DATE</th>
											<th>CNT</th>
										</tr>
									</thead>
									<tbody>
										<%
										for(Map<String, String> cntMap : cntList){
										%>
										<tr>
											<td><%=CmmUtil.nvl(cntMap.get("DATE")) %></td>
											<td><%=CmmUtil.nvl(String.valueOf(cntMap.get("CNT"))) %></td>
										</tr>
										<%
										}
										%>
									</tbody>
                                </table>
                            </div>
                            <!-- /.table-responsive -->
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-6 -->
                <!-- /.col-lg-12 -->
            </div>
        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->

    <!-- jQuery -->
    <script src="/vendor/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="/vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="/vendor/metisMenu/metisMenu.min.js"></script>

    <!-- DataTables JavaScript -->
    <script src="/vendor/datatables/js/jquery.dataTables.min.js"></script>
    <script src="/vendor/datatables-plugins/dataTables.bootstrap.min.js"></script>
    <script src="/vendor/datatables-responsive/dataTables.responsive.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="/dist/js/sb-admin-2.js"></script>

    <!-- Page-Level Demo Scripts - Tables - Use for reference -->
    <script>
    $(document).ready(function() {
        $('#table1').DataTable({
            responsive: true
        });
        $('#table2').DataTable({
            responsive: true
        });
    });
    </script>

</body>

</html>
