//������ʽü��ȳ� ��Ʈ�ѷ�
package com.cl.controller.admin;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cl.dto.CodeDTO;
import com.cl.dto.FuneralInfoDTO;
import com.cl.service.ICodeService;
import com.cl.service.IFuneralInfoService;
import com.cl.util.CmmUtil;
import com.cl.util.PageUtil;
import com.cl.util.SessionUtil;

@Controller
public class FuneralInfoController {
	
	private Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="FuneralInfoService")
	private IFuneralInfoService funeralInfoService;
	
	@Resource(name="CodeService")
	private ICodeService codeService;
	
	@RequestMapping("/Lmin/funeral/funeralInfoList")
	public String funeralInfoList(HttpServletRequest req, Model model, HttpSession session, HttpServletResponse resp) throws Exception{
		log.info("Lmin:funeralInfoList Start!!");
		SessionUtil.sessionCheck(resp, session);
		int splitPage = 10;
		
		HashMap<String, Object> hMap = new HashMap<>();
		hMap = PageUtil.paging(req, splitPage);
		hMap = funeralInfoService.getFuneralInfoList(hMap);
		HashMap<String ,List<CodeDTO>> hashMap = new HashMap<>();
		hashMap = codeService.getCodeList();
		
		
		model.addAttribute("hashMap", hashMap);
		model.addAttribute("hMap", hMap);
		
		hashMap = null;
		hMap = null;
		log.info("Lmin:funeralInfoList End!!");
		return "/Lmin/funeral/funeral_info_list";
	}
	
	@RequestMapping("/Lmin/funeral/funeralInfoWrite")
	public String funeralInfoWrite(Model model, HttpSession session, HttpServletResponse resp) throws Exception{
		log.info("Lmin:funeralInfoWrite Start!!");
		SessionUtil.sessionCheck(resp, session);
		HashMap<String ,List<CodeDTO>> hashMap = new HashMap<>();
		hashMap = codeService.getCodeList();
		
		model.addAttribute("hashMap", hashMap);
		log.info("Lmin:funeralInfoWrite End!!");
		return "/Lmin/funeral/funeral_info_write";
	}
	@RequestMapping("/Lmin/funeral/fueralInfoRegProc")
	public String funeralInfoRegProc(HttpServletRequest req, Model model, HttpSession session, HttpServletResponse resp) throws Exception{
		log.info("Lmin:funeralInfoRegProc Start!!");
		SessionUtil.sessionCheck(resp, session);
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
			msg = "전국장례시설 등록에 성공했습니다.";
		}else{
			url = "/Lmin/funeral/funeralInfoWrite.do";
			msg = "전국장례시설 등록에 실패했습니다.";
		}
		
		fDTO = null;
		
		model.addAttribute("url", url);
		model.addAttribute("msg", msg);
		log.info("Lmin:funeralInfoRegProc End!!");
		return "/alert";
	}
	
	@RequestMapping("/Lmin/funeral/funeralInfoDetail")
	public String funeralInfoDetail(HttpServletRequest req, Model model, HttpServletResponse resp, HttpSession session) throws Exception{
		log.info("Lmin:funeralInfoDetail Start!!");
		SessionUtil.sessionCheck(resp, session);
		String funeralInfoNo = CmmUtil.nvl(req.getParameter("fNo"));
		log.info("funeralInfoNo : "+funeralInfoNo);
		
		FuneralInfoDTO fDTO = new FuneralInfoDTO();
		fDTO.setFuneralInfoNo(funeralInfoNo);
		
		HashMap<String ,List<CodeDTO>> hashMap = new HashMap<>();
		hashMap = codeService.getCodeList();
		fDTO = funeralInfoService.getFuneralInfoDetail(fDTO);
		
		model.addAttribute("fDTO", fDTO);
		model.addAttribute("hashMap", hashMap);
		log.info("Lmin:funeralInfoDetail End!!");
		return "/Lmin/funeral/funeral_info_detail";
	}
	
	@RequestMapping("/Lmin/funeral/funeralInfoUpdateProc")
	public String funeralInfoUpdateProc(HttpServletRequest req, Model model, HttpSession session, HttpServletResponse resp) throws Exception{
		log.info("Lmin:funeralInfoUpdateProc Start!!");
		SessionUtil.sessionCheck(resp, session);
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
		
		url = "/Lmin/funeral/funeralInfoList.do";
		if(result==1){
			msg = "전국장례시설 수정에 성공했습니다.";
		}else{
			msg = "전국장례시설 수정에 실패했습니다.";
		}
		
		fDTO = null;
		
		model.addAttribute("url", url);
		model.addAttribute("msg", msg);
		
		log.info("Lmin:funeralInfoUpdateProc End!!");
		return "/alert";
	}
	
	@RequestMapping("/Lmin/funeral/funeralInfoDelete")
	public String funeralInfoDelete(HttpServletRequest req, Model model, HttpServletResponse resp, HttpSession session) throws Exception{
		log.info("Lmin:funeralInfoDelete Start!!");
		SessionUtil.sessionCheck(resp, session);
		String url = "";
		String msg = "";
		String funeralInfoNo = CmmUtil.nvl(req.getParameter("fNo"));
		
		log.info("funeralInfoNo : "+ funeralInfoNo);
		
		int result = funeralInfoService.deleteFuneralInfo(funeralInfoNo);
		url = "/Lmin/funeral/funeralInfoList.do";
		if(result == 0){
			msg = "전국장례시설 삭제에 성공했습니다.";
		}else{
			msg = "전국장례시설 삭제에 실패했습니다.";
		}
		model.addAttribute("url", url);
		model.addAttribute("msg", msg);
		
		log.info("Lmin:funeralInfoDelete End!!");
		return "/alert";
	}
}
