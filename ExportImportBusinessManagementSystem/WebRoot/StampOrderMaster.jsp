<%@ page language="java" pageEncoding="ISO-8859-1"%>
<%@page import="com.iebms.dao.EmployeMasterDao"%>
<%@page import="com.iebms.util.CoreList"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.yourcompany.struts.form.EmployeMasterForm"%>
<%@page import="com.iebms.dao.ProfileDAO"%>
<%@page import="com.iebms.model.Profile"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-bean" prefix="bean"%> 
<%@ taglib uri="http://jakarta.apache.org/struts/tags-html" prefix="html"%>
 
<html> 
	<head>
		<title>JSP for StampOrderMasterForm form</title>
	</head>
	<body>
	 <%if(request.getParameter("status")!=null){ %>
	<%=request.getParameter("status") %><%} %>
		<form action="StampOrderMasterAction.jsp"><table align="center">
			<tr><td>orderStatus:</td><td><input type=text name="orderStatus"/></td></tr>
			<tr><td>UserId:</td><td><select name="UserId">
			<%
			ProfileDAO dao3=new ProfileDAO();
			Profile model3=null;
			CoreList cl3=dao3.getuserdetails();
			Enumeration en3=cl3.elements();
			while(en3.hasMoreElements())
			{
			model3=(Profile)en3.nextElement();
		 
			%>
			<option value="<%=model3.getUserid() %>"><%=model3.getLoginID() %></option>
			 <%} %>
			</select></td></tr>
			<tr><td>orderAmount : </td><td><input type=text name="orderAmount"/> </td></tr>
			<tr><td>EmployeId : </td><td><select name="employeId"/> 
			<%
			String storepath=request.getRealPath("/images");
			EmployeMasterDao dao=new EmployeMasterDao();
			CoreList cl=dao.ViewEmployeMaster(storepath);
			Enumeration en=cl.elements();
			while(en.hasMoreElements())
			{EmployeMasterForm form=(EmployeMasterForm)en.nextElement(); 
			 %>
			 
			 <option value="<%=form.getEmployeId() %>"><%=form.getEmployeFirstName() %></option>
			 <%} %></select></td></tr>
			<tr><td>orderDate : </td><td><input type=text name="orderDate"/> </td></tr>
			<tr><td></td><td><input type=submit name="Register" value="Register"/> </td></tr></table>
		</form>
	</body>
</html>

