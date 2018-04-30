//1:1��� ��Ʈ�ѷ�
package com.cl.controller.admin;

import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cl.dto.CounselDTO;
import com.cl.service.ICodeService;
import com.cl.service.ICounselService;
import com.cl.util.AES256Util;
import com.cl.util.CmmUtil;
import com.cl.util.PageUtil;
import com.cl.util.SHA256Util;
import com.cl.util.SessionUtil;

@Controller
public class CounselController {
	
	private Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="CounselService")
	private ICounselService counselService;
	@Resource(name="CodeService")
	private ICodeService codeService;
	
	@RequestMapping("/Lmin/counsel/counselList")
	public String counselList(HttpServletRequest req, Model model, HttpServletResponse resp, HttpSession session) throws Exception{
		log.info("Lmin:counselList Start!!");
		SessionUtil.sessionCheck(resp, session);
		int splitPage = 10;
		
		HashMap<String, Object> hMap = new HashMap<>();
		hMap = PageUtil.paging(req, splitPage);
		hMap = counselService.getCounselList(hMap);
		
		model.addAttribute("hMap", hMap);
		hMap = null;
		log.info("Lmin:counselList End!!");
		return "/Lmin/counsel/counsel_list";
	}
	
	@RequestMapping("/Lmin/counsel/counselWrite")
	public String counselWrite(HttpServletRequest req, Model model, HttpServletResponse resp, HttpSession session) throws Exception{
		log.info("Lmin:counselWrite Start!!");
		SessionUtil.sessionCheck(resp, session);
		
		log.info("Lmin:counselWrite End!!");
		return "/Lmin/counsel/counsel_write";
	}
	
	@RequestMapping("/Lmin/counsel/counselRegProc")
	public String counselRegProc(HttpServletRequest req, Model model, HttpServletResponse resp, HttpSession session) throws Exception{
		log.info("Lmin:counselRegProc Start!!");
		SessionUtil.sessionCheck(resp, session);
		String url = "";
		String msg = "";
		String counselReply = "N";
		String counselRegName = CmmUtil.nvl(req.getParameter("name"));
		String counselTitle = CmmUtil.nvl(req.getParameter("title"));
		String counselContents = CmmUtil.nvl(req.getParameter("contents"));
		String counselEmail1 = CmmUtil.nvl(req.getParameter("email1"));
		String counselEmail2 = CmmUtil.nvl(req.getParameter("email2"));
		String counselPassword = SHA256Util.sha256(CmmUtil.nvl(req.getParameter("password")));
		String counselPhoneNo = CmmUtil.nvl(req.getParameter("phone1"))+"-"+CmmUtil.nvl(req.getParameter("phone2"))+"-"+CmmUtil.nvl(req.getParameter("phone3"));
		
		log.info("counselRegName : "+counselRegName);
		log.info("counselRegTitle : "+counselTitle);
		log.info("counselRegContents : "+counselContents);
		log.info("counselRegEmail1 : "+counselEmail1);
		log.info("counselRegEmail2 : "+counselEmail2);
		log.info("counselPhoneNo : "+counselPhoneNo);
		log.info("counselPassword : "+counselPassword);
		
		CounselDTO cDTO = new CounselDTO();
		
		cDTO.setCounselRegName(AES256Util.strEncode(counselRegName));
		cDTO.setCounselTitle(counselTitle);
		cDTO.setCounselContents(counselContents);
		cDTO.setCounselReply(counselReply);
		cDTO.setCounselEmail1(AES256Util.strEncode(counselEmail1));
		cDTO.setCounselEmail2(AES256Util.strEncode(counselEmail2));
		cDTO.setCounselPhoneNo(AES256Util.strEncode(counselPhoneNo));
		cDTO.setCounselPassword(counselPassword);
		
		int result = counselService.insertCounsel(cDTO);
		
		if(result==0){
			msg = "상담사 등록에 실패했습니다.";
		}else{
			msg = "상담사 등록에 성공했습니다.";
		}
		url = "/Lmin/counsel/counselList.do";
		model.addAttribute("url", url);
		model.addAttribute("msg", msg);
		
		url = null;
		msg = null;
		counselReply = null;
		counselRegName = null;
		counselTitle = null;
		counselContents = null;;
		counselEmail1 = null;
		counselEmail2 = null;
		counselPassword = null;
		counselPhoneNo = null;
		cDTO = null;
		log.info("Lmin:counselRegProc End!!");
		return "/alert";
	}
	
	@RequestMapping("/Lmin/counsel/counselDetail")
	public String counselDetail(HttpServletRequest req, Model model, HttpServletResponse resp, HttpSession session) throws Exception{
		log.info("Lmin:counselDetail Start!!");
		SessionUtil.sessionCheck(resp, session);
		String counselNo = CmmUtil.nvl(req.getParameter("cNo"));
		log.info("counselNo : "+counselNo);
		
		CounselDTO cDTO = new CounselDTO();
		cDTO.setCounselNo(counselNo);
		cDTO = counselService.getCounselDetail(cDTO);
		
		model.addAttribute("cDTO", cDTO);
		counselNo = null;
		cDTO = null;
		log.info("Lmin:counselDetail End!!");
		return "/Lmin/counsel/counsel_view";
	}
	
	@RequestMapping("/Lmin/counsel/counselReplyProc")
	public String counselReplyProc(HttpServletRequest req, Model model, HttpSession session, HttpServletResponse resp) throws Exception{
		log.info("Lmin:counselReplyProc Start!!");
		SessionUtil.sessionCheck(resp, session);
		String url = "";
		String msg = "";
		String counselNo = CmmUtil.nvl(req.getParameter("cNo"));
		String chgMemberNo = CmmUtil.nvl((String) session.getAttribute("ss_member_no"));
		
		log.info("counselNo : "+counselNo);
		log.info("chgMemberNo : "+chgMemberNo);
		
		CounselDTO cDTO = new CounselDTO();
		cDTO.setCounselNo(counselNo);
		cDTO.setCounselReply("Y");
		cDTO.setChgMemberNo(chgMemberNo);
		
		int result = counselService.updateReplyStat(cDTO);
		
		if(result==0){
			msg = "상담사 수정에 실패했습니다.";
		}else{
			msg = "상담사 수정에 성공했습니다.";
		}
		url = "/Lmin/counsel/counselList.do";
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		url = null;
		msg = null;
		counselNo = null;
		chgMemberNo = null;;
		cDTO = null;
		log.info("Lmin:counselReplyProc End!!");
		return "/alert";
	}
	
	@RequestMapping(value="/Lmin/counsel/deleteCounsel")
	public String deleteCounsel(HttpServletRequest req, HttpServletResponse resp, Model model, HttpSession session) throws Exception{
		
		String returnPage = "";
		String msg = "";
		String url = "";
		String cNo = CmmUtil.nvl(req.getParameter("cNo"));
		log.info("cNo : " + cNo);
		
		
		int result = counselService.deleteCounsel(cNo);
		
		if(result != 0){
			returnPage = "redirect:/Lmin/counsel/counselList.do";
		}else{
			msg = "삭제 실패...";
			url = "/Lmin/counsel/counselList.do";
			model.addAttribute("msg", msg);
			model.addAttribute("url", url);
			returnPage = "/alert";
		}
		
		return returnPage;
	}
}
