package com.iebms.action;
/*
 * Generated by MyEclipse Struts
 * Template path: templates/java/JavaClass.vtl
 */
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.iebms.dao.SecurityDAO;

/** 
 * MyEclipse Struts
 *  
 * 
 * XDoclet definition:
 * @struts.action validate="true"
 * @struts.action-forward name="success" path="/Registerform.jsp"
 * @struts.action-forward name="fail" path="/Fail.jsp"
 */
public class CheckUserAction extends Action {
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
		String username = request.getParameter("userName");
		String user = new SecurityDAO().checkUser(username);
		System.out.println("user"+user);
	String target="";
		try
		{
			
			 
		
			if (user.equals(null))
			{
		return mapping.findForward("success");
				//target = "Registerform.jsp?status1=<font color=green>_/Available</font>";
				
			}
			
			else
			{
				return mapping.findForward("fail");
			}
				//target = "Registerform.jsp?status1=<font color=red>Alreadyexist</font>&userName="+username;
		}
		
		
		catch (Exception e)
		{
e.printStackTrace();
			target = "Registerform.jsp?status1=<font color=green>_/<b>Available</b></font>&userName="+username;
		}
		return mapping.findForward("success");
	}
}