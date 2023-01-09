package kr.co.mall4Us.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.mall4Us.vo.MemberVO;

@Repository
public class MemberDAOImpl implements MemberDAO{

	@Autowired
	SqlSession session;

	@Override
	public List<MemberVO> getAllMember() {
		return session.selectList("kr.co.mall4Us.MemberDAO.getAllMember");
	}

	@Override
	public MemberVO getOneMember(String memId) {
		return session.selectOne("kr.co.mall4Us.MemberDAO.getOneMember", memId);
	}

	@Override
	public int addMember(MemberVO vo) {
		return session.insert("kr.co.mall4Us.MemberDAO.addMember", vo);
	}
	
	@Override
	public int delMember(String memId) {
		return session.delete("kr.co.mall4Us.MemberDAO.delMember", memId);
	}

	@Override
	public List<MemberVO> selectArea() {
		return session.selectList("kr.co.mall4Us.MemberDAO.selectArea");
	}

	@Override
	public int updateMember(MemberVO vo) {
		return session.update("kr.co.mall4Us.MemberDAO.updateMember", vo);
	}

}
