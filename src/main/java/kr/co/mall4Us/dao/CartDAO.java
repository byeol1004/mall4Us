package kr.co.mall4Us.dao;

import java.util.List;
import java.util.Map;

import kr.co.mall4Us.vo.CartVO;

public interface CartDAO {

	int addCart(CartVO vo);

	CartVO getCartExist(Map<String, Object> map);

	int updateCart(Map<String, Object> map);

	int updateCartStatus(Map<String, Object> map);

	List<Map<String, Object>> getCartListByMemId(Map<String, Object> map);

	int delCart(Map<String, Object> map);

	int delCartById(int cartId);

	int updateCartStatusByOne(String memId);

	List<Map<String, Object>> getProductBySold();

	int updateCartStatusOneUsingCartId(long cartId);


}
