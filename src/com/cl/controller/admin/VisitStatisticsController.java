package com.cl.controller.admin;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpServletResponse;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import com.cl.service.IAdviceService;
import com.cl.service.IVisitStatisticsService;
import com.cl.util.CmmUtil;

@Controller
public class VisitStatisticsController {

private Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="VisitStatisticsService")
	private IVisitStatisticsService visitStatisticsService;
	
	@RequestMapping("/visitStatistics/visit")
	public void visit(HttpServletRequest req, HttpServletResponse resp, Model model, HttpSession session) throws Exception{
		log.info(this.getClass() + ".visitStatistics start!!!");
		String visitID = CmmUtil.nvl(req.getParameter("visitID"));
		log.info("visitID : " + visitID);
		String url = CmmUtil.nvl(req.getParameter("URL"));
		log.info("URL : " + url);
		
		Map<String, String> visitInfo = new HashMap<>();
		visitInfo.put("visitID", visitID);
		visitInfo.put("URL", url);
		visitInfo.put("uType", visitID.substring(0, 1));
		
		visitStatisticsService.insertVisitInfo(visitInfo);
		
		visitID = null;
		url = null;
		visitInfo = null;
		
		log.info(this.getClass() + ".visitStatistics end!!!");
	}
	
}
