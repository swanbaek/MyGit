package kr.co.hanbit;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;
@Repository
public class MemoDAOMyBatis extends SqlSessionDaoSupport 
implements MemoDAO{
    private String NS="kr.co.hanbit.MemoMapper";
    private SqlSession ses;
    
    
    Connection con;
    PreparedStatement pstmt;
    ResultSet rs;
    public MemoDAOMyBatis(){
    	
    }

	@Resource(name="sqlSessionFactory")
    public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory){
    	super.setSqlSessionFactory(sqlSessionFactory);
    }
    @Resource(name="sqlSessionTemplate")
    public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate){
    	super.setSqlSessionTemplate(sqlSessionTemplate);
    }
    
   
	public List<MemoVO> selectAllMemo() throws SQLException {
		 try{
	        	ses=this.getSqlSession();            
	            List<MemoVO> arr=null;
	            arr=ses.selectList(NS+".getMemo");
	            return arr;            
	        }finally{
	           // if(ses!=null) ses.close();
	        }
	}
    
    public void close(){
        try {
            if(rs!=null) rs.close();
            if(pstmt!=null) pstmt.close();
            if(con!=null) con.close();
        } catch (Exception e) {
        }
    }//close()----------------------------------------



 
    
}///////////////////////////////////////////////




