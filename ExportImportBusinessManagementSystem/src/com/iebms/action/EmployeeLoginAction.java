/*
 * Generated by MyEclipse Struts
 * Template path: templates/java/JavaClass.vtl
 */
package com.iebms.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.iebms.dao.EmployeMasterDao;

/** 
 * MyEclipse Struts
 *  
 * 
 * XDoclet definition:
 * @struts.action validate="true"
 */
public class EmployeeLoginAction extends Action {
	/*
	 * Generated Methods
	 */

	/** 
	 * Method execute
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return ActionForward
	 */
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
	try{
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		EmployeMasterDao aMasterDao=new EmployeMasterDao();
		int employeeid=aMasterDao.getEmployeeDetails(username, password);
		System.out.println("employeeid"+employeeid);
		if(employeeid!=0)
		{
			request.getSession().setAttribute("employeeid",new Integer(employeeid));
			request.getSession().setAttribute("employeename",username);
			request.getSession().setAttribute("role",username);
			return mapping.findForward("loginSuccess");
		}
	}catch (Exception e) {
		// TODO: handle exception
	}
	return mapping.findForward("loginFail");
	}
}