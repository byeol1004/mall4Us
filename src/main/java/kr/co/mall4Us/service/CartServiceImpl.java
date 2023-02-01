package kr.co.mall4Us.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.mall4Us.dao.CartDAO;
import kr.co.mall4Us.vo.CartVO;

@Service
public class CartServiceImpl implements CartService{

	private CartDAO dao;
	
	@Autowired	
	public void setDao(CartDAO dao) {
		this.dao = dao;
	}

	@Override
	public int addCart(CartVO vo) {
		System.out.println("*******");
		
		return dao.addCart(vo);
	}

	@Override
	public CartVO getCartExist(Map<String, Object> map) {
		return dao.getCartExist(map);
	}

	@Override
	public int updateCart(Map<String, Object> map) {
		
		return dao.updateCart(map);
	}

	@Override
	public int updateCartStatus(Map<String, Object> map) {
		return dao.updateCartStatus(map);
	}

	@Override
	public List<Map<String, Object>> getCartListByMemId(Map<String, Object> map) {
		return dao.getCartListByMemId(map);
	}

	@Override
	public int delCart(Map<String, Object> map) {
		return dao.delCart(map);
	}

	@Override
	public int delCartById(int cartId) {
		// TODO Auto-generated method stub
		return dao.delCartById(cartId);
	}

	@Override
	public int updateCartStatusByOne(String memId) {
		return dao.updateCartStatusByOne(memId);
	}

	@Override
	public List<Map<String, Object>> getProductBySold() {
		return dao.getProductBySold();
	}

	@Override
	public int updateCartStatusOneUsingCartId(long cartId) {
		return dao.updateCartStatusOneUsingCartId(cartId);
	}



}
