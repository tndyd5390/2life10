//ũ���� ��Ʈ�ѷ�
package com.cl.controller.user;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.cl.dto.CruiseDTO;
import com.cl.service.ICruiseService;
import com.cl.util.CmmUtil;
import com.cl.util.FileUtil;
import com.cl.util.PageUtil;

@Controller
public class UCruiseController {
	
	private Logger log = Logger.getLogger(this.getClass());
	@Resource(name="CruiseService")
	private ICruiseService cruiseService;

	
	@RequestMapping("/cruise/cruiseMark")
	public String cruiseMark() throws Exception{
		log.info("cruiseMark Start!!");
		
		log.info("cruiseMark End!!");
		return "/cruise/cruise_mark";
	}
	
	@RequestMapping("/cruise/cruisePro")
	public String cruisePro() throws Exception{
		log.info("cruiseProc Start!!");
		
		log.info("cruiseProc End!!");
		return "/cruise/cruise_pro";
	}
	
	@RequestMapping(value="/cruise/cruiseScheduleList")
	public String cruiseScheduleList(HttpServletRequest req, HttpServletResponse resp, Model model, HttpSession session) throws Exception{
		log.info("cruiseScheduleList Start!!!");
		int splitPage = 5;
		
		HashMap<String, Object> hMap = new HashMap<>();
		
		hMap = PageUtil.paging(req, splitPage);
		hMap = cruiseService.getCruiseList(hMap);
		model.addAttribute("hMap", hMap);
		
		hMap = null;
		log.info("cruiseScheduleList End!!!");
		return "/cruise/cruise_schedule";
	}
	
	@RequestMapping(value="/cruise/cruiseDownloadSche")
	public ModelAndView crusieDownLoadSche(HttpServletRequest req, HttpServletResponse resp, Model model, HttpSession session) throws Exception{
		log.info("cruiseDownLoadSche start!!!");
		
		String cruiseNo = CmmUtil.nvl(req.getParameter("cruiseNo"));
		log.info(" cruiseNo : " + cruiseNo);
		
		CruiseDTO cDTO = cruiseService.getCruise(cruiseNo);
		if(cDTO == null) cDTO = new CruiseDTO();
		
		String path = CmmUtil.nvl(cDTO.getCruiseScheFilePath());
		String fileName = CmmUtil.nvl(cDTO.getCruiseScheFileName());;
		String fileOrgName = CmmUtil.nvl(cDTO.getCruiseScheFileOrgName());
		
		File file = new File(path + fileName);
		
		ModelAndView mav = new ModelAndView("download", "downloadFile", file);
		mav.addObject("fileOrgName", fileOrgName);
		log.info("cruiseDownLoadSche end!!!");
		
		return mav;
	}


}