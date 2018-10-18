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

import com.automobile.beans.Employee;
import com.automobile.ifaces.DAO;

public class EmployeeDAOImpl implements DAO<Employee> {

	private Connection con;
	
	public EmployeeDAOImpl() {
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
	public int add(Employee employee) throws SQLException {
		int result = 0; 
		
		if(checkExistingEmp(employee.geteId())) {
		
			String sql = "Insert into employeeShubham values(?,?,?,?)";
		
			PreparedStatement pstmt = con.prepareStatement(sql);
		
			pstmt.setLong(2, employee.geteId());
			pstmt.setString(1, employee.geteName());
			pstmt.setString(3,employee.getPassword());
			pstmt.setString(4, employee.getUserName());
		
			result=pstmt.executeUpdate();
			pstmt.close();
		}
		
		return result;
	}


	@Override
	public int remove(long id) throws SQLException {
		
		String sql = "delete from employeeShubham where eId = ?";
		
		PreparedStatement pstmt = null;
				
		int rowsDeleted = 0;
	
		pstmt = con.prepareStatement(sql);
		pstmt.setLong(1, id);

		rowsDeleted = pstmt.executeUpdate();
		
		pstmt.close();
		
		
		return rowsDeleted;
		
	}

	@Override
	public int modify(long eid, String property, String newValue) throws SQLException {
		
		String sql = "update employeeShubham set " + property + "= ? where eId = ? ";
		
		
		PreparedStatement pstmt = null;

		pstmt = con.prepareStatement(sql);
		pstmt.setString(1,newValue);
		pstmt.setLong(2,eid);
		int rowUpdated = pstmt.executeUpdate();
		
		pstmt.close();

		return rowUpdated;	
		
	}

	@Override
	public List<Employee> getAll() throws SQLException {
		
		List<Employee> empList =new ArrayList<>();
		
		String sql = "select * from employeeShubham order by eName";
		PreparedStatement preparedStatement=null;
		
		try{
	
			preparedStatement = con.prepareStatement(sql);
			ResultSet rs = preparedStatement.executeQuery();
			
			while(rs.next()){
				Employee emp = convertToObject(rs);
				empList.add(emp);
			}
		}
		
		catch(Exception e){
			e.printStackTrace();
		}
		return empList;	
	}

	@Override
	public Employee get(long id) throws SQLException {

		Employee emp= null;
		String sql = "select * from employeeShubham where eId = ?";
		
		PreparedStatement preparedStatement=null;
		
		try{
	
			preparedStatement = con.prepareStatement(sql);
			preparedStatement.setLong(1, id);
			ResultSet rs = preparedStatement.executeQuery();
			while(rs.next()){
				emp = convertToObject(rs);
				System.out.println(emp);
			}
		
		}
		
		catch(Exception e){
			e.printStackTrace();
		}
		return emp;	
	}
	
	
	private Employee convertToObject(ResultSet rs) throws SQLException{
		
		Employee employee = null;
		String ename = rs.getString("eName");
		long eid = rs.getLong("eId");
		String password = rs.getString("Password");
		String userName = rs.getString("userName");
		
		employee= new Employee(ename, eid, password,userName);
		return employee;
	}
	
	public boolean validateEmp(long empId, String empPassword) throws SQLException{
		
		boolean status = false;
		
		Employee employee = this.get(empId);
		
		if(employee!=null) {
			if(empPassword.equals(employee.getPassword())) {
				status = true;
			}
		}
		
		return status;
		
		
	}

	public boolean checkExistingEmp(long empId) throws SQLException{
		
		boolean status = true;
		
		Employee employee = this.get(empId);
		
		if(employee!=null) {
				status = false;
			
		}
		
		return status;
		
		
	}
}
