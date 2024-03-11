package org.zerock.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.zerock.service.BoardService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
// "/board"로 시작하는 모든 처리를 BoardController가 담당
@RequestMapping("/board/*")
@AllArgsConstructor
public class BoardController {
  
  private BoardService service;
  
  //게시물 목록 출력
  @GetMapping("/list")
  public void list(Model model) {
    
    log.info("list");
    model.addAttribute("list", service.getList());
    
  }
}
