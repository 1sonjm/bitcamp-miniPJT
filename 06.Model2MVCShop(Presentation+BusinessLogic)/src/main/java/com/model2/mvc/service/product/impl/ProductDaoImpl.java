package com.model2.mvc.service.product.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.product.ProductDao;

@Repository("productDaoImpl")
public class ProductDaoImpl implements ProductDao {
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void getSqlSession(SqlSession sqlsession){
		this.sqlSession = sqlsession;
	}
	
	public ProductDaoImpl() {
		System.out.println(this.getClass());
	}

	@Override
	public int insertProduct(Product product) throws Exception {
		return sqlSession.insert("ProductMapper.addProduct",product);
	}

	@Override
	public Product findProduct(int prodNo) throws Exception {
		return sqlSession.selectOne("ProductMapper.getProduct",prodNo);
	}

	@Override
	public int updateProduct(Product product) throws Exception {
		return sqlSession.update("ProductMapper.updateProduct",product);
	}

	@Override
	public List<Product> getProductList(Search search) throws Exception {
		Map<String, Object> searchMap = new HashMap<String, Object>();
		searchMap.put("sortTarget", null);
		searchMap.put("isDESC", null);
		if(search.getSearchSortingOption() != null){
			if(!search.getSearchSortingOption().equals("?")){
				String[] sortOptionTemp = search.getSearchSortingOption().split(",");
				searchMap.put("sortTarget", sortOptionTemp[0]);
				searchMap.put("isDESC", sortOptionTemp[1]);
			}
		}
		searchMap.put("search", search);
		
		return sqlSession.selectList("ProductMapper.getProductList", searchMap);
	}

	@Override
	public int getTotalCount(Search search) throws Exception {
		return sqlSession.selectOne("ProductMapper.getTotalCount",search);
	}

	
}
