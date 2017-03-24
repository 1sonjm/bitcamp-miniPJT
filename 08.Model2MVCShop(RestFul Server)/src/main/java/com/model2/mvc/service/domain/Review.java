package com.model2.mvc.service.domain;

import org.springframework.web.multipart.MultipartFile;

public class Review {
	
	private int reviewNo;
	//네이밍을 Purchase객체면 domainPurchase라고 하면어떨까
	// domainProduct,domainUser가 되서 이해가 더 쉬워지는거지
	private Purchase purchasehistory;
	private Product purchaseItem;
	private User buyer;
	private String reviewTitle;
	private String reviewContent;
	private String imageName;
	private MultipartFile uploadfile;
	private String answerTitle;
	private String answerContent;
	private int grade;
	private String regDate;
	
	public Review() {
	}

	public int getReviewNo() {		return reviewNo;	}
	public void setReviewNo(int reviewNo) {		this.reviewNo = reviewNo;	}
	
	public Purchase getPurchasehistory() {		return purchasehistory;	}
	public void setPurchasehistory(Purchase purchasehistory) {		this.purchasehistory = purchasehistory;	}

	public Product getPurchaseItem() {		return purchaseItem;	}
	public void setPurchaseItem(Product purchaseItem) {		this.purchaseItem = purchaseItem;	}

	public User getBuyer() {		return buyer;	}
	public void setBuyer(User buyer) {		this.buyer = buyer;	}

	public String getReviewTitle() {		return reviewTitle;	}
	public void setReviewTitle(String reviewTitle) {		this.reviewTitle = reviewTitle;	}

	public String getReviewContent() {		return reviewContent;	}
	public void setReviewContent(String reviewContent) {		this.reviewContent = reviewContent;	}

	public String getImageName() {		return imageName;	}
	public void setImageName(String imageName) {		this.imageName = imageName;	}

	public String getAnswerTitle() {		return answerTitle;	}
	public void setAnswerTitle(String answerTitle) {		this.answerTitle = answerTitle;	}

	public String getAnswerContent() {		return answerContent;	}
	public void setAnswerContent(String answerContent) {		this.answerContent = answerContent;	}

	public int getGrade() {		return grade;	}
	public void setGrade(int grade) {		this.grade = grade;	}

	public String getRegDate() {		return regDate;	}
	public void setRegDate(String regDate) {		this.regDate = regDate;	}

	public MultipartFile getUploadfile() {		return uploadfile;	}
	public void setUploadfile(MultipartFile uploadfile) {		this.uploadfile = uploadfile;	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Review [reviewNo=");
		builder.append(reviewNo);
		builder.append(", purchasehistory=");
		builder.append(purchasehistory);
		builder.append(", purchaseItem=");
		builder.append(purchaseItem);
		builder.append(", buyer=");
		builder.append(buyer);
		builder.append(", reviewTitle=");
		builder.append(reviewTitle);
		builder.append(", reviewContent=");
		builder.append(reviewContent);
		builder.append(", imageName=");
		builder.append(imageName);
		builder.append(", uploadfile=");
		builder.append(uploadfile);
		builder.append(", answerTitle=");
		builder.append(answerTitle);
		builder.append(", answerContent=");
		builder.append(answerContent);
		builder.append(", grade=");
		builder.append(grade);
		builder.append(", regDate=");
		builder.append(regDate);
		builder.append("]");
		return builder.toString();
	}
}
