package kr.co.mall4Us;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;

import java.sql.ResultSet;
import java.util.List;

import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.co.mall4Us.service.ProductsService;
import kr.co.mall4Us.vo.MemberVO;
import kr.co.mall4Us.vo.ProductsVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class ProductsTest {

	@Autowired
	ApplicationContext context;
	
	@Test
	public void contextTest() {
		assertNotNull(context);
	}
	
	@Autowired
	ProductsService service;
	
	@Test
	
	public void addOne() {
		ProductsVO sampleData = new ProductsVO();
		sampleData.setProdId(555555);
		sampleData.setProdHiClass("여성");
		sampleData.setProdMiClass("상의");
		sampleData.setProdLoClass("긴팔");
		sampleData.setProdName("기모맨투맨");
		sampleData.setProdKeyword("여성상의, 여성맨투맨, 맨투맨");
		sampleData.setProdPrice(56000);
		sampleData.setProdThumImage("001.jpg");
		sampleData.setProdDetailImage("001.jpg");
		service.addProd(sampleData);
		
		
	}
	
	@Test
	public void getOne() {
		ProductsVO vo= service.getOne(1);
		assertNotNull(vo);
	}
	
	
/*	@Test
	public void getAllTest() {
		List<ProductsVO> list = service.getAll("오즈위고");
		for(ProductsVO vo:list) {
			System.out.println(vo);
		};
	}*/
	
	@Test
	public void getAllTest() {
//		String prodName = null;
//		List<ProductsVO> list = service.getAll(prodName);
//		for(ProductsVO vo:list) {
//			System.out.println(vo);
//		};
		String prodName = "삭스";
		List<ProductsVO> list = service.getAll(prodName);
//		list = service.getAll(prodName);
		for(ProductsVO vo:list) {
			System.out.println(vo);
		}
	}
	
	
	
	@Test

	public void deleteOne() {
		int result = service.deleteOne(98721908);
		/* assertEquals(service.deleteOne(98721908),1); */
		
	}
	
	@Test
	public void getCount() {
		int result = service.getCount();
		System.out.println(result);
	}
	@Test
	public void update() {
		ProductsVO vo = new ProductsVO();
		
		vo.setProdHiClass("여성"); vo.setProdMiClass("상의");
		vo.setProdLoClass("맨투맨"); vo.setProdName("여성맨투맨");
		vo.setProdKeyword("여성상의, 여성긴팔, 맨투맨"); vo.setProdPrice(25000);
		vo.setProdThumImage("mtm001.jpg"); vo.setProdDetailImage("mtm001.jpg");
		vo.setProdId(10);
		assertEquals(service.update(vo), 1);
		System.out.println(vo);
	}
/*	
	@Test
	public void getListTest() {
		

		List<MemberVO> list = service.getList();
		for (MemberVO vo : list) {

			System.out.println("=====" + vo);
		}

	}*/
}
