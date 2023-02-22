package kr.co.mall4Us.dao;

import kr.co.mall4Us.vo.CouponVO;

public interface CouponDAO {

	int addCoupon(CouponVO vo);

	CouponVO getCoupon(String memId);

	int initCoupon(String memId);

	int updateCoupon(CouponVO vo);
}
