package com.model2.mvc.web.purchase;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.model2.mvc.common.Page;
import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.Purchase;
import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.product.ProductService;
import com.model2.mvc.service.purchase.PurchaseService;

@Controller
@RequestMapping("/purchase/*")
public class PurchaseController {

	@Autowired
	@Qualifier("purchaseServiceImpl")
	private PurchaseService purchaseService;
	
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;

	@Value("#{commonProperties['pageUnit']?: 3}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize']?: 2}")
	int pageSize;
	
	
	public PurchaseController() {
		System.out.println(this.getClass());
	}
	
	@RequestMapping(value="addPurchaseView",method=RequestMethod.GET)
	public ModelAndView addPurchaseView(HttpSession session
										,@RequestParam("prodNo")int prodNo
										) throws Exception{
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("user", session.getAttribute("user"));
		modelAndView.addObject("product", productService.getProduct(prodNo));
		
		modelAndView.setViewName("forward:/purchase/addPurchaseView.jsp");
		return modelAndView;
	}
	
	@RequestMapping(value="addPurchase",method=RequestMethod.POST)
	public ModelAndView addPurchase(HttpSession session
									,@ModelAttribute("purchase")Purchase purchase
									,@RequestParam("prodNo")int prodNo
									) throws Exception{
		
		purchase.setPurchaseProd(productService.getProduct(prodNo));
		purchase.setBuyer((User)session.getAttribute("user"));
		purchaseService.addPurchase(purchase);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("purchase", purchase);
		
		modelAndView.setViewName("forward:/purchase/addPurchase.jsp");
		return modelAndView;
	}
	
	@RequestMapping(value="getPurchase",method=RequestMethod.GET)
	public ModelAndView getPurchase(@RequestParam("tranNo")int tranNo
									) throws Exception{
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("purchase", purchaseService.getPurchase(tranNo));
		
		modelAndView.setViewName("forward:/purchase/getPurchase.jsp");
		return modelAndView;
	}
	@RequestMapping(value="getJsonPurchase/{tranNo}",method=RequestMethod.GET)
	public void getJsonPurchase(@PathVariable int tranNo
								,Model model
								) throws Exception{
		System.out.println("???");
		model.addAttribute("purchase",purchaseService.getPurchase(tranNo));
	}

	@RequestMapping(value="updatePurchaseView",method=RequestMethod.GET)
	public ModelAndView updatePurchaseView(@RequestParam("tranNo")int tranNo
											) throws Exception{
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("purchase", purchaseService.getPurchase(tranNo));
		
		modelAndView.setViewName("forward:/purchase/updatePurchaseView.jsp");
		return modelAndView;
	}
	
	@RequestMapping(value="updatePurchase",method=RequestMethod.POST)
	public ModelAndView updatePurchase(@RequestParam("tranNo")int tranNo
										,@ModelAttribute("purchase")Purchase purchase
										) throws Exception{
		
		purchaseService.updatePurcahse(purchase);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("redirect:/purchase/getPurchase?tranNo="+tranNo);
		return modelAndView;
	}
	
	@RequestMapping(value="updateTranCodeByProdAction",method=RequestMethod.GET)
	public ModelAndView updateTranCodeByProdAction(@ModelAttribute("product")Product product
													) throws Exception{
		
		Purchase purchase = new Purchase();
		purchase.setPurchaseProd(product);
		purchase.setTranCode("1");
		purchaseService.updateTranCode(purchase);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("redirect:/purchase/listProduct?menu=manage");
		return modelAndView;
	}
	
	@RequestMapping(value="updateTranCode",method=RequestMethod.GET)
	public ModelAndView updateTranCode(@ModelAttribute("purchase")Purchase purchase
										) throws Exception{
		
		purchase.setTranCode("2");
		purchaseService.updateTranCode(purchase);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("redirect:/purchase/listPurchase");
		return modelAndView;
	}
	
	@RequestMapping(value="listPurchase")
	public ModelAndView listPurchase(@ModelAttribute("search")Search search
									,HttpSession session
									) throws Exception{
		
		if(search.getCurrentPage()==0){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		User user = (User)session.getAttribute("user");
		Map<String, Object> map = purchaseService.getPurchaseList(search, user.getUserId());
		Page resultPage = new Page(search.getCurrentPage()
				, ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("list",map.get("list"));
		modelAndView.addObject("resultPage",resultPage);
		modelAndView.addObject("search",search);
		
		modelAndView.setViewName("forward:/purchase/listPurchase.jsp");
		return modelAndView;
	}
}
