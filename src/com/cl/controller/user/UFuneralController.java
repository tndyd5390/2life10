//������ʽü��ȳ� ��Ʈ�ѷ�
package com.cl.controller.user;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cl.service.IFuneralInfoService;

@Controller
public class UFuneralController {
	
	private Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="FuneralInfoService")
	private IFuneralInfoService funeralInfoService;
	
	@RequestMapping("/funeral/funeralMark")
	public String funeralMark() throws Exception{
		log.info("funeralMark Start!!");
		
		log.info("funeralMark End!!");
		return "/funeral/funeral_mark";
	}
	
	@RequestMapping("/funeral/funeralList_a")
	public String funeralList_a(HttpServletRequest req) throws Exception{
		log.info("funeralList_a Start!!");
		
		log.info("funeralList_a End!!");
		return "/funeral/funeral_list_a";
	}
	
	@RequestMapping("/funeral/funeralList_b")
	public String funeralList_b(HttpServletRequest req) throws Exception{
		log.info("funeralList_b Start!!");
		log.info("test" + req.getParameter("menuNum"));
		log.info("funeralList_b End!!");
		return "/funeral/funeral_list_b";
	}	
	
	@RequestMapping("/funeral/funeralList_c")
	public String funeralList_c() throws Exception{
		log.info("funeralList_c Start!!");
		
		log.info("funeralList_c End!!");
		return "/funeral/funeral_list_c";
	}	
	
	@RequestMapping("/funeral/funeralList_d")
	public String funeralList_d() throws Exception{
		log.info("funeralList_d Start!!");
		
		log.info("funeralList_d End!!");
		return "/funeral/funeral_list_d";
	}
	
	@RequestMapping("/funeral/funeralInfo_a")
	public String funeralInfo_a() throws Exception{
		log.info("funeralInfo_a Start!!");
		log.info("funeralInfo_a End!!");
		return "/funeral/funeral_info_a";
	}
	
	@RequestMapping("/funeral/funeralInfo_b")
	public String funeralInfo_b() throws Exception{
		log.info("funeralInfo_b Start!!");
		
		log.info("funeralInfo_b End!!");
		return "/funeral/funeral_info_b";
	}
	
	@RequestMapping("/funeral/funeralInfo_c")
	public String funeralInfo_c() throws Exception{
		log.info("funeralInfo_c Start!!");
		
		log.info("funeralInfo_c End!!");
		return "/funeral/funeral_info_c";
	}
}
