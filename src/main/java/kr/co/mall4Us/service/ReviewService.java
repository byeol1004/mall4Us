package kr.co.mall4Us.service;

import java.util.List;

import kr.co.mall4Us.vo.ReviewVO;

public interface ReviewService {

	int addReview(ReviewVO vo);

	List<ReviewVO> getAllReview();

	List<ReviewVO> getReviewByMemId(String memId);

	List<ReviewVO> getReviewByProdId(long prodId);


}
