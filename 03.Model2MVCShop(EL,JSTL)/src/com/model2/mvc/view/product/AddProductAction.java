package com.model2.mvc.view.product;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileUpload;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.DiskFileUpload;

import com.model2.mvc.framework.Action;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.product.ProductService;
import com.model2.mvc.service.product.impl.ProductServiceImpl;
import com.sun.org.apache.bcel.internal.generic.IFLE;

public class AddProductAction extends Action {

	public AddProductAction() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		if(FileUpload.isMultipartContent(request)){
			String temDir="C:\\Users\\BitCamp\\git\\bitcamp-miniPJT\\03.Model2MVCShop(EL,JSTL)\\WebContent\\images\\uploadFiles\\";
			
			DiskFileUpload fileUpload = new DiskFileUpload();
			fileUpload.setRepositoryPath(temDir);
			fileUpload.setSizeMax(1024*1024*10);
			fileUpload.setSizeThreshold(1024*100);
			
			if(request.getContentLength() < fileUpload.getSizeMax()){
				Product product = new Product();
				StringTokenizer token = null;
				
				List fileItemList = fileUpload.parseRequest(request);
				for(int i = 0;i<fileItemList.size();i++){
					FileItem fileItem = (FileItem)fileItemList.get(i);
					if(fileItem.isFormField()){
						if(fileItem.getFieldName().equals("manuDate")){
							token = new StringTokenizer(fileItem.getString("euc-kr"), "-");
							String manuDate = token.nextToken() + token.nextToken() + token.nextToken();
							product.setManuDate(manuDate);
						}
						else if(fileItem.getFieldName().equals("prodName"))
							product.setProdName(fileItem.getString("euc-kr"));
						else if(fileItem.getFieldName().equals("prodDetail"))
							product.setProdDetail(fileItem.getString("euc-kr"));
						else if(fileItem.getFieldName().equals("price"))
							product.setPrice(Integer.parseInt(fileItem.getString("euc-kr")));
					}else{
						if(fileItem.getSize()>0){
							int idx = fileItem.getName().lastIndexOf("\\");
							if(idx == -1){
								idx = fileItem.getName().lastIndexOf("/");
							}
							String fileName = fileItem.getName().substring(idx+1);
							product.setFileName(fileName);
							try{
								File uploadedFile = new File(temDir, fileName);
								fileItem.write(uploadedFile);
							}catch(IOException e){
								System.out.println(e);
							}
						}else{
							product.setFileName("../../images/empty.GIF");
						}
					}
				}
				ProductServiceImpl service = new ProductServiceImpl();
				service.addProduct(product);
				
				request.setAttribute("product", product);
			}else{
				int overSize = (request.getContentLength() / 1000000);
				System.out.println("<script>alert('파일 크기는 1mb까지, 업로드 파일 용량은"+overSize+"mb 입니다')history.back();</script>");
			}
		}
		System.out.println("33333");
		return "redirect:/listProduct.do?menu=manage";
	}
}
