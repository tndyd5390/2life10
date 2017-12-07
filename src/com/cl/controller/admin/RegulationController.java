//���ù��� ��Ʈ�ѷ�
package com.cl.controller.admin;

import java.util.HashMap;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.cl.dto.RegulationDTO;
import com.cl.service.IRegulationService;
import com.cl.util.CmmUtil;
import com.cl.util.FileUtil;
import com.cl.util.PageUtil;

@Controller
public class RegulationController {
	
	private Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="RegulationService")
	private IRegulationService regulationService;
	private String regulationSavePath = "C:\\Users\\Data3811-32\\git\\2life10\\WebContent\\regulationFile\\";
	
	/**
	 * 
	 * @param req
	 * @param resp
	 * @param model
	 * @param session
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="Lmin/regulation/regulationList", method= {RequestMethod.GET, RequestMethod.POST})
	public String regulationList(HttpServletRequest req, HttpServletResponse resp, Model model, HttpSession session) throws Exception{
		log.info(this.getClass() + ".regulationList start!!!");
		
		int splitPage = 10;
		
		HashMap<String, Object> hMap = new HashMap<>();
		hMap = PageUtil.paging(req, splitPage);
		hMap = regulationService.getRegulationList(hMap);
		model.addAttribute("hMap", hMap);
		
		hMap = null;
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
		model.addAttribute("url", "/Lmin/regulation/regulationList.do");
		
		regulationTitle = null;
		regulationContents = null;
		regMemberNo = null;
		rDTO = null;
		regulationFileName = null;
		regulationFileOrgName = null;
		
		log.info(this.getClass() + ".regulationRegProc end!!!");
		return "alert";
	}
	
	@RequestMapping(value="Lmin/regulation/regulationDetail", method=RequestMethod.GET)
	public String regulationDetail(HttpServletRequest req, HttpServletResponse resp, Model model, HttpSession sessino) throws Exception{
		log.info(this.getClass() + ".regulationDetail start!!!");
		
		String regulationNo = CmmUtil.nvl(req.getParameter("regulationNo"));
		log.info(" regulationNo : " + regulationNo);
		
		RegulationDTO rDTO = regulationService.getRegulationDetail(regulationNo);
		if(rDTO == null) rDTO = new RegulationDTO();
		
		model.addAttribute("rDTO", rDTO);
		
		regulationNo = null;
		rDTO = null;
		log.info(this.getClass() + ".regulationDetail end!!!");
		return "/Lmin/regulation/regulation_view";
	}
	
	@RequestMapping(value="Lmin/regulation/regulationDelete", method=RequestMethod.GET)
	public String regulationDeleteProc(HttpServletRequest req, HttpServletResponse resp, Model model, HttpSession session) throws Exception{
		log.info(this.getClass() + ".regulationDelete start!!!");
		
		String regulationNo = CmmUtil.nvl(req.getParameter("regulationNo"));
		log.info(" regulationNo : " + regulationNo);
		
		RegulationDTO rDTO = regulationService.deleteRegulation(regulationNo);
		
		if(rDTO != null) {
			FileUtil.deleteFile(CmmUtil.nvl(rDTO.getRegulationFilePath()), CmmUtil.nvl(rDTO.getRegulationFileName()));
			model.addAttribute("msg", "상조관련법규 삭제에 성공했습니다.");
		}else {
			model.addAttribute("msg", "상조관련법규 삭제에 실패 했습니다.");
		}
		model.addAttribute("url", "/Lmin/regulation/regulationList.do");
		
		regulationNo = null;
		rDTO = null;
		
		log.info(this.getClass() + ".regulationDelete end!!!");
		return "/alert";
	}
	
	@RequestMapping(value="Lmin/regulation/regulationUpdateView", method=RequestMethod.GET)
	public String regulationUpdateView(HttpServletRequest req, HttpServletResponse resp, Model model, HttpSession session) throws Exception{
		log.info(this.getClass() + ".regulationUpdateView start!!!");
		
		String regulationNo = CmmUtil.nvl(req.getParameter("regulationNo"));
		log.info(" regulationNo : " + regulationNo);
		
		RegulationDTO rDTO = regulationService.getRegulationDetail(regulationNo);
		if(rDTO == null) rDTO = new RegulationDTO();
		
		model.addAttribute("rDTO", rDTO);
		
		regulationNo = null;
		rDTO= null;
		
		log.info(this.getClass() + ".regulationUpdateView end!!!");
		return "/Lmin/regulation/regulation_update_view";
	}
	
	@RequestMapping(value="Lmin/regulation/regulationDeleteImg", method=RequestMethod.POST)
	public void regulationDeleteImg(HttpServletRequest req, HttpServletResponse resp, Model model, HttpSession session) throws Exception{
		log.info(this.getClass() + ".regulationDeleteImg start!!!");
		
		String regulationNo = CmmUtil.nvl(req.getParameter("regulationNo"));
		log.info(" regulationNo : " + regulationNo);
		String regulationFileNo = CmmUtil.nvl(req.getParameter("regulationFileNo"));
		log.info(" regulationFileNo : " + regulationFileNo); 
		String chgMemberNo = (String)session.getAttribute("ss_member_no");
		log.info(" memberNo : " + chgMemberNo);
		
		Map<String, String> map = new HashMap<>();
		map.put("regulationNo", regulationNo);
		map.put("regulationFileNo", regulationFileNo);
		map.put("chgMemberNo", chgMemberNo);
		
		int result = regulationService.updateRegulationImgNull(map);
		
		resp.getWriter().println(result);
		
		regulationNo = null;
		regulationFileNo = null;
		chgMemberNo = null;
		map = null;
		
		log.info(this.getClass() + ".regulationDeleteImg end!!!");
	}
	
	@RequestMapping(value="Lmin/regulation/regulationImgChangeView")
	public String regulationImgChangeView(HttpServletRequest req, HttpServletResponse resp, Model model, HttpSession session) throws Exception{
		log.info(this.getClass() + ".regulationImgChangeView start!!");
		String regulationNo = CmmUtil.nvl(req.getParameter("regulationNo"));
		log.info(" regulationNo : " + regulationNo);
		
		RegulationDTO rDTO = regulationService.getRegulationDetail(regulationNo);
		if(rDTO == null) rDTO = new RegulationDTO();
		
		model.addAttribute("rDTO", rDTO);
		
		regulationNo = null;
		rDTO = null;
		
		log.info(this.getClass() + ".regulationImgChangeView end!!!");
		return "/Lmin/regulation/regulation_img_update";
	}
	
	
	@RequestMapping(value="Lmin/regulation/regulationImgChange")
	public void regulationImgChange(MultipartHttpServletRequest mulReq, HttpServletRequest req, HttpServletResponse resp, Model model, HttpSession session) throws Exception{
		log.info(this.getClass() + ".regulationChangeImg start!!!");
		
		String regulationNo = CmmUtil.nvl(req.getParameter("regulationNo"));
		log.info(" regulationNo : " + regulationNo);
		String preFileNo = CmmUtil.nvl(req.getParameter("preFileNo"));
		log.info(" preFileNo : " + preFileNo);
		String preFileName = CmmUtil.nvl(req.getParameter("preFileName"));;
		log.info(" preFileName : " + preFileName);
		String preFilePath = CmmUtil.nvl(req.getParameter("preFilePath"));
		log.info(" proFilePath : " + preFilePath);
		String chgMemberNo = (String)session.getAttribute("ss_member_no");
		log.info(" memberNo : " + chgMemberNo);
		
		MultipartFile file = mulReq.getFile("regulationFile");
		String reFileName = "";
		String regulationFileOrgName = CmmUtil.nvl(file.getOriginalFilename());
		log.info(" regulationFileOrgName : " + regulationFileOrgName);
		reFileName = FileUtil.fileSave(file, regulationSavePath);
		
		RegulationDTO rDTO = new RegulationDTO();
		rDTO.setRegulationNo(regulationNo);
		rDTO.setRegulationFileOrgName(regulationFileOrgName);
		rDTO.setRegulationFilePath(regulationSavePath);
		rDTO.setRegulationFileName(reFileName);
		rDTO.setChgMemberNo(chgMemberNo);
		
		Map<String, Object> map = new HashMap<>();
		map.put("rDTO", rDTO);
		map.put("deleteFileNo", preFileNo);
		
		int result = regulationService.updateRegulationImg(map);
		
		if(result != 0) {
			resp.getWriter().println(reFileName);
			FileUtil.deleteFile(preFilePath, preFileName);
		}else {
			resp.getWriter().println(0);
		}
		
		regulationNo = null;
		preFileNo = null;
		preFileName = null;
		preFilePath = null;
		chgMemberNo = null;
		file = null;
		reFileName = null;
		regulationFileOrgName = null;
		map = null;
				
		
		log.info(this.getClass() + ".regualtionChangeImg end!!!");
	}
	
	@RequestMapping(value="Lmin/regulation/regulationUpdateProc", method=RequestMethod.POST)
	public String regulationUpdateProcWithoutImg(MultipartHttpServletRequest mulReq, HttpServletRequest req, HttpServletResponse resp, Model model, HttpSession session) throws Exception{
		log.info(this.getClass() + ".regulationUpdateProcWithoutImg start!!"); 
		
		String regulationNo = CmmUtil.nvl(req.getParameter("regulationNo"));
		log.info(" regulationNo : " + regulationNo);
		String regulationTitle = CmmUtil.nvl(req.getParameter("regulationTitle"));
		log.info(" regulationTitle : " + regulationTitle);
		String regulationContents = CmmUtil.nvl(req.getParameter("regulationContents"));
		log.info(" regulationContents : " + regulationContents);
		String chgMemberNo = (String)session.getAttribute("ss_member_no");
		log.info(" memberNo : " + chgMemberNo);
		
		MultipartFile file = mulReq.getFile("regulationFile");
		String regulationFileOrgName = "";
		if(file !=  null) {
			regulationFileOrgName = CmmUtil.nvl(file.getOriginalFilename());
			log.info(" regulationFileName : " + regulationFileOrgName);
		}

		RegulationDTO rDTO = new RegulationDTO();
		rDTO.setRegulationTitle(regulationTitle);
		rDTO.setRegulationContents(regulationContents);
		rDTO.setChgMemberNo(chgMemberNo);
		rDTO.setRegulationNo(regulationNo);
		
		if(!"".equals(regulationFileOrgName)) {
			String regulationReFileName = FileUtil.fileSave(file, regulationSavePath);
			rDTO.setRegulationFileName(regulationReFileName);
			rDTO.setRegulationFileOrgName(regulationFileOrgName);
			rDTO.setRegulationFilePath(regulationSavePath);
		}
		
		int result = regulationService.updateRegulation(rDTO);
		if(result != 0) {
			model.addAttribute("msg", "상조관련법규 수정에 성공했습니다.");
		}else {
			model.addAttribute("msg", "상조관련법규 수정에 실패했습니다.");
		}
		model.addAttribute("url", "/Lmin/regulation/regulationList.do");
		
		regulationNo = null;
		regulationTitle = null;
		regulationContents = null;
		chgMemberNo= null;
		rDTO = null;
		
		log.info(this.getClass() + ".regulationUpdateProcWithoutImg end!!!");
		return "/alert";
	}
}
