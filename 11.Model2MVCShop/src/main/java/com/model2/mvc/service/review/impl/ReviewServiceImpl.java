package com.model2.mvc.service.review.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.model2.mvc.service.domain.Review;
import com.model2.mvc.service.review.ReviewDao;
import com.model2.mvc.service.review.ReviewService;

@Repository("reviewServiceImpl")
public class ReviewServiceImpl implements ReviewService {

	@Autowired
	@Qualifier("reviewDaoImpl")
	ReviewDao reviewDao;
	public void getReviewDao(ReviewDao reviewDao){
		this.reviewDao = reviewDao;
	}
	
	public ReviewServiceImpl() {
		System.out.println(this.getClass());
	}

	@Override
	public int insertReview(Review review) throws Exception {
		return reviewDao.insertReview(review);
	}

	@Override
	public List<Review> getReviewList(int prodNo) throws Exception {
		return reviewDao.getReviewList(prodNo);
	}
	
	@Override
	public Review getReview(int reviewNo) throws Exception {
		return reviewDao.getReview(reviewNo);
	}

	@Override
	public int updateReview(Review review) throws Exception {
		return reviewDao.updateReview(review);
	}

	@Override
	public int updateAnswer(Review review) throws Exception {
		return reviewDao.updateAnswer(review);
	}

}
