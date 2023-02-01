package kr.co.mall4Us.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.mall4Us.vo.ReviewVO;

@Repository
public class ReviewDAOImpl implements ReviewDAO{

	@Autowired
	SqlSession session;
	
	@Override
	public int addReview(ReviewVO vo) {
		
		return session.insert("kr.co.mall4Us.ReviewDao.addReview", vo);
	}

	@Override
	public List<ReviewVO> getAllReview() {
		return session.selectList("kr.co.mall4Us.ReviewDao.getAllReview");
	}

	@Override
	public List<ReviewVO> getReviewByMemId(String memId) {
		return session.selectList("kr.co.mall4Us.ReviewDao.getReviewByMemId", memId);
	}

	@Override
	public List<ReviewVO> getReviewByProdId(long prodId) {
		return session.selectList("kr.co.mall4Us.ReviewDao.getReviewByProdId", prodId);
	}

}
