package kr.co.mall4Us;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.co.mall4Us.service.CartService;
import kr.co.mall4Us.service.ProductsService;
import kr.co.mall4Us.vo.CartVO;
import kr.co.mall4Us.vo.ProductsVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations ="file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class CartTest {

	@Autowired
	CartService service;
	
	@Autowired
	ProductsService pservice;
	
	@Ignore
	@Test
	public void addCartTest() {
		
		CartVO vo = new CartVO();
		vo.setMemId("choi");
		vo.setProdId(1237);
		vo.setPsize("M");
		vo.setStatus(0);
		vo.setQuantity(2);
		
		service.addCart(vo);
		
	}
	
	@Ignore
	@Test
	public void getCartExistTest() {
		
		Map<String, Object> map = new HashMap<>();
		map.put("memId", "mook");
		map.put("prodId", 1234);
		map.put("status", 1);
		
		CartVO vo = service.getCartExist(map);
		System.out.println(vo);
		
	}
	
	@Ignore
	@Test
	public void updateCartTest() {

		Map<String, Object> map = new HashMap<>();
		map.put("memId", "choi");
		map.put("prodId", 1237);
		map.put("status", 0);
		
		CartVO vo = service.getCartExist(map);

		Map<String, Object> map1 = new HashMap<>();

		map1.put("cartId", 4);
		map1.put("psize", "M");
		map1.put("quantity", 7);

		int result = service.updateCart(map1);
		
	}

	@Ignore
	@Test
	public void updateCartStatus() {
		Map<String, Object> map = new HashMap<>();
		map.put("memId", "choi");
		map.put("prodId", 1237);
		map.put("status", 1);

		int result = service.updateCartStatus(map);

		
	}
	
	@Ignore
	@Test
	public void getCartListByMemId() {

		Map<String, Object> map = new HashMap<>();
		map.put("memId", "1236");
		map.put("status", 0);

		List<Map<String, Object>> list = service.getCartListByMemId(map);
		
		for(Map<String, Object> item : list) {
			
			System.out.println(item.get("CARTID"));
		}
	}
	
	@Ignore
	@Test
	public void delCart() {
		
		Map<String, Object> map = new HashMap<>();
		map.put("memId", "choi");
		map.put("prodId", 1237);
		map.put("status", 0);
		
		int result = service.delCart(map);
		
	}
	
	@Ignore
	@Test
	public void delCartById() {
		int result = service.delCartById(6);
	}
	
	@Ignore
	@Test
	public void updateCartStatusByOneTest() {
		
		int result = service.updateCartStatusByOne("1236");
		
	}
	
	@Test
	public void getProductBySold() {
		
		List<Map<String, Object>> list = service.getProductBySold();
		List<ProductsVO> listBySold = new ArrayList<ProductsVO>();
		
		for(Map<String, Object> item : list) {
			
			long prodId = Long.parseLong(String.valueOf(item.get("PRODID")));
			System.out.println(prodId);
			ProductsVO vo = pservice.getOne(prodId);

			listBySold.add(vo);
			
		}
		
		for(ProductsVO vo : listBySold) {
			
			System.out.println(vo.getProdId());
		}
		
	}
	
	
}
