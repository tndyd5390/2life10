//사이버홍보 컨트롤러
package com.cl.controller.admin;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cl.service.ICyberService;

@Controller
public class CyberController {
	
	private Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="CyberService")
	private ICyberService cyberService;
	
	@RequestMapping("/Lmin/company/cyber")
	public String cyberList() throws Exception{
		log.info("cyberList Start!!");
		
		
		
		log.info("cyberList End!!");
		return "/Lmin/company/cyber";
	}
	@RequestMapping("/Lmin/company/cyberWrite")
	public String cyberWrite() throws Exception{
		log.info("cyberWrite Start!!");
		
		
		
		log.info("cyberWrite End!!");
		return "/Lmin/company/cyber_write";
	}
}
