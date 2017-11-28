//ũ���� ��Ʈ�ѷ�
package com.cl.controller.admin;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

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

@Controller
public class CruiseController {
	
	private Logger log = Logger.getLogger(this.getClass());
	private String scheSavePath = "C:\\Users\\Data3811-32\\git\\2life10\\WebContent\\cruiseSchedule\\";
	private String imgSavePath = "C:\\Users\\Data3811-32\\git\\2life10\\WebContent\\cruiseImg\\";
	@Resource(name="CruiseService")
	private ICruiseService cruiseService;
	
	@RequestMapping(value="Lmin/cruise/cruiseScheduleList", method=RequestMethod.GET)
	public String cruiseScheduleList(HttpServletRequest req, HttpServletResponse resp, Model model, HttpSession session) throws Exception{
		log.info(this.getClass() + ".cruiseScheduleList start!!!");
		
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
		String startDay = CmmUtil.nvl(req.getParameter("startDay"));
		log.info(" startDay : " + startDay);
		String endYear = CmmUtil.nvl(req.getParameter("endYear"));
		log.info(" endYear : " + endYear);
		String endMonth = CmmUtil.nvl(req.getParameter("endMonth"));
		log.info(" endMonth : " + endMonth);
		String endDay = CmmUtil.nvl(req.getParameter("endDay"));
		log.info(" endDay : " + endDay);
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
		
		log.info(this.getClass() + ".cruiseScheduleRegProc end!!!");
		return null;
	}
}
