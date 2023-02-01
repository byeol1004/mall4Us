package kr.co.mall4Us.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CouponVO {

    private String memId;
    private String memGrade;
    private int memCoupon;
    private int memPoint;
    private long memAmount;

}
