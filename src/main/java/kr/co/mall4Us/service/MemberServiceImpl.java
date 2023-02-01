package kr.co.mall4Us.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.mall4Us.dao.MemberDAO;
import kr.co.mall4Us.vo.MemberVO;

@Service
public class MemberServiceImpl implements MemberService{

	@Autowired
	MemberDAO dao;

	@Override
	public List<MemberVO> getAllMember() {
		return dao.getAllMember();
	}

	@Override
	public MemberVO getOneMember(String memId, String memPwd) {
		
		MemberVO vo = dao.getOneMember(memId);
		
	    if (vo != null && memPwd.equals(vo.getMemPwd())) return vo;
							
	    return null;
	}

	@Override
	public int addMember(MemberVO vo) {
		return dao.addMember(vo);
	}
	
	@Override
	public int delMember(String memId) {
		return dao.delMember(memId);
	}

	@Override
	public List<MemberVO> selectArea() {
		return dao.selectArea();
	}

	@Override
	public int updateMember(MemberVO vo) {
		return dao.updateMember(vo);
	}

	@Override
	public MemberVO getOneMember(String memId) {
		return dao.getOneMember(memId);
	}

}
