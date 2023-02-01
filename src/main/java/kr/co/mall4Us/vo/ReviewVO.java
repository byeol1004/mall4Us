package kr.co.mall4Us.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ReviewVO {

    private String memId;
    private long prodId;
    private String contents;
    private int rating;
    private String reviewDate;
    private String photo;
}
