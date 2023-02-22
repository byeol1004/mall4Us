package kr.co.mall4Us.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.mall4Us.dao.ReviewDAO;
import kr.co.mall4Us.vo.ReviewVO;

@Service
public class ReviewServiceImpl implements ReviewService{

	@Autowired
	ReviewDAO dao;
	
	@Override
	public int addReview(ReviewVO vo) {
		
		return dao.addReview(vo);
	}

	@Override
	public List<ReviewVO> getAllReview() {

		return dao.getAllReview();
	}

	@Override
	public List<ReviewVO> getReviewByMemId(String memId) {
		return dao.getReviewByMemId(memId);
	}

	@Override
	public List<ReviewVO> getReviewByProdId(long prodId) {
		return dao.getReviewByProdId(prodId);
	}

}
