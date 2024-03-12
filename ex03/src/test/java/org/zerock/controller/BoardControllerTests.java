package org.zerock.controller;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
/*
   @WebAppConfiguration 어노테이션
   Servlet에서는 ServletContext를, spring에서는 WebApplicationContext를 사용하기 위해서 붙임
 */
@WebAppConfiguration
@ContextConfiguration({
    "file:src/main/webapp/WEB-INF/spring/root-context.xml",
    "file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"})
@Log4j
public class BoardControllerTests {

  @Setter(onMethod_ = {@Autowired})
  private WebApplicationContext ctx;
  /*
      개발 단계에서 Tomcat(WAS)를 실행하지 않고 스프링 프로젝트를 테스트 할 수 있는 방법!
      
      MockMvc?: 가짜 MVC
      가짜로 URL과 파라미터를 브라우저에서 사용하는 것처럼 만들어서 Controller를 실행할 수 있다.
      
   */
  private MockMvc mockMvc;
  
  /*
     @Before이 붙은 메소드는 모든 테스트 전에 매번 실행된다.
   */
  @Before
  public void setup() {
    this.mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
  }
  
  @Test
  public void testList() throws Exception {
    
    log.info(
        mockMvc.perform(MockMvcRequestBuilders.get("/board/list"))
        .andReturn()
        .getModelAndView()
        .getModelMap());
  }
}