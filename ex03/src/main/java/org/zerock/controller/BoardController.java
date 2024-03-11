package org.zerock.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
// "/board"로 시작하는 모든 처리를 BoardController가 담당
@RequestMapping("/board/*")
public class BoardController {
  
}
