package org.zerock.service;

import static org.junit.jupiter.api.Assertions.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BoardServiceTests {
  
  @Setter(onMethod_ = {@Autowired})
  private BoardService service;
  
  //BoardService 객체가 제대로 주입되었는지 확인
  //BoardService 안의 BoardMapper가 주입이 잘 되었다면 BoardService 객체도 성공적으로 주입이 될 것이다.
  @Test
  public void testExist() {
    
    log.info(service);
    assertNotNull(service);
  }
}