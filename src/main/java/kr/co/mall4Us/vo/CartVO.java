package kr.co.mall4Us.vo;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;

@Data
@NoArgsConstructor
@RequiredArgsConstructor
public class CartVO {
	private long cartId;
	@NonNull
	private String memId;
	@NonNull
	private long prodId;
	@NonNull
	private String size;
	@NonNull
	private int status;
	private String cartDate;
}
