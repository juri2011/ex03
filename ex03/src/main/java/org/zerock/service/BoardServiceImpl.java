package org.zerock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.domain.BoardVO;
import org.zerock.mapper.BoardMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class BoardServiceImpl implements BoardService {
  
  //@Setter는 해당 필드의 setter를 생성한다. 클래스 레벨은 물론이고 필드레벨에도 사용 가능하다.
  //@Setter(onMethod_ = @Autowired) : setter가 생성되면 @Autowired를 붙인다.
  /*
     @Autowired : BoardServiceImpl을 생성할 때 스프링의 AutowiredAnnotationBeanPostProcessor가
     BoardMapper 타입의 빈을 얻어서 mapper 필드에 자동으로 연결한다.
     (지금은 Spring이 controller 패키지 안의 컴포넌트만 스캔하도록 설정 되어있는데, 과연 이 상태에서 의존주입이 될까?)
  */
  @Setter(onMethod_ = @Autowired)
  private BoardMapper mapper;
  
  @Override
  public void register(BoardVO board) {
    
  }

  @Override
  public BoardVO get(Long bno) {
    return null;
  }

  @Override
  public boolean modify(BoardVO board) {
    return false;
  }

  @Override
  public boolean remove(Long bno) {
    return false;
  }

  @Override
  public List<BoardVO> getList() {
    return null;
  }

}
