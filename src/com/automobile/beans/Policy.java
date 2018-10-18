package com.automobile.beans;


public class Policy {
	private long policyId;
	private double premiumAmount = 0;
	private String policyType;
	
	
	
	
	public Policy() {
		super();
		
	}


	public Policy(long policyId, String policyType) {
		super();
		this.policyId = policyId;
		this.policyType = policyType;
	}


	public long getPolicyId() {
		return policyId;
	}


	public void setPolicyId(long policyId) {
		this.policyId = policyId;
	}


	public double getPremiumAmount() {
		calculatePremium();
		return premiumAmount;
	}


	public void setPremiumAmount(double premiumAmount) {
		this.premiumAmount = premiumAmount;
	}


	public String getPolicyType() {
		return policyType;
	}


	public void setPolicyType(String policyType) {
		this.policyType = policyType;
	}


	@Override
	public String toString() {
		return "Policy [policyId=" + policyId + ", premiumAmount=" + premiumAmount + ", policyType=" + policyType + "]";
	}

	private void calculatePremium(){
		switch (this.policyType){
		case ("TypeA"):
			this.premiumAmount = 2000;
			break;
		case ("TypeB"):
			this.premiumAmount = 3000;
			break;
		case ("TypeC"):
			this.premiumAmount = 5000;
			break;
		default:
			this.premiumAmount = 1000;
		}
	} 
	
	
}
