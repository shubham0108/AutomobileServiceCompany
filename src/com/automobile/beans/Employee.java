package com.automobile.beans;

public class Employee {

	private String eName;
	private long eId;
	private String password;
	private String userName;
	public Employee() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Employee(String eName, long eId, String password, String userName) {
		super();
		this.eName = eName;
		this.eId = eId;
		this.password = password;
		this.userName = userName;
	}
	public String geteName() {
		return eName;
	}
	public void seteName(String eName) {
		this.eName = eName;
	}
	public long geteId() {
		return eId;
	}
	public void seteId(long eId) {
		this.eId = eId;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	@Override
	public String toString() {
		return "Employee [eName=" + eName + ", eId=" + eId + ", password=" + password + ", userName=" + userName + "]";
	}
	
	
	
	
	
}

