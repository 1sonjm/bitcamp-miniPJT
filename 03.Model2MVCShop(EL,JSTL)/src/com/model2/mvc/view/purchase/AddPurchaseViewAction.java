package com.model2.mvc.view.purchase;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model2.mvc.framework.Action;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.product.ProductService;
import com.model2.mvc.service.product.impl.ProductServiceImpl;

public class AddPurchaseViewAction extends Action {

	public AddPurchaseViewAction() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		System.out.println("Product 积己矫累");
		ProductService pService = new ProductServiceImpl();
		Product product = pService.getProduct(Integer.parseInt(request.getParameter("prod_no")));
		System.out.println("##"+product.getProdNo());
		System.out.println("Product 积己肯丰");
		
		request.setAttribute("user", (User)session.getAttribute("user"));
		request.setAttribute("product", product);
		return "forward:/purchase/addPurchaseView.jsp";
	}

}
