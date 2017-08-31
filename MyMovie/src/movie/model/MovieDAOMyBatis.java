package movie.model;

import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import movie.theater.model.TheaterVO;

public class MovieDAOMyBatis {
	
	//어떤 mapper를 사용할지 정함(네임스페이스 지정 필수)
		private final String NS="movie.model.MovieMapper";
		private SqlSession ses;
		
		//세션팩토리를 얻는 메소드 구성
		private SqlSessionFactory getSessionFactory(){
			String resource="config/mybatis-config.xml";
			InputStream is=null;
			try {
				is=Resources.getResourceAsStream(resource);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			SqlSessionFactory fac
			=new SqlSessionFactoryBuilder().build(is); 
			return fac;
		}//----------------------------------
		
		public List<MovieVOView> getMovieList(){
			try{
				ses=this.getSessionFactory().openSession();
				List<MovieVOView> arr=ses.selectList(NS+".listMovieView");
				return arr;
			}finally{
				close();
			}
		}//---------------------------
		public MovieVOView getMovieDetail(int movie_code){
			try{
				ses=this.getSessionFactory().openSession();
				MovieVOView movie=ses.selectOne(NS+".detailMovieView",movie_code);
				return movie;
			}finally{
				close();
			}  
		}//---------------------------
		
		/**[예매 관련-지역 목록 가져오기]*/
		public List<TheaterVO> getLocList(){
			try{
				ses=this.getSessionFactory().openSession();
				List<TheaterVO> arr=ses.selectList(NS+".listLoc");
				return arr;
			}finally{
				close();
			}
		}
		/**[예매 관련-특정 영화를 상영하는 지역 목록 가져오기]*/
		public List<TheaterVO> getLocListByMovie(int movie_code){
			try{
				ses=this.getSessionFactory().openSession();
				List<TheaterVO> arr=ses.selectList(NS+".listLocByMovieCode",movie_code);
				return arr;
			}finally{
				close();
			}
		}
		/**[예매 관련-특정 영화를 상영하는 지역 목록과 상영관수 가져오기]*/
		public List<TheaterVO> getLocListByMovieCnt(int movie_code){
			try{
				ses=this.getSessionFactory().openSession();
				List<TheaterVO> arr=ses.selectList(NS+".listCountByMovieCode",movie_code);
				return arr;
			}finally{
				close();
			}
		}
		
		/**[예매 관련-지역의 영화관 목록 가져오기]*/
		public List<TheaterVO> getTheaterList(int loc_code){
			try{
				ses=this.getSessionFactory().openSession();
				List<TheaterVO> arr=ses.selectList(NS+".listTheater",loc_code);
				return arr;
			}finally{
				close();
			}
		}
		/**[예매 관련-특정 영화를 상영하는 지역의 영화관 목록 가져오기]*/
		public List<TheaterVO> getTheaterList(int loc_code, int movie_code){
			try{
				Map<String,Integer> map=new HashMap<String,Integer>();
				map.put("loc_code", loc_code);
				map.put("movie_code",movie_code);
				ses=this.getSessionFactory().openSession();
				List<TheaterVO> arr=ses.selectList(NS+".listTheaterByMovie",map);
				return arr;
			}finally{
				close();
			}
		}
		
		public List<TheaterVO> getMovieList(int theater_code){
			try{
				ses=this.getSessionFactory().openSession();
				List<TheaterVO> arr=ses.selectList(NS+".listMovieByTheater",theater_code);
				return arr;
			}finally{
				close();
			}
		} 
		/**예매순 영화목록 보여주기*/
		public List<MovieVOView> getMovieListByRate(){  
			try{
				ses=this.getSessionFactory().openSession();
				List<MovieVOView> arr=ses.selectList(NS+".listMovieByRate");
				return arr;
			}finally{
				close();  
			}
		}
		
		
		
		private void close(){
			if(ses!=null) ses.close();
		}//---------------------------

}
