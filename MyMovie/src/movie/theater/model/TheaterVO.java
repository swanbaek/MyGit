package movie.theater.model;
import java.io.*;
public class TheaterVO implements Serializable{
	
	private Integer theater_code;
	private String theater_name;
	private int seat_total;
	private String theater_addr;
	
	private int loc_code;
	private String loc_name;
	private int cnt;
	
	
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public Integer getTheater_code() {
		return theater_code;
	}
	public void setTheater_code(Integer theater_code) {
		this.theater_code = theater_code;
	}
	public String getTheater_name() {
		return theater_name;
	}
	public void setTheater_name(String theater_name) {
		this.theater_name = theater_name;
	}
	public int getSeat_total() {
		return seat_total;
	}
	public void setSeat_total(int seat_total) {
		this.seat_total = seat_total;
	}
	public String getTheater_addr() {
		return theater_addr;
	}
	public void setTheater_addr(String theater_addr) {
		this.theater_addr = theater_addr;
	}
	public int getLoc_code() {
		return loc_code;
	}
	public void setLoc_code(int loc_code) {
		this.loc_code = loc_code;
	}
	public String getLoc_name() {
		return loc_name;
	}
	public void setLoc_name(String loc_name) {
		this.loc_name = loc_name;
	}
	

}
