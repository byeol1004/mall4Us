package kr.co.mall4Us.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.mall4Us.dao.CouponDAO;
import kr.co.mall4Us.vo.CouponVO;

@Service
public class CouponServiceImpl implements CouponService{

	@Autowired
	CouponDAO dao;
	
	@Override
	public int addCoupon(CouponVO vo) {
		
		return dao.addCoupon(vo);
	}

	@Override
	public CouponVO getCoupon(String memId) {
		return dao.getCoupon(memId);
	}

	@Override
	public int initCoupon(String memId) {
		CouponVO vo = dao.getCoupon(memId);
		
		if (vo != null) return 0;
		
		return dao.initCoupon(memId);
	}

	@Override
	public int updateCoupon(CouponVO vo) {
		return dao.updateCoupon(vo);
	}

}
