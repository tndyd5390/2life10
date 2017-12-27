//占싸곤옙舡占� 占쏙옙트占싼뤄옙
package com.cl.controller.user;

import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cl.service.IFuneralNoticeService;
import com.cl.util.PageUtil;

@Controller
public class UFuneralNoticeController {
	
	private Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="FuneralNoticeService")
	private IFuneralNoticeService funeralNoticeService;
	
	@RequestMapping("/funeral/funeralNoticeList")
	public String funeralNoticeList(HttpServletRequest req, Model model) throws Exception{
		log.info("funeralNoticeList Start!!");
		
		int viewCount = 10;
		int splitPage = 5;
		
		HashMap<String, Object> hMap = new HashMap<>();
		
		hMap = PageUtil.paging(req, splitPage);
		hMap.put("page", viewCount);
		hMap = funeralNoticeService.getUserFuneralNoticeList(hMap);
		
		model.addAttribute("hMap", hMap);
		
		hMap = null;
		log.info("funeralNoticeList End!!");
		return "/funeral/funeral_notice";
	}

}
