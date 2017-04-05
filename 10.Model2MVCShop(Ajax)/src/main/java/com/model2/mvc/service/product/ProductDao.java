package com.model2.mvc.service.product;

import java.util.List;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;

public interface ProductDao {
	public int insertProduct(Product product) throws Exception;
	
	public Product findProduct(int prodNo) throws Exception;
	
	public int updateProduct(Product product) throws Exception;
	
	public List<Product> getProductList(Search search) throws Exception;

	public int getTotalCount(Search search) throws Exception;
	
	public List<Product> getProductListAll(Search search) throws Exception;
}
