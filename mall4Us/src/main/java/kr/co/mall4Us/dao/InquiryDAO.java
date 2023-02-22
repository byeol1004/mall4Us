package kr.co.mall4Us.dao;

import java.util.List;
import java.util.Map;

import kr.co.mall4Us.vo.ProductsVO;

public interface InquiryDAO {

	List<Map<String, Object>> viewInventory();

	List<ProductsVO> dynamicInventory(Map<String, String> map);

	List<Map<String, Object>> dynamicInventorySearch(Map<String, String> map);

	List<Map<String, Object>> soldProducts();

	List<Map<String, Object>> soldProductsByPrice();

	List<Map<String, Object>> soldProductsByClass();

	List<Map<String, Object>> soldProductsByDate();

	List<Map<String, Object>> soldProductsByDateAsc();

	List<Map<String, Object>> soldProductsByPriceAsc();

	List<Map<String, Object>> soldProductsAsc();

	List<Map<String, Object>> dynamicInventorySearchByPriceAsc(Map<String, String> map);

	List<Map<String, Object>> dynamicInventorySearchByPriceDesc(Map<String, String> map);

	List<ProductsVO> productsSearchByPriceAsc(Map<String, String> map);

	List<ProductsVO> productsSearchByPriceDesc(Map<String, String> map);

}
