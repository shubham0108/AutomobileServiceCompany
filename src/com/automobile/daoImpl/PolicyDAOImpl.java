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

import com.automobile.beans.Policy;
import com.automobile.ifaces.DAO;

public class PolicyDAOImpl implements DAO<Policy> {

	private Connection con;
	
	public PolicyDAOImpl() {
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
	public int add(Policy policy) throws SQLException {
		int result = 0; 
		
		String sql = "Insert into policyShubham values(?,?,?)";
		
		PreparedStatement pstmt = con.prepareStatement(sql);
		
		pstmt.setLong(1, policy.getPolicyId());
		pstmt.setString(3, policy.getPolicyType());
		pstmt.setDouble(2,policy.getPremiumAmount());
		
		result=pstmt.executeUpdate();
		pstmt.close();
		
		return result;	
	}

	@Override
	public int remove(long id) throws SQLException {

		String sql = "delete from policyShubham where policyId = ?";
		
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

		String sql = "update policyShubham " + property + "= ? where policyId = ? ";
		
		int rowUpdated = -1;
		PreparedStatement pstmt = null;

		pstmt = con.prepareStatement(sql);
		pstmt.setString(1,newValue);
		pstmt.setLong(2,id);
		if(!property.equals("policyType")){
			rowUpdated = pstmt.executeUpdate();
		}
		
		pstmt.close();

		return rowUpdated;	
	}

	@Override
	public List<Policy> getAll() throws SQLException {

		List<Policy> policyList =new ArrayList<>();
		
		String sql = "select * from policyShubham";
		PreparedStatement preparedStatement=null;
		
		try{
			preparedStatement = con.prepareStatement(sql);
			ResultSet rs = preparedStatement.executeQuery();
			while(rs.next()){
				Policy policy = convertToObject(rs);
				policyList.add(policy);
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return policyList;		
	}

	@Override
	public Policy get(long id) throws SQLException {


		Policy policy= null;
		String sql = "select * from policyShubham where policyId = ?";
		
		PreparedStatement preparedStatement=null;
		
		try{
	
			preparedStatement = con.prepareStatement(sql);
			preparedStatement.setLong(1, id);
			ResultSet rs = preparedStatement.executeQuery();
			while(rs.next()){
				policy = convertToObject(rs);
			}
		
		}
		
		catch(Exception e){
			e.printStackTrace();
		}
		return policy;	
	}
	
	private Policy convertToObject(ResultSet rs) throws SQLException{
		
		Policy policy = null;
		String policyType = rs.getString("policyType");
		long policyId = rs.getLong("policyId");
		double premiumAmount = rs.getDouble("premiumAmount");
		
		policy= new Policy(policyId, policyType);
		policy.setPremiumAmount(premiumAmount);
		return policy;
	}

}
