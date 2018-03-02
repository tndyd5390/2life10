package com.cl.controller.admin;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cl.dto.AnalysisDTO;
import com.cl.service.IAnalysisService;
import com.cl.util.SessionUtil;

@Controller
public class AnalysisController {
	private Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="AnalysisService")
	private IAnalysisService analysisService;
	
	@RequestMapping(value="/Lmin/analysis/analysisList")
	public String analysisList(HttpServletResponse resp, HttpSession session) throws Exception{
		log.info("Lmin:analysisList Start!!");
		SessionUtil.sessionCheck(resp, session);
		log.info("Lmin:analysisList End!!");
		return "/Lmin/analysis/analysis_list";
	}
	
	@RequestMapping(value="/Lmin/analysis/sexAnalysis")
	public @ResponseBody List<AnalysisDTO> sexAnaysis() throws Exception{
		log.info("Lmin:sexAnalysis Start!!");
		
		log.info("Lmin:sexAnalysis End!!");
		return analysisService.getSexAnalysisData();
	}
	
	@RequestMapping(value="/Lmin/analysis/ageAnalysis")
	public @ResponseBody List<AnalysisDTO> ageAnalysis() throws Exception{
		log.info("Lmin:ageAnalysis Start!!");
		
		log.info("Lmin:ageAnalysis End!!");		
		return analysisService.getAgeAnalysisData();
	}
	
	@RequestMapping(value="/Lmin/analysis/reRegAnalysis")
	public @ResponseBody List<AnalysisDTO> reRegAnalysis() throws Exception{
		log.info("Lmin:reRegAnalysis Start!!");
		
		log.info("Lmin:reRegAnalysis End!!");	
		return analysisService.getReRegAnalysis();
	}
	
	@RequestMapping(value="/Lmin/analysis/regYearAnalysis")
	public @ResponseBody List<AnalysisDTO> regYearAnalysis() throws Exception{
		log.info("Lmin:regYearAnalysis Start!!");
		
		log.info("Lmin:regYearAnalysis End!!");	
		return analysisService.getRegYearAnalysis();
	}
	@RequestMapping(value="/Lmin/analysis/stateAnalysis")
	public @ResponseBody List<AnalysisDTO> areaAnalysis() throws Exception{
		log.info("Lmin:stateAnalysis Start!!");
		
		log.info("Lmin:stateAnalysis End!!");	
		return analysisService.getStateAnalysis();
	}
	
	@RequestMapping(value="/Lmin/analysis/itemAnalysis")
	public @ResponseBody List<AnalysisDTO> itemAnalysis() throws Exception{
		log.info("Lmin:itemAnalysis Start!!");
		
		log.info("Lmin:itemAnalysis End!!");	
		return analysisService.getItemAnalysis();
	}
	@RequestMapping(value="/Lmin/analysis/cityAnalysis")
	public @ResponseBody List<AnalysisDTO> cityAnalysis(@RequestParam(value="state") String state) throws Exception{
		log.info("Lmin:cityAnalysis Start!!");
		
		log.info("Lmin:cityAnalysis End!!");	
		return analysisService.getCityAnalysis(state);
	}
}
