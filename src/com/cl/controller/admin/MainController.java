//������ȸ ��Ʈ�ѷ�
package com.cl.controller.admin;

import java.util.HashMap;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cl.service.IMainService;

@Controller
public class MainController {
	
	private Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="MainService")
	private IMainService mainService;

	@RequestMapping("/main")
	public String main(Model model) throws Exception{
		log.info("main Start!!");
		
		HashMap<String, Object> hMap = new HashMap<>();
		hMap = mainService.getMainList();
		
		model.addAttribute("hMap", hMap);
		hMap = null;
		log.info("main End!!");
		return "/index";
	}
}
