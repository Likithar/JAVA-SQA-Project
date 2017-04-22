
<%@page import="com.iebms.util.CoreList"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.yourcompany.struts.form.Orders"%><!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/transitional.dtd">
<html>
<head>
<style>
body,td,th {
	color: white;
	;
}
body {
	background-color: white;
}
</style>

<title>EPost- Office</title>
<script type="text/javascript" src="scripts/moveclock.js"></script>



<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" /></head>
<body>
<table width="750" align="center" bgcolor="white">
<tr><td>
<img src="images/goods.jpg" width="780" height="230"></td>
</tr>
<tr>
   <td bgcolor="skyblue">
   <jsp:include page="UserOptions.jsp"/>
   </td></tr>
<tr><td>
<%--<div align="center">--%>
<%--<table bgcolor="white" width="750" align="center">--%>
<%--<tr>--%>
<%--   <td><jsp:include page="Template.html"/></td></tr></table></div>--%>
<div align="center">
<table bgcolor="white" width="770" align="center" height="70">
<tr>
   <td>
   <font color="skyblue"><h1></h1>
  
     <p align="center">
   <center>
    <h3><font color="black">VIEW ORDER DETAILS</font></h3>
    <font color="black"><b>
    <table>
    <tr bgcolor="white">
    <td><strong><font color="black">Orderid</font></strong></td>
    <td><strong><font color="black">Order Date</font></strong></td>
    <td><strong><font color="black">Order Amount</font></strong></td>
    <td><b><font color="black">Order Status</font></b></td>
    </tr>
    <%
    CoreList acorelist=(CoreList)request.getAttribute("ViewOrderstaus");
Enumeration aenumeration =acorelist.elements();
while(aenumeration.hasMoreElements())
{
Orders aOrders=(Orders)aenumeration.nextElement();
int orderid=aOrders.getOrderID();
String orderdate=aOrders.getOrderDate();
double orderamount=aOrders.getPrice();
String status=aOrders.getStatus();

     %>
     <tr bgcolor="#C3D7BA"><td><strong><font color="black"><a href="CustomerViewOrderDetails.jsp?orderid=<%=orderid %>"><%=orderid %></a></font></strong></td>
     <td><strong><font color="black"><%=orderdate %></font></strong></td>
     <td><strong><font color="black"><%=orderamount %></font></strong></td>
     <td><strong><font color="black"><%=status %></font></strong></td>
     </tr>
<%} %>
</table>
    </b></font>
    
    
    
     
     </center>
    
     
     
     </td></tr></table>
          <p>&nbsp;</p>
               <p>&nbsp;</p>
                    <p>&nbsp;</p>
                         
           <p>&nbsp;</p>
               <p>&nbsp;</p>
                    <p>&nbsp;</p>
                         
           <p>&nbsp;</p>
             
                         
                              
     <p>&nbsp;</p></div>


</body></html>