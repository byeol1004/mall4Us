package kr.co.mall4Us;

import static org.junit.Assert.assertNotNull;

import java.util.List;

import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.co.mall4Us.service.InventoryService;
import kr.co.mall4Us.vo.InventoryVO;




@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class InventoryTest {
	
	@Autowired
	InventoryService service;
	
	@Test
	@Ignore
	public void add() {
		InventoryVO sampleData = new InventoryVO();
		sampleData.setProdId(1); sampleData.setSizeS(6);
		sampleData.setSizeM(14); sampleData.setSizeL(50);
		service.addInven(sampleData);
	}
	
	@Test
	//@Ignore
	public void getOne() {
		InventoryVO vo = service.getOne(73238863);
		assertNotNull(vo);
	}
	
	@Test
	@Ignore
	public void getAll() {
		List<InventoryVO> list = service.getAll();
		for(InventoryVO vo:list) {
			System.out.println(vo);
		}
	}
	
}
