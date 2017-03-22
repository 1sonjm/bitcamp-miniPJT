package com.model2.mvc.view.purchase;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model2.mvc.framework.Action;
import com.model2.mvc.service.domain.Purchase;
import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.product.ProductService;
import com.model2.mvc.service.product.impl.ProductServiceImpl;
import com.model2.mvc.service.purchase.PurchaseService;
import com.model2.mvc.service.purchase.impl.PurchaseServiceImpl;

public class AddPurchaseAction extends Action {

	public AddPurchaseAction() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		Purchase purchase = new Purchase();
		ProductService prService = new ProductServiceImpl();
		
		int prodNo = Integer.parseInt(request.getParameter("prodNo"));
		purchase.setPurchaseProd(prService.getProduct(prodNo));
		purchase.setBuyer((User)session.getAttribute("user"));
		purchase.setReceiverName(request.getParameter("receiverName"));
		purchase.setReceiverPhone(request.getParameter("receiverPhone"));
		purchase.setPaymentOption(request.getParameter("paymentOption"));
		purchase.setDlvyRequest(request.getParameter("receiverRequest"));
		purchase.setDlvyAddr(request.getParameter("receiverAddr"));
		purchase.setDlvyDate(request.getParameter("receiverDate"));
		
		PurchaseService puService = new PurchaseServiceImpl();
		puService.addPurchase(purchase);
		request.setAttribute("purchase", purchase);
		
		return "forward:/purchase/addPurchase.jsp";
	}

}
