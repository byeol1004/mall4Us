package kr.co.mall4Us.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ProductsVO {
	
    private long prodId;
    private String prodHiClass;
    private String prodMiClass;
    private String prodLoClass;
    private String prodName;
    private String prodKeyword;
    private int prodPrice;
    private String prodThumImage;
    private String prodDetailImage;

}
