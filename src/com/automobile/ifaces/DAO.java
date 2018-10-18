package com.automobile.ifaces;

import java.sql.SQLException;
import java.util.List;

public interface DAO<T> {
	
	public int add(T t) throws SQLException;
	public int remove(long id) throws SQLException; 
	public int modify(long id, String property, String newValue) throws SQLException;
	public List<T> getAll() throws SQLException;
	public T get(long id) throws SQLException;
	
}
