package com.model2.mvc.service.domain;

import java.sql.Date;

public class Purchase {
	
	private User buyer;
	private String dlvyAddr;
	private String dlvyDate;
	private String dlvyRequest;
	private Date orderDate;
	private String paymentOption;
	private Product purchaseProd;
	private String receiverName;
	private String receiverPhone;
	private String tranCode;
	private int tranNo;
	private boolean createReview;
	
	public Purchase(){
	}
	
	public User getBuyer() {
		return buyer;
	}
	public void setBuyer(User buyer) {
		this.buyer = buyer;
	}
	public String getDlvyAddr() {
		return dlvyAddr;
	}
	public void setDlvyAddr(String divyAddr) {
		this.dlvyAddr = divyAddr;
	}
	public String getDlvyDate() {
		return dlvyDate;
	}
	public void setDlvyDate(String divyDate) {
		this.dlvyDate = divyDate;
	}
	public String getDlvyRequest() {
		return dlvyRequest;
	}
	public void setDlvyRequest(String divyRequest) {
		this.dlvyRequest = divyRequest;
	}
	public Date getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}
	public String getPaymentOption() {
		return paymentOption;
	}
	public void setPaymentOption(String paymentOption) {
		this.paymentOption = paymentOption;
	}
	public Product getPurchaseProd() {
		return purchaseProd;
	}
	public void setPurchaseProd(Product purchaseProd) {
		this.purchaseProd = purchaseProd;
	}
	public String getReceiverName() {
		return receiverName;
	}
	public void setReceiverName(String receiverName) {
		this.receiverName = receiverName;
	}
	public String getReceiverPhone() {
		return receiverPhone;
	}
	public void setReceiverPhone(String receiverPhone) {
		this.receiverPhone = receiverPhone;
	}
	public String getTranCode() {
		return tranCode;
	}
	public void setTranCode(String tranCode) {
		this.tranCode = tranCode;
	}
	public int getTranNo() {
		return tranNo;
	}
	public void setTranNo(int tranNo) {
		this.tranNo = tranNo;
	}

	public boolean isCreateReview() {
		return createReview;
	}

	public void setCreateReview(boolean createReview) {
		this.createReview = createReview;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Purchase [buyer=");
		builder.append(buyer);
		builder.append(", dlvyAddr=");
		builder.append(dlvyAddr);
		builder.append(", dlvyDate=");
		builder.append(dlvyDate);
		builder.append(", dlvyRequest=");
		builder.append(dlvyRequest);
		builder.append(", orderDate=");
		builder.append(orderDate);
		builder.append(", paymentOption=");
		builder.append(paymentOption);
		builder.append(", purchaseProd=");
		builder.append(purchaseProd);
		builder.append(", receiverName=");
		builder.append(receiverName);
		builder.append(", receiverPhone=");
		builder.append(receiverPhone);
		builder.append(", tranCode=");
		builder.append(tranCode);
		builder.append(", tranNo=");
		builder.append(tranNo);
		builder.append(", createReview=");
		builder.append(createReview);
		builder.append("]");
		return builder.toString();
	}
	
}