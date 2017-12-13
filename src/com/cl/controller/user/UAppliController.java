//���Խ�û ��Ʈ�ѷ�
package com.cl.controller.user;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cl.service.IAppliService;

@Controller
public class UAppliController {
	
	private Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="AppliService")
	private IAppliService applyService;
	
	@RequestMapping("/apply/applyForm")
	public String applyForm() throws Exception{
		log.info("applyForm Start!!");
		
		log.info("applyForm End!!");
		return "/appli/appli_form";
	}
}
