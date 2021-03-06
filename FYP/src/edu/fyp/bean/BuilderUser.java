package edu.fyp.bean;

import java.io.Serializable;

import javax.jdo.annotations.PersistenceCapable;
import javax.jdo.annotations.Persistent;

import com.google.appengine.api.datastore.Key;

@PersistenceCapable
public class BuilderUser implements Serializable{
	
	@Persistent
	private String userName;
	@Persistent
	private String password;
	@Persistent
	private Key employee;
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public Key getEmployee() {
		return employee;
	}
	public void setEmployee(Key employee) {
		this.employee = employee;
	}
	
	
	
	

}
