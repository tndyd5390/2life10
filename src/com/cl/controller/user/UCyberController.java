//���̹�ȫ�� ��Ʈ�ѷ�
package com.cl.controller.user;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cl.service.ICyberService;

@Controller
public class UCyberController {
	
	private Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="CyberService")
	private ICyberService cyberService;
	
	@RequestMapping("/company/cyberList")
	public String cyberList() throws Exception{
		log.info("cyberList Start!!");
		
		log.info("cyberList End!!");
		return "/company/cyber";
	}
}
