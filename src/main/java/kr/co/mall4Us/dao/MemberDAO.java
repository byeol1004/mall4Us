package kr.co.mall4Us.dao;

import java.util.List;

import kr.co.mall4Us.vo.MemberVO;

public interface MemberDAO {

	List<MemberVO> getAllMember();

	MemberVO getOneMember(String memId);

	int addMember(MemberVO vo);
	
	int delMember(String memId);

	List<MemberVO> selectArea();

	int updateMember(MemberVO vo);

}
