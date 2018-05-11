//占쏙옙占쌉쏙옙청 占쏙옙트占싼뤄옙
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
import org.springframework.web.bind.annotation.RequestMethod;

import com.cl.dto.AppliDTO;
import com.cl.service.IAppliService;
import com.cl.util.AES256Util;
import com.cl.util.CmmUtil;
import com.cl.util.PageUtil;
import com.cl.util.SessionUtil;

@Controller
public class AppliController {
	
	private Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="AppliService")
	private IAppliService appliService;
	
	@RequestMapping(value="Lmin/appli/appliForm", method=RequestMethod.GET)
	public String appliForm(HttpServletRequest req, HttpServletResponse resp, Model model, HttpSession session) throws Exception{
		log.info(this.getClass() + ".appliForm start!!!");
		SessionUtil.sessionCheck(resp, session);
		log.info(this.getClass() + ".appliForm end!!!");
		return "/Lmin/appli/appli_form";
	}
	
	@RequestMapping(value="Lmin/appli/appliProc", method=RequestMethod.POST)
	public String appliProc(HttpServletRequest req, HttpServletResponse resp, Model model, HttpSession session) throws Exception{
		log.info(this.getClass() + ".appliProc start!!!");
		SessionUtil.sessionCheck(resp, session);
		String regMemberNo = CmmUtil.nvl((String)session.getAttribute("ss_member_no"));
		log.info(" regMemberNo : " + regMemberNo);
		String appliProdCode = CmmUtil.nvl(req.getParameter("appliProdCode"));
		log.info(" appliProdCode : " + appliProdCode);
		String appliContractCode = CmmUtil.nvl(req.getParameter("appliContractCode"));
		log.info(" appliContractCode : " + appliContractCode);
		String appliName = CmmUtil.nvl(req.getParameter("appliName"));
		log.info(" appliName : " + appliName);
		String tel1 = CmmUtil.nvl(req.getParameter("tel1"));
		log.info(" tel1 : " + tel1);
		String tel2 = CmmUtil.nvl(req.getParameter("tel2"));
		log.info(" tel2 : " + tel2);
		String tel3 = CmmUtil.nvl(req.getParameter("tel3"));
		log.info(" tel3 : " + tel3);
		String phoneTel1 = CmmUtil.nvl(req.getParameter("phoneTel1"));
		log.info(" phoneTel1 : " + phoneTel1);
		String phoneTel2 = CmmUtil.nvl(req.getParameter("phoneTel2"));
		log.info(" phoneTel2 : " + phoneTel2);
		String phoneTel3 = CmmUtil.nvl(req.getParameter("phoneTel3"));
		log.info(" phoneTel3 : " + phoneTel3);
		String appliRouteCode = CmmUtil.nvl(req.getParameter("appliRouteCode"));
		log.info(" appliRouteCode : " + appliRouteCode);
		String appliPostNo = CmmUtil.nvl(req.getParameter("appliPostNo"));
		log.info(" appliPostNo : " + appliPostNo);
		String appliAddress = CmmUtil.nvl(req.getParameter("appliAddress"));
		log.info(" appliAddress : " + appliAddress);
		String appliAddressDetail = CmmUtil.nvl(req.getParameter("appliAddressDetail"));
		log.info(" appliAddressDetail : " + appliAddressDetail);
		
		AppliDTO aDTO = new AppliDTO();
		aDTO.setAppliProdCode(appliProdCode);
		aDTO.setAppliContractCode(appliContractCode);
		aDTO.setAppliName(AES256Util.strEncode(appliName));
		aDTO.setAppliHomeNo(AES256Util.strEncode(tel1 + "-" + tel2 + "-" + tel3));
		aDTO.setAppliPhoneNo(AES256Util.strEncode(phoneTel1 + "-" + phoneTel2 + "-" + phoneTel3));
		aDTO.setAppliPostNo(AES256Util.strEncode(appliPostNo));
		aDTO.setAppliAddress(AES256Util.strEncode(appliAddress));
		aDTO.setAppliAddressDetail(AES256Util.strEncode(appliAddressDetail));
		aDTO.setAppliRouteCode(appliRouteCode);
		aDTO.setRegMemberNo(regMemberNo);
		
		int result = appliService.insertAppli(aDTO);
		if(result != 0){
			model.addAttribute("msg", "가입신청되었습니다.");
		}else{
			model.addAttribute("msg", "가입신청에 실패했습니다.");
		}
		model.addAttribute("url", "/Lmin/appli/appliList.do");
		
		regMemberNo = null;
		appliProdCode = null;
		appliContractCode = null;
		appliName = null;
		tel1 = null;
		tel2 = null;
		tel3 = null;
		phoneTel1 = null;
		phoneTel2 = null;
		phoneTel3 = null;
		appliRouteCode = null;
		appliPostNo = null;
		appliAddress= null;
		appliAddressDetail = null;
		
		log.info(this.getClass() + ".appliProc end!!!");
		return "/alert";
	}
	
	@RequestMapping(value="Lmin/appli/appliList", method={RequestMethod.GET, RequestMethod.POST})
	public String appliList(HttpServletRequest req, HttpServletResponse resp, Model model, HttpSession session) throws Exception{
		log.info(this.getClass() + ".appliList start!!!");
		SessionUtil.sessionCheck(resp, session);
		int splitPage = 3;
		
		HashMap<String, Object> hMap = new HashMap<>();
		hMap = PageUtil.paging(req, splitPage);
		hMap = appliService.getAppliList(hMap);
		
		model.addAttribute("hMap", hMap);
		
		hMap = null;
		log.info(this.getClass() + ".appliList end!!!");
		return "/Lmin/appli/appli_list";
	}
	@RequestMapping(value="Lmin/appli/appliDetail", method=RequestMethod.GET)
	public String appliDetail(HttpServletRequest req, HttpServletResponse resp, HttpSession session, Model model) throws Exception{
		log.info(this.getClass() + ".appliDetail start!!!");
		SessionUtil.sessionCheck(resp, session);
		String appliNo = CmmUtil.nvl(req.getParameter("appliNo"));
		log.info(" appliNo : " + appliNo);
		
		AppliDTO aDTO = appliService.getAppliDetail(appliNo);
		if(aDTO == null) aDTO = new AppliDTO();
		model.addAttribute("aDTO", aDTO);
		
		aDTO = null;
		appliNo = null;
		log.info(this.getClass() + ".appliDetail end!!!");
		return "/Lmin/appli/appli_view";
	}
	
	@RequestMapping(value="Lmin/appli/appliReplyProc", method=RequestMethod.POST)
	public String appliReplyProc(HttpServletRequest req, HttpServletResponse resp, Model model, HttpSession session) throws Exception{
		log.info(this.getClass() + ".appliReplyProc start!!!");
		SessionUtil.sessionCheck(resp, session);
		String appliNo = CmmUtil.nvl(req.getParameter("appliNo"));
		log.info(" appliNo : " + appliNo);
		
		int result = appliService.updateAppliReply(appliNo);
		if(result != 0){
			model.addAttribute("msg", "답변이 완료되었습니다.");
		}else{
			model.addAttribute("msg", "답변완료에 실패했습니다.");
		}
		model.addAttribute("url", "/Lmin/appli/appliList.do");
		
		appliNo = null;
		log.info(this.getClass() + ".appliReplyProc end!!!");
		return "/alert";
	}
	
	@RequestMapping(value="Lmin/appli/deleteAppli")
	public String appliDelete(HttpServletRequest req,HttpServletResponse resp, Model model, HttpSession session) throws Exception{
		log.info(this.getClass() + ".appliDelete start!!!");
		
		SessionUtil.sessionCheck(resp, session);
		String appliNo = CmmUtil.nvl(req.getParameter("aNo"));
		
		log.info("appliNo : "+appliNo);
		
		int result = appliService.deleteAppli(appliNo);
		
		if(result != 0){
			model.addAttribute("msg", "삭제 되었습니다.");
		}else{
			model.addAttribute("msg", "삭제 실패했습니다.");
		}
		model.addAttribute("url", "/Lmin/appli/appliList.do");

		appliNo = null;
		
		log.info(this.getClass() + ".appliDelete end!!!");
		return "/alert";
	}
}
