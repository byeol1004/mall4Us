package kr.co.mall4Us.service;

import java.util.List;
import java.util.Map;

import kr.co.mall4Us.vo.ProductsVO;

public interface ProductsService {

	int addProd(ProductsVO vo);
	ProductsVO getOne(long prodId);
	List<ProductsVO> getAll(String prodName);
	int deleteOne(long prodId);
	int getCount();
	int update(ProductsVO vo);
	List<ProductsVO> getCategory(Map<String, String> map);
	/* ProductsVO getCart(Map<String, Object> map); */
}
