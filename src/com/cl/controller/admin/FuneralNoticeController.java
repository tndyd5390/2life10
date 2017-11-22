package com.cl.controller.admin;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;

import com.cl.service.IFuneralNoticeService;

@Controller
public class FuneralNoticeController {
	
	private Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="FuneralNoticeService")
	private IFuneralNoticeService funeralNoticeService;
	
	
}
