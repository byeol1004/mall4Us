package kr.co.mall4Us.dao;

import java.util.List;

import kr.co.mall4Us.vo.InventoryVO;

public interface InventoryDAO {

	InventoryVO getOne(long prodId);

	int addInven(InventoryVO vo);

	List<InventoryVO> getAll();

}
