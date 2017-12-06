//���̹�ȫ�� ��Ʈ�ѷ�
package com.cl.controller.user;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cl.service.ICyberService;

@Controller
public class UInfoController {
	
	private Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="CyberService")
	private ICyberService cyberService;

	
	@RequestMapping("/info/proInfo")
	public String proInfo() throws Exception{
		log.info("proInfo Start!!");
		
		log.info("proInfo End!!");
		return "/info/pro_info";
	}
	
	@RequestMapping("/info/joinStep")
	public String joinStep() throws Exception{
		log.info("joinStep Start!!");
		
		log.info("joinStep End!!");
		return "/info/join_step";
	}
	
	@RequestMapping("/info/catalogue")
	public String catalogue() throws Exception{
		log.info("catalogue Start!!");
		
		log.info("catalogue End!!");
		return "/info/catalogue";
	}
	
	@RequestMapping("/info/endPro")
	public String endPro() throws Exception{
		log.info("endPro Start!!");
		
		log.info("endPro End!!");
		return "/info/end_pro";
	}
	
}
