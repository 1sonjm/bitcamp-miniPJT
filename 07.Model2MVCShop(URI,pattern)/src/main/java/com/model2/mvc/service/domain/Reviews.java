package com.model2.mvc.service.domain;

public class Reviews {
	
	private int reviewNo;
	private int	tranNo;
	private int prodNo;
	private String buyerId;
	private String reviewTitle;
	private String reviewContent;
	private String imageName;
	private String answerTitle;
	private String answerContent;
	private int grade;
	private String regDate;
	
	public Reviews() {
		// TODO Auto-generated constructor stub
	}

	public int getReviewNo() {		return reviewNo;	}
	public void setReviewNo(int reviewNo) {		this.reviewNo = reviewNo;	}

	public int getTranNo() {		return tranNo;	}
	public void setTranNo(int tranNo) {		this.tranNo = tranNo;	}

	public int getProdNo() {		return prodNo;	}
	public void setProdNo(int prodNo) {		this.prodNo = prodNo;	}

	public String getBuyerId() {		return buyerId;	}
	public void setBuyerId(String buyerId) {		this.buyerId = buyerId;	}

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

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Reviews [reviewNo=");
		builder.append(reviewNo);
		builder.append(", tranNo=");
		builder.append(tranNo);
		builder.append(", prodNo=");
		builder.append(prodNo);
		builder.append(", buyerId=");
		builder.append(buyerId);
		builder.append(", reviewTitle=");
		builder.append(reviewTitle);
		builder.append(", reviewContent=");
		builder.append(reviewContent);
		builder.append(", imageName=");
		builder.append(imageName);
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
