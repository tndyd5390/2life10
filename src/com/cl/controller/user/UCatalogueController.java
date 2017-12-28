//������ȸ ��Ʈ�ѷ�
package com.cl.controller.user;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.cl.dto.CatalogueDTO;
import com.cl.service.ICatalogueService;
import com.cl.util.CmmUtil;
import com.cl.util.SessionUtil;

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

	@RequestMapping("/catalogue/catalogueDownload")
	public ModelAndView catalogueDownload(HttpServletRequest req, HttpServletResponse resp, HttpSession session) throws Exception{
		log.info("catalogueDownLoad Start!!");
		String catalogueNo = CmmUtil.nvl(req.getParameter("cNo"));
		
		log.info("catalogueNo : "+catalogueNo);
		
		CatalogueDTO cDTO = new CatalogueDTO();
		cDTO = catalogueService.getCatalogueFile(catalogueNo);
		
		String path = CmmUtil.nvl(cDTO.getCatalogueFilePath());
		String fileName = CmmUtil.nvl(cDTO.getCatalogueFileName());
		String fileOrgName = CmmUtil.nvl(cDTO.getCatalogueFileOrgName());
		
		log.info("path : " +path);
		log.info("fileName : " +fileName);
		log.info("fileOrgName : " +fileOrgName);
		File file = new File(path + fileName);
		
		ModelAndView mav = new ModelAndView("download", "downloadFile", file);
		mav.addObject("fileOrgName", fileOrgName);
		
		log.info("catalogueDownLoad End!!");
		return mav;
	}
}
