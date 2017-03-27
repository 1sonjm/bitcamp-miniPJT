package com.model2.mvc.service.review;

import java.util.List;

import com.model2.mvc.service.domain.Review;

public interface ReviewDao {
	public int insertReview(Review review) throws Exception;

	public List<Review> getReviewList(int prodNo) throws Exception;
	
	public Review getReview(int reviewNo) throws Exception;
	
	public int updateReview(Review review) throws Exception;

	public int updateAnswer(Review review) throws Exception;
}
