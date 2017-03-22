package com.model2.mvc.view.purchase;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model2.mvc.framework.Action;
import com.model2.mvc.service.domain.Purchase;
import com.model2.mvc.service.purchase.PurchaseService;
import com.model2.mvc.service.purchase.impl.PurchaseServiceImpl;

public class GetPurchaseAction extends Action {

	public GetPurchaseAction() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		PurchaseService service = new PurchaseServiceImpl();
		int tranNo = Integer.parseInt(request.getParameter("tranNo"));
		request.setAttribute("purchase", service.getPurchase(tranNo));
		
		/*//prodNo로 넘어왔을때 처리해주자
		if(request.getParameter("tranNo") == null){
			return "forward:/purchase/updatePurchaseView.jsp";
		}else{
			return "forward:/purchase/getPurchase.jsp";
		}
		*/
		
		return "forward:/purchase/getPurchase.jsp";
	}

}
