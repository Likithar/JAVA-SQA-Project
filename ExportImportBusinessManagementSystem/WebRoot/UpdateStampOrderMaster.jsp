
<%@page import="com.iebms.dao.StampOrderMasterDao"%>
<%@page import="com.yourcompany.struts.form.StampOrderMasterForm"%>
<%@page import="com.iebms.dao.ProfileDAO"%>
<%@page import="com.iebms.model.Profile"%>
<%@page import="com.iebms.util.CoreList"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.iebms.dao.EmployeMasterDao"%>
<%@page import="com.yourcompany.struts.form.EmployeMasterForm"%>
<%
int id=Integer.parseInt(request.getParameter("Id"));
StampOrderMasterDao dao=new StampOrderMasterDao();
StampOrderMasterForm form=dao.ViewStampOrderMasterById(id);
%>
<form action="UpdateStampOrderMasterAction.jsp"><table align="center">
			<tr><td>OrderId</td><td><input type=text name="OrderId" value="<%=id%>"></td></tr>
			<tr><td>OrderStatus:</td><td><input type=text name="orderStatus" value="<%=form.getOrderStatus() %>"/></td></tr>
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
			<tr><td>orderAmount : </td><td><input type=text name="orderAmount" value="<%=form.getOrderAmount() %>"/> </td></tr>
			<tr><td>EmployeId : </td><td><select name="employeId"/> 
			<%
			String storepath=request.getRealPath("/images");
			EmployeMasterDao dao1=new EmployeMasterDao();
			CoreList cl1=dao1.ViewEmployeMaster(storepath);
			Enumeration en1=cl1.elements();
			while(en1.hasMoreElements())
			{EmployeMasterForm form1=(EmployeMasterForm)en1.nextElement(); 
			 %>
			 
			 <option value="<%=form1.getEmployeId() %>"><%=form1.getEmployeFirstName() %></option>
			 <%} %></select></td></tr>
			<tr><td>orderDate : </td><td><input type=text name="orderDate" value="<%=form.getOrderDate() %>"/> </td></tr>
			<tr><td></td><td><input type=submit name="Register" value="Register"/> </td></tr></table>
		</form>