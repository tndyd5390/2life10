package com.cl.controller.admin;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;

import com.cl.service.IAdviceService;

@Controller
public class AdviceController {
	
	private Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="AdviceService")
	private IAdviceService adviceService;
	
	
}
