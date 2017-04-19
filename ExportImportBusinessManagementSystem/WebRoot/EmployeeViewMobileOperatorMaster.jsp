<%@page import="com.iebms.dao.MobileOperatorMasterDao"%>
<%@page import="com.iebms.util.CoreList"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.yourcompany.struts.form.MobileOperatorMasterForm"%> 

<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/transitional.dtd">
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
.style10 {
	color: white;
	font-weight: bold;
}
</style>

<title>ImportExportBusinessManagementSystem</title>
<script type="text/javascript" src="scripts/moveclock.js"></script>



<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" /></head>
<body>
<table width="750" align="center" bgcolor="white">
<tr><td>
<img src="images/goods.jpg" width="780" height="230"></td>
</tr>
<tr>
   <td bgcolor="skyblue">
   <jsp:include page="EmployeeOptions.jsp"/>
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
    <h2><font color="black">Mobile Operators</font></h2>
   
 <%
 try
 {
  
 CoreList cl=(CoreList)request.getAttribute("viewMobileOperators");
 Enumeration en=cl.elements();
 %>
 <table align="center" border=1>
 <tr bgcolor="#336633">
 <td><font color="black"><b>Operator Name</b></font></td>
 <td><font color="black"><b>Operator Desc</b></font></td>
 </tr>
 <%while(en.hasMoreElements())
 {
 MobileOperatorMasterForm form=(MobileOperatorMasterForm)en.nextElement();
 %>
 <tr bgcolor="skyblue">
 <td><div align="center"><span class="style10"><%=form.getOperatorName()%></span></div></td>
 <td><div align="center"><span class="style10"><%=form.getOperatorDesc()%></span></div></td>
 </tr>
 <%} }catch(Exception e)
 {
 e.printStackTrace();
 }
 %>
 </table>
    
    
    
    
   <center>
     
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