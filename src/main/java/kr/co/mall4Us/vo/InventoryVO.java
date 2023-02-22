package kr.co.mall4Us.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class InventoryVO {

	private long prodId;
    private int sizeS;
    private int sizeM;
    private int sizeL;
}
