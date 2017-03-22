package com.model2.mvc.service.review;

import com.model2.mvc.service.domain.Review;

public interface ReviewService {
	public int insertReview(Review review) throws Exception;
	
	public Review getReview(int reviewNo) throws Exception;
	
	public int updateReview(Review review) throws Exception;
}
