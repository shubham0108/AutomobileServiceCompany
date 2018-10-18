package com.automobile.beans;

public class Car {
	
	private long regNumber;
	private String carName;
	private long policyId;
	private long custId;
	public Car() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Car(long regNumber, String carName, long policyId, long custId) {
		super();
		this.regNumber = regNumber;
		this.carName = carName;
		this.policyId = policyId;
		this.custId = custId;
	}
	public long getRegNumber() {
		return regNumber;
	}
	public void setRegNumber(long regNumber) {
		this.regNumber = regNumber;
	}
	public String getCarName() {
		return carName;
	}
	public void setCarName(String carName) {
		this.carName = carName;
	}
	public long getPolicyId() {
		return policyId;
	}
	public void setPolicyId(long policyId) {
		this.policyId = policyId;
	}
	public long getCustId() {
		return custId;
	}
	public void setCustId(long custId) {
		this.custId = custId;
	}
	@Override
	public String toString() {
		return "Car [regNumber=" + regNumber + ", carName=" + carName + ", policyId=" + policyId + ", custId=" + custId
				+ "]";
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((carName == null) ? 0 : carName.hashCode());
		result = prime * result + (int) (custId ^ (custId >>> 32));
		result = prime * result + (int) (policyId ^ (policyId >>> 32));
		result = prime * result + (int) (regNumber ^ (regNumber >>> 32));
		return result;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Car other = (Car) obj;
		if (carName == null) {
			if (other.carName != null)
				return false;
		} else if (!carName.equals(other.carName))
			return false;
		if (custId != other.custId)
			return false;
		if (policyId != other.policyId)
			return false;
		if (regNumber != other.regNumber)
			return false;
		return true;
	}
	
	

}
