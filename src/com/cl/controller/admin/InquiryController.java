//������ȸ ��Ʈ�ѷ�
package com.cl.controller.admin;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cl.service.IInquiryService;

@Controller
public class InquiryController {
	
	private Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="InquiryService")
	private IInquiryService inquiryService;
	
	@RequestMapping("/inquiry/inquiryList")
	public String inquiryList(Model model) throws Exception{
		log.info("inquiryList Start!!");
		
		String url = "/main.do";
		String msg = "준비중입니다.";
		
		model.addAttribute("url", url);
		model.addAttribute("msg", msg);
		
		url = null;
		msg = null;
		
		log.info("inquiryList End!!");
		return "/alert";
	}
}
