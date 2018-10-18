package com.automobile.utils;

import java.sql.*;
import java.util.Properties;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import java.io.*;

public class DbConnection {

	public static Connection getOracleConnection(){
		Connection con = null;
		
		try{
			
			Context ctx=new InitialContext();
   			DataSource dataSource=(DataSource)ctx.lookup("java:comp/env/jdbc/ds1");
   			con=dataSource.getConnection();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return con;
	}
}
