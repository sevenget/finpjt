package model.company;

import java.io.Serializable;
import java.util.Date;

public class InterestedRCDTO implements Serializable{
	private String memid;
	private int cid;
	private Date regTime;
	private Date canTime;
	
	public InterestedRCDTO(){
		
	}

	public String getMemid() {
		return memid;
	}

	public void setMemid(String memid) {
		this.memid = memid;
	}

	public int getCid() {
		return cid;
	}

	public void setCid(int cid) {
		this.cid = cid;
	}

	public Date getRegTime() {
		return regTime;
	}

	public void setRegTime(Date regTime) {
		this.regTime = regTime;
	}

	public Date getCanTime() {
		return canTime;
	}

	public void setCanTime(Date canTime) {
		this.canTime = canTime;
	}
	
	
}
