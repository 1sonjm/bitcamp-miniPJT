package com.model2.mvc.web.review;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.model2.mvc.service.domain.Purchase;
import com.model2.mvc.service.domain.Review;
import com.model2.mvc.service.product.ProductService;
import com.model2.mvc.service.purchase.PurchaseService;
import com.model2.mvc.service.review.ReviewService;

@Controller
@RequestMapping("/review/*")
public class ReviewController {

	@Autowired
	@Qualifier("reviewServiceImpl")
	ReviewService reviewService;

	@Autowired
	@Qualifier("productServiceImpl")
	ProductService productService;
	
	@Autowired
	@Qualifier("purchaseServiceImpl")
	PurchaseService purchaseService;
	
	public ReviewController() {
		System.out.println(this.getClass());
	}
	
	@RequestMapping(value="getReview/{reviewNo}")
	public String getReview(@PathVariable int reviewNo
							,Model model) throws Exception{
		
		model.addAttribute("review",reviewService.getReview(reviewNo));
		
		return "forward:/review/getReview.jsp";
	}
	@RequestMapping(value="getJsonReview/{reviewNo}")
	public void getJsonReview(@PathVariable int reviewNo
							,Model model) throws Exception{
		
		System.out.println("getJsonReview, reviewNo:"+reviewNo);
		model.addAttribute("review",reviewService.getReview(reviewNo));
	}
	
	@RequestMapping(value="addReviewView/{tranNo}")
	public String addReviewView(@PathVariable int tranNo
								,@ModelAttribute("review")Review review
								,Model model) throws Exception{
		
		model.addAttribute("purchase",purchaseService.getPurchase(tranNo));
		return "forward:/review/addReviewView.jsp";
	}
	@RequestMapping(value="addReview/{tranNo}")
	public String addReview(@PathVariable int tranNo
								,@ModelAttribute("review")Review review
								,Model model
								,HttpSession session) throws Exception{

		Purchase purchase = purchaseService.getPurchase(tranNo);
		review.setPurchasehistory(purchase);
		reviewService.insertReview(review);
		return "redirect:/purchase/listPurchase";
	}

	@RequestMapping(value="updateReviewView/{reviewNo}")
	public String updateReviewView(@PathVariable int reviewNo
								,@ModelAttribute("review")Review review
								,Model model) throws Exception{
		
		model.addAttribute(reviewService.getReview(reviewNo));
		return "forward:/review/updateReviewView.jsp";
	}
	@RequestMapping(value="updateReview/{reviewNo}")
	public String updateReview(@PathVariable int reviewNo
								,@ModelAttribute("review")Review review
								,Model model) throws Exception{

		reviewService.updateReview(review);
		return "redirect:/product/listProduct?menu=search";
	}
	
	@RequestMapping(value="updateAnswerView/{reviewNo}")
	public String updateAnswerView(@PathVariable int reviewNo
									,@ModelAttribute("review")Review review
									,Model model) throws Exception{
		
		model.addAttribute("review",reviewService.getReview(reviewNo));
		return "forward:/review/updateAnswerView.jsp";
	}
	@RequestMapping(value="updateAnswer/{reviewNo}")
	public String updateAnswer(@PathVariable int reviewNo
								,@ModelAttribute("review")Review review) throws Exception{

		reviewService.updateAnswer(review);
		return "redirect:/review/getReview/"+reviewNo;
	}
}
