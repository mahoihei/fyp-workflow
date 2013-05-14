<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="edu.fyp.bean.Form"%>
<%@page import="edu.fyp.bean.Employee"%>
<%@page import="edu.fyp.bean.ApplicationPath"%>
<%@page import="edu.fyp.bean.Application"%>
<%@page import="edu.fyp.bean.Department"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.google.appengine.api.datastore.KeyFactory"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
Form form = (Form)request.getSession().getAttribute("form");
ApplicationPath appPath  = (ApplicationPath)request.getSession().getAttribute("appPath");
Employee emp = (Employee)request.getSession().getAttribute("emp");
Department dept = (Department)request.getSession().getAttribute("dept");
Application app = (Application)request.getSession().getAttribute("app");
SimpleDateFormat dateformat = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Application Display - <%= form.getTitle() %></title>
<link rel="stylesheet" type="text/css" href="css/common.css">
<link rel="stylesheet" type="text/css" href="css/showForm.css">
<link rel="stylesheet" type="text/css"
	href="css/jqueryui/jquery-ui-1.9.2.custom.min.css">
<link href="css/bootstrap.min.css" rel="stylesheet" media="screen">
<script type="text/javascript" src="js/JQ/jquery-1.9.0.js"></script>
<script type="text/javascript"
	src="js/JQ/jquery-ui-1.10.0.custom.min.js"></script>
<script type="text/javascript">
	<%
		if(form!=null&&app!=null){
	%>
		 $(function() {
			var appData = jQuery.parseJSON('<%=app.getFormData().getValue()%>');
			if(appData.length !== 0) {
				for(var i = 0; i < appData.length; i++) {
					var item = $("#"+appData[i].Id);
					var itemType = appData[i].Id.split('-')[0];
					
					switch (true) {
						case (/TEXTFIELD/) .test(itemType):
						case (/DATE/) .test(itemType):
							item.find("input[type=text]").val(appData[i].Value);
							break;
						case (/RADIOBUTTON/) .test(itemType):
							if(appData[i].Value!==""&appData[i].Value!="-1")
									item.find(".choice").eq(appData[i].Value).find("input[type=radio]")
										.attr('checked', true);
						break;
						case (/CHECKBOX/) .test(itemType):
							var subVal = appData[i].Value.split(",");
							$(subVal).each(function(index, value){
								if(value!==""&value!="-1")
									item.find(".choice").eq(value).find("input[type=checkbox]")
										.attr('checked', true);
							});
							break;
						case (/COMBOBOX/) .test(itemType):
							if(appData[i].Value!=="-1"){
								item.find("select")[0].selectedIndex = appData[i].Value;
							}
							break;
						case (/TEXTAREA/) .test(itemType):
							item.find("textarea").val(appData[i].Value);
							break;
						default:
							break;
					}
				}
			}
			$(".form-item").append("<div class='overlay' ></div>");
		});
	<%
		}
	%>	
	</script>
</head>
<body>

	<div class="form_container">
		<%
	if(app==null){
		%>
		<span>Error. Application not found.</span>
	</div>
	<%
	}else if(form!=null){
		%>
	<%= form.getFormHtml().getValue() %>
	</div>
	<div class="control_panel">
		<div class="zoom"></div>
		<div class="form_detail">
			<table class="app_detail_table">
				<tbody>
					<tr>
						<td class="app_detail_left">Title:</td>
						<td><%= form.getTitle() %></td>
					</tr>
					<tr>
						<td class="app_detail_left">Version:</td>
						<td><%= form.getVersion() %></td>
					</tr>
					<tr>
						<td class="app_detail_left">Apply Date:</td>
						<td><%= dateformat.format(app.getApplyDate()) %></td>
					</tr>
					<tr>
						<td class="app_detail_left">Description:</td>
						<td><%= form.getDescription() %></td>
					</tr>
				</tbody>
			</table>
			<table class="app_detail_table">
				<tbody>
					<tr>
					<td>Applier:</td>
					<td><%= emp.getEngOtherName() + " " + emp.getEngSurname() %></td></tr>
					<tr>
					<td>Department</td>
					<td><%= dept.getDeptName() %></td>
					</tr>
					<tr>
					<td>Apply Date</td>
					<td><%= dateformat.format(app.getApplyDate()) %></td>
					</tr>
					<tr>
					<td></td>
					<td><a href="/Client/approveAppNode?appKey=<%= KeyFactory.keyToString(app.getKey()) %>&nodeKey=<%= KeyFactory.keyToString(appPath.getCurrentNode()) %>&approve=true">Approve</a>  
					<a href="/Client/approveAppNode?appKey=<%= KeyFactory.keyToString(app.getKey()) %>&nodeKey=<%= KeyFactory.keyToString(appPath.getCurrentNode()) %>&approve=false">Reject</a></td>
					</tr><tr>
				</tr></tbody>
			</table>
		</div>
	</div>
	<%
	}
	%>

</body>
</html>