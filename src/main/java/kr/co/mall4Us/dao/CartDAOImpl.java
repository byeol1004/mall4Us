package kr.co.mall4Us.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.mall4Us.vo.CartVO;

@Repository
public class CartDAOImpl implements CartDAO{

	@Autowired
	SqlSession session;
	
	@Override
	public int addCart(CartVO vo) {
		
		System.out.println(vo);
		
		return session.update("kr.co.mall4Us.CartDao.addCart", vo);
	}

	@Override
	public CartVO getCartExist(Map<String, Object> map) {
		
		return session.selectOne("kr.co.mall4Us.CartDao.getCartExist", map);
	}

	@Override
	public int updateCart(Map<String, Object> map) {
		
		return session.update("kr.co.mall4Us.CartDao.updateCart", map);
	}

	@Override
	public int updateCartStatus(Map<String, Object> map) {
		return session.update("kr.co.mall4Us.CartDao.updateCartStatus", map);
	}

	@Override
	public List<Map<String, Object>> getCartListByMemId(Map<String, Object> map) {
		return session.selectList("kr.co.mall4Us.CartDao.getCartListByMemId", map);
	}

	@Override
	public int delCart(Map<String, Object> map) {
		return session.update("kr.co.mall4Us.CartDao.delCart", map);
	}

	@Override
	public int delCartById(int cartId) {
		return session.update("kr.co.mall4Us.CartDao.delCartById", cartId);
	}

	@Override
	public int updateCartStatusByOne(String memId) {
		return session.update("kr.co.mall4Us.CartDao.updateCartStatusByOne", memId);
	}

	@Override
	public List<Map<String, Object>> getProductBySold() {
		return session.selectList("kr.co.mall4Us.CartDao.getProductBySold");
	}

	@Override
	public int updateCartStatusOneUsingCartId(long cartId) {
		return session.update("kr.co.mall4Us.CartDao.updateCartStatusOneUsingCartId", cartId);
	}

	
}
