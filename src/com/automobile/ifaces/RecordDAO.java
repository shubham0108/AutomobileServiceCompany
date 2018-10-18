package com.automobile.ifaces;

import java.sql.SQLException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import com.automobile.beans.Car;
import com.automobile.beans.Service;

public interface RecordDAO {
	
	public int add(long carRegNum,long serviceId) throws SQLException;
	public int remove(long carRegNum) throws SQLException;
	public HashMap<Car, HashMap<Date, List<Service>>> getAll() throws SQLException;
	public HashMap<Car, HashMap<Date, List<Service>>> getByRegNum(long carRegNum) throws SQLException;
	public HashMap<Car, HashMap<Date, List<Service>>> getByCustId(long custId) throws SQLException;
}
