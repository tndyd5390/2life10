package com.cl.controller.admin;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;

import com.cl.service.ICyberService;

@Controller
public class CyberController {
	
	private Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="CyberService")
	private ICyberService cyberService;
	
	
}
