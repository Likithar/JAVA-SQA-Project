


<%@page import="com.yourcompany.struts.form.StampOrderMasterForm"%>
<%@page import="com.iebms.dao.StampOrderMasterDao"%> <%
 String target="ViewStampOrderMaster.jsp?status=Updation failed";
 try
 {
 StampOrderMasterForm form=new StampOrderMasterForm();
 form.setOrderId(Integer.parseInt(request.getParameter("OrderId")));
 form.setEmployeId(Integer.parseInt(request.getParameter("employeId")));
 form.setUserId(Integer.parseInt(request.getParameter("UserId")));
 form.setOrderDate(request.getParameter("orderDate"));
 form.setOrderAmount(Integer.parseInt(request.getParameter("orderAmount")));
 form.setOrderStatus(request.getParameter("orderStatus"));
 StampOrderMasterDao dao=new StampOrderMasterDao();
 boolean flag=dao.UpdateStampOrderMaster(form);
 if(flag)
 {
 target="ViewStampOrderMaster.jsp?status=Updation Success";
 }
 }
 catch(Exception e)
 {
 e.printStackTrace();
 }
 RequestDispatcher rd=request.getRequestDispatcher(target);
 rd.forward(request,response);
 %>
 
