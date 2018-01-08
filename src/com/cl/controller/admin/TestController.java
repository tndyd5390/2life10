package com.cl.controller.admin;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cl.dto.TestDTO;
import com.cl.service.impl.TestService;

@Controller
public class TestController {
	private Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="TestService")
	private TestService testService;
	
	@RequestMapping(value="/test")
	public String testMember(HttpServletRequest req, HttpServletResponse resp, Model model, HttpSession session) throws Exception{
		log.info(this.getClass() + ".testMember start!!!");
		List<TestDTO> tList = testService.getTestList();
		if(tList == null) tList = new ArrayList<>();
		model.addAttribute("tList", tList);
		log.info(this.getClass() + ".testMember end!!!");
		return "/test";
	}
}
