//������ȸ ��Ʈ�ѷ�
package com.cl.controller.admin;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Locale;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cl.dto.NoticeDTO;
import com.cl.service.IMainService;
import com.cl.service.INoticeService;
import com.mysql.fabric.Response;

@Controller
public class MainController {
	
	private Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="MainService")
	private IMainService mainService;
	
	@Resource(name="NoticeService")
	private INoticeService noticeService;

	@RequestMapping("/main")
	public String main(Model model) throws Exception{
		log.info("main Start!!");
		
		HashMap<String, Object> hMap = new HashMap<>();
		hMap = mainService.getMainList();
		
		model.addAttribute("hMap", hMap);
		hMap = null;
		log.info("main End!!");
		return "/index";
	}
	
	@RequestMapping(value="/popup/mainPopup")
	public String mainPopup(HttpServletRequest req, HttpServletResponse resp, Model model) throws Exception{
		
		log.info(this.getClass() + ".mainPopup start!!!");
		
		NoticeDTO nDTO = new NoticeDTO();
		nDTO.setNoticeNo("46");
		
		nDTO = noticeService.getNoticeDetail(nDTO);
		
		model.addAttribute("nDTO", nDTO);
		
		log.info(this.getClass() + ".mainPopup end!!!");
		
		return "/popup/mainPopup";
	}
	
	@RequestMapping(value="/popup/setCookieOneDay")
	public void setCookieOneDay(HttpServletRequest req, HttpServletResponse resp, Model model) throws Exception{
		log.info(this.getClass() + ".setCookieOneDay start!!!");
		
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd", Locale.KOREA);
		Date now = new Date();
		
		Cookie cookie = new Cookie("pop", df.format(now));
		cookie.setPath("/");
		cookie.setMaxAge(60*60*24);
		resp.addCookie(cookie);
		
		System.out.println("cookie set complete!!");
		resp.getWriter().println("1");
		
		log.info(this.getClass() + ".setCookieOneDay end!!!");
	}
	
	@RequestMapping(value="/popup/popupTest")
	public String popupTest(HttpServletRequest req, HttpServletResponse resp, Model model) throws Exception{
		log.info(this.getClass() + ".mainPopup start!!!");
		
		NoticeDTO nDTO = new NoticeDTO();
		nDTO.setNoticeNo("46");
		
		nDTO = noticeService.getNoticeDetail(nDTO);
		
		model.addAttribute("nDTO", nDTO);
		
		log.info(this.getClass() + ".mainPopup end!!!");
		
		return "/popup/mainPopup";
		
	}
}
