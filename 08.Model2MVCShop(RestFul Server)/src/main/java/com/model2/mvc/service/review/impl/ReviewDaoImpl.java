package com.model2.mvc.service.review.impl;

import java.util.List;

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
	public List<Review> getReviewList(int prodNo) throws Exception {
		return sqlSession.selectList("ReviewMapper.getReviewList", prodNo);
	}

	@Override
	public Review getReview(int reviewNo) throws Exception {
		return sqlSession.selectOne("ReviewMapper.getReview", reviewNo);
	}

	@Override
	public int updateReview(Review review) throws Exception {
		return sqlSession.update("ReviewMapper.updateReview", review);
	}

	@Override
	public int updateAnswer(Review review) throws Exception {
		return sqlSession.update("ReviewMapper.updateAnswer", review);
	}


}
