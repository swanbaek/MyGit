/*
 */
package memo.model;
import java.io.Serializable;
import java.sql.Date;

public class MemoVO implements Serializable{
    
    private int idx;
    private String name;
    private String msg;
    private java.sql.Timestamp wdate;
    public MemoVO(){
        
    }
    public MemoVO(int idx, String name, String msg, java.sql.Timestamp wdate) {
        this.idx = idx;
        this.name = name;
        this.msg = msg;
        this.wdate = wdate;
    }
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	
	
	public java.sql.Timestamp getWdate() {
		return wdate;
	}
	public void setWdate(java.sql.Timestamp wdate) {
		this.wdate = wdate;
	}
	@Override
	public String toString() {
		return "MemoVO [idx=" + idx + ", name=" + name + ", msg=" + msg + ", indate=" + wdate + "]";
	}

  
    
}///////////////////////////////////////
