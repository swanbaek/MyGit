package movie.model;

import java.io.Serializable;
import java.sql.Date;
import java.io.*;
public class MovieVOView implements Serializable {
	
	
	private String genrename;
	private String gradename;
	private String gradeimage;
	
	private Integer movie_code;
	private String movie_title, subtitle;
	
	private Integer genrecode; /* 장르코드 */
	private Integer gradecode; /* 등급코드 */
	private String director;  /* 영화감독 */
	private String story ; /* 줄거리 */
	private Integer runtime; /* 상영시간 */
	private java.sql.Date opendate;/* 개봉일 */
	private String poster1 ; /* 포스터1 */
	private String poster2 ; /* 포스터2 */
	private String actor ; /* 주연배우 */
	private String producer ; /* 제작사 */
	private String makeYear; /* 제작년도 */
	private String makeCountry ; /* 제작국가 */
	private String supplier ; /* 공급업체 */
	private Integer release_status; /* 영화개봉상태구분 */
	private String movie_site;/*영화 공식 사이트*/
	private float rate;
	
	private int theater_code;
	
	
	
	
	public int getTheater_code() {
		return theater_code;
	}
	public void setTheater_code(int theater_code) {
		this.theater_code = theater_code;
	}
	public float getRate() {
		return rate;
	}
	public void setRate(float rate) {
		this.rate = rate;
	}
	public String getGenrename() {
		return genrename;
	}
	public void setGenrename(String genrename) {
		this.genrename = genrename;
	}
	public String getGradename() {
		return gradename;
	}
	public void setGradename(String gradename) {
		this.gradename = gradename;
	}
	public String getGradeimage() {
		return gradeimage;
	}
	public void setGradeimage(String gradeimage) {
		this.gradeimage = gradeimage;
	}
	public String getSubtitle() {
		return subtitle;
	}
	public void setSubtitle(String subtitle) {
		this.subtitle = subtitle;
	}
	public Integer getMovie_code() {
		return movie_code;
	}
	public void setMovie_code(Integer movie_code) {
		this.movie_code = movie_code;
	}
	public String getMovie_title() {
		return movie_title;
	}
	public void setMovie_title(String movie_title) {
		this.movie_title = movie_title;
	}
	public Integer getGenrecode() {
		return genrecode;
	}
	public void setGenrecode(Integer genrecode) {
		this.genrecode = genrecode;
	}
	public Integer getGradecode() {
		return gradecode;
	}
	public void setGradecode(Integer gradecode) {
		this.gradecode = gradecode;
	}
	public String getDirector() {
		return director;
	}
	public void setDirector(String director) {
		this.director = director;
	}
	public String getStory() {
		return story;
	}
	public void setStory(String story) {
		this.story = story;
	}
	public Integer getRuntime() {
		return runtime;
	}
	public void setRuntime(Integer runtime) {
		this.runtime = runtime;
	}
	public java.sql.Date getOpendate() {
		return opendate;
	}
	public void setOpendate(java.sql.Date opendate) {
		this.opendate = opendate;
	}
	public String getPoster1() {
		return poster1;
	}
	public void setPoster1(String poster1) {
		this.poster1 = poster1;
	}
	public String getPoster2() {
		return poster2;
	}
	public void setPoster2(String poster2) {
		this.poster2 = poster2;
	}
	public String getActor() {
		return actor;
	}
	public void setActor(String actor) {
		this.actor = actor;
	}
	public String getProducer() {
		return producer;
	}
	public void setProducer(String producer) {
		this.producer = producer;
	}
	public String getMakeYear() {
		return makeYear;
	}
	public void setMakeYear(String makeYear) {
		this.makeYear = makeYear;
	}
	public String getMakeCountry() {
		return makeCountry;
	}
	public void setMakeCountry(String makeCountry) {
		this.makeCountry = makeCountry;
	}
	public String getSupplier() {
		return supplier;
	}
	public void setSupplier(String supplier) {
		this.supplier = supplier;
	}
	public Integer getRelease_status() {
		return release_status;
	}
	public void setRelease_status(Integer release_status) {
		this.release_status = release_status;
	}
	public String getMovie_site() {
		return movie_site;
	}
	public void setMovie_site(String movie_site) {
		this.movie_site = movie_site;
	}
	@Override
	public String toString() {
		return "MovieVO [movie_code=" + movie_code + ", movie_title=" + movie_title + ", genrecode=" + genrecode
				+ ", gradecode=" + gradecode + ", director=" + director + ", story=" + story + ", runtime=" + runtime
				+ ", opendate=" + opendate + ", poster1=" + poster1 + ", poster2=" + poster2 + ", actor=" + actor
				+ ", producer=" + producer + ", makeYear=" + makeYear + ", makeCountry=" + makeCountry + ", supplier="
				+ supplier + ", release_status=" + release_status + ", movie_site=" + movie_site + "]";
	}
	
	

}
