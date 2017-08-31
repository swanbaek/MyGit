package memo.model;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

@Repository
public class MemoDAOMyBatis extends SqlSessionDaoSupport  implements MemoDAO  {
	
	private final String NS="memo.model.MemoMapper";
	
	

	@Resource(name="sqlSessionFactory")
	@Override
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		// TODO Auto-generated method stub
		super.setSqlSessionFactory(sqlSessionFactory);
	}
	@Override
	public int createMemo(MemoVO memo) {
		// TODO Auto-generated method stub
		return this.getSqlSession().insert(NS+".insertMemo",memo);
	}

	@Override
	public List<MemoVO> listMemo() {
		// TODO Auto-generated method stub
		return this.getSqlSession().selectList(NS+".listMemo");
	}

	@Override
	public MemoVO getMemo(int idx) {
		// TODO Auto-generated method stub
		return this.getSqlSession().selectOne(NS+".selectMemoByIdx",idx);
	}

	@Override
	public int updateMemo(MemoVO memo) {
		// TODO Auto-generated method stub
		return this.getSqlSession().update(NS+".updateMemo",memo);
	}

	@Override
	public int deleteMemo(int idx) {
		// TODO Auto-generated method stub
		return this.getSqlSession().delete(NS+".deleteMemo",idx);
	}

}
