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

import com.iebms.dao.CountryMasterDao;
import com.iebms.util.CoreList;

/** 
 * MyEclipse Struts
 *  
 * 
 * XDoclet definition:
 * @struts.action validate="true"
 */
public class UserViewCountryDetails extends Action {
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
		String storepath=request.getRealPath("/images");
		 CountryMasterDao dao=new CountryMasterDao();
		 CoreList acorelist=dao.ViewCountryMaster(storepath);
		 int size=acorelist.size();
		 if(size!=0)
		 {
			 request.setAttribute("viewcountrymaster",acorelist);
			 return mapping.findForward("viewcountrymaster");
		 }
	}catch (Exception e) {
		// TODO: handle exception
	}
	 return mapping.findForward("norecords");
	}
}