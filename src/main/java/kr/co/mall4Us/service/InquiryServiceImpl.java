package kr.co.mall4Us.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.mall4Us.dao.InquiryDAO;
import kr.co.mall4Us.vo.ProductsVO;

@Service
public class InquiryServiceImpl implements InquiryService{

	@Autowired
	InquiryDAO dao;
	
	@Override
	public List<Map<String, Object>> viewInventory() {
		
		return dao.viewInventory();
	}

	@Override
	public List<ProductsVO> dynamicInventory(Map<String, String> map) {

		return dao.dynamicInventory(map);
	}

	@Override
	public List<Map<String, Object>> dynamicInventorySearch(Map<String, String> map) {
		
		return dao.dynamicInventorySearch(map);
	}

	@Override
	public List<Map<String, Object>> soldProducts() {
		return dao.soldProducts();
	}

	@Override
	public List<Map<String, Object>> soldProductsByPrice() {
		return dao.soldProductsByPrice();
	}

	@Override
	public List<Map<String, Object>> soldProductsByClass() {
		return dao.soldProductsByClass();
	}

	@Override
	public List<Map<String, Object>> soldProductsByDate() {
		return dao.soldProductsByDate();
	}

	@Override
	public List<Map<String, Object>> soldProductsByDateAsc() {
		return dao.soldProductsByDateAsc();
	}

	@Override
	public List<Map<String, Object>> soldProductsByPriceAsc() {
		return dao.soldProductsByPriceAsc();
	}

	@Override
	public List<Map<String, Object>> soldProductsAsc() {
		return dao.soldProductsAsc();
	}

	@Override
	public List<Map<String, Object>> dynamicInventorySearchByPriceAsc(Map<String, String> map) {
		return dao.dynamicInventorySearchByPriceAsc(map);
	}

	@Override
	public List<Map<String, Object>> dynamicInventorySearchByPriceDesc(Map<String, String> map) {
		return dao.dynamicInventorySearchByPriceDesc(map);
	}

	@Override
	public List<ProductsVO> productsSearchByPriceAsc(Map<String, String> map) {
		return dao.productsSearchByPriceAsc(map);
	}

	@Override
	public List<ProductsVO> productsSearchByPriceDesc(Map<String, String> map) {
		return dao.productsSearchByPriceDesc(map);
	}



	
	
}
