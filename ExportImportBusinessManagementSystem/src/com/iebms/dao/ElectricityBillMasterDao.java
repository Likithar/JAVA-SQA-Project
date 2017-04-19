package com.iebms.dao;
import java.sql.*; 

import com.iebms.dao.AbstractDataAccessObject;
import com.iebms.util.CoreList;
import com.iebms.util.DateWrapper;
import com.iebms.util.LoggerManager;
import com.yourcompany.struts.form.ElectricityBillMasterForm;

public class ElectricityBillMasterDao extends AbstractDataAccessObject 
{
	public boolean insertElectricityBillMaster(ElectricityBillMasterForm cmform)
	{
		java.sql.Connection con=null;
		boolean flag=false;
		try
		{
		int n=getSequenceID("ElectricityBillMaster","BillId");
		con=getConnection();
		System.out.println("this is userid"+cmform.getUserId());
		PreparedStatement ps=con.prepareStatement("insert into ElectricityBillMaster values(?,?,?,?,?,?,?,?)");
		ps.setInt(1,n);
		ps.setString(2,DateWrapper.parseDate(cmform.getBillDate()));
		ps.setInt(3,cmform.getUserId());
		ps.setString(4,cmform.getBillNo());
		ps.setString(5,cmform.getServiceNo());
		ps.setInt(6,cmform.getNoOfUnits());
		ps.setInt(7,cmform.getAmount());
		ps.setInt(8,2);
	 
		
		 
		int i=ps.executeUpdate();
		if(i>0)
		{
			boolean flag1=new MobileCardSalesDao().getCardDetails(cmform.getCreditcardno(), cmform.getAmount());
			if(flag1)
			{
			flag=true;
		}
		}
			
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}finally
	{
		try{
			con.close();
		}
	catch(Exception e)
	{
		LoggerManager.writeLogInfo(e);
	}
	}
	return flag;
	
	
		}

public CoreList ViewElectricityBillMaster(int userid)
{   CoreList v=new CoreList();
	java.sql.Connection con=null;
	ElectricityBillMasterForm cmform=null;
	try
	{
		con=getConnection();
		Statement st=con.createStatement();
		ResultSet rs=st.executeQuery("select * from ElectricityBillMaster where userid="+userid);
		 
		while(rs.next())
		{
			cmform=new ElectricityBillMasterForm();
			 
			cmform.setBillId(rs.getInt(1));
			cmform.setBillDate(DateWrapper.parseDate(rs.getDate(2)));
			cmform.setUserId(rs.getInt(3));
			cmform.setBillNo(rs.getString(4));
			cmform.setServiceNo(rs.getString(5));
			cmform.setNoOfUnits(rs.getInt(6));
			cmform.setAmount(rs.getInt(7));
			cmform.setEmployeId(rs.getInt(8));
			 
			v.add(cmform);
		}

		 
	}
		catch(Exception e)
	{
		
	}
		finally
		{
			try{
				con.close();
			}
		catch(Exception e)
		{
			LoggerManager.writeLogInfo(e);
		}
		}
		return v;
		
	
}
public ElectricityBillMasterForm ViewElectricityBillMasterById(int BillId)
{   ElectricityBillMasterForm cmform=new ElectricityBillMasterForm();
	java.sql.Connection con=null;
	 
	try
	{
		 
		con=getConnection();
		 
		PreparedStatement ps=con.prepareStatement("select * from ElectricityBillMaster where BillId = ? ");
		ps.setInt(1,BillId);
		ResultSet rs=ps.executeQuery();
		 
		if(rs.next())
		{
			cmform=new ElectricityBillMasterForm();
			 
			cmform.setBillId(rs.getInt(1));
			cmform.setBillDate(DateWrapper.parseDate(rs.getDate(2)));
			cmform.setUserId(rs.getInt(3));
			cmform.setBillNo(rs.getString(4));
			cmform.setServiceNo(rs.getString(5));
			cmform.setNoOfUnits(rs.getInt(6));
			cmform.setAmount(rs.getInt(7));
			cmform.setEmployeId(rs.getInt(8));
			 
			 
		}

		 
	}
		catch(Exception e)
	{
		
	}finally
	{
		try{
			con.close();
		}
	catch(Exception e)
	{
		LoggerManager.writeLogInfo(e);
	}
	}
	return cmform;
	
	
}

public boolean deleteElectricityBillMaster(int BillId)
	{
		java.sql.Connection con=null;
		boolean flag=false;
		try
		{
			 
			con=getConnection();
			 
			PreparedStatement ps=con.prepareStatement("delete from ElectricityBillMaster where BillId = ? ");
			ps.setInt(1,BillId);
			int i=ps.executeUpdate();
			if(i>0)
				flag=true;
			
			          
		}
		catch(Exception e)
		{
		}
		finally
		{
			try{
				con.close();
			}
		catch(Exception e)
		{
			LoggerManager.writeLogInfo(e);
		}
		}
		return flag;
		
		}

public boolean UpdateElectricityBillMaster(ElectricityBillMasterForm cmform)
{
	java.sql.Connection con=null;
	boolean flag=false;
	try
	{
	 
	con=getConnection();
	PreparedStatement ps=con.prepareStatement("update ElectricityBillMaster set BillDate = ?,userid = ?, billno = ?,serviceno = ?,noofunits = ?,amount = ?,employeid = ? where BillId = ? ");
	ps.setInt(8,cmform.getBillId());
	ps.setString(1,DateWrapper.parseDate(cmform.getBillDate()));
	ps.setInt(2,cmform.getUserId());
	ps.setString(3,cmform.getBillNo());
	ps.setString(4,cmform.getServiceNo());
	ps.setInt(5,cmform.getNoOfUnits());
	ps.setInt(6,cmform.getAmount());
	ps.setInt(7,cmform.getEmployeId());
	int i=ps.executeUpdate();
	if(i>0)
		flag=true;
	 
}
catch(Exception e)
{
}finally
{
	try{
		con.close();
	}
catch(Exception e)
{
	LoggerManager.writeLogInfo(e);
}
}
return flag;


	}
}






 


 





 


 

 