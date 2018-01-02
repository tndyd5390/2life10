//���̹�ȫ�� ��Ʈ�ѷ�
package com.cl.controller.user;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UMarryController {
	
	private Logger log = Logger.getLogger(this.getClass());
	
	@RequestMapping("/marry/marryMark")
	public String marryMark() throws Exception{
		log.info("marryMark Start!!");
		log.info("marryMark End!!");
		return "/marry/marry_mark";
	}
	
	@RequestMapping("/marry/marryList_d")
	public String marryList_d() throws Exception{
		log.info("marryList_d Start!!");
		log.info("marryList_d End!!");
		return "/marry/marry_list_d";
	}
	
	@RequestMapping("/marry/marryList_a")
	public String marryList_a() throws Exception{
		log.info("marryList_a Start!!");
		log.info("marryList_a End!!");
		return "/marry/marry_list_a";
	}
	
	@RequestMapping("/marry/marryList_b")
	public String marryList_b() throws Exception{
		log.info("marryList_b Start!!");
		log.info("marryList_b End!!");
		return "/marry/marry_list_b";
	}
	
	@RequestMapping("/marry/marryList_c")
	public String marryList_c() throws Exception{
		log.info("marryList_c Start!!");
		log.info("marryList_c End!!");
		return "/marry/marry_list_c";
	}
}
