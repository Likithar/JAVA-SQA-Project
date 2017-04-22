
<%@page import="com.iebms.dao.StampOrderDetailsDao"%>
<%@page import="com.iebms.util.CoreList"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.yourcompany.struts.form.StampOrderDetailsForm"%> <%
 try
 {
 StampOrderDetailsDao dao=new StampOrderDetailsDao();
 CoreList cl=dao.ViewStampOrderDetails();
 Enumeration en=cl.elements();
 %>
 <table align="center" border=1>
 <tr> 
 <td> ORDERID </td>       
 <td>ITEMID</td>         
 <td>QTYORDERED</td></tr>
 <%while(en.hasMoreElements())
 {
 StampOrderDetailsForm form=(StampOrderDetailsForm)en.nextElement(); 
 %>
 <tr>
 <td><a href="UpdateStampOrderDetails.jsp?Id=<%=form.getOrderId()%>"><%=form.getOrderId() %></a></td>
 <td><%=form.getItemId()%></td>
 <td><%=form.getQtyOredered()%></td></tr>
 <%}}catch(Exception e)
 {
 e.printStackTrace();
 }
 %>