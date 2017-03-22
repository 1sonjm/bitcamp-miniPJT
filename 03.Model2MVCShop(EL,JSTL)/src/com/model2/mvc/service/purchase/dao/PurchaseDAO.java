package com.model2.mvc.service.purchase.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.model2.mvc.common.Search;
import com.model2.mvc.common.util.DBUtil;
import com.model2.mvc.service.domain.Purchase;
import com.model2.mvc.service.product.ProductService;
import com.model2.mvc.service.product.dao.ProductDAO;
import com.model2.mvc.service.product.impl.ProductServiceImpl;
import com.model2.mvc.service.user.UserService;
import com.model2.mvc.service.user.impl.UserServiceImpl;

public class PurchaseDAO {
	private PurchaseDAO dao;
	private ProductDAO prodDAO;

	public PurchaseDAO() {
	}

	public Purchase findPurchase(int tranNo) throws Exception{
		Purchase purchase = null;
		Connection con = DBUtil.getConnection();
		
		String sql = "SELECT tran_no, prod_no, buyer_id, payment_option, receiver_name, receiver_phone, dlvy_addr"
				+ ", dlvy_request, tran_status_code, order_date, TO_CHAR(dlvy_date,'yyyymmdd') dlvy_date"
				+ " FROM transaction WHERE tran_no= ?"
				+ " ORDER BY tran_no DESC";
		
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, tranNo);
		
		ResultSet rs = pstmt.executeQuery();
		UserService usService = new UserServiceImpl();
		ProductService prService = new ProductServiceImpl();
		while(rs.next()){
			purchase = new Purchase();
			purchase.setBuyer(usService.getUser(rs.getString("buyer_id")));
			purchase.setDlvyAddr(rs.getString("dlvy_addr"));
			purchase.setDlvyDate(rs.getString("dlvy_date"));
			purchase.setDlvyRequest(rs.getString("dlvy_request"));
			purchase.setOrderDate(rs.getDate("order_date"));
			purchase.setPaymentOption(rs.getString("payment_option"));
			purchase.setPurchaseProd(prService.getProduct(rs.getInt("prod_no")));
			purchase.setReceiverName(rs.getString("receiver_name"));
			purchase.setReceiverPhone(rs.getString("receiver_phone"));
			purchase.setTranCode(rs.getString("tran_status_code"));
			purchase.setTranNo(rs.getInt("tran_no"));
		}
		
		rs.close();
		pstmt.close();
		con.close();
		
