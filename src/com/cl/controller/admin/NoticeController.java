//공지사항 컨트롤러
package com.cl.controller.admin;

import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cl.service.INoticeService;
import com.cl.util.PageUtil;

@Controller
public class NoticeController {
	
	private Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="NoticeService")
	private INoticeService noticeService;
	
	@RequestMapping("/Lmin/notice/noticeList")
	public String noticeList(HttpServletRequest req, Model model) throws Exception{
		log.info("Lmin:noticeList Start!!");

		int splitPage = 10;
	
		HashMap<String, Object> hMap = new HashMap<>();
		
		hMap = PageUtil.paging(req, splitPage);
		
		hMap = noticeService.getNoticeList(hMap);
		
		model.addAttribute("hMap", hMap);
		
		log.info("Lmin:noticeList End!!");
		return "/Lmin/notice/notice_list";
	}
	
}
