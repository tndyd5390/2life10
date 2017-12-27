//������ȸ ��Ʈ�ѷ�
package com.cl.controller.admin;

import java.io.File;
import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.cl.dto.CatalogueDTO;
import com.cl.service.ICatalogueService;
import com.cl.util.CmmUtil;
import com.cl.util.FileUtil;
import com.cl.util.PageUtil;
import com.cl.util.SessionUtil;

@Controller
public class CatalogueController {
	
	private Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="CatalogueService")
	private ICatalogueService catalogueService;
	
	String catalogueFileSavePath = "/www/thunder-edu_com/file/catalogue/file/";
		
	@RequestMapping("/Lmin/catalogue/catalogueList")
	public String catalogueList(HttpServletRequest req, Model model, HttpServletResponse resp, HttpSession session) throws Exception{
		log.info("Lmin:catalogueList Start!!");
		SessionUtil.sessionCheck(resp, session);
		int splitPage = 10;
	
		HashMap<String, Object> hMap = new HashMap<>();
		
		hMap = PageUtil.paging(req, splitPage);
		
		hMap = catalogueService.getCatalogueList(hMap);
		
		model.addAttribute("hMap", hMap);
		
		hMap = null;
		
		log.info("Lmin:catalogueList End!!");
		return "/Lmin/catalogue/catalogue_list";
	}
	
	@RequestMapping("/Lmin/catalogue/catalogueWrite")
	public String catalogueWrite(HttpServletResponse resp, HttpSession session) throws Exception{
		log.info("Lmin:catalogueWrite Start!!");
		SessionUtil.sessionCheck(resp, session);
		log.info("Lmin:catalogueWrite End!!");
		return "/Lmin/catalogue/catalogue_write";
	}
	
	@RequestMapping("/Lmin/catalogue/catalogueRegProc")
	public String catalogueRegProc(HttpServletRequest req,HttpServletResponse resp, Model model, HttpSession session, MultipartHttpServletRequest mulReq) throws Exception{
		log.info("Lmin:catalogueRegProc Start!!");
		SessionUtil.sessionCheck(resp, session);
		MultipartFile file = mulReq.getFile("file");
		String url = "";
		String msg = "";
		String regMemberNo = CmmUtil.nvl((String)session.getAttribute("ss_member_no"));
		String catalogueName = CmmUtil.nvl(req.getParameter("name"));
		String catalogueContents = CmmUtil.nvl(req.getParameter("contents"));
		String catalogueStart = CmmUtil.nvl(req.getParameter("start"));
		String catalogueEnd = CmmUtil.nvl(req.getParameter("end"));
		String catalogueFileOrgName = CmmUtil.nvl(file.getOriginalFilename());
		String catalogueFileName = FileUtil.fileSave(file, catalogueFileSavePath);
		
		log.info("regMemberNo : " +regMemberNo);
		log.info("catalogueName : " +catalogueName);
		log.info("catalogueContents : " +catalogueContents);
		log.info("catalogueStart : " +catalogueStart);
		log.info("catalogueEnd : " +catalogueEnd);
		log.info("catalogueFileOrgName : " +catalogueFileOrgName);
		log.info("catalogueFileName : " +catalogueFileName);
		
		CatalogueDTO cDTO = new CatalogueDTO();
		cDTO.setCatalogueName(catalogueName);
		cDTO.setCatalogueStart(catalogueStart);
		cDTO.setCatalogueContents(catalogueContents);
		cDTO.setCatalogueEnd(catalogueEnd);
		cDTO.setRegMemberNo(regMemberNo);
		cDTO.setCatalogueFileName(catalogueFileName);
		cDTO.setCatalogueFileOrgName(catalogueFileOrgName);
		cDTO.setCatalogueFilePath(catalogueFileSavePath);
		
		int result = catalogueService.insertCatalogue(cDTO);
		
		
		url = "/Lmin/catalogue/catalogueList.do";
		if(result == 0){
			msg = "카달로그 등록에 실패했습니다.";
		}else{
			msg = "카달로그 등록에 성공했습니다.";
		}
		
		cDTO = null;
		
		model.addAttribute("url", url);
		model.addAttribute("msg", msg);
		log.info("Lmin:catalogueRegProc End!!");
		return "/alert";
	}
	
	@RequestMapping("/Lmin/catalogue/catalogueDownload")
	public ModelAndView catalogueDownload(HttpServletRequest req, HttpServletResponse resp, HttpSession session) throws Exception{
		log.info("Lmin:catalogueDownLoad Start!!");
		SessionUtil.sessionCheck(resp, session);
		String catalogueNo = CmmUtil.nvl(req.getParameter("cNo"));
		
		log.info("catalogueNo : "+catalogueNo);
		
		CatalogueDTO cDTO = new CatalogueDTO();
		cDTO = catalogueService.getCatalogueFile(catalogueNo);
		
		String path = CmmUtil.nvl(cDTO.getCatalogueFilePath());
		String fileName = CmmUtil.nvl(cDTO.getCatalogueFileName());
		String fileOrgName = CmmUtil.nvl(cDTO.getCatalogueFileOrgName());
		
		log.info("path : " +path);
		log.info("fileName : " +fileName);
		log.info("fileOrgName : " +fileOrgName);
		File file = new File(path + fileName);
		
		ModelAndView mav = new ModelAndView("download", "downloadFile", file);
		mav.addObject("fileOrgName", fileOrgName);
		
		cDTO = null;
		file = null;
		
		log.info("Lmin:catalogueDownLoad End!!");
		return mav;
	}
	
	@RequestMapping("/Lmin/catalogue/catalogueDetail")
	public String catalogueDetail(HttpServletRequest req, Model model, HttpServletResponse resp, HttpSession session) throws Exception{
		log.info("Lmin:catalogueDetail Start!!");
		SessionUtil.sessionCheck(resp, session);
		String catalogueNo = CmmUtil.nvl(req.getParameter("cNo"));
		
		log.info("catalogueNo : "+ catalogueNo);
		
		CatalogueDTO cDTO = new CatalogueDTO();
		cDTO = catalogueService.getCatalogueDetail(catalogueNo);
		
		model.addAttribute("cDTO", cDTO);
		
		cDTO = null;
		log.info("Lmin:catalogueDetail End!!");
		return "/Lmin/catalogue/catalogue_view";
	}
	
	@RequestMapping("/Lmin/catalogue/catalogueUpdateProc")
	public String catalogueUpdateProc(HttpServletRequest req, Model model, HttpSession session, MultipartHttpServletRequest mulReq, HttpServletResponse resp) throws Exception{
		log.info("Lmin:catalogueUpdateProc Start!!");
		SessionUtil.sessionCheck(resp, session);
		MultipartFile file = mulReq.getFile("file");
		String url = "";
		String msg = "";
		String chgMemberNo = CmmUtil.nvl((String) session.getAttribute("ss_member_no"));
		String catalogueNo = CmmUtil.nvl(req.getParameter("cNo"));
		String catalogueName = CmmUtil.nvl(req.getParameter("name"));
		String catalogueContents = CmmUtil.nvl(req.getParameter("contents"));
		String catalogueStart = CmmUtil.nvl(req.getParameter("start"));
		String catalogueEnd = CmmUtil.nvl(req.getParameter("end"));
		String deleteFileNo = CmmUtil.nvl(req.getParameter("fNo"));
		
		log.info("chgMemberNo : " +chgMemberNo);
		log.info("catalogueNo : " +catalogueNo);
		log.info("catalogueName : " +catalogueName);
		log.info("catalogueContents : " +catalogueContents);
		log.info("catalogueStart : " +catalogueStart);
		log.info("catalogueEnd : " +catalogueEnd);
		log.info("deleteFileNo : " +deleteFileNo);
		
		CatalogueDTO cDTO = new CatalogueDTO();
		cDTO.setChgMemberNo(chgMemberNo);
		cDTO.setCatalogueNo(catalogueNo);
		cDTO.setCatalogueName(catalogueName);
		cDTO.setCatalogueContents(catalogueContents);
		cDTO.setCatalogueStart(catalogueStart);
		cDTO.setCatalogueEnd(catalogueEnd);
		
		if(!file.getOriginalFilename().equals("")){
			System.out.println("Ž");
			String deleteFileOrgName = CmmUtil.nvl(req.getParameter("delFileOrg"));
			String deleteFileName = CmmUtil.nvl(req.getParameter("delFileName"));
			String catalogueFileOrgName = CmmUtil.nvl(file.getOriginalFilename());
			String catalogueFileName = FileUtil.fileSave(file, catalogueFileSavePath);
			log.info("catalogueFileOrgName : " +catalogueFileOrgName);
			log.info("catalogueFileName : " +catalogueFileName);
			
			cDTO.setDeleteFileNo(deleteFileNo);
			cDTO.setDeleteFileName(deleteFileName);
			cDTO.setDeleteFileOrgName(deleteFileOrgName);
			cDTO.setCatalogueFileName(catalogueFileName);
			cDTO.setCatalogueFileOrgName(catalogueFileOrgName);
			cDTO.setCatalogueFilePath(catalogueFileSavePath);	
		}
		
		int result = catalogueService.updateCatalogue(cDTO);
		
		url = "/Lmin/catalogue/catalogueList.do";
		
		if(result == 0){
			msg = "카달로그 수정에 실패했습니다.";
		}else{
			msg = "카달로그 수정에 성공했습니다.";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		cDTO = null;
		
		log.info("Lmin:catalogueUpdateProc End!!");
		return "/alert";
	}
	
	@RequestMapping("/Lmin/catalogue/catalogueDeleteProc")
	public String catalogueDeleteProc(HttpServletRequest req, Model model, HttpServletResponse resp, HttpSession session) throws Exception{
		log.info("Lmin:catalogueDeleteProc Start!!");
		SessionUtil.sessionCheck(resp, session);
		String url = "";
		String msg = "";
		String catalogueNo = CmmUtil.nvl(req.getParameter("cNo"));
		String deleteFileNo = CmmUtil.nvl(req.getParameter("fNo"));
		String deleteFileOrgName = CmmUtil.nvl(req.getParameter("delFileOrg"));
		String deleteFileName = CmmUtil.nvl(req.getParameter("delFileName"));
		
		CatalogueDTO cDTO = new CatalogueDTO();
		cDTO.setCatalogueNo(catalogueNo);
		cDTO.setDeleteFileNo(deleteFileNo);
		cDTO.setDeleteFileOrgName(deleteFileOrgName);
		cDTO.setDeleteFileName(deleteFileName);
		cDTO.setDeleteFilePath(catalogueFileSavePath);
		
		log.info("catalogueNo : "+catalogueNo);
		log.info("deleteFileNo : "+deleteFileNo);
		log.info("deleteFileOrgName : "+deleteFileOrgName);
		log.info("deleteFileName : "+deleteFileName);
		log.info("deleteFileFilePath : "+catalogueFileSavePath);
		
		int result = catalogueService.deleteCatalogue(cDTO);
		
		url = "/Lmin/catalogue/catalogueList.do";
		
		if(result == 0){
			msg = "카달로그 삭제에 성공했습니다.";
		}else{
			msg = "카달로그 삭제에 실패했습니다.";
		}
		
		model.addAttribute("url", url);
		model.addAttribute("msg", msg);
		
		log.info("Lmin:catalogueDeleteProc End!!");
		return "/alert";
	}
}