		return purchase;
	}
	
	public Map<String, Object> getPurchaseList(Search search, String buyerId) throws Exception{
		Map<String, Object> purchaseListMap = new HashMap<String, Object>();
		ProductService prService = new ProductServiceImpl();
		UserService usService = new UserServiceImpl();
		
		Connection con = DBUtil.getConnection();

		String sql = "SELECT tran_no, prod_no, buyer_id, payment_option, receiver_name, receiver_phone"
					+ ", dlvy_addr, dlvy_request, NVL(tran_status_code,'3') tran_status_code, order_date, dlvy_date"
					+ " FROM transaction WHERE buyer_id= '"+buyerId+"'"
					+ " ORDER BY tran_no DESC";
		System.out.println("PurchaseDAO_SQL -> " + sql);
		
		//==> TotalCount GET
		int totalCount = this.getTotalCount(sql);
		System.out.println("PurchaseDAO_totalCount -> " + totalCount);
		
		//==> CurrentPage 게시물만 받도록 Query 다시구성
		sql = makeCurrentPageSql(sql, search);
		PreparedStatement pStmt = con.prepareStatement(sql);
		ResultSet rs = pStmt.executeQuery();
	
		System.out.println(search);

		List<Purchase> list = new ArrayList<Purchase>();
		
		while(rs.next()){
			Purchase purchase = new Purchase();
			purchase.setBuyer(usService.getUser(buyerId));
			purchase.setDlvyAddr(rs.getString("dlvy_addr"));
			purchase.setDlvyDate(rs.getString("dlvy_date"));
			purchase.setDlvyRequest(rs.getString("dlvy_request"));
			purchase.setOrderDate(rs.getDate("order_date"));
			purchase.setPaymentOption(rs.getString("payment_option"));
			purchase.setPurchaseProd(prService.getProduct(rs.getInt("prod_no")));
			purchase.setReceiverName(rs.getString("receiver_name"));
			purchase.setReceiverPhone(rs.getString("receiver_phone"));
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
			purchase.setTranCode(tranCode);
			purchase.setTranNo(rs.getInt("tran_no"));
			list.add(purchase);
		}
		
		//==> totalCount 정보 저장
		purchaseListMap.put("totalCount", new Integer(totalCount));
		//==> currentPage 의 게시물 정보 갖는 List 저장
		purchaseListMap.put("list", list);

		rs.close();
		pStmt.close();
		con.close();
			
		return purchaseListMap;
	}
	
	public Map<String, Object> getSaleList(Search search) throws Exception{
		Map<String, Object> saleListMap = new HashMap<String, Object>();
		ProductService prService = new ProductServiceImpl();
		UserService usService = new UserServiceImpl();
		
		Connection con = DBUtil.getConnection();

		String sql = "SELECT tran_no, prod_no, buyer_id, payment_option, receiver_name, receiver_phone"
					+ ", dlvy_addr, dlvy_request, tran_status_code, order_date, dlvy_date"
					+ " FROM transaction"
					+ " ORDER BY tran_no DESC";
		System.out.println("PurchaseDAO_SQL -> " + sql);
		
		//==> TotalCount GET
		int totalCount = this.getTotalCount(sql);
		System.out.println("PurchaseDAO_totalCount -> " + totalCount);
		
		//==> CurrentPage 게시물만 받도록 Query 다시구성
		sql = makeCurrentPageSql(sql, search);
		PreparedStatement pStmt = con.prepareStatement(sql);
		ResultSet rs = pStmt.executeQuery();
	
		System.out.println(search);

		List<Purchase> list = new ArrayList<Purchase>();
		
		while(rs.next()){
				Purchase purchase = new Purchase();
				//purchase.setBuyer(usService.getUser(buyerId));//TODO 수정사항-주문전체보기 어떻게할까?
				purchase.setDlvyAddr(rs.getString("dlvy_addr"));
				purchase.setDlvyDate(rs.getString("dlvy_date"));
				purchase.setDlvyRequest(rs.getString("dlvy_request"));
				purchase.setOrderDate(rs.getDate("order_date"));
				purchase.setPaymentOption(rs.getString("payment_option"));
				purchase.setPurchaseProd(prService.getProduct(rs.getInt("prod_no")));
				purchase.setReceiverName(rs.getString("receiver_name"));
				purchase.setReceiverPhone(rs.getString("receiver_phone"));
				purchase.setTranCode(rs.getString("tran_status_code"));
				purchase.setTranNo(rs.getInt("tran_no"));
				list.add(purchase);
			}
		
		//==> totalCount 정보 저장
		saleListMap.put("totalCount", new Integer(totalCount));
		//==> currentPage 의 게시물 정보 갖는 List 저장
		saleListMap.put("list", list);

		rs.close();
		pStmt.close();
		con.close();
			
		return saleListMap;
	}
	
	public void insertPurchase(Purchase purchase) throws Exception{
		Connection con = DBUtil.getConnection();
		PreparedStatement pstmt 
			= con.prepareStatement("INSERT INTO transaction(tran_no, prod_no, buyer_id, payment_option, receiver_name"
								+ ", receiver_phone, dlvy_addr, dlvy_request, tran_status_code, order_date, dlvy_date)"
								+ " VALUES (seq_transaction_tran_no.nextval,?,?,?,?,?,?,?,?,SYSDATE,?)");
		pstmt.setInt(1, purchase.getPurchaseProd().getProdNo());
		pstmt.setString(2, purchase.getBuyer().getUserId());
		pstmt.setString(3, purchase.getPaymentOption());
		pstmt.setString(4, purchase.getBuyer().getUserName());
		pstmt.setString(5, purchase.getBuyer().getPhone());
		pstmt.setString(6, purchase.getBuyer().getAddr());
		pstmt.setString(7, purchase.getDlvyRequest());
		pstmt.setString(8, "0");//0-구매완료,1-배송중,2-배송완료	
		pstmt.setString(9, purchase.getDlvyDate());
		
		if(pstmt.executeUpdate()==1){
			System.out.println("insert 완료");
		}else{
			System.out.println("insert error 발생");
		}
		
		con.close();
	}
	
	public void updatePurchase(Purchase purchase) throws Exception{
		Connection con = DBUtil.getConnection();
		
		String sql ="UPDATE transaction SET payment_option=?, receiver_name=?"
				+ ", receiver_phone=?, dlvy_addr=?, dlvy_request=?, dlvy_date=?"
				+ " WHERE tran_no = ?";

		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, purchase.getPaymentOption());
		pstmt.setString(2, purchase.getReceiverName());
		pstmt.setString(3, purchase.getReceiverPhone());
		pstmt.setString(4, purchase.getDlvyAddr());
		pstmt.setString(5, purchase.getDlvyRequest());
		pstmt.setString(6, purchase.getDlvyDate());
		pstmt.setInt(7, purchase.getTranNo());
		if(pstmt.executeUpdate()==1){
			System.out.println("update 완료");
		}else{
			System.out.println("update error 발생");
		}
		
		con.close();
	}
	
	public void updateTranCode(Purchase purchase) throws Exception{
		Connection con = DBUtil.getConnection();
		int prodNo = purchase.getPurchaseProd().getProdNo();
		
		String sql = "UPDATE transaction Set tran_status_code=?"
				+ " WHERE "+(prodNo==0?"tran_no":"prod_no")+"=?";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, purchase.getTranCode());
		
		if(prodNo!=0){
			pstmt.setInt(2, prodNo);
		}else{
			pstmt.setInt(2, purchase.getTranNo());
		}
		
		if(pstmt.executeUpdate()==1){
			System.out.println("배송상태 변경완료");
		}else{
			System.out.println("배송상태 변경시 오류 발생");
		}
		
		pstmt.close();
		con.close();
	}	
	
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
