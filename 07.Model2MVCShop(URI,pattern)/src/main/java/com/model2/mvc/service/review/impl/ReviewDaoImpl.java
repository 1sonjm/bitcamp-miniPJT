package com.model2.mvc.service.review.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.model2.mvc.service.domain.Review;
import com.model2.mvc.service.review.ReviewDao;

@Service("reviewDaoImpl")
public class ReviewDaoImpl implements ReviewDao {

	@Autowired
	@Qualifier("sqlSessionTemplate")
	SqlSession sqlSession;
	public void getSqlSession(SqlSession sqlSession){
		this.sqlSession = sqlSession;
	}
	
	public ReviewDaoImpl() {
		System.out.println(this.getClass());
	}

	@Override
	public int insertReview(Review review) throws Exception {
		return sqlSession.insert("ReviewMapper.insertReview", review);
	}

	@Override
	public Review getReview(int reviewNo) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateReview(Review review) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

}
