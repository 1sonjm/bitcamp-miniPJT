package com.model2.mvc.service.purchase;

import java.util.List;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Purchase;

public interface PurchaseDao {
	public int insertPurchase(Purchase purchase) throws Exception;
	
	public Purchase getPurchase(int tranNo) throws Exception;
	
	public int updatePurchase(Purchase purchase) throws Exception;
	
	public int updateTranCode(Purchase purchase) throws Exception;
	
	public List<Purchase> getPurchaseList(Search search, String buyerId) throws Exception;
	
	public int getTotalCount(String buyerId) throws Exception;
	public int getTotalCount() throws Exception;

	public List<Purchase> getSalesList(Search search) throws Exception;

}
