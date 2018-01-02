package com.cl.controller.admin;

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
import com.cl.util.SessionUtil;

@Controller
public class CruiseController {
	
	private Logger log = Logger.getLogger(this.getClass());
	
	private String scheSavePath = "/www/thunder-edu_com/file/cruise/file/";
	//private String scheSavePath = "C:\\Users\\Data3811-32\\git\\2life10\\WebContent\\cruiseFile\\";
	private String imgSavePath = "/www/thunder-edu_com/file/cruise/img/";
	//private String imgSavePath = "C:\\Users\\Data3811-32\\git\\2life10\\WebContent\\cruiseFile\\";
	
	@Resource(name="CruiseService")
	private ICruiseService cruiseService;
	
	/**
	 * @param req
	 * @param resp
	 * @param model
	 * @param session
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="Lmin/cruise/cruiseScheduleList", method={RequestMethod.GET, RequestMethod.POST})
	public String cruiseScheduleList(HttpServletRequest req, HttpServletResponse resp, Model model, HttpSession session) throws Exception{
		log.info(this.getClass() + ".cruiseScheduleList start!!!");
		SessionUtil.sessionCheck(resp, session);
		int splitPage = 5;
		
		HashMap<String, Object> hMap = new HashMap<>();
		
		hMap = PageUtil.paging(req, splitPage);
		hMap = cruiseService.getCruiseList(hMap);
		model.addAttribute("hMap", hMap);
		
		hMap = null;
		log.info(this.getClass() + ".cruiseScheduleList end!!!");
		return "/Lmin/cruise/cruise_schedule";
	}
	
	/**
	 * @param req
	 * @param resp
	 * @param model
	 * @param session
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="Lmin/cruise/cruiseSchduleWriteView", method=RequestMethod.GET)
	public String cruiseSchduleWriteView(HttpServletRequest req, HttpServletResponse resp, Model model, HttpSession session) throws Exception{
		log.info(this.getClass() + ".cruiseSchduleWriteView start!!!");
		SessionUtil.sessionCheck(resp, session);
		log.info(this.getClass() + ".cruiseSchduleWriteView end!!!");
		return "/Lmin/cruise/cruise_schedule_write";
	}
	
	/**
	 * @param req
	 * @param resp
	 * @param model
	 * @param session
	 * @param cruiseScheFile
	 * @param cruiseImgFile
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="Lmin/cruise/cruiseScheduleRegProc", method=RequestMethod.POST)
	public String cruiseScheduleRegProc(HttpServletRequest req, HttpServletResponse resp, Model model, HttpSession session, @RequestParam("cruiseScheFile") MultipartFile cruiseScheFile, @RequestParam("cruiseImgFile") MultipartFile cruiseImgFile) throws Exception{
		log.info(this.getClass() + ".cruiseScheduleRegProc start!!!");
		SessionUtil.sessionCheck(resp, session);
		String regMemberNo = CmmUtil.nvl((String)session.getAttribute("ss_member_no"));
		log.info(" regMemberNo : " + regMemberNo);
		String cruiseName = CmmUtil.nvl(req.getParameter("cruiseName"));
		log.info(" cruiseName : " + cruiseName);
		String cruiseShipName = CmmUtil.nvl(req.getParameter("cruiseShipName"));
		log.info(" cruiseShipName : " + cruiseShipName);
		String cruisePrice = CmmUtil.nvl(req.getParameter("cruisePrice"));
		log.info(" cruisePrice : "  + cruisePrice);
		String cruiseAccomodation = CmmUtil.nvl(req.getParameter("cruiseAccomodation"));
		log.info(" cruiseAccomodation : " + cruiseAccomodation);
		String cruiseCabinCode = CmmUtil.nvl(req.getParameter("cruiseCabinCode"));
		log.info(" cruiseCabinCode : " + cruiseCabinCode);
		String startYear = CmmUtil.nvl(req.getParameter("startYear"));
		log.info(" startYear : " + startYear);
		String startMonth = CmmUtil.nvl(req.getParameter("startMonth"));
		log.info(" startMonth : " + startMonth);
		if(Integer.parseInt(startMonth) < 10) startMonth = "0" + startMonth;
		String startDay = CmmUtil.nvl(req.getParameter("startDay"));
		log.info(" startDay : " + startDay);
		if(Integer.parseInt(startDay) < 10) startDay = "0" + startDay;
		String endYear = CmmUtil.nvl(req.getParameter("endYear"));
		log.info(" endYear : " + endYear);
		String endMonth = CmmUtil.nvl(req.getParameter("endMonth"));
		log.info(" endMonth : " + endMonth);
		if(Integer.parseInt(endMonth) < 10) endMonth = "0" + endMonth;
		String endDay = CmmUtil.nvl(req.getParameter("endDay"));
		log.info(" endDay : " + endDay);
		if(Integer.parseInt(endDay) < 10) endDay = "0" + endDay;
		String cruiseEtc = CmmUtil.nvl(req.getParameter("cruiseEtc"));
		log.info(" cruiseEtc : " + cruiseEtc);
		
		String orgScheFileName = CmmUtil.nvl(cruiseScheFile.getOriginalFilename());
		log.info(" cruiseScheFileName : " + orgScheFileName);
		String orgImgFileName = CmmUtil.nvl(cruiseImgFile.getOriginalFilename());
		log.info(" cruiseImgFileName : " + orgImgFileName);

		String reScheFileName = FileUtil.fileSave(cruiseScheFile, scheSavePath);
		String reImgFileName = FileUtil.fileSave(cruiseImgFile, imgSavePath);
		
		CruiseDTO cDTO = new CruiseDTO();
		cDTO.setCruiseShipName(cruiseShipName);
		cDTO.setCruiseStartDay(startYear + startMonth + startDay);
		cDTO.setCruiseEndDay(endYear + endMonth + endDay);
		cDTO.setCruiseName(cruiseName);
		cDTO.setCruiseAccomodation(cruiseAccomodation);
		cDTO.setCruiseCabinCode(cruiseCabinCode);
		cDTO.setCruiseEtc(cruiseEtc);
		cDTO.setRegMemberNo(regMemberNo);
		cDTO.setCruiseImgFileName(reImgFileName);
		cDTO.setCruiseImgFileOrgName(orgImgFileName);
		cDTO.setCruiseScheFileName(reScheFileName);
		cDTO.setCruiseScheFileOrgName(orgScheFileName);
		cDTO.setCruiseImgFilePath(imgSavePath);
		cDTO.setCruiseScheFilePath(scheSavePath);
		cDTO.setCruisePrice(cruisePrice);
		
		int result = cruiseService.insertCruise(cDTO);
		
		if(result != 0){
			model.addAttribute("msg", "크루즈일정 등록에 성공했습니다.");
		}else{
			model.addAttribute("msg", "크루즈일정 등록에 실패했습니다.");
		}
		model.addAttribute("url", "/Lmin/cruise/cruiseScheduleList.do");
		
		regMemberNo = null;
		cruiseName = null;
		cruiseShipName = null;
		cruisePrice = null;
		cruiseAccomodation = null;
		cruiseCabinCode = null;
		startYear = null;
		startMonth = null;
		startDay = null;
		endYear = null;
		endMonth = null;
		endDay = null;
		cruiseEtc = null;
		orgScheFileName = null;
		orgImgFileName = null;
		reScheFileName = null;
		reImgFileName = null;
		cDTO = null;
		log.info(this.getClass() + ".cruiseScheduleRegProc end!!!");
		return "/alert";
	}
	
	/**
	 * @param req
	 * @param resp
	 * @param model
	 * @param session
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="Lmin/cruise/deleteCruise", method=RequestMethod.POST)
	public String deleteCruise(HttpServletRequest req, HttpServletResponse resp, Model model, HttpSession session) throws Exception{
		log.info(this.getClass() + ".deleteCruise start!!!");
		SessionUtil.sessionCheck(resp, session);
		String cruiseNo = CmmUtil.nvl(req.getParameter("cruiseNo"));
		log.info(" cruiseNo : " + cruiseNo);
		String cruiseImgFileNo = CmmUtil.nvl(req.getParameter("cruiseImgFileNo"));
		log.info(" cruiseImgFileNo : " + cruiseImgFileNo);
		String cruiseScheFileNo = CmmUtil.nvl(req.getParameter("cruiseScheFileNo"));
		log.info(" cruiseScheFileNo : " + cruiseScheFileNo);
		
		CruiseDTO cDTO = new CruiseDTO();
		cDTO.setCruiseNo(cruiseNo);
		cDTO.setCruiseImgFileNo(Integer.parseInt(cruiseImgFileNo));
		cDTO.setCruiseScheFileNo(Integer.parseInt(cruiseScheFileNo));
		String[] fileNoArr = {cruiseImgFileNo, cruiseScheFileNo};
		cDTO.setFileNoArr(fileNoArr);
		
		Map<String, String> fileNames = cruiseService.deleteCruise(cDTO);
		if(fileNames == null){
			model.addAttribute("msg", "크루즈일정 삭제에 실패했습니다.");
			model.addAttribute("url", "/Lmin/cruise/cruiseScheduleList.do");
			return "/alert";
		}else{
			FileUtil.deleteFile(fileNames.get("imgFullPath"));
			FileUtil.deleteFile(fileNames.get("pdfFullPath"));
		}
		log.info(this.getClass() + ".deleteCruise end!!!");
		
		cruiseNo = null;
		cruiseImgFileNo = null;
		cruiseScheFileNo = null;
		cDTO = null;
		fileNoArr = null;
		fileNames = null;
		
		return "redirect:/Lmin/cruise/cruiseScheduleList.do";
	}
	
	/**
	 * @param req
	 * @param resp
	 * @param model
	 * @param session
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="Lmin/cruise/updateCruiseView", method=RequestMethod.GET)
	public String updateCruise(HttpServletRequest req, HttpServletResponse resp, Model model, HttpSession session) throws Exception{
		log.info(this.getClass() + ".updateCruise start!!!");
		SessionUtil.sessionCheck(resp, session);
		String cruiseNo = CmmUtil.nvl(req.getParameter("cruiseNo"));
		log.info(" cruiseNo : " + cruiseNo);
		
		CruiseDTO cDTO = cruiseService.getCruise(cruiseNo);
		if(cDTO == null) cDTO = new CruiseDTO();
		
		model.addAttribute("cDTO", cDTO);
		
		cruiseNo = null;;
		cDTO = null;
		log.info(this.getClass() + ".updateCruise end!!!");
		return "/Lmin/cruise/cruise_schedule_updateView";
	}
	
	/**
	 * @param req
	 * @param resp
	 * @param model
	 * @param session
	 * @param cruiseScheFile
	 * @param cruiseImgFile
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="Lmin/cruise/cruiseScheduleUpdateProc", method=RequestMethod.POST)
	public String updateCruiseProc(HttpServletRequest req, HttpServletResponse resp, Model model, HttpSession session, @RequestParam("cruiseScheFile") MultipartFile cruiseScheFile, @RequestParam("cruiseImgFile") MultipartFile cruiseImgFile) throws Exception{
		log.info(this.getClass() + ".updateCruiseProc start!!!");
		SessionUtil.sessionCheck(resp, session);
		String cruiseNo = CmmUtil.nvl(req.getParameter("cruiseNo"));
		log.info(" cruiseNo : " + cruiseNo);
		String chgMemberNo = CmmUtil.nvl((String)session.getAttribute("ss_member_no"));
		log.info(" chgMemberNo : " + chgMemberNo);
		String regMemberNo = CmmUtil.nvl((String)session.getAttribute("ss_member_no"));
		log.info(" regMemberNo : " + regMemberNo);
		String cruiseName = CmmUtil.nvl(req.getParameter("cruiseName"));
		log.info(" cruiseName : " + cruiseName);
		String cruiseShipName = CmmUtil.nvl(req.getParameter("cruiseShipName"));
		log.info(" cruiseShipName : " + cruiseShipName);
		String cruisePrice = CmmUtil.nvl(req.getParameter("cruisePrice"));
		log.info(" cruisePrice : "  + cruisePrice);
		String cruiseAccomodation = CmmUtil.nvl(req.getParameter("cruiseAccomodation"));
		log.info(" cruiseAccomodation : " + cruiseAccomodation);
		String cruiseCabinCode = CmmUtil.nvl(req.getParameter("cruiseCabinCode"));
		log.info(" cruiseCabinCode : " + cruiseCabinCode);
		String startYear = CmmUtil.nvl(req.getParameter("startYear"));
		log.info(" startYear : " + startYear);
		String startMonth = CmmUtil.nvl(req.getParameter("startMonth"));
		log.info(" startMonth : " + startMonth);
		if(Integer.parseInt(startMonth) < 10) startMonth = "0" + startMonth;
		String startDay = CmmUtil.nvl(req.getParameter("startDay"));
		log.info(" startDay : " + startDay);
		if(Integer.parseInt(startDay) < 10) startDay = "0" + startDay;
		String endYear = CmmUtil.nvl(req.getParameter("endYear"));
		log.info(" endYear : " + endYear);
		String endMonth = CmmUtil.nvl(req.getParameter("endMonth"));
		log.info(" endMonth : " + endMonth);
		if(Integer.parseInt(endMonth) < 10) endMonth = "0" + endMonth;
		String endDay = CmmUtil.nvl(req.getParameter("endDay"));
		log.info(" endDay : " + endDay);
		if(Integer.parseInt(endDay) < 10) endDay = "0" + endDay;
		String cruiseEtc = CmmUtil.nvl(req.getParameter("cruiseEtc"));
		log.info(" cruiseEtc : " + cruiseEtc);
		String cruiseImgFileNo = CmmUtil.nvl(req.getParameter("cruiseImgFileNo"));
		log.info(" cruiseImgFileNo : " + cruiseImgFileNo);
		String cruiseScheFileNo = CmmUtil.nvl(req.getParameter("cruiseScheFileNo"));
		log.info(" cruiseScheFileNo : " + cruiseScheFileNo);
		String imgFileName = CmmUtil.nvl(req.getParameter("imgFileName"));
		log.info(" imgFileName : " + imgFileName);
		String scheFileName = CmmUtil.nvl(req.getParameter("scheFileName"));
		log.info(" scheFileName : " + scheFileName);
		
		
		CruiseDTO cDTO = new CruiseDTO();
		cDTO.setCruiseNo(cruiseNo);
		cDTO.setChgMemberNo(chgMemberNo);
		cDTO.setCruiseShipName(cruiseShipName);
		cDTO.setCruiseStartDay(startYear + startMonth + startDay);
		cDTO.setCruiseEndDay(endYear + endMonth + endDay);
		cDTO.setCruiseName(cruiseName);
		cDTO.setCruiseAccomodation(cruiseAccomodation);
		cDTO.setCruiseCabinCode(cruiseCabinCode);
		cDTO.setCruiseEtc(cruiseEtc);
		cDTO.setCruiseImgFilePath(imgSavePath);
		cDTO.setCruiseScheFilePath(scheSavePath);
		cDTO.setCruisePrice(cruisePrice);
		cDTO.setCruiseImgFileNo(Integer.parseInt(cruiseImgFileNo));
		cDTO.setCruiseScheFileNo(Integer.parseInt(cruiseScheFileNo));
		cDTO.setRegMemberNo(regMemberNo);
		
		String reScheFileName = "";
		String reImgFileName = "";
		
		String orgScheFileName = CmmUtil.nvl(cruiseScheFile.getOriginalFilename());
		log.info(" cruiseScheFileName : " + orgScheFileName);
		String orgImgFileName = CmmUtil.nvl(cruiseImgFile.getOriginalFilename());
		log.info(" cruiseImgFileName : " + orgImgFileName);
		
		if(!"".equals(orgScheFileName)){
			reScheFileName = FileUtil.fileSave(cruiseScheFile, scheSavePath);
			FileUtil.deleteFile(scheSavePath, scheFileName);
			cDTO.setCruiseScheFileName(reScheFileName);
			cDTO.setCruiseScheFileOrgName(orgScheFileName);
		}else{
			cDTO.setCruiseScheFileName(null);
			cDTO.setCruiseScheFileOrgName(null);
		}
		
		if(!"".equals(orgImgFileName)){
			reImgFileName = FileUtil.fileSave(cruiseImgFile, imgSavePath);
			FileUtil.deleteFile(imgSavePath, imgFileName);
			cDTO.setCruiseImgFileName(reImgFileName);
			cDTO.setCruiseImgFileOrgName(orgImgFileName);
		}else{
			cDTO.setCruiseImgFileName(null);
			cDTO.setCruiseImgFileOrgName(null);
		}
		
		boolean result = cruiseService.updateCruise(cDTO);
		
		if(result){
			model.addAttribute("msg", "크루즈일정 수정에 성공했습니다.");
			model.addAttribute("url", "/Lmin/cruise/cruiseScheduleList.do");
		}else{
			model.addAttribute("msg", "크루즈일정 수정에 실패했습니다.");
			model.addAttribute("url", "/Lmin/cruise/updateCruiseView.do?cruiseNo=" + cruiseNo);
		}
		
		cruiseNo = null;
		chgMemberNo = null;
		regMemberNo = null;
		cruiseName = null;
		cruiseShipName = null;;
		cruisePrice = null;
		cruiseAccomodation = null;
		cruiseCabinCode = null;
		startYear = null;
		startMonth = null;
		startDay = null;
		endYear = null;
		endMonth = null;
		endDay = null;
		cruiseEtc = null;
		cruiseImgFileNo = null;
		cruiseScheFileNo = null;
		imgFileName = null;
		scheFileName = null;
		cDTO = null;
		
		log.info(this.getClass() + ".updateCruiseProc end!!!");
		return "/alert";
	}
	
	/**
	 * @param req
	 * @param resp
	 * @param model
	 * @param session
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="Lmin/cruise/cruiseDownloadSche", method=RequestMethod.GET)
	public ModelAndView crusieDownLoadSche(HttpServletRequest req, HttpServletResponse resp, Model model, HttpSession session) throws Exception{
		log.info(this.getClass() + ".cruiseDownLoadSche start!!!");
		SessionUtil.sessionCheck(resp, session);
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
		log.info(this.getClass() + ".cruiseDownLoadSche end!!!");
		
		return mav;
	}
	
	@RequestMapping(value="Lmin/cruise/cruiseChangeOrder", method=RequestMethod.GET)
	public String cruiseChangeOrder(HttpServletRequest req, HttpServletResponse resp, Model model, HttpSession session) throws Exception{
		log.info(this.getClass() + ".cruiseChangeOrder start!!!");
		SessionUtil.sessionCheck(resp, session);
		int splitPage = 5;
		
		HashMap<String, Object> hMap = new HashMap<>();
		
		hMap = PageUtil.paging(req, splitPage);
		hMap = cruiseService.getCruiseList(hMap);
		model.addAttribute("hMap", hMap);
		
		hMap = null;
		log.info(this.getClass() + ".cruiseChangeOrder end!!!");
		return "/Lmin/cruise/cruise_change_order";
	}
	
	@RequestMapping(value="Lmin/cruise/doOrderByCruise", method=RequestMethod.POST)
	public String orderByCruise(HttpServletRequest req, HttpServletResponse resp, Model model, HttpSession session) throws Exception{
		log.info(this.getClass() + ".orderByCruise start!!!");
		SessionUtil.sessionCheck(resp, session);
		String[] cruiseList = req.getParameterValues("cruiseNo");
		
		boolean result = cruiseService.orderByCruise(cruiseList);
		if(result){
			//order success
			model.addAttribute("msg", "크루즈일정 정렬에 성공했습니다.");
		}else{
			//order fail
			model.addAttribute("msg", "크루즈일정 정렬에 실패했습니다.");
		}
		model.addAttribute("url", "/Lmin/cruise/cruiseScheduleList.do");
		
		cruiseList = null;
		
		log.info(this.getClass() + ".orderByCruise end!!!");
		return "/alert";
	}
	
}