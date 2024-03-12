package org.zerock.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.BoardVO;
import org.zerock.service.BoardService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

//Controller에서 tomcat을 연결
@Controller
@Log4j
// "/board"로 시작하는 모든 처리를 BoardController가 담당
@RequestMapping("/board/*")
@AllArgsConstructor //생성자 주입
public class BoardController {
  
  //스프링 4.3부터는 단일 파라미터를 받는 생성자는 자동으로 주입 가능
  @Autowired
  private BoardService service;
  
  //게시물 목록 출력
  @GetMapping("/list")
  public void list(Model model) {
    
    log.info("list");
    model.addAttribute("list", service.getList());
    
  }
  
  //PRG패턴
  @PostMapping("/register")
  public String register(BoardVO board, RedirectAttributes rttr) {
    log.info("register: " + board);
    
    service.register(board);
    
    rttr.addFlashAttribute("result",board.getBno());
    
    return "redirect:/board/list";
    
  }
}
