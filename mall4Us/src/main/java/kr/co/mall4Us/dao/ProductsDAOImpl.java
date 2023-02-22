package kr.co.mall4Us.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.mall4Us.vo.ProductsVO;

@Repository
public class ProductsDAOImpl implements ProductsDAO{

	@Autowired
	SqlSession session;
	
	@Override
	public int addProd(ProductsVO vo) {
		return session.update("productNS.addOne", vo);
	}
	
	@Override
	public ProductsVO getOne(long prodId) {
		return session.selectOne("productNS.getOne", prodId);
	}
	
	@Override
	public List<ProductsVO> getAll(String prodName) {
		return session.selectList("productNS.getAll", prodName);
	}
	
	@Override
	public int deleteOne(long prodId) {
		
		return session.delete("productNS.deleteOne", prodId);
	}

	@Override
	public int getCount() {
		
		return session.selectOne("productNS.getCount");
	}

	@Override
	public int update(ProductsVO vo) {
		
		return session.update("productNS.update",vo);
	}
	@Override
	   public List<ProductsVO> getCategory(Map<String, String> map) {
	      
	      return session.selectList("productNS.getCategory", map);
	 }

		/*
		 * @Override public ProductsVO getCart(Map<String, Object> map) {
		 * 
		 * return session.selectOne("productNS.getCart", map); }
		 */
}
