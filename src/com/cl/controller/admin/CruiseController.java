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
import org.springframework.web.servlet.ModelAndView;

import com.cl.dto.CruiseDTO;
import com.cl.service.ICruiseService;
import com.cl.util.CmmUtil;
import com.cl.util.FileUtil;
import com.cl.util.PageUtil;

@Controller
public class CruiseController {
	
	private Logger log = Logger.getLogger(this.getClass());
	
	//크루즈 일정파일이 저장될 경로
	private String scheSavePath = "C:\\Users\\Data3811-32\\git\\2life10\\WebContent\\cruiseSchedule\\";
	//크루즈 이미지 파일이 저장될 경로
	private String imgSavePath = "C:\\Users\\Data3811-32\\git\\2life10\\WebContent\\cruiseImg\\";
	
	@Resource(name="CruiseService")
	private ICruiseService cruiseService;
	
	/**
	 * @param req
	 * @param resp
	 * @param model
	 * @param session
	 * @return
	 * @throws Exception
	 * 크루즈 리스트 화면 메소드
	 */
	@RequestMapping(value="Lmin/cruise/cruiseScheduleList", method={RequestMethod.GET, RequestMethod.POST})
	public String cruiseScheduleList(HttpServletRequest req, HttpServletResponse resp, Model model, HttpSession session) throws Exception{
		log.info(this.getClass() + ".cruiseScheduleList start!!!");
		//한 화면에 보여줄 크루즈 갯수
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
	 * 크루즈 등록 화면으로 이동하는 메소드
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
	 * 크루즈 등록 메소드
	 */
	@RequestMapping(value="Lmin/cruise/cruiseScheduleRegProc", method=RequestMethod.POST)
	public String cruiseScheduleRegProc(HttpServletRequest req, HttpServletResponse resp, Model model, HttpSession session, @RequestParam("cruiseScheFile") MultipartFile cruiseScheFile, @RequestParam("cruiseImgFile") MultipartFile cruiseImgFile) throws Exception{
		log.info(this.getClass() + ".cruiseScheduleRegProc start!!!");
		
		//등록자 회원번호
		String regMemberNo = CmmUtil.nvl((String)session.getAttribute("ss_member_no"));
		log.info(" regMemberNo : " + regMemberNo);
		//크루즈 이름
		String cruiseName = CmmUtil.nvl(req.getParameter("cruiseName"));
		log.info(" cruiseName : " + cruiseName);
		//선사이름
		String cruiseShipName = CmmUtil.nvl(req.getParameter("cruiseShipName"));
		log.info(" cruiseShipName : " + cruiseShipName);
		//가격
		String cruisePrice = CmmUtil.nvl(req.getParameter("cruisePrice"));
		log.info(" cruisePrice : "  + cruisePrice);
		//탑승인원
		String cruiseAccomodation = CmmUtil.nvl(req.getParameter("cruiseAccomodation"));
		log.info(" cruiseAccomodation : " + cruiseAccomodation);
		//캐빈
		String cruiseCabinCode = CmmUtil.nvl(req.getParameter("cruiseCabinCode"));
		log.info(" cruiseCabinCode : " + cruiseCabinCode);
		//출발년도
		String startYear = CmmUtil.nvl(req.getParameter("startYear"));
		log.info(" startYear : " + startYear);
		//출발월
		String startMonth = CmmUtil.nvl(req.getParameter("startMonth"));
		log.info(" startMonth : " + startMonth);
		if(Integer.parseInt(startMonth) < 10) startMonth = "0" + startMonth;
		//출발일
		String startDay = CmmUtil.nvl(req.getParameter("startDay"));
		log.info(" startDay : " + startDay);
		if(Integer.parseInt(startDay) < 10) startDay = "0" + startDay;
		//종료년도
		String endYear = CmmUtil.nvl(req.getParameter("endYear"));
		log.info(" endYear : " + endYear);
		//종료월
		String endMonth = CmmUtil.nvl(req.getParameter("endMonth"));
		log.info(" endMonth : " + endMonth);
		if(Integer.parseInt(endMonth) < 10) endMonth = "0" + endMonth;
		//종료일
		String endDay = CmmUtil.nvl(req.getParameter("endDay"));
		log.info(" endDay : " + endDay);
		if(Integer.parseInt(endDay) < 10) endDay = "0" + endDay;
		//기다
		String cruiseEtc = CmmUtil.nvl(req.getParameter("cruiseEtc"));
		log.info(" cruiseEtc : " + cruiseEtc);
		
		//원래 파일 이름들
		String orgScheFileName = CmmUtil.nvl(cruiseScheFile.getOriginalFilename());
		log.info(" cruiseScheFileName : " + orgScheFileName);
		String orgImgFileName = CmmUtil.nvl(cruiseImgFile.getOriginalFilename());
		log.info(" cruiseImgFileName : " + orgImgFileName);

		//저장된 파일의 이름
		String reScheFileName = FileUtil.fileSave(cruiseScheFile, scheSavePath);
		String reImgFileName = FileUtil.fileSave(cruiseImgFile, imgSavePath);
		
		//등록할 cruiseDTO세팅
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
		
		//크루즈 등록
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
	
	/**
	 * @param req
	 * @param resp
	 * @param model
	 * @param session
	 * @return
	 * @throws Exception
	 * 크루즈 삭제 메소드
	 */
	@RequestMapping(value="Lmin/cruise/deleteCruise", method=RequestMethod.POST)
	public String deleteCruise(HttpServletRequest req, HttpServletResponse resp, Model model, HttpSession session) throws Exception{
		log.info(this.getClass() + ".deleteCruise start!!!");
		
		//크루즈 번호
		String cruiseNo = CmmUtil.nvl(req.getParameter("cruiseNo"));
		log.info(" cruiseNo : " + cruiseNo);
		//크루즈 이미지 파일 번호
		String cruiseImgFileNo = CmmUtil.nvl(req.getParameter("cruiseImgFileNo"));
		log.info(" cruiseImgFileNo : " + cruiseImgFileNo);
		//크루즈 일정 파일 번호
		String cruiseScheFileNo = CmmUtil.nvl(req.getParameter("cruiseScheFileNo"));
		log.info(" cruiseScheFileNo : " + cruiseScheFileNo);
		
		//삭제할 cruiseDTO세팅
		CruiseDTO cDTO = new CruiseDTO();
		cDTO.setCruiseNo(cruiseNo);
		cDTO.setCruiseImgFileNo(Integer.parseInt(cruiseImgFileNo));
		cDTO.setCruiseScheFileNo(Integer.parseInt(cruiseScheFileNo));
		String[] fileNoArr = {cruiseImgFileNo, cruiseScheFileNo};
		cDTO.setFileNoArr(fileNoArr);
		
		//크루즈 이미지와 일정파일을 삭제하기 위해 delete후 각각의 파일이름을 가져온다.
		Map<String, String> fileNames = cruiseService.deleteCruise(cDTO);
		if(fileNames == null){
			model.addAttribute("msg", "크루즈 상품 삭제에 실패했습니다.");
			model.addAttribute("url", "/Lmin/cruise/cruiseScheduleList.do");
			return "/alert";
		}else{
			//각각의 파일 삭제
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
	 * 크루즈 수정화면으로 이동할 메소드
	 */
	@RequestMapping(value="Lmin/cruise/updateCruiseView", method=RequestMethod.GET)
	public String updateCruise(HttpServletRequest req, HttpServletResponse resp, Model model, HttpSession session) throws Exception{
		log.info(this.getClass() + ".updateCruise start!!!");
		
		//크루즈 번호
		String cruiseNo = CmmUtil.nvl(req.getParameter("cruiseNo"));
		log.info(" cruiseNo : " + cruiseNo);
		
		//크루즈 상세 가져오기
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
	 * 크루즈 수정 메소드
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
		
		//다른이름으로 저장할 변수
		String reScheFileName = "";
		String reImgFileName = "";
		
		//원래 파일 이름들
		String orgScheFileName = CmmUtil.nvl(cruiseScheFile.getOriginalFilename());
		log.info(" cruiseScheFileName : " + orgScheFileName);
		String orgImgFileName = CmmUtil.nvl(cruiseImgFile.getOriginalFilename());
		log.info(" cruiseImgFileName : " + orgImgFileName);
		
		//크루즈 일정 파일을 변경한다면
		if(!"".equals(orgScheFileName)){
			//저장된 파일의 이름
			reScheFileName = FileUtil.fileSave(cruiseScheFile, scheSavePath);
			FileUtil.deleteFile(scheSavePath, scheFileName);
			cDTO.setCruiseScheFileName(reScheFileName);
			cDTO.setCruiseScheFileOrgName(orgScheFileName);
		}else{
			cDTO.setCruiseScheFileName(null);
			cDTO.setCruiseScheFileOrgName(null);
		}
		
		//크루즈 이미지 파일을 변경한다면
		if(!"".equals(orgImgFileName)){
			//저장된 파일의 이름
			reImgFileName = FileUtil.fileSave(cruiseImgFile, imgSavePath);
			FileUtil.deleteFile(imgSavePath, imgFileName);
			cDTO.setCruiseImgFileName(reImgFileName);
			cDTO.setCruiseImgFileOrgName(orgImgFileName);
		}else{
			cDTO.setCruiseImgFileName(null);
			cDTO.setCruiseImgFileOrgName(null);
		}
		
		//크루즈 수정
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
	
	/**
	 * @param req
	 * @param resp
	 * @param model
	 * @param session
	 * @return
	 * @throws Exception
	 * 크루즈 일정 다운로드 메소드
	 */
	@RequestMapping(value="Lmin/cruise/cruiseDownloadSche", method=RequestMethod.GET)
	public ModelAndView crusieDownLoadSche(HttpServletRequest req, HttpServletResponse resp, Model model, HttpSession session) throws Exception{
		log.info(this.getClass() + ".cruiseDownLoadSche start!!!");
		
		//크루즈번호
		String cruiseNo = CmmUtil.nvl(req.getParameter("cruiseNo"));
		log.info(" cruiseNo : " + cruiseNo);
		
		//크루즈 상세를 가져온다 파일의 경로와 파일 이름
		CruiseDTO cDTO = cruiseService.getCruise(cruiseNo);
		if(cDTO == null) cDTO = new CruiseDTO();
		
		//파일 경로
		String path = CmmUtil.nvl(cDTO.getCruiseScheFilePath());
		//파일 이름
		String fileName = CmmUtil.nvl(cDTO.getCruiseScheFileName());;
		//파일의 원래이름
		String fileOrgName = CmmUtil.nvl(cDTO.getCruiseScheFileOrgName());
		
		//파일 객체 생성하고
		File file = new File(path + fileName);
		
		//ModelAndView클래스를 통해 DispatherServlet에 download라고 이름이 지어져있는 view클래스로 데이터를 던진다.
		ModelAndView mav = new ModelAndView("download", "downloadFile", file);
		mav.addObject("fileOrgName", fileOrgName);
		log.info(this.getClass() + ".cruiseDownLoadSche end!!!");
		
		return mav;
	}
}