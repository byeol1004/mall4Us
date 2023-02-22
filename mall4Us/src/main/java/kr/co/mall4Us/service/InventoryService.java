package kr.co.mall4Us.service;

import java.util.List;

import kr.co.mall4Us.vo.InventoryVO;

public interface InventoryService {

	InventoryVO getOne(long prodId);

	int addInven(InventoryVO vo);

	List<InventoryVO> getAll();

}
