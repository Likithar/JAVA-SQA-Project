package com.iebms.dao; 
import java.sql.*; 

import com.iebms.dao.AbstractDataAccessObject;
import com.iebms.util.CoreList;
import com.iebms.util.LoggerManager;
import com.yourcompany.struts.form.StampOrderDetailsForm;

public class StampOrderDetailsDao extends AbstractDataAccessObject 
{
	public boolean insertStampOrderDetails(StampOrderDetailsForm soform)
	{
		java.sql.Connection con=null;
		boolean flag=false;
		try
		{
		 
		con=getConnection();
		PreparedStatement ps=con.prepareStatement("insert into StampOrderDetails values(?,?,?)");
		ps.setInt(1,soform.getOrderId());
		ps.setInt(2,soform.getItemId());
		ps.setInt(3,soform.getQtyOredered());
		 
		 
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

public CoreList ViewStampOrderDetails()
{   CoreList v=new CoreList();
	java.sql.Connection con=null;
	StampOrderDetailsForm soform=null;
	try
	{
		con=getConnection();
		Statement st=con.createStatement();
		ResultSet rs=st.executeQuery("select * from StampOrderDetails");
		 
		while(rs.next())
		{
			soform=new StampOrderDetailsForm();
			soform.setOrderId(rs.getInt(1));
			soform.setItemId(rs.getInt(2));
			soform.setQtyOredered(rs.getInt(3));
			 
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
public StampOrderDetailsForm ViewStampOrderDetailsById(int OrderId)
{   StampOrderDetailsForm soform=new StampOrderDetailsForm();
	java.sql.Connection con=null;
	 
	try
	{
		 
		con=getConnection();
		 
		PreparedStatement ps=con.prepareStatement("select * from StampOrderDetails where OrderId = ? ");
		ps.setInt(1,OrderId);
		ResultSet rs=ps.executeQuery();
		 
		if(rs.next())
		{
			soform=new StampOrderDetailsForm();
			soform.setOrderId(rs.getInt(1));
			soform.setItemId(rs.getInt(2));
			soform.setQtyOredered(rs.getInt(3));
			 
			 
			 
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

public boolean deleteStampOrderDetails(int OrderId)
	{
		java.sql.Connection con=null;
		boolean flag=false;
		try
		{
			 
			con=getConnection();
			 
			PreparedStatement ps=con.prepareStatement("delete from StampOrderDetails where OrderId = ? ");
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

public boolean UpdateStampOrderDetails(StampOrderDetailsForm soform)
{
	java.sql.Connection con=null;
	boolean flag=false;
	try
	{
	 
	con=getConnection();
	PreparedStatement ps=con.prepareStatement("update StampOrderDetails set itemid = ?,Qtyordered = ? where OrderId = ? ");
	ps.setInt(3,soform.getOrderId());
	ps.setInt(1,soform.getItemId());
	ps.setInt(2,soform.getQtyOredered());
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




 


 






 

 
