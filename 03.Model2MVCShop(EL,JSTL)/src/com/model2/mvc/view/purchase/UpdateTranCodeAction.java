package com.model2.mvc.view.purchase;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model2.mvc.framework.Action;
import com.model2.mvc.service.domain.Purchase;
import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.purchase.PurchaseService;
import com.model2.mvc.service.purchase.impl.PurchaseServiceImpl;

public class UpdateTranCodeAction extends Action {

	public UpdateTranCodeAction() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//HttpSession session = request.getSession();
		Purchase purchase = new Purchase();
		int tranNo = Integer.parseInt(request.getParameter("tranNo"));

		//boolean loginGrade = ((User)session.getAttribute("user")).getRole().equals("admin");
		//if(loginGrade){
			purchase.setTranCode("1");
		//}
		purchase.setTranNo(tranNo);
		
		PurchaseService puService = new PurchaseServiceImpl();
		puService.updateTranCode(purchase);
		return "redirect:/listPurchase.do";
	}

}
