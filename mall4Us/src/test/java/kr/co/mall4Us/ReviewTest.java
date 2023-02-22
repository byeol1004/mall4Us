package kr.co.mall4Us;

import static org.junit.Assert.assertEquals;

import java.util.List;

import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.co.mall4Us.service.ReviewService;
import kr.co.mall4Us.vo.ReviewVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations ="file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class ReviewTest {
	
	@Autowired
	ReviewService service;
	
	//@Ignore
	@Test
	public void addReviewTest() {
		ReviewVO vo = new ReviewVO();

		vo.setContents("너무 좋아요. 감사합니다. 예쁘게 착용하겠습니다!");
		vo.setMemId("sb9408");
		vo.setPhoto("d카디건.jpg.jpg");
		vo.setProdId(17112571);
		vo.setRating(5);
		
		int result = service.addReview(vo);
		assertEquals(result, 1);
		//service.addReview(vo);
	}

	@Ignore
	@Test
	public void getAllReviewTest() {
		List<ReviewVO> list = service.getAllReview();
		
		for(ReviewVO vo : list) {
			System.out.println(vo);
		}
		
	}

	@Ignore
	@Test
	public void getReviewByMemIdTest() {
		List<ReviewVO> list = service.getReviewByMemId("java1234");
		
		for(ReviewVO vo : list) {
			System.out.println(vo);
		}
	}
	
	@Ignore
	@Test
	public void getReviewByProdIdTest() {
		List<ReviewVO> list = service.getReviewByProdId(22226903);
		
		for(ReviewVO vo : list) {
			System.out.println(vo);
		}
	}
	
}
