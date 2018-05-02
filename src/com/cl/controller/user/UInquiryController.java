//������ȸ ��Ʈ�ѷ�
package com.cl.controller.user;

import java.util.ArrayList;
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
import org.springframework.web.bind.annotation.RequestMethod;

import com.cl.service.IInquiryService;
import com.cl.util.CmmUtil;

@Controller
public class UInquiryController {
	
	private Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="InquiryService")
	private IInquiryService inquiryService;
	
	@RequestMapping(value="/inquiry/inquiryList", method={RequestMethod.GET, RequestMethod.POST})
	public String inquiryInfo(HttpServletRequest req, HttpServletResponse resp, Model model, HttpSession session) throws Exception{
		log.info(this.getClass() + ".inquiryInfo start!!!");
		
		String memberPreNo = CmmUtil.nvl((String)session.getAttribute("ss_member_pre"));
		log.info("memberPreNo : " + memberPreNo);
		if("".equals(memberPreNo)){
			model.addAttribute("msg", "로그인을 해주세요.");
			model.addAttribute("url", "/member/login.do");
			return "/alert";
		}
		
		if("N".equals(memberPreNo) || "".equals(memberPreNo)){
			model.addAttribute("msg", "납부조회가 되지 않습니다. 전화로 문의해 주세요.");
			model.addAttribute("url", "/");
			return "/alert";
		}
		
		List<Map<String, Object>> map = inquiryService.getInquiryTab(memberPreNo);
		if(map == null) map = new ArrayList();
		
		model.addAttribute("totalInquiry", map);

		memberPreNo = null;
		map = null;
		
		log.info(this.getClass() + ".inquiryInfo end!!!");
		return "/inquiry/inquiry_list";
	}
	
	
}
