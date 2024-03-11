package org.zerock.persistence;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.BoardVO;
import org.zerock.mapper.BoardMapper;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BoardMapperTests {
  
  @Autowired
  private BoardMapper mapper;
  
  //테스트: 전체 게시글 가져오기
  @Test
  public void testGetList() {
    
    mapper.getList().forEach(board -> log.info(board));
    
  }
  
  //테스트: 데이터 삽입
  @Test
  public void testInsert() {
    
    BoardVO board = new BoardVO();
    board.setTitle("새로 작성하는 글");
    board.setContent("새로 작성하는 내용");
    board.setWriter("newbie");
    
    mapper.insert(board);
    
    log.info(board);
  }
  
  //테스트: key값 확인 후 데이터 삽입
  @Test
  public void testInsertSelectKey() {
    
    BoardVO board = new BoardVO();
    board.setTitle("새로 작성하는 글 selectKey");
    board.setContent("새로 작성하는 내용 selectKey");
    board.setWriter("newbie");
    
    mapper.insertSelectKey(board);
    
    log.info(board);
    log.info("after insert selectkey : "+board.getBno());
  }
  
}
