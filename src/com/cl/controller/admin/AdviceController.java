//������ȸ ��Ʈ�ѷ�
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

import com.cl.service.IAdviceService;

@Controller
public class AdviceController {
	
	private Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="AdviceService")
	private IAdviceService adviceService;
	
	@RequestMapping(value="Lmin/company/adviceList", method=RequestMethod.GET)
	public String adviceList(HttpServletRequest req, HttpServletResponse resp, Model model, HttpSession session) throws Exception{
		log.info(this.getClass() + ".adviceList start!!!");
		
		
		
		log.info(this.getClass() + ".adviceList end!!!");
		return null;
	}
}
