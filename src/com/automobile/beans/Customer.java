package com.automobile.beans;

import java.util.*;


public class Customer {
	
	private long custId;
	private String custName;
	private long mobile;
	private List<Car> carList;
	
	
	
	public Customer(long custId, String custName, long mobile) {
		super();
		this.custId = custId;
		this.custName = custName;
		this.mobile = mobile;
		this.carList= new ArrayList<>();

	}

	public Customer(long custId, String custName, long mobile, List<Car> carList) {
		super();
		this.custId = custId;
		this.custName = custName;
		this.mobile = mobile;
		this.carList = carList;
	}
	
	public List<Car> getCarList() {
		return carList;
	}

	public void setCarList(List<Car> carList) {
		this.carList = carList;
	}

	public Customer() {
		super();
		this.carList= new ArrayList<>();
	}
	
	public long getCustId() {
		return custId;
	}
	public void setCustId(long custId) {
		this.custId = custId;
	}
	public String getCustName() {
		return custName;
	}
	public void setCustName(String custName) {
		this.custName = custName;
	}
	public long getMobile() {
		return mobile;
	}
	public void setMobile(long mobile) {
		this.mobile = mobile;
	}
	@Override
	public String toString() {
		return "Customer [custId=" + custId + ", custName=" + custName + ", mobile=" + mobile + "]";
	}
	
	public void addCar(Car car){
		this.carList.add(car);
	}
	
}
