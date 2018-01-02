//������ȸ ��Ʈ�ѷ�
package com.cl.controller.user;

import java.util.HashMap;

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
import com.cl.util.PageUtil;

@Controller
public class UAdviceController {
	
	private Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="AdviceService")
	private IAdviceService adviceService;
	

	@RequestMapping(value="/company/adviceList")
	public String adviceList(HttpServletRequest req, HttpServletResponse resp, Model model, HttpSession session) throws Exception{
		log.info(this.getClass() + ".adviceList start!!!");
		int splitPage = 10;
		
		HashMap<String, Object> hMap = new HashMap<>();
		
		hMap = PageUtil.paging(req, splitPage);
		hMap = adviceService.getAdviceList(hMap);
		model.addAttribute("hMap", hMap);
		
		hMap = null;
		
		log.info(this.getClass() + ".adviceList end!!!");
		return "/company/advice";
	}
	
}
