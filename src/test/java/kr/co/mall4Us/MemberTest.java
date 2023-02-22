package kr.co.mall4Us;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.co.mall4Us.dao.MemberDAO;
import kr.co.mall4Us.service.MemberService;
import kr.co.mall4Us.vo.MemberVO;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class MemberTest {

	/*
	 * @Autowired MemberDAO dao;
	 */
	
	@Autowired
	MemberService service;

	@Test
	public void getAllMemberTest() {
		List<MemberVO> list = service.getAllMember();
		for(MemberVO vo : list) {
		
			System.out.println("=====" + vo);
		}
	}
	
	@Test
	public void getOneMemberTest() {
		MemberVO vo = service.getOneMember("holgildong", "555");
		System.out.println("=====" + vo);
	}
	
	@Test
	public void addMemberTest() {
		MemberVO vo = new MemberVO();
		vo.setMemId("onlyone726");
		vo.setMemName("kks");
		vo.setMemPwd("onlyone726");
		vo.setMemLivingArea("경기도");
		vo.setMemAddress("경기도 광주시");
		vo.setMemPhone("01078781010");
		int result = service.addMember(vo);
		assertEquals(result, 1);
	}
	
	@Test
	public void delMemberTest() {
		int result = service.delMember("666");
	}
	
	@Test
	public void selectAreaTest() {
		/* MemberVO vo = service.selectArea("서울", "경기"); */

		List<MemberVO> list = service.selectArea();
		for (MemberVO vo : list) {

			System.out.println("=====" + vo);
		}

	}
	
	@Test
	public void updateMemberTest() {
		MemberVO vo = new MemberVO();
		vo.setMemName("짱ㅇㅇ");
		vo.setMemPwd("123");
		vo.setMemLivingArea("전라도");
		vo.setMemAddress("전라도 광주");
		vo.setMemPhone("01077778888");
		vo.setMemId("777");
		assertEquals(service.updateMember(vo), 1);

	}
}