package com.cl.controller.admin;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;

import com.cl.service.IApplyService;

@Controller
public class ApplyController {
	
	private Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="ApplyService")
	private IApplyService applyService;
	
	
}
