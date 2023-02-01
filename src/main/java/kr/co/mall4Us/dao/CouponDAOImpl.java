package kr.co.mall4Us.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.mall4Us.vo.CouponVO;

@Repository
public class CouponDAOImpl implements CouponDAO {

	@Autowired
	SqlSession session;
	
	@Override
	public int addCoupon(CouponVO vo) {
		return session.insert("kr.co.mall4Us.CouponDao.addCoupon", vo);
	}//end of addCoupon

	@Override
	public CouponVO getCoupon(String memId) {
		return session.selectOne("kr.co.mall4Us.CouponDao.getCoupon", memId);

	}//end of getCoupon

	@Override
	public int initCoupon(String memId) {
		return session.insert("kr.co.mall4Us.CouponDao.initCoupon", memId);
	}

	@Override
	public int updateCoupon(CouponVO vo) {
		return session.update("kr.co.mall4Us.CouponDao.updateCoupon", vo);
	}
	
}
