package com.cl.controller.admin;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;

import com.cl.service.ICruiseService;

@Controller
public class CruiseController {
	
	private Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="CruiseService")
	private ICruiseService cruiseService;
	
	
}
