//���ù��� ��Ʈ�ѷ�
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

import com.cl.dto.RegulationDTO;
import com.cl.service.IRegulationService;
import com.cl.util.CmmUtil;
import com.cl.util.PageUtil;

@Controller
public class URegulationController {
	
	private Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="RegulationService")
	private IRegulationService regulationService;
	private String regulationSavePath = "C:\\Users\\Data3811-32\\git\\2life10\\WebContent\\regulationFile\\";

	@RequestMapping(value="/regulation/regulationList")
	public String regulationList(HttpServletRequest req, HttpServletResponse resp, Model model, HttpSession session) throws Exception{
		log.info(this.getClass() + ".regulationList start!!!");
		
		int splitPage = 10;
		
		HashMap<String, Object> hMap = new HashMap<>();
		hMap = PageUtil.paging(req, splitPage);
		hMap = regulationService.getRegulationList(hMap);
		model.addAttribute("hMap", hMap);
		
		hMap = null;
		log.info(this.getClass() + ".regulation end!!!");
		return "/regulation/regulation_list";
	}
		
	@RequestMapping(value="/regulation/regulationDetail")
	public String regulationDetail(HttpServletRequest req, HttpServletResponse resp, Model model, HttpSession sessino) throws Exception{
		log.info(this.getClass() + ".regulationDetail start!!!");
		
		String regulationNo = CmmUtil.nvl(req.getParameter("regulationNo"));
		log.info(" regulationNo : " + regulationNo);
		
		RegulationDTO rDTO = regulationService.getRegulationDetail(regulationNo);
		if(rDTO == null) rDTO = new RegulationDTO();
		
		model.addAttribute("rDTO", rDTO);
		
		regulationNo = null;
		rDTO = null;
		log.info(this.getClass() + ".regulationDetail end!!!");
		return "/regulation/regulation_view";
	}

}
