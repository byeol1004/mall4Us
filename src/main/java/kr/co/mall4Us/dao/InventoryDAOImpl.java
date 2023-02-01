package kr.co.mall4Us.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.mall4Us.vo.InventoryVO;

@Repository
public class InventoryDAOImpl implements InventoryDAO{

	@Autowired
	SqlSession session;
	
	@Override
	public InventoryVO getOne(long prodId) {
	
		return session.selectOne("inventoryNS.getOne",prodId);
	}

	@Override
	public int addInven(InventoryVO vo) {
		
		return session.insert("inventoryNS.addOne",vo);
	}

	@Override
	public List<InventoryVO> getAll() {
		
		return session.selectList("inventoryNS.getAll");
	}
}
