package kr.co.mall4Us.service;

import java.util.List;

import kr.co.mall4Us.vo.MemberVO;

public interface MemberService {

	List<MemberVO> getAllMember();

	MemberVO getOneMember(String memId, String memPwd);

	int addMember(MemberVO vo);
	
	int delMember(String memId);

	List<MemberVO> selectArea();

	int updateMember(MemberVO vo);

}
