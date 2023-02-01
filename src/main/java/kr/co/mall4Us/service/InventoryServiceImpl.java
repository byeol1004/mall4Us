package kr.co.mall4Us.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.mall4Us.dao.InventoryDAO;
import kr.co.mall4Us.vo.InventoryVO;

@Service
public class InventoryServiceImpl implements InventoryService{

	@Autowired
	InventoryDAO dao;
	
	@Override
	public InventoryVO getOne(long prodId) {
		
		return dao.getOne(prodId);
	}

	@Override
	public int addInven(InventoryVO vo) {
		
		return dao.addInven(vo);
	}

	@Override
	public List<InventoryVO> getAll() {
		
		return dao.getAll();
	}


}
