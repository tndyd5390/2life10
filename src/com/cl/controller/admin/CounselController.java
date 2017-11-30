//1:1��� ��Ʈ�ѷ�
package com.cl.controller.admin;

import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

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

@Controller
public class CounselController {
	
	private Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="CounselService")
	private ICounselService counselService;
	@Resource(name="CodeService")
	private ICodeService codeService;
	
	@RequestMapping("/Lmin/counsel/counselList")
	public String counselList(HttpServletRequest req, Model model) throws Exception{
		log.info("Lmin:counselList Start!!");
		
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
	public String counselWrite(HttpServletRequest req, Model model) throws Exception{
		log.info("Lmin:counselWrite Start!!");
		
		
		log.info("Lmin:counselWrite End!!");
		return "/Lmin/counsel/counsel_write";
	}
	
	@RequestMapping("/Lmin/counsel/counselRegProc")
	public String counselRegProc(HttpServletRequest req, Model model) throws Exception{
		log.info("Lmin:counselRegProc Start!!");
		
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
			msg = "등록실패";
		}else{
			msg = "등록성공";
		}
		url = "/Lmin/counsel/counselList.do";
		model.addAttribute("url", url);
		model.addAttribute("msg", msg);
		cDTO = null;
		log.info("Lmin:counselRegProc End!!");
		return "/alert";
	}
	
	@RequestMapping("/Lmin/counsel/counselDetail")
	public String counselDetail(HttpServletRequest req, Model model) throws Exception{
		log.info("Lmin:counselDetail Start!!");
		
		String counselNo = CmmUtil.nvl(req.getParameter("cNo"));
		log.info("counselNo : "+counselNo);
		
		CounselDTO cDTO = new CounselDTO();
		cDTO.setCounselNo(counselNo);
		cDTO = counselService.getCounselDetail(cDTO);
		
		model.addAttribute("cDTO", cDTO);
		cDTO = null;
		log.info("Lmin:counselDetail End!!");
		return "/Lmin/counsel/counsel_view";
	}
	
	@RequestMapping("/Lmin/counsel/counselReplyProc")
	public String counselReplyProc(HttpServletRequest req, Model model) throws Exception{
		log.info("Lmin:counselReplyProc Start!!");
		
		String url = "";
		String msg = "";
		String counselNo = CmmUtil.nvl(req.getParameter("cNo"));
		log.info("counselNo : "+counselNo);
		
		CounselDTO cDTO = new CounselDTO();
		cDTO.setCounselNo(counselNo);
		cDTO.setCounselReply("Y");
		
		int result = counselService.updateReplyStat(cDTO);
		
		if(result==0){
			msg = "변경실패";
		}else{
			msg = "변경성공";
		}
		url = "/Lmin/counsel/counselList.do";
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		log.info("Lmin:counselReplyProc End!!");
		return "/alert";
	}
}
