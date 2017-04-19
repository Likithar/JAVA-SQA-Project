
<%@page import="com.yourcompany.struts.form.ElectricityBillMasterForm"%>
<%@page import="com.iebms.dao.ElectricityBillMasterDao"%>
<%
String target="ElectricityBillMaster.jsp?status=Registration failed";
try
{
ElectricityBillMasterForm form=new ElectricityBillMasterForm();
form.setBillDate(request.getParameter("billDate"));
form.setUserId(Integer.parseInt(request.getParameter("UserId")));
form.setBillNo(request.getParameter("billNo"));
form.setServiceNo(request.getParameter("serviceNo"));
form.setNoOfUnits(Integer.parseInt(request.getParameter("noOfUnits")));
form.setAmount(Integer.parseInt(request.getParameter("amount")));
form.setEmployeId(Integer.parseInt(request.getParameter("employeId")));
ElectricityBillMasterDao dao=new ElectricityBillMasterDao();
boolean flag=dao.insertElectricityBillMaster(form);
if(flag)
{
target="ElectricityBillMaster.jsp?status=Registration Success";
}
}
catch(Exception e)
{
e.printStackTrace();
}
RequestDispatcher rd=request.getRequestDispatcher(target);
rd.forward(request,response);
%>
