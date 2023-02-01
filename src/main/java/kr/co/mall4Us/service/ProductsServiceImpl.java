package kr.co.mall4Us.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.mall4Us.dao.ProductsDAO;
import kr.co.mall4Us.vo.ProductsVO;

@Service
public class ProductsServiceImpl implements ProductsService{

	@Autowired
	ProductsDAO dao;
	
	@Override
	public int addProd(ProductsVO vo) {
		return dao.addProd(vo);
	}
	@Override
	public ProductsVO  getOne(long prodId) {
		ProductsVO vo = dao.getOne(prodId);
		if(vo != null) {
			return vo;
		}
		return null;
	}
	@Override
	public List<ProductsVO> getAll(String prodName) {
		return dao.getAll(prodName);
	}
	
	@Override
	public int deleteOne(long prodId) {
		
		return dao.deleteOne(prodId);
		
	}
	@Override
	public int getCount() {
		
		return dao.getCount();
	}
	@Override
	public int update(ProductsVO vo) {
	
		return dao.update(vo);
	}
	@Override
	   public List<ProductsVO> getCategory(Map<String, String> map) {
	      
	      return dao.getCategory(map);
	 }
		/*
		 * @Override public ProductsVO getCart(Map<String, Object> map) { return
		 * dao.getCart(map); }
		 */
}
