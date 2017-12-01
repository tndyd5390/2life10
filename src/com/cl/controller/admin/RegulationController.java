//���ù��� ��Ʈ�ѷ�
package com.cl.controller.admin;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.cl.dto.RegulationDTO;
import com.cl.service.IRegulationService;
import com.cl.util.CmmUtil;
import com.cl.util.FileUtil;

@Controller
public class RegulationController {
	
	private Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="RegulationService")
	private IRegulationService regulationService;
	private String regulationSavePath = "C:\\Users\\Data3811-32\\git\\2life10\\WebContent\\regulationFile\\";
	
	@RequestMapping(value="Lmin/regulation/regulationList", method= {RequestMethod.GET, RequestMethod.POST})
	public String regulationList(HttpServletRequest req, HttpServletResponse resp, Model model, HttpSession session) throws Exception{
		log.info(this.getClass() + ".regulationList start!!!");
		
		log.info(this.getClass() + ".regulation end!!!");
		return "/Lmin/regulation/regulation_list";
	}
	
	@RequestMapping(value="Lmin/regulation/regulationRegView", method=RequestMethod.GET)
	public String regulationRegView(HttpServletRequest req, HttpServletResponse resp, Model model, HttpSession session) throws Exception{
		log.info(this.getClass() + ".regulationRegView start!!!");
		
		log.info(this.getClass() + ".regulationRegView end!!!");
		return "/Lmin/regulation/regulation_write";
	}
	
	@RequestMapping(value="Lmin/regulation/regulationRegProc", method=RequestMethod.POST)
	public String regulationRegProc(HttpServletRequest req, HttpServletResponse resp, Model model, HttpSession session, @RequestParam("regulationFile") MultipartFile regulationFile)throws Exception{
		log.info(this.getClass() + ".regulationRegProc start!!!");
		
		String regulationTitle = CmmUtil.nvl(req.getParameter("regulationTitle"));
		log.info(" regulationTitle : " + regulationTitle);
		String regulationContents = CmmUtil.nvl(req.getParameter("regulationContents"));
		log.info(" regulationContents : " + regulationContents);
		String regMemberNo = CmmUtil.nvl((String)session.getAttribute("ss_member_no"));
		log.info(" regMemberNo : " + regMemberNo);

		RegulationDTO rDTO = new RegulationDTO();
		rDTO.setRegMemberNo(regMemberNo);
		rDTO.setRegulationTitle(regulationTitle);
		rDTO.setRegulationContents(regulationContents);
		
		String regulationFileName = null;
		String regulationFileOrgName = null;
		if(!CmmUtil.nvl(regulationFile.getOriginalFilename()).equals("")) {
			regulationFileOrgName = CmmUtil.nvl(regulationFile.getOriginalFilename());
			regulationFileName = FileUtil.fileSave(regulationFile, regulationSavePath);
			log.info(" regulationFileOrgName : " + regulationFileOrgName);
			log.info(" regulationFileName : " + regulationFileName);
			rDTO.setRegulationFilePath(regulationSavePath);
			rDTO.setRegulationFileOrgName(regulationFileOrgName);
			rDTO.setRegulationFileName(regulationFileName);
		}
		
		int result = regulationService.insertRegulation(rDTO);
		
		if(result != 0) {
			model.addAttribute("msg", "상조관련법규 등록에 성공하였습니다.");
		}else {
			model.addAttribute("msg", "상조관련법규 등록에 실패하였습니다.");
		}
		model.addAttribute("msg", "/Lmin/regulation/regulationList.do");
		log.info(this.getClass() + ".regulationRegProc end!!!");
		return "alert";
	}
}
