package com.model2.mvc.web.review;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.model2.mvc.service.review.ReviewService;

@Controller
@RequestMapping("/review/*")
public class ReviewController {

	@Autowired
	@Qualifier("reviewServiceImpl")
	ReviewService reviewService;
	
	public ReviewController() {
		System.out.println(this.getClass());
	}
	
	@RequestMapping(value="getReview/{reviewNo}")
	public String getReview(@PathVariable int reviewNo
							,Model model) throws Exception{
		
		model.addAttribute("review",reviewService.getReview(reviewNo));
		
		return "forward:/review/getReview.jsp";
	}

}
