<%@ page language="java" pageEncoding="ISO-8859-1"%>
<%@page import="com.iebms.dao.StampOrderMasterDao"%>
<%@page import="com.iebms.util.CoreList"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.yourcompany.struts.form.StampOrderMasterForm"%>
<%@page import="com.iebms.dao.GoodsDetailsDao"%>
<%@page import="com.yourcompany.struts.form.GoodsDetailsForm"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-bean" prefix="bean"%> 
<%@ taglib uri="http://jakarta.apache.org/struts/tags-html" prefix="html"%>
 
<html> 
	<head>
		<title>JSP for StampOrderDetailsForm form</title>
	</head>
	<%
		if(request.getParameter("status")!=null){
	%>
	<%=request.getParameter("status")%><%
		}
	%>
	<body>
		<form action="StampOrderDetailsAction.jsp"><table align="center">
			<tr><td>orderId : </td><td><select name="orderId"/>
			<%
				String storepath=request.getRealPath("/images");
				StampOrderMasterDao dao=new StampOrderMasterDao();
				CoreList cl=dao.ViewStampOrderMaster();
				Enumeration en=cl.elements();
				while(en.hasMoreElements())
				{
				StampOrderMasterForm form=(StampOrderMasterForm)en.nextElement();
			%><option value="<%=form.getOrderId()%>"><%=form.getUserId()%></option>
			<%
				}
			%></select></td></tr> 
			<tr><td>qtyOredered : </td><td><input type=text name="qtyOredered"/> </td></tr>
			<tr><td>itemId : </td><td><select name="itemId"/>
			<%
				GoodsDetailsDao dao2=new GoodsDetailsDao();
				CoreList cl2=dao2.ViewGoodsDetails(storepath);
				Enumeration en2=cl2.elements();
				while(en2.hasMoreElements())
				{
				GoodsDetailsForm form=(GoodsDetailsForm)en2.nextElement();
			 
			%><option value="<%=form.getItemId() %>"><%=form.getItemName() %> </option>
			 <%} %></select></td></tr>
			<tr><td></td><td><input type=submit name="Register" value="Register"/> </td></tr></table>
		</form>
	</body>
</html>

