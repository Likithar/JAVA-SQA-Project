 
<%@page import="com.yourcompany.struts.form.StampOrderDetailsForm"%>
<%@page import="com.iebms.dao.StampOrderDetailsDao"%> 
 
 <%
 String target="ViewStampOrderDetails.jsp?status=Updation failed";
 try
 {
 StampOrderDetailsForm form=new StampOrderDetailsForm();
 form.setOrderId(Integer.parseInt(request.getParameter("orderId")));
 form.setItemId(Integer.parseInt(request.getParameter("itemId")));
 form.setQtyOredered(Integer.parseInt(request.getParameter("qtyOredered")));
 StampOrderDetailsDao dao=new StampOrderDetailsDao();
 boolean flag=dao.UpdateStampOrderDetails(form);
 if(flag)
 {
 target="ViewStampOrderDetails.jsp?status=Updation success";
 }
 }
 catch(Exception e)
 {
 e.printStackTrace();
 }
 RequestDispatcher rd=request.getRequestDispatcher(target);
 rd.forward(request,response);
 %>
 