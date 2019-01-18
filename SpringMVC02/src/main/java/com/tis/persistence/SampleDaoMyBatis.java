package com.tis.persistence;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class SampleDaoMyBatis implements SampleDao {

	final String NS="mapper.SampleMapper";
	
	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate session;
	@Override
	public int getCnt() {
		// TODO Auto-generated method stub
		return session.selectOne(NS+".getCnt");
	}

}
