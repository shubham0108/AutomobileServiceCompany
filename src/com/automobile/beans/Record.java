package com.automobile.beans;

import java.util.*;



public class Record {
	private HashMap< Car, HashMap<Date, List<Service>>> recordMap;

	public Record() {
		super();
		this.recordMap = new HashMap<>(); 
	}




	public HashMap<Car, HashMap<Date, List<Service>>> getRecordMap() {
		return recordMap;
	}


	public void setRecordMap(HashMap<Car, HashMap<Date, List<Service>>> recordMap) {
		this.recordMap = recordMap;
	}


	@Override
	public String toString() {
		return "Record [recordMap=" + recordMap + "]";
	}

	
}

