//전국장례시설안내 컨트롤러
package com.cl.controller.admin;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cl.dto.CodeDTO;
import com.cl.dto.FuneralInfoDTO;
import com.cl.service.IFuneralInfoService;
import com.cl.util.CmmUtil;

@Controller
public class FuneralInfoController {
	
	private Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="FuneralInfoService")
	private IFuneralInfoService funeralInfoService;
	
	@RequestMapping("/Lmin/funeral/funeralInfoList")
	public String funeralInfoList(HttpServletRequest req, Model model) throws Exception{
		log.info("Lmin:funeralInfoList Start!!");
		String nowPage = "";
		int page;
		int splitPage = 10;
		
		if(!CmmUtil.nvl(req.getParameter("page")).equals("")){
			nowPage = CmmUtil.nvl(req.getParameter("page"));
			System.out.println(nowPage);
			page = (Integer.parseInt(nowPage)-1) * splitPage;
		}else{
			System.out.println(nowPage);
			nowPage = "1";
			page = 0;
		}
		
		FuneralInfoDTO fDTO = new FuneralInfoDTO();
		fDTO.setPage(page);
		fDTO.setSplitPage(splitPage);
		List<FuneralInfoDTO> fList = new ArrayList<>();
		fList = funeralInfoService.getFuneralInfoList(fDTO);
		
		log.info("nowPage : "+ nowPage);
		
		HashMap<String ,List<CodeDTO>> hashMap = new HashMap<>();
		hashMap = funeralInfoService.getCodeList();
		
		model.addAttribute("fList", fList);
		model.addAttribute("hashMap", hashMap);
		model.addAttribute("nowPage", nowPage);
		model.addAttribute("splitPage", splitPage);
		
		fList = null;
		hashMap = null;
		fDTO = null;
		log.info("Lmin:funeralInfoList End!!");
		return "/Lmin/funeral/funeral_info_list";
	}
	
	@RequestMapping("/Lmin/funeral/funeralInfoSearch")
	public String funeralInfoSearch(HttpServletRequest req, Model model) throws Exception{
		log.info("Lmin:funeralInfoSearch Start!!");
		String nowPage = "";
		int page;
		int splitPage = 10;
		String geoCode = CmmUtil.nvl(req.getParameter("geoCode"));
		String funeralCode = CmmUtil.nvl(req.getParameter("funeral"));
		
		log.info("geoCode : "+geoCode);
		log.info("funeralCode : "+funeralCode);
		
		if(!CmmUtil.nvl(req.getParameter("page")).equals("")){
			nowPage = CmmUtil.nvl(req.getParameter("page"));
			page = (Integer.parseInt(nowPage)-1) * splitPage;
		}else{
			nowPage = "1";
			page = 0;
		}
		
		FuneralInfoDTO fDTO = new FuneralInfoDTO();
		fDTO.setPage(page);
		fDTO.setSplitPage(splitPage);
		fDTO.setFuneralInfoCode(funeralCode);
		fDTO.setFuneralInfoAreaCode(geoCode);
		List<FuneralInfoDTO> fList = new ArrayList<>();
		fList = funeralInfoService.getFuneralInfoSearch(fDTO);
		
		if(fList==null){
			fList = new ArrayList<>();
		}
		log.info("nowPage : "+ nowPage);
		
		HashMap<String ,List<CodeDTO>> hashMap = new HashMap<>();
		hashMap = funeralInfoService.getCodeList();
		
		model.addAttribute("fList", fList);
		model.addAttribute("hashMap", hashMap);
		model.addAttribute("nowPage", nowPage);
		model.addAttribute("splitPage", splitPage);
		model.addAttribute("fDTO", fDTO);
		
		fList = null;
		hashMap = null;
		fDTO = null;
		
		log.info("Lmin:funeralInfoSearch End!!");
		return "/Lmin/funeral/funeral_info_search";
	}
	
	@RequestMapping("/Lmin/funeral/funeralInfoWrite")
	public String funeralInfoWrite(Model model) throws Exception{
		log.info("Lmin:funeralInfoWrite Start!!");
		
		HashMap<String ,List<CodeDTO>> hashMap = new HashMap<>();
		hashMap = funeralInfoService.getCodeList();
		
		model.addAttribute("hashMap", hashMap);
		log.info("Lmin:funeralInfoWrite End!!");
		return "/Lmin/funeral/funeral_info_write";
	}
	@RequestMapping("/Lmin/funeral/fueralInfoRegProc")
	public String funeralInfoRegProc(HttpServletRequest req, Model model, HttpSession session) throws Exception{
		log.info("Lmin:funeralInfoRegProc Start!!");
		
		String url = "";
		String msg = "";
		String funeralInfoCode = CmmUtil.nvl(req.getParameter("funeral"));
		String funeralInfoName = CmmUtil.nvl(req.getParameter("name"));
		String funeralInfoArea = CmmUtil.nvl(req.getParameter("geo"));
		String funeralInfoTel = CmmUtil.nvl(req.getParameter("tel1"))+"-"+CmmUtil.nvl(req.getParameter("tel2"))+"-"+CmmUtil.nvl(req.getParameter("tel3"));
		String funeralInfoPostno = CmmUtil.nvl(req.getParameter("postcode"));
		String funeralInfoAddr1 = CmmUtil.nvl(req.getParameter("address1"));
		String funeralInfoAddr2 = CmmUtil.nvl(req.getParameter("address2"));
		String regMemberNo = CmmUtil.nvl((String) session.getAttribute("ss_member_no"));
		
		log.info("funeralInfoCode : " + funeralInfoCode);
		log.info("funeralInfoName : " + funeralInfoName);
		log.info("funeralInfoArea : " + funeralInfoArea);
		log.info("funeralInfoTel : " + funeralInfoTel);
		log.info("funeralInfoPostno : " + funeralInfoPostno);
		log.info("funeralInfoAddr1 : " + funeralInfoAddr1);
		log.info("funeralInfoAddr2 : " + funeralInfoAddr2);
		log.info("regMemberNo : " + regMemberNo);
		
		FuneralInfoDTO fDTO = new FuneralInfoDTO();
		
		fDTO.setFuneralInfoCode(funeralInfoCode);
		fDTO.setFuneralInfoAreaCode(funeralInfoArea);
		fDTO.setFuneralInfoName(funeralInfoName);
		fDTO.setFuneralInfoTelNo(funeralInfoTel);
		fDTO.setFuneralPostNo(funeralInfoPostno);
		fDTO.setFuneralAddress(funeralInfoAddr1);
		fDTO.setFuneralAddressDetail(funeralInfoAddr2);
		fDTO.setRegMemberNo(regMemberNo);
		
		int result = funeralInfoService.insertFuneralInfo(fDTO);
		
		if(result==1){
			url = "/Lmin/funeral/funeralInfoList.do";
			msg = "등록성공";
		}else{
			url = "/Lmin/funeral/funeralInfoWrite.do";
			msg = "등록실패";
		}
		
		fDTO = null;
		
		model.addAttribute("url", url);
		model.addAttribute("msg", msg);
		log.info("Lmin:funeralInfoRegProc End!!");
		return "/alert";
	}
	
	@RequestMapping("/Lmin/funeral/funeralInfoDetail")
	public String funeralInfoDetail(HttpServletRequest req, Model model) throws Exception{
		log.info("Lmin:funeralInfoDetail Start!!");
		
		String funeralInfoNo = CmmUtil.nvl(req.getParameter("fNo"));
		log.info("funeralInfoNo : "+funeralInfoNo);
		
		FuneralInfoDTO fDTO = new FuneralInfoDTO();
		fDTO.setFuneralInfoNo(funeralInfoNo);
		
		HashMap<String ,List<CodeDTO>> hashMap = new HashMap<>();
		hashMap = funeralInfoService.getCodeList();
		fDTO = funeralInfoService.getFuneralInfoDetail(fDTO);
		
		model.addAttribute("fDTO", fDTO);
		model.addAttribute("hashMap", hashMap);
		log.info("Lmin:funeralInfoDetail End!!");
		return "/Lmin/funeral/funeral_info_detail";
	}
	
	@RequestMapping("/Lmin/funeral/funeralInfoUpdateProc")
	public String funeralInfoUpdateProc(HttpServletRequest req, Model model, HttpSession session) throws Exception{
		log.info("Lmin:funeralInfoUpdateProc Start!!");

		String url = "";
		String msg = "";
		String funeralInfoNo = CmmUtil.nvl(req.getParameter("fNo"));
		String funeralInfoCode = CmmUtil.nvl(req.getParameter("funeral"));
		String funeralInfoName = CmmUtil.nvl(req.getParameter("name"));
		String funeralInfoArea = CmmUtil.nvl(req.getParameter("geo"));
		String funeralInfoTel = CmmUtil.nvl(req.getParameter("tel1"))+"-"+CmmUtil.nvl(req.getParameter("tel2"))+"-"+CmmUtil.nvl(req.getParameter("tel3"));
		String funeralInfoPostno = CmmUtil.nvl(req.getParameter("postcode"));
		String funeralInfoAddr1 = CmmUtil.nvl(req.getParameter("address1"));
		String funeralInfoAddr2 = CmmUtil.nvl(req.getParameter("address2"));
		String chgMemberNo = CmmUtil.nvl((String) session.getAttribute("ss_member_no"));
		
		log.info("funeralInfoNo : " + funeralInfoNo);
		log.info("funeralInfoCode : " + funeralInfoCode);
		log.info("funeralInfoName : " + funeralInfoName);
		log.info("funeralInfoArea : " + funeralInfoArea);
		log.info("funeralInfoTel : " + funeralInfoTel);
		log.info("funeralInfoPostno : " + funeralInfoPostno);
		log.info("funeralInfoAddr1 : " + funeralInfoAddr1);
		log.info("funeralInfoAddr2 : " + funeralInfoAddr2);
		log.info("chgMemberNo : " + chgMemberNo);
		
		FuneralInfoDTO fDTO = new FuneralInfoDTO();
		
		fDTO.setFuneralInfoNo(funeralInfoNo);
		fDTO.setFuneralInfoCode(funeralInfoCode);
		fDTO.setFuneralInfoAreaCode(funeralInfoArea);
		fDTO.setFuneralInfoName(funeralInfoName);
		fDTO.setFuneralInfoTelNo(funeralInfoTel);
		fDTO.setFuneralPostNo(funeralInfoPostno);
		fDTO.setFuneralAddress(funeralInfoAddr1);
		fDTO.setFuneralAddressDetail(funeralInfoAddr2);
		fDTO.setChgMemberNo(chgMemberNo);
		
		int result = funeralInfoService.updateFuneralInfo(fDTO);
		
		if(result==1){
			url = "/Lmin/funeral/funeralInfoList.do";
			msg = "수정성공";
		}else{
			url = "/Lmin/funeral/funeralInfoDetail.do?fNo="+funeralInfoNo;
			msg = "수정실패";
		}
		
		fDTO = null;
		
		model.addAttribute("url", url);
		model.addAttribute("msg", msg);
		
		log.info("Lmin:funeralInfoUpdateProc End!!");
		return "/alert";
	}
	
	@RequestMapping("/Lmin/funeral/funeralInfoDelete")
	public String funeralInfoDelete(HttpServletRequest req, Model model) throws Exception{
		log.info("Lmin:funeralInfoDelete Start!!");
		
		String url = "";
		String msg = "";
		String funeralInfoNo = CmmUtil.nvl(req.getParameter("fNo"));
		
		log.info("funeralInfoNo : "+ funeralInfoNo);
		
		int result = funeralInfoService.deleteFuneralInfo(funeralInfoNo);
		if(result == 0){
			msg = "삭제실패";
			url = "/Lmin/funeral/funeralInfoList.do";
		}else{
			msg = "삭제성공";
			url = "/Lmin/funeral/funeralInfoList.do";
		}
		model.addAttribute("url", url);
		model.addAttribute("msg", msg);
		
		log.info("Lmin:funeralInfoDelete End!!");
		return "/alert";
	}
}
