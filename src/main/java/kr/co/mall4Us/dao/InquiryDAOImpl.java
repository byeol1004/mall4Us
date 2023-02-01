package kr.co.mall4Us.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.mall4Us.vo.ProductsVO;

@Repository
public class InquiryDAOImpl implements InquiryDAO {
	@Autowired
	SqlSession session;

	@Override
	public List<Map<String, Object>> viewInventory() {
		
		return session.selectList("kr.co.mall4Us.InquiryDao.viewInventory");
	}

	@Override
	public List<ProductsVO> dynamicInventory(Map<String, String> map) {
		
		return session.selectList("kr.co.mall4Us.InquiryDao.dynamicInventory", map);

	}

	@Override
	public List<Map<String, Object>> dynamicInventorySearch(Map<String, String> map) {

		return session.selectList("kr.co.mall4Us.InquiryDao.dynamicInventorySearch", map);

	}

	@Override
	public List<Map<String, Object>> soldProducts() {
		return session.selectList("kr.co.mall4Us.InquiryDao.soldProducts");
	}

	@Override
	public List<Map<String, Object>> soldProductsByPrice() {
		return session.selectList("kr.co.mall4Us.InquiryDao.soldProductsByPrice");

	}

	@Override
	public List<Map<String, Object>> soldProductsByClass() {
		return session.selectList("kr.co.mall4Us.InquiryDao.soldProductsByClass");
	}

	@Override
	public List<Map<String, Object>> soldProductsByDate() {
		return session.selectList("kr.co.mall4Us.InquiryDao.soldProductsByDate");
	}

	@Override
	public List<Map<String, Object>> soldProductsByDateAsc() {
		return session.selectList("kr.co.mall4Us.InquiryDao.soldProductsByDateAsc");
	}

	@Override
	public List<Map<String, Object>> soldProductsByPriceAsc() {
		return session.selectList("kr.co.mall4Us.InquiryDao.soldProductsByPriceAsc");
	}

	@Override
	public List<Map<String, Object>> soldProductsAsc() {
		return session.selectList("kr.co.mall4Us.InquiryDao.soldProductsAsc");
	}

	@Override
	public List<Map<String, Object>> dynamicInventorySearchByPriceAsc(Map<String, String> map) {
		return session.selectList("kr.co.mall4Us.InquiryDao.dynamicInventorySearchByPriceAsc", map);
	}

	@Override
	public List<Map<String, Object>> dynamicInventorySearchByPriceDesc(Map<String, String> map) {
		return session.selectList("kr.co.mall4Us.InquiryDao.dynamicInventorySearchByPriceDesc", map);
	}

	@Override
	public List<ProductsVO> productsSearchByPriceAsc(Map<String, String> map) {
		return session.selectList("kr.co.mall4Us.InquiryDao.productsSearchByPriceAsc", map);
	}

	@Override
	public List<ProductsVO> productsSearchByPriceDesc(Map<String, String> map) {
		return session.selectList("kr.co.mall4Us.InquiryDao.productsSearchByPriceDesc", map);
	}
	
}


