//1:1��� ��Ʈ�ѷ�
package com.cl.controller.user;

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
import com.cl.util.SHA256Util;

@Controller
public class UCounselController {
	
	private Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="CounselService")
	private ICounselService counselService;
	@Resource(name="CodeService")
	private ICodeService codeService;
	
	@RequestMapping("/counsel/counselWrite")
	public String counselWrite(HttpServletRequest req, Model model) throws Exception{
		log.info("counselWrite Start!!");
		
		
		log.info("counselWrite End!!");
		return "/counsel/counsel_list";
	}
	
	@RequestMapping("/counsel/counselRegProc")
	public String counselRegProc(HttpServletRequest req, Model model) throws Exception{
		log.info("counselRegProc Start!!");
		
		String url = "";
		String msg = "";
		String counselReply = "N";
		String counselRegName = CmmUtil.nvl(req.getParameter("name"));
		String counselTitle = CmmUtil.nvl(req.getParameter("title"));
		String counselContents = CmmUtil.nvl(req.getParameter("contents"));
		String counselEmail1 = CmmUtil.nvl(req.getParameter("email1"));
		String counselEmail2 = CmmUtil.nvl(req.getParameter("email2"));
		String counselPhoneNo = CmmUtil.nvl(req.getParameter("phone1"))+"-"+CmmUtil.nvl(req.getParameter("phone2"))+"-"+CmmUtil.nvl(req.getParameter("phone3"));
		
		log.info("counselRegName : "+counselRegName);
		log.info("counselRegTitle : "+counselTitle);
		log.info("counselRegContents : "+counselContents);
		log.info("counselRegEmail1 : "+counselEmail1);
		log.info("counselRegEmail2 : "+counselEmail2);
		log.info("counselPhoneNo : "+counselPhoneNo);
		
		CounselDTO cDTO = new CounselDTO();
		
		cDTO.setCounselRegName(AES256Util.strEncode(counselRegName));
		cDTO.setCounselTitle(counselTitle);
		cDTO.setCounselContents(counselContents);
		cDTO.setCounselReply(counselReply);
		cDTO.setCounselEmail1(AES256Util.strEncode(counselEmail1));
		cDTO.setCounselEmail2(AES256Util.strEncode(counselEmail2));
		cDTO.setCounselPhoneNo(AES256Util.strEncode(counselPhoneNo));
		
		int result = counselService.insertCounsel(cDTO);
		
		if(result==0){
			msg = "실패";
		}else{
			msg = "신청 되었습니다.";
		}
		url = "/counsel/counselWrite.do";
		model.addAttribute("url", url);
		model.addAttribute("msg", msg);
		
		cDTO = null;
		url = null;
		msg = null;
		counselReply = null;
		counselRegName = null;
		counselTitle = null;
		counselContents = null;
		counselEmail1 = null;
		counselEmail2 = null;
		counselPhoneNo = null;
		cDTO = null;
		
		log.info("counselRegProc End!!");
		return "/alert";
	}

}
