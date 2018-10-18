package com.automobile.beans;

public class Service {

	private long serviceId;
	private String serviceName;
	private double cost;
	public Service() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Service(long serviceId, String serviceName, double cost) {
		super();
		this.serviceId = serviceId;
		this.serviceName = serviceName;
		this.cost = cost;
	}
	public long getServiceId() {
		return serviceId;
	}
	public void setServiceId(long serviceId) {
		this.serviceId = serviceId;
	}
	public String getServiceName() {
		return serviceName;
	}
	public void setServiceName(String serviceName) {
		this.serviceName = serviceName;
	}
	public double getCost() {
		return cost;
	}
	public void setCost(double cost) {
		this.cost = cost;
	}
	@Override
	public String toString() {
		return "Service [serviceId=" + serviceId + ", serviceName=" + serviceName + ", cost=" + cost + "]";
	}
	
	
}
