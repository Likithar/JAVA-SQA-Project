
<%@page import="com.iebms.dao.StampOrderMasterDao"%> 
 
 <%
 String target="ViewStampOrderMaster.jsp?status=Deletion failed";
 try
 {
 String id[]=request.getParameterValues("TypeId");
 for(int i=0;i<id.length;i++)
 {
 int Id=Integer.parseInt(id[i]);
 StampOrderMasterDao dao=new StampOrderMasterDao();
 boolean flag=dao.deleteStampOrderMaster(Id);
 if(flag)
 {
 target="ViewStampOrderMaster.jsp?status=Deletion success";
 }
 }
 }
 catch(Exception e)
 {
 e.printStackTrace();
 }
 RequestDispatcher rd=request.getRequestDispatcher(target);
 rd.forward(request,response);
 %>
 