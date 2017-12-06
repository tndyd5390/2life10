//������ȸ ��Ʈ�ѷ�
package com.cl.controller.user;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UCompanyController {
	
	private Logger log = Logger.getLogger(this.getClass());
	
	@RequestMapping("/company/overView")
	public String overView() throws Exception{
		log.info("overView Start!!");
		
		log.info("overView End!!");
		return "/company/overview";
	}
	
	@RequestMapping("/company/organ")
	public String organ() throws Exception{
		log.info("organ Start!!");
		
		
		log.info("organ End!!");
		return "/company/organ";
	}
	
	@RequestMapping("/company/road")
	public String road() throws Exception{
		log.info("road Start!!");
		
		log.info("road End!!");
		return "/company/road";
	}
}

