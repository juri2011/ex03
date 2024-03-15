package org.zerock.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Criteria {
  
  private int pageNum;
  private int amount;
  
  //파라미터가 없을 경우 1페이지 출력(기본값)
  public Criteria() {
    this(1, 10);
  }
  //생성자 오버로딩
  public Criteria(int pageNum, int amount) {
    this.pageNum = pageNum;
    this.amount = amount;
  }
}
