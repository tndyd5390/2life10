//크占쏙옙占쏙옙 占쏙옙트占싼뤄옙
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

@Controller
public class CruiseController {
	
	private Logger log = Logger.getLogger(this.getClass());
	
	//�겕猷⑥쫰 �씪�젙�뙆�씪�씠 ���옣�맆 寃쎈줈
	private String scheSavePath = "/www/thunder-edu_com/file/cruise/file/";
	//�겕猷⑥쫰 �씠誘몄� �뙆�씪�씠 ���옣�맆 寃쎈줈
	private String imgSavePath = "/www/thunder-edu_com/file/cruise/img/";
	
	@Resource(name="CruiseService")
	private ICruiseService cruiseService;
	
	/**
	 * @param req
	 * @param resp
	 * @param model
	 * @param session
	 * @return
	 * @throws Exception
	 * �겕猷⑥쫰 由ъ뒪�듃 �솕硫� 硫붿냼�뱶
	 */
	@RequestMapping(value="Lmin/cruise/cruiseScheduleList", method={RequestMethod.GET, RequestMethod.POST})
	public String cruiseScheduleList(HttpServletRequest req, HttpServletResponse resp, Model model, HttpSession session) throws Exception{
		log.info(this.getClass() + ".cruiseScheduleList start!!!");
		//�븳 �솕硫댁뿉 蹂댁뿬以� �겕猷⑥쫰 媛��닔
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
	 * �겕猷⑥쫰 �벑濡� �솕硫댁쑝濡� �씠�룞�븯�뒗 硫붿냼�뱶
	 */
	@RequestMapping(value="Lmin/cruise/cruiseSchduleWriteView", method=RequestMethod.GET)
	public String cruiseSchduleWriteView(HttpServletRequest req, HttpServletResponse resp, Model model, HttpSession session) throws Exception{
		log.info(this.getClass() + ".cruiseSchduleWriteView start!!!");
		
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
	 * �겕猷⑥쫰 �벑濡� 硫붿냼�뱶
	 */
	@RequestMapping(value="Lmin/cruise/cruiseScheduleRegProc", method=RequestMethod.POST)
	public String cruiseScheduleRegProc(HttpServletRequest req, HttpServletResponse resp, Model model, HttpSession session, @RequestParam("cruiseScheFile") MultipartFile cruiseScheFile, @RequestParam("cruiseImgFile") MultipartFile cruiseImgFile) throws Exception{
		log.info(this.getClass() + ".cruiseScheduleRegProc start!!!");
		
		//�벑濡앹옄 �쉶�썝踰덊샇
		String regMemberNo = CmmUtil.nvl((String)session.getAttribute("ss_member_no"));
		log.info(" regMemberNo : " + regMemberNo);
		//�겕猷⑥쫰 �씠由�
		String cruiseName = CmmUtil.nvl(req.getParameter("cruiseName"));
		log.info(" cruiseName : " + cruiseName);
		//�꽑�궗�씠由�
		String cruiseShipName = CmmUtil.nvl(req.getParameter("cruiseShipName"));
		log.info(" cruiseShipName : " + cruiseShipName);
		//媛�寃�
		String cruisePrice = CmmUtil.nvl(req.getParameter("cruisePrice"));
		log.info(" cruisePrice : "  + cruisePrice);
		//�깙�듅�씤�썝
		String cruiseAccomodation = CmmUtil.nvl(req.getParameter("cruiseAccomodation"));
		log.info(" cruiseAccomodation : " + cruiseAccomodation);
		//罹먮퉰
		String cruiseCabinCode = CmmUtil.nvl(req.getParameter("cruiseCabinCode"));
		log.info(" cruiseCabinCode : " + cruiseCabinCode);
		//異쒕컻�뀈�룄
		String startYear = CmmUtil.nvl(req.getParameter("startYear"));
		log.info(" startYear : " + startYear);
		//異쒕컻�썡
		String startMonth = CmmUtil.nvl(req.getParameter("startMonth"));
		log.info(" startMonth : " + startMonth);
		if(Integer.parseInt(startMonth) < 10) startMonth = "0" + startMonth;
		//異쒕컻�씪
		String startDay = CmmUtil.nvl(req.getParameter("startDay"));
		log.info(" startDay : " + startDay);
		if(Integer.parseInt(startDay) < 10) startDay = "0" + startDay;
		//醫낅즺�뀈�룄
		String endYear = CmmUtil.nvl(req.getParameter("endYear"));
		log.info(" endYear : " + endYear);
		//醫낅즺�썡
		String endMonth = CmmUtil.nvl(req.getParameter("endMonth"));
		log.info(" endMonth : " + endMonth);
		if(Integer.parseInt(endMonth) < 10) endMonth = "0" + endMonth;
		//醫낅즺�씪
		String endDay = CmmUtil.nvl(req.getParameter("endDay"));
		log.info(" endDay : " + endDay);
		if(Integer.parseInt(endDay) < 10) endDay = "0" + endDay;
		//湲곕떎
		String cruiseEtc = CmmUtil.nvl(req.getParameter("cruiseEtc"));
		log.info(" cruiseEtc : " + cruiseEtc);
		
		//�썝�옒 �뙆�씪 �씠由꾨뱾
		String orgScheFileName = CmmUtil.nvl(cruiseScheFile.getOriginalFilename());
		log.info(" cruiseScheFileName : " + orgScheFileName);
		String orgImgFileName = CmmUtil.nvl(cruiseImgFile.getOriginalFilename());
		log.info(" cruiseImgFileName : " + orgImgFileName);

		//���옣�맂 �뙆�씪�쓽 �씠由�
		String reScheFileName = FileUtil.fileSave(cruiseScheFile, scheSavePath);
		String reImgFileName = FileUtil.fileSave(cruiseImgFile, imgSavePath);
		
		//�벑濡앺븷 cruiseDTO�꽭�똿
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
		
		//�겕猷⑥쫰 �벑濡�
		int result = cruiseService.insertCruise(cDTO);
		
		if(result != 0){
			model.addAttribute("msg", "�겕猷⑥쫰 �긽�뭹 �벑濡앹뿉 �꽦怨듯뻽�뒿�땲�떎.");
		}else{
			model.addAttribute("msg", "�겕猷⑥쫰 �긽�뭹 �벑濡앹뿉 �떎�뙣�뻽�뒿�땲�떎.");
		}
		model.addAttribute("url", "/Lmin/cruise/cruiseScheduleList.do");
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
	 * �겕猷⑥쫰 �궘�젣 硫붿냼�뱶
	 */
	@RequestMapping(value="Lmin/cruise/deleteCruise", method=RequestMethod.POST)
	public String deleteCruise(HttpServletRequest req, HttpServletResponse resp, Model model, HttpSession session) throws Exception{
		log.info(this.getClass() + ".deleteCruise start!!!");
		
		//�겕猷⑥쫰 踰덊샇
		String cruiseNo = CmmUtil.nvl(req.getParameter("cruiseNo"));
		log.info(" cruiseNo : " + cruiseNo);
		//�겕猷⑥쫰 �씠誘몄� �뙆�씪 踰덊샇
		String cruiseImgFileNo = CmmUtil.nvl(req.getParameter("cruiseImgFileNo"));
		log.info(" cruiseImgFileNo : " + cruiseImgFileNo);
		//�겕猷⑥쫰 �씪�젙 �뙆�씪 踰덊샇
		String cruiseScheFileNo = CmmUtil.nvl(req.getParameter("cruiseScheFileNo"));
		log.info(" cruiseScheFileNo : " + cruiseScheFileNo);
		
		//�궘�젣�븷 cruiseDTO�꽭�똿
		CruiseDTO cDTO = new CruiseDTO();
		cDTO.setCruiseNo(cruiseNo);
		cDTO.setCruiseImgFileNo(Integer.parseInt(cruiseImgFileNo));
		cDTO.setCruiseScheFileNo(Integer.parseInt(cruiseScheFileNo));
		String[] fileNoArr = {cruiseImgFileNo, cruiseScheFileNo};
		cDTO.setFileNoArr(fileNoArr);
		
		//�겕猷⑥쫰 �씠誘몄��� �씪�젙�뙆�씪�쓣 �궘�젣�븯湲� �쐞�빐 delete�썑 媛곴컖�쓽 �뙆�씪�씠由꾩쓣 媛��졇�삩�떎.
		Map<String, String> fileNames = cruiseService.deleteCruise(cDTO);
		if(fileNames == null){
			model.addAttribute("msg", "�겕猷⑥쫰 �긽�뭹 �궘�젣�뿉 �떎�뙣�뻽�뒿�땲�떎.");
			model.addAttribute("url", "/Lmin/cruise/cruiseScheduleList.do");
			return "/alert";
		}else{
			//媛곴컖�쓽 �뙆�씪 �궘�젣
			FileUtil.deleteFile(fileNames.get("imgFullPath"));
			FileUtil.deleteFile(fileNames.get("pdfFullPath"));
		}
		log.info(this.getClass() + ".deleteCruise end!!!");
		return "redirect:/Lmin/cruise/cruiseScheduleList.do";
	}
	
	/**
	 * @param req
	 * @param resp
	 * @param model
	 * @param session
	 * @return
	 * @throws Exception
	 * �겕猷⑥쫰 �닔�젙�솕硫댁쑝濡� �씠�룞�븷 硫붿냼�뱶
	 */
	@RequestMapping(value="Lmin/cruise/updateCruiseView", method=RequestMethod.GET)
	public String updateCruise(HttpServletRequest req, HttpServletResponse resp, Model model, HttpSession session) throws Exception{
		log.info(this.getClass() + ".updateCruise start!!!");
		
		//�겕猷⑥쫰 踰덊샇
		String cruiseNo = CmmUtil.nvl(req.getParameter("cruiseNo"));
		log.info(" cruiseNo : " + cruiseNo);
		
		//�겕猷⑥쫰 �긽�꽭 媛��졇�삤湲�
		CruiseDTO cDTO = cruiseService.getCruise(cruiseNo);
		if(cDTO == null) cDTO = new CruiseDTO();
		
		model.addAttribute("cDTO", cDTO);
		
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
	 * �겕猷⑥쫰 �닔�젙 硫붿냼�뱶
	 */
	@RequestMapping(value="Lmin/cruise/cruiseScheduleUpdateProc", method=RequestMethod.POST)
	public String updateCruiseProc(HttpServletRequest req, HttpServletResponse resp, Model model, HttpSession session, @RequestParam("cruiseScheFile") MultipartFile cruiseScheFile, @RequestParam("cruiseImgFile") MultipartFile cruiseImgFile) throws Exception{
		log.info(this.getClass() + ".updateCruiseProc start!!!");
		
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
		
		//�떎瑜몄씠由꾩쑝濡� ���옣�븷 蹂��닔
		String reScheFileName = "";
		String reImgFileName = "";
		
		//�썝�옒 �뙆�씪 �씠由꾨뱾
		String orgScheFileName = CmmUtil.nvl(cruiseScheFile.getOriginalFilename());
		log.info(" cruiseScheFileName : " + orgScheFileName);
		String orgImgFileName = CmmUtil.nvl(cruiseImgFile.getOriginalFilename());
		log.info(" cruiseImgFileName : " + orgImgFileName);
		
		//�겕猷⑥쫰 �씪�젙 �뙆�씪�쓣 蹂�寃쏀븳�떎硫�
		if(!"".equals(orgScheFileName)){
			//���옣�맂 �뙆�씪�쓽 �씠由�
			reScheFileName = FileUtil.fileSave(cruiseScheFile, scheSavePath);
			FileUtil.deleteFile(scheSavePath, scheFileName);
			cDTO.setCruiseScheFileName(reScheFileName);
			cDTO.setCruiseScheFileOrgName(orgScheFileName);
		}else{
			cDTO.setCruiseScheFileName(null);
			cDTO.setCruiseScheFileOrgName(null);
		}
		
		//�겕猷⑥쫰 �씠誘몄� �뙆�씪�쓣 蹂�寃쏀븳�떎硫�
		if(!"".equals(orgImgFileName)){
			//���옣�맂 �뙆�씪�쓽 �씠由�
			reImgFileName = FileUtil.fileSave(cruiseImgFile, imgSavePath);
			FileUtil.deleteFile(imgSavePath, imgFileName);
			cDTO.setCruiseImgFileName(reImgFileName);
			cDTO.setCruiseImgFileOrgName(orgImgFileName);
		}else{
			cDTO.setCruiseImgFileName(null);
			cDTO.setCruiseImgFileOrgName(null);
		}
		
		//�겕猷⑥쫰 �닔�젙
		boolean result = cruiseService.updateCruise(cDTO);
		
		if(result){
			model.addAttribute("msg", "�닔�젙�릺�뿀�뒿�땲�떎.");
			model.addAttribute("url", "/Lmin/cruise/cruiseScheduleList.do");
		}else{
			model.addAttribute("msg", "�떎�뙣�븯���뒿�땲�떎.");
			model.addAttribute("url", "/Lmin/cruise/updateCruiseView.do?cruiseNo=" + cruiseNo);
		}
		
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
	 * �겕猷⑥쫰 �씪�젙 �떎�슫濡쒕뱶 硫붿냼�뱶
	 */
	@RequestMapping(value="Lmin/cruise/cruiseDownloadSche", method=RequestMethod.GET)
	public ModelAndView crusieDownLoadSche(HttpServletRequest req, HttpServletResponse resp, Model model, HttpSession session) throws Exception{
		log.info(this.getClass() + ".cruiseDownLoadSche start!!!");
		
		//�겕猷⑥쫰踰덊샇
		String cruiseNo = CmmUtil.nvl(req.getParameter("cruiseNo"));
		log.info(" cruiseNo : " + cruiseNo);
		
		//�겕猷⑥쫰 �긽�꽭瑜� 媛��졇�삩�떎 �뙆�씪�쓽 寃쎈줈�� �뙆�씪 �씠由�
		CruiseDTO cDTO = cruiseService.getCruise(cruiseNo);
		if(cDTO == null) cDTO = new CruiseDTO();
		
		//�뙆�씪 寃쎈줈
		String path = CmmUtil.nvl(cDTO.getCruiseScheFilePath());
		//�뙆�씪 �씠由�
		String fileName = CmmUtil.nvl(cDTO.getCruiseScheFileName());;
		//�뙆�씪�쓽 �썝�옒�씠由�
		String fileOrgName = CmmUtil.nvl(cDTO.getCruiseScheFileOrgName());
		
		//�뙆�씪 媛앹껜 �깮�꽦�븯怨�
		File file = new File(path + fileName);
		
		//ModelAndView�겢�옒�뒪瑜� �넻�빐 DispatherServlet�뿉 download�씪怨� �씠由꾩씠 吏��뼱�졇�엳�뒗 view�겢�옒�뒪濡� �뜲�씠�꽣瑜� �뜕吏꾨떎.
		ModelAndView mav = new ModelAndView("download", "downloadFile", file);
		mav.addObject("fileOrgName", fileOrgName);
		log.info(this.getClass() + ".cruiseDownLoadSche end!!!");
		
		return mav;
	}
}