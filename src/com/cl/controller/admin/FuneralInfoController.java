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
	public String funeralInfoList(Model model) throws Exception{
		log.info("Lmin:funeralInfoList Start!!");
		
		List<FuneralInfoDTO> fList = new ArrayList<>();
		fList = funeralInfoService.getFuneralInfoList();
		
		HashMap<String ,List<CodeDTO>> hashMap = new HashMap<>();
		hashMap = funeralInfoService.getCodeList();
		
		model.addAttribute("fList", fList);
		model.addAttribute("hashMap", hashMap);
		
		fList = null;
		hashMap = null;
		
		log.info("Lmin:funeralInfoList End!!");
		return "/Lmin/funeral/funeral_info_list";
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
		log.info("funeralInfoDetail Start!!");
		
		String funeralInfoNo = CmmUtil.nvl(req.getParameter("fNo"));
		
		FuneralInfoDTO fDTO = new FuneralInfoDTO();
		fDTO.setFuneralInfoNo(funeralInfoNo);
		
		HashMap<String ,List<CodeDTO>> hashMap = new HashMap<>();
		hashMap = funeralInfoService.getCodeList();
		fDTO = funeralInfoService.getFuneralInfoDetail(fDTO);
		
		model.addAttribute("fDTO", fDTO);
		model.addAttribute("hashMap", hashMap);
		log.info("funeralInfoDetail End!!");
		return "/Lmin/funeral/funeral_info_detail";
	}
}
