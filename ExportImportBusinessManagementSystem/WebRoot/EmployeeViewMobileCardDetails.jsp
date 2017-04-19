<%@page import="com.iebms.dao.MobileCardDetailsDao"%>
<%@page import="com.iebms.util.CoreList"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.yourcompany.struts.form.MobileCardDetailsForm"%>
<%@page import="com.iebms.util.LoggerManager"%> 
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
.style1 {
	color: white;
	font-weight: bold;
}
.style2 {color: white}
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
    <h2><font color="black">Mobile Card Details</font></h2>
   
 <%
 try
 {
 MobileCardDetailsDao dao=new MobileCardDetailsDao();
 CoreList cl=(CoreList)request.getAttribute("viewMobilecarddetails");
 Enumeration en=cl.elements();
 %>
 <table align="center" border=1>
 <tr bgcolor="white">
 <td><div align="center"><strong><font color="black">Operator Name</font> </strong></div></td>   
<td><div align="center"><strong><font color="black">CardName</font></strong></div></td>       
<td><div align="center"><strong><font color="black">CardAmount</font></strong></div></td>  
<td><div align="center"><strong><font color="black">ValidityDt</font></strong></div></td>
<td><div align="center"><strong><font color="black">CardStatus</font></strong></div></td>
 </tr>     
<%
while(en.hasMoreElements())
{
MobileCardDetailsForm form=(MobileCardDetailsForm)en.nextElement();
 %>
<tr bgcolor="skyblue">
<td><div align="center" class="style1"><strong><font color="white"><%=form.getOperatorname()%></font></strong></div></td>

<td><div align="center" class="style1"><a href="UpdateMobileCardDetails.jsp?Id=<%=form.getCardId() %>"><strong><font color="white"><%=form.getCardName()%></font></strong></a></div></td>
<td><div align="center" class="style1"><strong><font color="white"><%=form.getCardAmount()%></font></strong></div></td>
<td><div align="center" class="style1"><strong><font color="white"><%=form.getValidityDate()%></font></strong></div></td>
<td><div align="center" class="style1"><font color="white"><strong><%=form.getCardStatus()%></strong></font></div></td>
</tr>
<%
}
}
catch(Exception e)
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