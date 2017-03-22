package com.model2.mvc.service.product.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.model2.mvc.common.Search;
import com.model2.mvc.common.util.DBUtil;
import com.model2.mvc.service.domain.Product;

public class ProductDAO {

	public ProductDAO() {
		// TODO Auto-generated constructor stub
	}
	
	public Product findProduct(int prodNo) throws Exception {
		Connection con = DBUtil.getConnection();
		
		PreparedStatement pstmt 
			= con.prepareStatement("SELECT prod_name, prod_detail, manufacture_day, price, image_file, reg_date FROM"
							+ " product WHERE prod_no=?");
		pstmt.setInt(1, prodNo);

		ResultSet rs = pstmt.executeQuery();

		Product product = null;
		while (rs.next()) {
			product = new Product();
			product.setProdNo(prodNo);
			product.setProdName(rs.getString("prod_name"));
			product.setProdDetail(rs.getString("prod_detail"));
			product.setManuDate(rs.getString("manufacture_day"));
			product.setPrice(rs.getInt("price"));
			product.setFileName(rs.getString("image_file"));
			product.setRegDate(rs.getDate("reg_date"));
		}
		
		con.close();

		return product;
	}
	
	public Map<String, Object> getProductList(Search search) throws Exception {
		Map<String , Object> productListMap = new HashMap<String, Object>();
		Connection con = DBUtil.getConnection();
		
		String sql = "SELECT p.prod_no, p.prod_name, p.prod_detail, p.manufacture_day"
				+ ", p.price, p.image_file, p.reg_date, NVL(t.tran_status_code,'3') tran_status_code"
				+ " FROM product p, transaction t WHERE p.prod_no = t.prod_no(+)";
		if (search.getSearchCondition() != null) {
			if (search.getSearchCondition().equals("0")) {
				sql += " AND p.prod_no LIKE('%"+search.getSearchKeyword()+"%')";
			} else if (search.getSearchCondition().equals("1")) {
				sql += " AND p.prod_name LIKE('%"+search.getSearchKeyword()+"%')";
			} else if (search.getSearchCondition().equals("2")) {
				sql += " AND p.price LIKE('%"+search.getSearchKeyword()+"%')";
			}
		}
		if(search.getSearchValueLow() != search.getSearchValueHigh()){
			if(search.getSearchValueLow() > search.getSearchValueHigh()){
				sql += " AND p.price BETWEEN "+search.getSearchValueHigh()+" AND "+search.getSearchValueLow();
			}else{
				sql += " AND p.price BETWEEN "+search.getSearchValueLow()+" AND "+search.getSearchValueHigh();
			}
		}
		if(search.isViewSoldItem()){
			sql+= "AND tran_status_code='0'";
		}

		if(search.getSearchSortingOption() != null){
			if(!search.getSearchSortingOption().equals("")){
				String[] sortOption = search.getSearchSortingOption().split(",");
				switch(sortOption[0]){
					case "price":
						sql += " ORDER BY p.price"; break;
					case "prodName":
						sql += " ORDER BY p.prod_name"; break;
				}
				if(sortOption[1].equals("0")){
					sql += " DESC";
				}
			}
		}else{
			sql += "ORDER BY p.prod_no DESC";
		}
		
		//==> TotalCount GET
		int totalCount = this.getTotalCount(sql);
		System.out.println("ProductDAO_totalCount -> " + totalCount);
		
		//==> CurrentPage 게시물만 받도록 Query 다시구성
		sql = makeCurrentPageSql(sql, search);
		PreparedStatement pStmt = con.prepareStatement(sql);
		ResultSet rs = pStmt.executeQuery();
	
		System.out.println(search);

		List<Product> list = new ArrayList<Product>();
		
		while(rs.next()){
			Product product = new Product();
			product.setProdNo(Integer.parseInt(rs.getString("prod_no")));
			product.setProdName(rs.getString("prod_name"));
			product.setProdDetail(rs.getString("prod_detail"));
			product.setManuDate(rs.getString("manufacture_day"));
			product.setPrice(rs.getInt("price"));
			product.setFileName(rs.getString("image_file"));
			product.setRegDate(rs.getDate("reg_date"));
			String tranCode = rs.getString("tran_status_code").trim();
			switch(tranCode){
				case "3":
					tranCode = "판매중";	break;
				case "2":
					tranCode = "배송완료";	break;
				case "1":
					tranCode = "배송중";	break;
				case "0":
					tranCode = "구매완료";	break;
			}
			product.setProTranCode(tranCode);
			list.add(product);
		}
		
		//==> totalCount 정보 저장
		productListMap.put("totalCount", new Integer(totalCount));
		//==> currentPage 의 게시물 정보 갖는 List 저장
		productListMap.put("list", list);

		rs.close();
		pStmt.close();
		con.close();
			
		return productListMap;
	}
	
	public void insertProduct(Product product) throws Exception {
		Connection con = DBUtil.getConnection();
		
		PreparedStatement pstmt 
			= con.prepareStatement("INSERT INTO product(prod_no, prod_name, prod_detail, manufacture_day, price, image_file, reg_date)"
							+ " VALUES (seq_product_prod_no.nextval,?,?,?,?,?,SYSDATE)");
		pstmt.setString(1, product.getProdName());
		pstmt.setString(2, product.getProdDetail());
		pstmt.setString(3, product.getManuDate().replace("-", ""));
		pstmt.setInt(4, product.getPrice());
		pstmt.setString(5, product.getFileName());
		pstmt.executeUpdate();
		
		con.close();
	}
	
	public void updateProduct(Product product) throws Exception {
		Connection con = DBUtil.getConnection();
		
		PreparedStatement pstmt 
			= con.prepareStatement("UPDATE product SET prod_name=?, prod_detail=?, manufacture_day=?, price=?, image_file=?"
						+ " WHERE prod_no = ?");
		pstmt.setString(1, product.getProdName());
		pstmt.setString(2, product.getProdDetail());
		pstmt.setString(3, product.getManuDate());
		pstmt.setInt(4, product.getPrice());
		pstmt.setString(5, product.getFileName());
		pstmt.setInt(6, product.getProdNo());
		pstmt.executeUpdate();
		
		con.close();
	}
	// 게시판 Page 처리를 위한 전체 Row(totalCount)  return
	private int getTotalCount(String sql) throws Exception {
		
		sql = "SELECT COUNT(*) "+
		          "FROM ( " +sql+ ") countTable";
		
		Connection con = DBUtil.getConnection();
		PreparedStatement pStmt = con.prepareStatement(sql);
		ResultSet rs = pStmt.executeQuery();
		
		int totalCount = 0;
		if( rs.next() ){
			totalCount = rs.getInt(1);
		}
		
		pStmt.close();
		con.close();
		rs.close();
		
		return totalCount;
	}
	
	// 게시판 currentPage Row 만  return 
	private String makeCurrentPageSql(String sql , Search search){
		sql = 	"SELECT * "+ 
					"FROM (		SELECT inner_table. * ,  ROWNUM AS row_seq " +
									" 	FROM (	"+sql+" ) inner_table "+
									"	WHERE ROWNUM <="+search.getCurrentPage()*search.getPageSize()+" ) " +
					"WHERE row_seq BETWEEN "+((search.getCurrentPage()-1)*search.getPageSize()+1) +" AND "+search.getCurrentPage()*search.getPageSize();
		
		System.out.println("UserDAO :: make SQL :: "+ sql);	
		
		return sql;
	}
}
