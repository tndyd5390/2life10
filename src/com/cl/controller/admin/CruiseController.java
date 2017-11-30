//ũ���� ��Ʈ�ѷ�
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

import com.cl.dto.CruiseDTO;
import com.cl.service.ICruiseService;
import com.cl.util.CmmUtil;
import com.cl.util.PageUtil;

@Controller
public class CruiseController {
	
	private Logger log = Logger.getLogger(this.getClass());
	private String scheSavePath = "C:\\Users\\Data3811-32\\git\\2life10\\WebContent\\cruiseSchedule\\";
	private String imgSavePath = "C:\\Users\\Data3811-32\\git\\2life10\\WebContent\\cruiseImg\\";
	@Resource(name="CruiseService")
	private ICruiseService cruiseService;
	
	@RequestMapping(value="Lmin/cruise/cruiseScheduleList", method={RequestMethod.GET, RequestMethod.POST})
	public String cruiseScheduleList(HttpServletRequest req, HttpServletResponse resp, Model model, HttpSession session) throws Exception{
		log.info(this.getClass() + ".cruiseScheduleList start!!!");
		int splitPage = 10;
		
		HashMap<String, Object> hMap = new HashMap<>();
		
		hMap = PageUtil.paging(req, splitPage);
		hMap = cruiseService.getCruiseList(hMap);
		model.addAttribute("hMap", hMap);
		
		hMap = null;
		log.info(this.getClass() + ".cruiseScheduleList end!!!");
		return "/Lmin/cruise/cruise_schedule";
	}
	
	@RequestMapping(value="Lmin/cruise/cruiseSchduleWriteView", method=RequestMethod.GET)
	public String cruiseSchduleWriteView(HttpServletRequest req, HttpServletResponse resp, Model model, HttpSession session) throws Exception{
		log.info(this.getClass() + ".cruiseSchduleWriteView start!!!");
		
		log.info(this.getClass() + ".cruiseSchduleWriteView end!!!");
		return "/Lmin/cruise/cruise_schedule_write";
	}
	
