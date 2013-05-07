<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="edu.fyp.bean.Form"%>
<%
	//Get form list
	ArrayList<Form> formList = (ArrayList) request.getSession()
			.getAttribute("formList");
%>
<html>
<head>
<link rel="stylesheet" type="text/css"
	href="/formbuilder/css/common.css">
	<link rel="stylesheet" type="text/css"
	href="/formbuilder/css/showBuilderFormList.css">
</head>
<body>
	<div id="bodyContainer">
		<div id="topContainer">
			<%@ include file="head.jsp"%>
		</div>
		<div id="mainContainer">
			<div id="menu">
				<%@ include file="menu.jsp"%>
			</div>
			<div id="mainBody">
				<fieldset>
					<legend align='center'>You can Maintain these Application</legend>
					<div class="searchField">
						<form method="get" action="showFormListServlet">
							<select name="search">
								<option value="formID">Form ID</option>
								<option value="title">Title</option>
							</select> <input type="text" name="keyword" id="Search"
								placeholder="input keyword here!" class="hint" /> <input
								type="submit" class="buttom" value="Search" />
						</form>
					</div>
					<table class="viewFormTable">
						<thead>
							<tr>
								<th>Application ID</th>
								<th>Version</th>
								<th>Title</th>
								<th>Description</th>
								<th>Action</th>
							</tr>
						</thead>
						<tfoot>
							<tr>
								<td colspan="10"></td>
							</tr>
						</tfoot>
						<tbody>
							<%
								if (formList.size() == 0) {
							%>
							<tr>
								<td colspan="10">No form found.</td>
							</tr>
							<%
								} else {
									for (int i = 0; i < formList.size(); i++) {
										Form tempForm = formList.get(i);
							%>
							<tr>
								<td><%=tempForm.getFormID()%></td>
								<td><%=tempForm.getVersion()%></td>
								<td><%=tempForm.getTitle()%></td>
								<td><%=tempForm.getDescription()%></td>
								<td><a
									href="showBuilderFormServlet?formID=<%=tempForm.getFormID()%>&version=<%=tempForm.getVersion()%>"
									target="_blank"> <img src="/formbuilder/img/dc.png" width="30px"
										height="30px" />
								</a> <a 
									href="/formbuilder/path/pathbuilder.jsp?formID=<%=tempForm.getFormID()%>&version=<%=tempForm.getVersion()%>">Path</a>
								</td>
							</tr>
							<%
								}
								}
							%>
						</tbody>
					</table>
				</fieldset>

			</div>
		</div>
	</div>
</body>
</html>
<%
	request.getSession().removeAttribute("formList");
%>