package kr.co.mall4Us.service;

import kr.co.mall4Us.vo.CouponVO;

public interface CouponService {

	int addCoupon(CouponVO vo);

	CouponVO getCoupon(String string);

	int initCoupon(String memId);

	int updateCoupon(CouponVO vo);

}
