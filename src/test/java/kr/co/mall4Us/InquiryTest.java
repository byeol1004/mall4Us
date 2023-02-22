package kr.co.mall4Us;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.co.mall4Us.service.InquiryService;
import kr.co.mall4Us.vo.ProductsVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class InquiryTest {
	@Autowired
	InquiryService service;
	
	@Ignore
	@Test
	public void inquiryTest() {
		
		List<Map<String, Object>> list = service.viewInventory();
		
		for(Map<String, Object> item : list) {
			
			System.out.println(item);
			
		}
	}
	
	@Ignore
	@Test
	public void dynamicInquiryTest(){

		Map<String, String> map = new HashMap<>();
		map.put("prodHiClass", "여성");
		map.put("prodMiClass", "탑");
		map.put("prodLoClass", "티셔츠");
		
		List<ProductsVO> list = service.dynamicInventory(map);
		
		for(ProductsVO item : list) {
			
			System.out.println(item);
			
		}
		
	}
	
	@Ignore
	@Test
	public void dynamicInquirySearchTest() {
		
		Map<String, String> map = new HashMap<>();
		map.put("prodHiClass", "남성");
		//map.put("prodMiClass", "탑");
		//map.put("prodLoClass", "티셔츠");
		
		List<Map<String, Object>> list = service.dynamicInventorySearch(map);
		
		for(Map<String, Object> item : list) {
			
			System.out.println(item);
			
		}

	}
	
	@Ignore
	@Test
	public void soldProductsTest() {
		
		List<Map<String, Object>> list = service.soldProducts();
		
		for(Map<String, Object> item : list) {
			
			System.out.println(item);
			
		}
	}

	@Ignore
	@Test
	public void soldProductsByPriceTest() {
		
		List<Map<String, Object>> list = service.soldProductsByPrice();
		
		for(Map<String, Object> item : list) {
			
			System.out.println(item);
		}
	}
	
	@Ignore
	@Test
	public void soldProductsByClassTest() {

		List<Map<String, Object>> list = service.soldProductsByClass();
		
		for(Map<String, Object> item : list) {
			
			System.out.println(item);
		}

	}
	
	@Ignore
	@Test
	public void soldProductsByDate() {

		List<Map<String, Object>> list = service.soldProductsByDate();

		for(Map<String, Object> item : list) {
			
			System.out.println(item);
		}

		
	}
	
	@Ignore
	@Test
	public void soldProductsByDateAsc() {

		List<Map<String, Object>> list = service.soldProductsByDateAsc();

		for(Map<String, Object> item : list) {
			
			System.out.println(item);
		}

		
	}
	
	@Ignore
	@Test
	public void soldProductsByPriceAsc() {
		
		List<Map<String, Object>> list = service.soldProductsByPriceAsc();

		for(Map<String, Object> item : list) {
			
			System.out.println(item);
		}
	}
	
	@Ignore
	@Test
	public void soldProductsTestAsc() {
		
		List<Map<String, Object>> list = service.soldProductsAsc();
		
		for(Map<String, Object> item : list) {
			
			System.out.println(item);
			
		}
	}

	@Ignore
	@Test
	public void dynamicInventorySearchByPriceAscTest() {

		Map<String, String> map = new HashMap<>();
		map.put("prodHiClass", "Woman");
		
		List<Map<String, Object>> list = service.dynamicInventorySearchByPriceAsc(map);
		
		for(Map<String, Object> item : list) {
			
			System.out.println(item);
			
		}
	}//end of dynamicInventorySearchByPriceAscTest
	
	@Ignore	
	@Test
	public void dynamicInventorySearchByPriceDescTest() {
		Map<String, String> map = new HashMap<>();
		map.put("prodHiClass", "Woman");
		
		List<Map<String, Object>> list = service.dynamicInventorySearchByPriceDesc(map);
		
		for(Map<String, Object> item : list) {
			
			System.out.println(item);
			
		}
	}//end of dynamicInventorySearchByPriceDescTest
		
	@Ignore
	@Test
	public void productsSearchByPriceAscTest() {
		Map<String, String> map = new HashMap<>();
		map.put("prodHiClass", "Woman");
		
		List<ProductsVO> list = service.productsSearchByPriceAsc(map);
		
		for(ProductsVO vo : list ) {
			
			System.out.println(vo);
			
		}
		
	}
	
	@Test
	public void productsSearchByPriceDescTest() {
		Map<String, String> map = new HashMap<>();
		map.put("prodHiClass", "Woman");
		
		List<ProductsVO> list = service.productsSearchByPriceDesc(map);
		
		for(ProductsVO vo : list ) {
			
			System.out.println(vo);
			
		}
		
	}
	
	
	
	

}
	
	