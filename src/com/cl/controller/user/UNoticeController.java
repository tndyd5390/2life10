//�������� ��Ʈ�ѷ�
package com.cl.controller.user;

import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cl.dto.NoticeDTO;
import com.cl.service.INoticeService;
import com.cl.util.CmmUtil;
import com.cl.util.PageUtil;

@Controller
public class UNoticeController {
	
	private Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="NoticeService")
	private INoticeService noticeService;
	

	@RequestMapping("/notice/noticeList")
	public String noticeList(HttpServletRequest req, Model model) throws Exception{
		log.info("noticeList Start!!");

		int splitPage = 10;
	
		HashMap<String, Object> hMap = new HashMap<>();
		
		hMap = PageUtil.paging(req, splitPage);
		
		hMap = noticeService.getNoticeList(hMap);
		
		model.addAttribute("hMap", hMap);
		
		log.info(":noticeList End!!");
		return "/notice/notice_list";
	}
	
	@RequestMapping("/notice/noticeDetail")
	public String noticeDetail(HttpServletRequest req, Model model) throws Exception{
		log.info("noticeDetail Start!!");
		
		String noticeNo = CmmUtil.nvl(req.getParameter("nNo"));
		log.info("noticeNo : "+noticeNo);
		
		NoticeDTO nDTO = new NoticeDTO();
		nDTO.setNoticeNo(noticeNo);
		
		nDTO = noticeService.getNoticeDetail(nDTO);
		
		model.addAttribute("nDTO", nDTO);
		
		nDTO = null;
		log.info("noticeDetail End!!");
		return "/notice/notice_view";
	}
}
