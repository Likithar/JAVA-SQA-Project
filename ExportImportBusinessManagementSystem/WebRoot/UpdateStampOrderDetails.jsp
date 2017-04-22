
<%@page import="com.iebms.dao.StampOrderDetailsDao"%>
<%@page import="com.yourcompany.struts.form.StampOrderDetailsForm"%>
<%@page import="com.iebms.dao.StampOrderMasterDao"%>
<%@page import="com.iebms.util.CoreList"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.yourcompany.struts.form.StampOrderMasterForm"%>
<%@page import="com.iebms.dao.GoodsDetailsDao"%>
<%@page import="com.yourcompany.struts.form.GoodsDetailsForm"%>

<%
	int id = Integer.parseInt(request.getParameter("Id"));
	StampOrderDetailsDao dao = new StampOrderDetailsDao();
	StampOrderDetailsForm form = dao.ViewStampOrderDetailsById(id);
%><form action="UpdateStampOrderDetailsAction.jsp">
	<table align="center">
		<tr>
			<td>
				orderId :
			</td>
			<td>
				<select name="orderId" />
					<%
						String storepath = request.getRealPath("/images");
						StampOrderMasterDao dao1 = new StampOrderMasterDao();
						CoreList cl1 = dao1.ViewStampOrderMaster();
						Enumeration en1 = cl1.elements();
						while (en1.hasMoreElements()) {
							StampOrderMasterForm form1 = (StampOrderMasterForm) en1
									.nextElement();
					%><option value="<%=form1.getOrderId()%>"><%=form1.getUserId()%></option>
					<%
						}
					%>
				</select>
			</td>
		</tr>
		<tr>
			<td>
				qtyOredered :
			</td>
			<td>
				<input type=text name="qtyOredered"
					value="<%=form.getQtyOredered()%>" />
			</td>
		</tr>
		<tr>
			<td>
				itemId :
			</td>
			<td>
				<select name="itemId" />
					<%
						GoodsDetailsDao dao2 = new GoodsDetailsDao();
						CoreList cl2 = dao2.ViewGoodsDetails(storepath);
						Enumeration en2 = cl2.elements();
						while (en2.hasMoreElements()) {
							GoodsDetailsForm form2 = (GoodsDetailsForm) en2.nextElement();
					%><option value="<%=form2.getItemId()%>"><%=form2.getItemName()%>
					</option>
					<%
						}
					%>
				</select>
			</td>
		</tr>
		<tr>
			<td></td>
			<td>
				<input type=submit name="Update" value="Update" />
			</td>
		</tr>
	</table>
</form>
