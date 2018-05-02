//������ȸ ��Ʈ�ѷ�
package com.cl.controller.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cl.dto.MsCustomDTO;
import com.cl.service.IInquiryService;
import com.cl.service.IMsCustomService;
import com.cl.util.CmmUtil;

@Controller
public class InquiryController {
	
	private Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="InquiryService")
	private IInquiryService inquiryService;
	
	@Resource(name="MsCustomService")
	private IMsCustomService msCustomService;
	
	@RequestMapping("/inquiry/inquiryList")
	public String inquiryList(Model model) throws Exception{
		log.info("inquiryList Start!!");
		
		String url = "/main.do";
		String msg = "준비중입니다.";
		
		model.addAttribute("url", url);
		model.addAttribute("msg", msg);
		
		url = null;
		msg = null;
		
		log.info("inquiryList End!!");
		return "/alert";
	}
	
	@RequestMapping(value="/Lmin/inquiry/inquiryInfoInput")
	public String inquiryInfoInput(HttpServletRequest req, HttpServletResponse resp, Model model, HttpSession session) throws Exception{
		log.info(this.getClass() + ".inquiryInfoInput start!!!");
		
		log.info(this.getClass() + ".inquiryInfoInput end!!!"); 
		return "/Lmin/inquiry/inquiryInfoInput";
	}
	
	@RequestMapping(value="/Lmin/inquiry/inquiryCheckAndProc")
	public String inquiryCheckAndProc(HttpServletRequest req, HttpServletResponse resp, Model model, HttpSession session) throws Exception{
		log.info(this.getClass() + ".inquriyCheckAndProc start!!!"); 
		
		String url = "";
		String msg = "";
		
		String name = CmmUtil.nvl(req.getParameter("name"));
		log.info("name : " + name);
		String birthday = CmmUtil.nvl(req.getParameter("birthday"));
		log.info("birthday : " + birthday);
		String phone = CmmUtil.nvl(req.getParameter("phone"));
		log.info("phone : " + phone);
		
		MsCustomDTO msDTO = new MsCustomDTO();
		msDTO.setMemberName(name);
		msDTO.setMemberRrn(birthday);
		msDTO.setPhoneNo(phone);
		
		msDTO = msCustomService.getMemberYN(msDTO);
		
		if(msDTO != null && msDTO.getMemberNo() == null){
			msg = "일치하는 회원이 없습니다.";
			url="/Lmin/inquiry/inquiryInfoInput.do";
			model.addAttribute("msg", msg);
			model.addAttribute("url", url);
			return "/alert";
		}
		
		Map<Object, Object> memberInfo = new HashMap<>();
		memberInfo.put("name", name);
		memberInfo.put("birthday", birthday);
		memberInfo.put("phone", phone);
		
		List<Map<String, Object>> totalInquiry = inquiryService.getInquiryTab(memberInfo);
		model.addAttribute("totalInquiry", totalInquiry);
		
		url = null;
		msg = null;
		name = null;
		birthday = null;
		phone = null;
		msDTO = null;
		memberInfo = null;
		totalInquiry = null;
		
		log.info(this.getClass() + ".inquriyCheckAndProc end!!!");
		return "/Lmin/inquiry/inquiryTab";
	}
}
