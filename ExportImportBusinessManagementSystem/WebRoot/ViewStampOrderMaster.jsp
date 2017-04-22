
<%@page import="com.iebms.dao.StampOrderDetailsDao"%>
<%@page import="com.iebms.util.CoreList"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.yourcompany.struts.form.StampOrderMasterForm"%>
<%@page import="com.iebms.dao.StampOrderMasterDao"%>

<form action="DeleteStampOrderMaster.jsp">

<%if(request.getParameter("status")!=null){ %>
<%=request.getParameter("status") %><%} %>

<%
try
{
StampOrderMasterDao dao=new StampOrderMasterDao();
CoreList cl=dao.ViewStampOrderMaster();
Enumeration en=cl.elements();
%>
<table align="center" border=1>
<tr><td><input type="checkbox" value="TypeId"></td>
<td>ORDERDATE</td>      
<td>USERID</td>         
<td>EMPLOYEID</td>      
<td>ORDERAMOUNT</td>    
<td>ORDERSTATUS</td></tr>
<%while(en.hasMoreElements())
{
StampOrderMasterForm form=(StampOrderMasterForm)en.nextElement();
%>
<tr><td><input type=checkbox name="TypeId" value="<%=form.getOrderId() %>"></td>
<td><a href="UpdateStampOrderMaster.jsp?Id=<%=form.getOrderId() %>"><%=form.getOrderDate() %></a></td>
<td><%=form.getUserId() %></td>
<td><%=form.getEmployeId() %></td>
<td><%=form.getOrderAmount() %></td>
<td><%=form.getOrderStatus() %></td></tr>
<%}}catch(Exception e)
{
e.printStackTrace();
}
 %>    
 </table>
 <center><input type=submit name="Delete" value="Delete"></center>
 </form>