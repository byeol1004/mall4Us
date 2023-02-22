package kr.co.mall4Us.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class MemberVO {
	@NonNull
	private String memId;
	@NonNull
	private String memName;
	@NonNull
	private String memPwd;
	private String memLivingArea;
	private String memAddress;
	private String memPhone;
	private String memRegiDate;
	private String memModiDate;
}
