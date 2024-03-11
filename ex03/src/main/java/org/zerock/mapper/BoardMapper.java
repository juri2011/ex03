package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.BoardVO;

public interface BoardMapper {
  
  //@Select("select * from tbl_board where bno > 0")
  public List<BoardVO> getList();
  
  //데이터 삽입만
  public void insert(BoardVO board);
  
  //데이터 삽입하고 key까지 가져옴
  public void insertSelectKey(BoardVO board);
}
