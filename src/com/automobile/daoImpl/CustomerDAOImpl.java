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

import com.automobile.beans.Car;
import com.automobile.beans.Customer;
import com.automobile.ifaces.DAO;

public class CustomerDAOImpl implements DAO<Customer> {

	private Connection con;
	
	public CustomerDAOImpl() {
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
	public int add(Customer cust) throws SQLException {
		int result = 0; 
		
		String sql = "Insert into custShubham values(?,?,?)";
		
		PreparedStatement pstmt = con.prepareStatement(sql);
		
		pstmt.setLong(1, cust.getCustId());
		pstmt.setString(2, cust.getCustName() );
		pstmt.setLong(3,cust.getMobile());
		
		result=pstmt.executeUpdate();
		pstmt.close();
		
		return result;
	}

	@Override
	public int remove(long id) throws SQLException {
		
		String sql = "delete from custShubham where custId = ?";
		
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
		
		String sql = "update custShubham set " + property + "= ? where custId = ? ";
		
		
		PreparedStatement pstmt = null;

		pstmt = con.prepareStatement(sql);
		pstmt.setString(1,newValue);
		pstmt.setLong(2,id);
		int rowUpdated = pstmt.executeUpdate();
		
		pstmt.close();

		return rowUpdated;	
		
	}

	@Override
	public List<Customer> getAll() throws SQLException {
		
		List<Customer> custList =new ArrayList<>();
		
		String sql = "select * from custShubham natural join carShubham order by custName";
		PreparedStatement preparedStatement=null;
		
		try{
	
			preparedStatement = con.prepareStatement(sql);
			ResultSet rs = preparedStatement.executeQuery();
			
			while(rs.next()){
				boolean exists = false;
				String custName = rs.getString("custName");
				long custId = rs.getLong("custId");
				long mobile = rs.getLong("Mobile");	
				
				long carRegNum = rs.getLong("regNumber");
				String carName = rs.getString("carName");
				long  policyId= rs.getLong("policyId");

				
				if(custList.size()>0){
					for(Customer customer : custList){
					
						if (customer.getCustId()==(custId)){
							customer.addCar(new Car(carRegNum, carName, policyId, custId));							
							exists = true;
					
						}
						
					}
					if(!exists){
					
						Customer cust = new Customer(custId, custName, mobile);
						cust.addCar(new Car(carRegNum, carName, policyId, custId));
						custList.add(cust);						
					}
				}
				else {
					
					Customer cust = new Customer(custId, custName, mobile);
					cust.addCar(new Car(carRegNum, carName, policyId, custId));
					custList.add(cust);
				}	

			}
			
		}
		
		catch(Exception e){
			e.printStackTrace();
		}
		return custList;	
	}

	@Override
	public Customer get(long id) throws SQLException {

		Customer cust= new Customer();
		String sql = "select * from custShubham natural join carShubham where custId = ?";
		
		PreparedStatement preparedStatement=null;
		
		try{
	
			preparedStatement = con.prepareStatement(sql);
			preparedStatement.setLong(1, id);
			ResultSet rs = preparedStatement.executeQuery();
			while(rs.next()){
				cust = convertToObject(rs,cust);
			}
		
		}
		
		catch(Exception e){
			e.printStackTrace();
		}
		return cust;	
	}
	private Customer convertToObject(ResultSet rs,Customer customer) throws SQLException{
		Customer cust = null;
		String custName = rs.getString("custName");
		long custId = rs.getLong("custId");
		long mobile = rs.getLong("Mobile");	
		
		long carRegNum = rs.getLong("regNumber");
		String carName = rs.getString("carName");
		long  policyId= rs.getLong("policyId");
		
		if(customer.getCustId()==0){
			cust = new Customer(custId, custName, mobile);
			cust.addCar(new Car(carRegNum, carName, policyId, custId));				
		}
		else {
			cust=customer;
			cust.addCar(new Car(carRegNum, carName, policyId, custId));	
		}
		return cust;
	}

	
//	private Customer convertToObject(ResultSet rs,List<Customer> custList) throws SQLException{
//		
//		Customer cust = null;
//		boolean exists = false;
//
//		String custName = rs.getString("custName");
//		long custId = rs.getLong("custId");
//		long mobile = rs.getLong("custMobNum");		 
//		
//		long carRegNum = rs.getLong("carRegNum");
//		String carMake = rs.getString("carmake");
//		String carModel = rs.getString("carmodel");
//		long  policyId= rs.getLong("policyId");
//			
//			if (customer.getCustId()==(custId)){
//				cust = customer;
//				cust.addCar(new Car(carRegNum, carMake, carModel, policyId, custId));
//
//				exists = true;
//			}
//		}
//			
//		if(!exists){
//			cust = new Customer(custId, custName, mobile);
//			cust.addCar(new Car(carRegNum, carMake, carModel, policyId, custId));				
//		}
//	
//		return cust;
//	}

}
