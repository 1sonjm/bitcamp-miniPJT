package com.model2.mvc.view.purchase;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model2.mvc.framework.Action;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.Purchase;
import com.model2.mvc.service.purchase.PurchaseService;
import com.model2.mvc.service.purchase.impl.PurchaseServiceImpl;

public class UpdateTranCodeByProdAction extends Action {

	public UpdateTranCodeByProdAction() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		PurchaseService puService = new PurchaseServiceImpl();
		Purchase purchase = new Purchase();
		Product product = new Product();
		product.setProdNo(Integer.parseInt(request.getParameter("prodNo")));
		purchase.setPurchaseProd(product);
		purchase.setTranCode("1");
		puService.updateTranCode(purchase);
		return "redirect:/listProduct.do?menu=manage";
	}

}
