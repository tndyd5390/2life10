//���̹�ȫ�� ��Ʈ�ѷ�
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

import com.cl.dto.CyberDTO;
import com.cl.service.ICyberService;
import com.cl.util.CmmUtil;
import com.cl.util.PageUtil;

@Controller
public class UCyberController {
	
	private Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="CyberService")
	private ICyberService cyberService;
	
	@RequestMapping("/company/cyberList")
	public String cyber(HttpServletRequest req, HttpServletResponse resp, Model model, HttpSession sesion) throws Exception{
		log.info(this.getClass() + ".cyberList Start!!");
		int splitPage = 10;
		
		HashMap<String, Object> hMap = new HashMap<>();
		hMap = PageUtil.paging(req, splitPage);
		hMap = cyberService.getCyberList(hMap);

		model.addAttribute("hMap", hMap);
		
		log.info(this.getClass() + ".cyberList End!!");
		return "/company/cyber";
	}
	
	@RequestMapping(value="/company/cyberDetail")
	public String cyberDetail(HttpServletRequest req, HttpServletResponse resp, Model model, HttpSession session) throws Exception{
		log.info(this.getClass() + ".cyberDetail start!!!");
		
		String cyberNo = CmmUtil.nvl(req.getParameter("cyberNo"));
		log.info(" cyberNo : " + cyberNo);
		
		CyberDTO cDTO = cyberService.getCyberDetail(cyberNo);
		if(cDTO == null) cDTO= new CyberDTO();
		
		model.addAttribute("cDTO", cDTO);
		
		log.info(this.getClass() + ".cyberDetail end!!!");
		return "/company/cyber_detail";
	}
}
