<%@page import="com.iebms.dao.CourierMasterDao"%>
<%@page import="com.iebms.util.CoreList"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.yourcompany.struts.form.CourierMasterForm"%>
<%@page import="com.iebms.dao.CountryMasterDao"%>
<%@page import="com.iebms.dao.CityMasterDao"%>
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
   <center>
     <font color="black"><b>  Export to :</b> <a href="ExportXLS" target="_blank"><font color="black"><b>XLS</b></a>
  
    <font color="black"><b><%if(request.getParameter("status")!=null){ %>
<%=request.getParameter("status") %><%} %>
<%

try
{String report="";


CoreList cl=(CoreList)request.getAttribute("EmployeeViewCourierRequests");
Enumeration en=cl.elements();
%>
<h3><center>View Courier Requests</center></h3>
<table align="center" border=1>
<tr bgcolor="white">
<td><div align="center"><strong><font color="black">CourierDate</font></strong></div></td>    
       
<%--<td><div align="center"><strong><font color="black">FromCountry</font></strong></div></td>  
--%><td><div align="center"><strong><font color="black">ToCountry</font></strong></div></td>    
<td><div align="center"><strong><font color="black">FromCity</font></strong></div></td>     
<td><div align="center"><strong><font color="black">ToCity</font></strong></div></td>       
<td><div align="center"><strong><font color="black">CourierAmt</font></strong></div></td>     
<td><div align="center"><strong><font color="black">CourierDetails</font></strong></div></td>
<td><div align="center"><strong><font color="black">Status</font></strong></div></td>
</tr>
<%report+="<table align=center border=1><tr bgcolor=#666666><td><div align=center><font color=white><b>CourierDate</b></font></div></td>           <td><div align=center><font color=white><b>FromCountry</b></font></div></td>  <td><div align=center><font color=white><b>ToCoiuntry</b></font></div></td>    <td><div align=center><font color=white><b>FromCity</b></font></div></td>     <td><div align=center><font color=white><b>ToCity</b></font></div></td>       <td><div align=center><font color=white><b>CourierAmt</b></font></div></td>     <td><div align=center><font color=white><b>CourierDetails</b></font></div></td><td><div align=center><font color=white><b>Status</b></font></div></td></tr>";

while(en.hasMoreElements())
{
CourierMasterForm form=(CourierMasterForm)en.nextElement();
String fromcountryname=new CountryMasterDao().getCountryName(form.getFromCountryId());
String tocountryname=new CountryMasterDao().getCountryName(form.getToCountryId());
String fromcityname=new CityMasterDao().getCityName(form.getFromCityId());
String tocityname=new CityMasterDao().getCityName(form.getToCityId());
 report+="<tr bgcolor=#FFFFFF> <td><font color=#B00606>   <div align=center><b>"+form.getCourierDate() +"</b></div></td>  <td align=center><div align=center><font color=#B00606><b>"+fromcountryname +"</b></font></div></td> <td align=center><div align=center><font color=#B00606><b>"+tocountryname +"</b></font></div></td> <td align=center><div align=center><font color=#B00606><b>"+fromcityname +"</b></font></div></td> <td align=center><div align=center><font color=#B00606><b>"+tocityname +"</b></font></div></td> <td align=center><div align=center><font color=#B00606><b>"+form.getCourierAmt() +"</b></font></div></td> <td align=center><div align=center><font color=#B00606><b>"+form.getCourierDet() +"</b></font></div></td> <td align=center><div align=center><font color=#B00606><b>"+form.getStatus() +"</b></font></div></td> <td align=center><div align=center><a href=CourierShipmentMaster.jsp?courierid="+form.getCourierId()+"<font color=#B00606><b>Accept</b></font></a></div></td> </tr>";
 %>
 <tr bgcolor="skyblue">
 <td align="center"><font color="white"><b><%=form.getCourierDate() %></b></font></td>
 <%--<td align="center"><font color="white"><b><%=fromcountryname %></b></font></td>
 --%><td align="center"><font color="white"><b><%=tocountryname %></b></font></td>
 <td align="center"><font color="white"><b><%=fromcityname %></b></font></td>
 <td align="center"><font color="white"><b><%=tocityname %></b></font></td>
 <td align="center"><font color="white"><b><%=form.getCourierAmt() %></b></font></td>
 <td align="center"><font color="white"><b><%=form.getCourierDet() %></b></font></td>
 <td align="center"><font color="white"><b><%=form.getStatus() %></b></font></td>
 <%if(!form.getStatus().equalsIgnoreCase("Deliverd")){ %>
 <td align="center"><font color="white"><b><a href="UpdateCourierShipmentMaster.jsp?courierid=<%=form.getCourierId() %>"><font color="white">Change</font></a></b></font></td>
 <%} %>
 </tr>
 <%}report+="</table>";
             session.setAttribute("Report",report);}catch(Exception e)
 {
 e.printStackTrace();
 }
  %>
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