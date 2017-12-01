//���ù��� ��Ʈ�ѷ�
package com.cl.controller.admin;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.cl.service.IRegulationService;

@Controller
public class RegulationController {
	
	private Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="RegulationService")
	private IRegulationService regulationService;
	
	@RequestMapping(value="Lmin/regulation/regulationList", method= {RequestMethod.GET, RequestMethod.POST})
	public String regulationList(HttpServletRequest req, HttpServletResponse resp, Model model, HttpSession session) throws Exception{
		log.info(this.getClass() + ".regulationList start!!!");
		
		log.info(this.getClass() + ".regulation end!!!");
		return "/Lmin/regulation/regulation_list";
	}
	
	@RequestMapping(value="Lmin/regulation/regulationRegView", method=RequestMethod.GET)
	public String regulationRegView(HttpServletRequest req, HttpServletResponse resp, Model model, HttpSession session) throws Exception{
		log.info(this.getClass() + ".regulationRegView start!!!");
		
		log.info(this.getClass() + ".regulationRegView end!!!");
		return "/Lmin/regulation/regulation_write";
	}
	
}
