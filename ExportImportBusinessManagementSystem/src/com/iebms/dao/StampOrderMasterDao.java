package com.iebms.dao;

 
 
import java.sql.*; 

import com.iebms.dao.AbstractDataAccessObject;
import com.iebms.util.CoreList;
import com.iebms.util.DateWrapper;
import com.iebms.util.LoggerManager;
import com.yourcompany.struts.form.StampOrderMasterForm;

public class StampOrderMasterDao extends AbstractDataAccessObject 
{
	public boolean insertStampOrderMaster(StampOrderMasterForm soform)
	{
		java.sql.Connection con=null;
		boolean flag=false;
		try
		{
		int n=getSequenceID("StampOrderMaster","OrderId");
		con=getConnection();
		PreparedStatement ps=con.prepareStatement("insert into StampOrderMaster values(?,?,?,?,?,?)");
		ps.setInt(1,n);
		ps.setString(2,DateWrapper.parseDate(soform.getOrderDate()));
		ps.setInt(3,soform.getUserId());
		ps.setInt(4,soform.getEmployeId());
		ps.setInt(5,soform.getOrderAmount());
		ps.setString(6,soform.getOrderStatus());
		 
		int i=ps.executeUpdate();
		if(i>0)
			flag=true;
		 
			
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

public CoreList ViewStampOrderMaster()
{   CoreList v=new CoreList();
	java.sql.Connection con=null;
	StampOrderMasterForm soform=null;
	try
	{
		con=getConnection();
		Statement st=con.createStatement();
		ResultSet rs=st.executeQuery("select * from StampOrderMaster");
		 
		while(rs.next())
		{
			soform=new StampOrderMasterForm();
			 
			soform.setOrderId(rs.getInt(1));
			soform.setOrderDate(DateWrapper.parseDate(rs.getDate(2)));
			soform.setUserId(rs.getInt(3));
			soform.setEmployeId(rs.getInt(4));
			soform.setOrderAmount(rs.getInt(5));
			soform.setOrderStatus(rs.getString(6));
			v.add(soform);
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
public StampOrderMasterForm ViewStampOrderMasterById(int OrderId)
{   StampOrderMasterForm soform=new StampOrderMasterForm();
	java.sql.Connection con=null;
	 
	try
	{
		 
		con=getConnection();
		 
		PreparedStatement ps=con.prepareStatement("select * from StampOrderMaster where OrderId = ? ");
		ps.setInt(1,OrderId);
		ResultSet rs=ps.executeQuery();
		 
		if(rs.next())
		{
			soform=new StampOrderMasterForm();
			 
			soform.setOrderId(rs.getInt(1));
			soform.setOrderDate(DateWrapper.parseDate(rs.getDate(2)));
			soform.setUserId(rs.getInt(3));
			soform.setEmployeId(rs.getInt(4));
			soform.setOrderAmount(rs.getInt(5));
			soform.setOrderStatus(rs.getString(6));
			 
			 
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
	return soform;
	
	
}

public boolean deleteStampOrderMaster(int OrderId)
	{
		java.sql.Connection con=null;
		boolean flag=false;
		try
		{
			 
			con=getConnection();
			 
			PreparedStatement ps=con.prepareStatement("delete from StampOrderMaster where OrderId = ? ");
			ps.setInt(1,OrderId);
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

public boolean UpdateStampOrderMaster(StampOrderMasterForm soform)
{
	java.sql.Connection con=null;
	boolean flag=false;
	try
	{
	 
	con=getConnection();
	PreparedStatement ps=con.prepareStatement("update StampOrderMaster set orderdate = ?,userid = ?,employeid = ?, orderamount = ?,orderstatus = ? where OrderId = ? ");
	ps.setInt(6,soform.getOrderId());
	ps.setString(1,DateWrapper.parseDate(soform.getOrderDate()));
	ps.setInt(2,soform.getUserId());
	ps.setInt(3,soform.getEmployeId());
	ps.setInt(4,soform.getOrderAmount());
	ps.setString(5,soform.getOrderStatus());
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






 


 





 
