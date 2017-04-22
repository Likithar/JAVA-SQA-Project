

<%@page import="com.iebms.dao.GoodsDetailsDao"%>

<%
	String target = "ViewgoodsDetails.jsp?status=Deletion failed";
	try {
		String id[] = request.getParameterValues("TypeId");
		for (int i = 0; i < id.length; i++) {
			int Id = Integer.parseInt(id[i]);
			GoodsDetailsDao dao = new GoodsDetailsDao();
			boolean flag = dao.deleteGoodsDetails(Id);
			if (flag) {
				target = "ViewgoodsDetails.jsp?status=Deletion success";
			}
		}
	} catch (Exception e) {
		e.printStackTrace();
	}
	RequestDispatcher rd = request.getRequestDispatcher(target);
	rd.forward(request, response);
%>
