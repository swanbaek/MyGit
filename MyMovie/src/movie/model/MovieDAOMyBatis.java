package movie.model;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

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
		}
		
		private void close(){
			if(ses!=null) ses.close();
		}//---------------------------

}
