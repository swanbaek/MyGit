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
	
	//� mapper�� ������� ����(���ӽ����̽� ���� �ʼ�)
		private final String NS="movie.model.MovieMapper";
		private SqlSession ses;
		
		//�������丮�� ��� �޼ҵ� ����
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
		
		/**[���� ����-���� ��� ��������]*/
		public List<TheaterVO> getLocList(){
			try{
				ses=this.getSessionFactory().openSession();
				List<TheaterVO> arr=ses.selectList(NS+".listLoc");
				return arr;
			}finally{
				close();
			}
		}
		/**[���� ����-Ư�� ��ȭ�� ���ϴ� ���� ��� ��������]*/
		public List<TheaterVO> getLocListByMovie(int movie_code){
			try{
				ses=this.getSessionFactory().openSession();
				List<TheaterVO> arr=ses.selectList(NS+".listLocByMovieCode",movie_code);
				return arr;
			}finally{
				close();
			}
		}
		/**[���� ����-Ư�� ��ȭ�� ���ϴ� ���� ��ϰ� �󿵰��� ��������]*/
		public List<TheaterVO> getLocListByMovieCnt(int movie_code){
			try{
				ses=this.getSessionFactory().openSession();
				List<TheaterVO> arr=ses.selectList(NS+".listCountByMovieCode",movie_code);
				return arr;
			}finally{
				close();
			}
		}
		
		/**[���� ����-������ ��ȭ�� ��� ��������]*/
		public List<TheaterVO> getTheaterList(int loc_code){
			try{
				ses=this.getSessionFactory().openSession();
				List<TheaterVO> arr=ses.selectList(NS+".listTheater",loc_code);
				return arr;
			}finally{
				close();
			}
		}
		/**[���� ����-Ư�� ��ȭ�� ���ϴ� ������ ��ȭ�� ��� ��������]*/
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
		/**���ż� ��ȭ��� �����ֱ�*/
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
