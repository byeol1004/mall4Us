package kr.co.mall4Us;

import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.co.mall4Us.service.CouponService;
import kr.co.mall4Us.service.ProductsService;
import kr.co.mall4Us.vo.CouponVO;
import kr.co.mall4Us.vo.ProductsVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations ="file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class CouponTest {
	
	@Autowired
	CouponService service;
	
	@Ignore
	@Test
	public void addCouponTest() {
		CouponVO vo = new CouponVO();
		vo.setMemId("1236");
		vo.setMemGrade("G");
		vo.setMemCoupon(10);
		vo.setMemPoint(0);
		vo.setMemAmount(0);
		
		int result = service.addCoupon(vo);
	}
	
	@Ignore
	@Test
	public void getCouponTest() {
		
		CouponVO vo = service.getCoupon("1236");
		
		System.out.println(vo);
		
	}
	
	@Ignore
	@Test
	public void initCouponTest() {
		
		int result = service.initCoupon("1240");
		
		
	}
	@Test
	public void updateCoupon() {
		CouponVO vo = new CouponVO();
		
		vo.setMemAmount(20000);
		vo.setMemCoupon(0);
		vo.setMemGrade("N");
		vo.setMemPoint(1000);
		vo.setMemId("1236");
		
		int result = service.updateCoupon(vo);
	}

}
