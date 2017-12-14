//������ȸ ��Ʈ�ѷ�
package com.cl.controller.user;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cl.dto.CatalogueDTO;
import com.cl.service.ICatalogueService;

@Controller
public class UCatalogueController {
	
	private Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="CatalogueService")
	private ICatalogueService catalogueService;

	@RequestMapping("/info/catalogue")
	public String catalogue(Model model) throws Exception{
		log.info("catalogue Start!!");
		
		int rowNum = 3;
		
		CatalogueDTO cDTO = new CatalogueDTO();
		List<CatalogueDTO> cList = new ArrayList<>();
		
		cDTO.setRowNum(rowNum);
		cList = catalogueService.getUserCatalogueList(cDTO);
		
		model.addAttribute("cList", cList);
		
		cList = null;
		cDTO = null;
		log.info("catalogue End!!");
		return "/info/catalogue";
	}
	
	@RequestMapping("/info/endPro")
	public String endPro(Model model) throws Exception{
		log.info("endPro Start!!");
		
		int rowNum = 2;
		
		CatalogueDTO cDTO = new CatalogueDTO();
		List<CatalogueDTO> cList = new ArrayList<>();
		
		cDTO.setRowNum(rowNum);
		cList = catalogueService.getUserCatalogueList(cDTO);
		
		model.addAttribute("cList", cList);
		
		cList = null;
		cDTO = null;
		
		log.info("endPro End!!");
		return "/info/end_pro";
	}
}
