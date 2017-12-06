//���̹�ȫ�� ��Ʈ�ѷ�
package com.cl.controller.user;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cl.service.ICyberService;

@Controller
public class UCustomerController {
	
	private Logger log = Logger.getLogger(this.getClass());
	
	@RequestMapping("/qna/qnaList")
	public String qnaList() throws Exception{
		log.info("qnaList Start!!");
		
		log.info("qnaList End!!");
		return "/qna/qna_list";
	}
	
	@RequestMapping("/infomation/infomation_a")
	public String infomation_a() throws Exception{
		log.info("infomation_a List Start!!");

		log.info("infomation_a End!!");
		return "/infomation/infomation_a";
	}
	@RequestMapping("/agreement/agreementList")
	public String agreementList() throws Exception{
		log.info("agreementList Start!!");
		
		log.info("agreementList End!!");
		return "/agreement/agreement_list";
	}
}
