package com.project.main.model;

import java.util.Date;

public class Recent {
	
	private int id;
	private int user_sendid;
	private int user_receiveid;
	private Date createdat;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getUser_sendid() {
		return user_sendid;
	}
	public void setUser_sendid(int user_sendid) {
		this.user_sendid = user_sendid;
	}
	public int getUser_receiveid() {
		return user_receiveid;
	}
	public void setUser_receiveid(int user_receiveid) {
		this.user_receiveid = user_receiveid;
	}
	public Date getCreatedat() {
		return createdat;
	}
	public void setCreatedat(Date createdat) {
		this.createdat = createdat;
	}
	
	
	
}
