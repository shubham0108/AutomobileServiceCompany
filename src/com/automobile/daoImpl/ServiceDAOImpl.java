package com.automobile.daoImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.automobile.beans.Service;
import com.automobile.ifaces.DAO;

public class ServiceDAOImpl implements DAO<Service> {

	private Connection con;
	
	public ServiceDAOImpl() {
		super();
		try {
			Context ctx = new InitialContext();
			DataSource dataSource = (DataSource) ctx.lookup("java:comp/env/jdbc/ds1");
			this.con = dataSource.getConnection();
		} catch (NamingException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		System.out.println(this.con);
	}
	
	@Override
	public int add(Service service) throws SQLException {
		int result = 0; 
		
		String sql = "Insert into serviceShubham values(?,?,?)";
		
		PreparedStatement pstmt = con.prepareStatement(sql);
		
		pstmt.setLong(1, service.getServiceId());
		pstmt.setString(2, service.getServiceName());
		pstmt.setDouble(3,service.getCost());
		
		
		result=pstmt.executeUpdate();
		pstmt.close();
		
		return result;	
	}

	@Override
	public int remove(long id) throws SQLException {

		String sql = "delete from serviceShubham where serviceId = ?";
		
		PreparedStatement pstmt = null;
				
		int rowsDeleted = 0;
	
		pstmt = con.prepareStatement(sql);
		pstmt.setLong(1, id);

		rowsDeleted = pstmt.executeUpdate();
		
		pstmt.close();
		
		
		return rowsDeleted;
		
	}

	@Override
	public int modify(long id, String property, String newValue) throws SQLException {

		String sql = "update serviceShubham set " + property + "= ? where serviceId = ? ";
		
		
		PreparedStatement pstmt = null;

		pstmt = con.prepareStatement(sql);
		pstmt.setString(1,newValue);
		pstmt.setLong(2,id);
		int rowUpdated = pstmt.executeUpdate();
		
		pstmt.close();

		return rowUpdated;	
	}

	@Override
	public List<Service> getAll() throws SQLException {

		List<Service> serviceList =new ArrayList<>();
		
		String sql = "select * from serviceShubham";
		PreparedStatement preparedStatement=null;
		
		try{
			preparedStatement = con.prepareStatement(sql);
			ResultSet rs = preparedStatement.executeQuery();
			while(rs.next()){
				Service service = convertToObject(rs);
				serviceList.add(service);
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return serviceList;		
	}

	@Override
	public Service get(long id) throws SQLException {


		Service service= null;
		String sql = "select * from serviceShubham where serviceId = ?";
		
		PreparedStatement preparedStatement=null;
		
		try{
	
			preparedStatement = con.prepareStatement(sql);
			preparedStatement.setLong(1, id);
			ResultSet rs = preparedStatement.executeQuery();
			while(rs.next()){
				service = convertToObject(rs);
			}
		
		}
		
		catch(Exception e){
			e.printStackTrace();
		}
		return service;	
	}
	
	private Service convertToObject(ResultSet rs) throws SQLException{
		
		Service service = null;
		String serviceName = rs.getString("serviceName");
		long serviceId = rs.getLong("serviceId");
		double cost = rs.getDouble("Cost");
		
		service= new Service(serviceId, serviceName, cost);
		return service;
	}

}