	@RequestMapping(value="Lmin/cruise/cruiseScheduleRegProc", method=RequestMethod.POST)
	public String cruiseScheduleRegProc(HttpServletRequest req, HttpServletResponse resp, Model model, HttpSession session, @RequestParam("cruiseScheFile") MultipartFile cruiseScheFile, @RequestParam("cruiseImgFile") MultipartFile cruiseImgFile) throws Exception{
		log.info(this.getClass() + ".cruiseScheduleRegProc start!!!");
		
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
		
		//다른이름으로 저장할 변수
		String reScheFileName = "";
		String reImgFileName = "";
		
		//원래 파일 이름들
		String orgScheFileName = CmmUtil.nvl(cruiseScheFile.getOriginalFilename());
		log.info(" cruiseScheFileName : " + orgScheFileName);
		String orgImgFileName = CmmUtil.nvl(cruiseImgFile.getOriginalFilename());
		log.info(" cruiseImgFileName : " + orgImgFileName);
		
		//각 파일의 확장자 추출
		String scheExtended = orgScheFileName.substring(orgScheFileName.indexOf("."), orgScheFileName.length());
		String imgExtended = orgImgFileName.substring(orgImgFileName.indexOf("."), orgImgFileName.length());
		
		//이름을 다시 지을 변수
		String now = new SimpleDateFormat("yyyyMMddhmsS").format(new Date());
		
		//완성된 각 파일의 이름
		reScheFileName = now + scheExtended;
		reImgFileName = now + imgExtended;
		
		//각파일이름으로 파일 객체 생성
		File newScheFile = new File(scheSavePath + reScheFileName);
		File newImgFile = new File(imgSavePath + reImgFileName);
		
		//파일 저장
		cruiseScheFile.transferTo(newScheFile);
		cruiseImgFile.transferTo(newImgFile);
		
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
			model.addAttribute("msg", "크루즈 상품 등록에 성공했습니다.");
		}else{
			model.addAttribute("msg", "크루즈 상품 등록에 실패했습니다.");
		}
		model.addAttribute("url", "/Lmin/cruise/cruiseScheduleList.do");
		log.info(this.getClass() + ".cruiseScheduleRegProc end!!!");
		return "/alert";
	}
	
	@RequestMapping(value="Lmin/cruise/deleteCruise", method=RequestMethod.POST)
	public String deleteCruise(HttpServletRequest req, HttpServletResponse resp, Model model, HttpSession session) throws Exception{
		log.info(this.getClass() + ".deleteCruise start!!!");
		
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
			model.addAttribute("msg", "크루즈 상품 삭제에 실패했습니다.");
			model.addAttribute("url", "/Lmin/cruise/cruiseScheduleList.do");
			return "/alert";
		}else{
			File file = new File(fileNames.get("imgFullPath"));
			if(file.exists()){
				file.delete();
			}
			file = new File(fileNames.get("pdfFullPath"));
			if(file.exists()){
				file.delete();
			}
		}
		log.info(this.getClass() + ".deleteCruise end!!!");
		return "redirect:/Lmin/cruise/cruiseScheduleList.do";
	}
	
	@RequestMapping(value="Lmin/cruise/updateCruiseView", method=RequestMethod.GET)
	public String updateCruise(HttpServletRequest req, HttpServletResponse resp, Model model, HttpSession session) throws Exception{
		log.info(this.getClass() + ".updateCruise start!!!");
		
		String cruiseNo = CmmUtil.nvl(req.getParameter("cruiseNo"));
		log.info(" cruiseNo : " + cruiseNo);
		
		CruiseDTO cDTO = cruiseService.getCruise(cruiseNo);
		if(cDTO == null) cDTO = new CruiseDTO();
		
		model.addAttribute("cDTO", cDTO);
		
		log.info(this.getClass() + ".updateCruise end!!!");
		return "/Lmin/cruise/cruise_schedule_updateView";
	}
	
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
		
		//다른이름으로 저장할 변수
		String reScheFileName = "";
		String reImgFileName = "";
		
		//원래 파일 이름들
		String orgScheFileName = CmmUtil.nvl(cruiseScheFile.getOriginalFilename());
		log.info(" cruiseScheFileName : " + orgScheFileName);
		String orgImgFileName = CmmUtil.nvl(cruiseImgFile.getOriginalFilename());
		log.info(" cruiseImgFileName : " + orgImgFileName);

		//완성된 각 파일의 이름
		String now = new SimpleDateFormat("yyyyMMddhmsS").format(new Date());
		
		if(!"".equals(orgScheFileName)){
			//각 파일의 확장자 추출
			String scheExtended = orgScheFileName.substring(orgScheFileName.indexOf("."), orgScheFileName.length());
			//이름을 다시 지을 변수
			reScheFileName = now + scheExtended;
			//각파일이름으로 파일 객체 생성
			File newScheFile = new File(scheSavePath + reScheFileName);
			//파일 저장
			cruiseScheFile.transferTo(newScheFile);
			newScheFile = new File(scheSavePath + scheFileName);
			if(newScheFile.exists()) newScheFile.delete();
			cDTO.setCruiseScheFileName(reScheFileName);
			cDTO.setCruiseScheFileOrgName(orgScheFileName);
		}else{
			cDTO.setCruiseScheFileName(null);
			cDTO.setCruiseScheFileOrgName(null);
		}
		
		if(!"".equals(orgImgFileName)){
			//이미지 파일의 확장자 추출
			String imgExtended = orgImgFileName.substring(orgImgFileName.indexOf("."), orgImgFileName.length());
			//새로 지은 이미지 파일 이름
			reImgFileName = now + imgExtended;
			//이미지 파일 객체 생성
			File newImgFile = new File(imgSavePath + reImgFileName);
			//이미지 파일 저장
			cruiseImgFile.transferTo(newImgFile);
			newImgFile = new File(imgSavePath + imgFileName);
			if(newImgFile.exists()) newImgFile.delete();
			cDTO.setCruiseImgFileName(reImgFileName);
			cDTO.setCruiseImgFileOrgName(orgImgFileName);
		}else{
			cDTO.setCruiseImgFileName(null);
			cDTO.setCruiseImgFileOrgName(null);
		}
		
		boolean result = cruiseService.updateCruise(cDTO);
		
		if(result){
			model.addAttribute("msg", "수정되었습니다.");
			model.addAttribute("url", "/Lmin/cruise/cruiseScheduleList.do");
		}else{
			model.addAttribute("msg", "실패하였습니다.");
			model.addAttribute("url", "/Lmin/cruise/updateCruiseView.do?cruiseNo=" + cruiseNo);
		}
		
		log.info(this.getClass() + ".updateCruiseProc end!!!");
		return "/alert";
	}
}
