package com.cl.controller.admin;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;

import com.cl.service.ICounselService;

@Controller
public class CounselController {
	
	private Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="CounselService")
	private ICounselService counselService;
	
	
}
