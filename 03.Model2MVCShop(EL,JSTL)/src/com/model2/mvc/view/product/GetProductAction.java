package com.model2.mvc.view.product;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model2.mvc.framework.Action;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.product.ProductService;
import com.model2.mvc.service.product.impl.ProductServiceImpl;

public class GetProductAction extends Action {

	public GetProductAction() {
	}

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int prodNo= Integer.parseInt(request.getParameter("prodNo"));
		
		ProductService service=new ProductServiceImpl();
		Product product=service.getProduct(prodNo);
		
		HttpSession session = request.getSession();
		
		Map<Integer,String> viewListMap = new HashMap<Integer,String>();
		if(session.getAttribute("viewListMap") != null){
			viewListMap = (HashMap<Integer,String>)session.getAttribute("viewListMap");
		}
		viewListMap.put(prodNo,product.getProdName());
		if(viewListMap.size()>6){
			viewListMap.remove(6);
		}
		System.out.println("º» »óÇ°-> "+viewListMap);
		session.setAttribute("viewListMap", viewListMap);
		
		request.setAttribute("product", product);
		
		if(request.getParameter("menu").equals("manage")){
			return "forward:/product/updateProductView.jsp";
		}	
		return "forward:/product/getProduct.jsp";
	}
}
