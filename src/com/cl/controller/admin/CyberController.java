//占쏙옙占싱뱄옙홍占쏙옙 占쏙옙트占싼뤄옙
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.cl.dto.CyberDTO;
import com.cl.persistance.mapper.CyberMapper;
import com.cl.service.ICyberService;
import com.cl.service.impl.CyberService;
import com.cl.util.CmmUtil;
import com.cl.util.FileUtil;
import com.cl.util.PageUtil;
import com.cl.util.SessionUtil;

@Controller
public class CyberController {
	
	private Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="CyberService")
	private ICyberService cyberService;
	
	String cyberFileSavePath = "/www/thunder-edu_com/file/cyber/movie/";
	
	@RequestMapping(value="/Lmin/company/cyber", method={RequestMethod.GET, RequestMethod.POST})
	public String cyberList(HttpServletRequest req, HttpServletResponse resp, Model model, HttpSession session) throws Exception{
		log.info(this.getClass() + ".cyberList Start!!");
		SessionUtil.sessionCheck(resp, session);
		int splitPage = 10;
		
		HashMap<String, Object> hMap = new HashMap<>();
		hMap = PageUtil.paging(req, splitPage);
		hMap = cyberService.getCyberList(hMap);

		model.addAttribute("hMap", hMap);
		
		log.info(this.getClass() + ".cyberList End!!");
		return "/Lmin/company/cyber";
	}
	@RequestMapping(value="/Lmin/company/cyberWrite", method={RequestMethod.GET, RequestMethod.POST})
	public String cyberWrite(HttpServletResponse resp, HttpSession session) throws Exception{
		log.info(this.getClass() + ".cyberWrite Start!!");
		SessionUtil.sessionCheck(resp, session);
		log.info(this.getClass() + ".cyberWrite End!!");
		return "/Lmin/company/cyber_write";
	}
	
	@RequestMapping(value="/Lmin/company/cyberRegProc", method=RequestMethod.POST)
	public String cyberRegProd(MultipartHttpServletRequest mulReq, HttpServletRequest req, HttpServletResponse resp, Model model, HttpSession session) throws Exception{
		log.info(this.getClass() + ".cyberRegProc start!!!");
		SessionUtil.sessionCheck(resp, session);
		String regMemberNo = CmmUtil.nvl((String)session.getAttribute("ss_member_no"));
		log.info(" regMemberNo : " + regMemberNo);
		String cyberTitle = CmmUtil.nvl(req.getParameter("cyberTitle"));
		log.info(" cyberTitle : " + cyberTitle);
		String cyberContents = CmmUtil.nvl(req.getParameter("cyberContents"));
		log.info(" cyberContents : " + cyberContents);
		
		MultipartFile file = mulReq.getFile("cyberFile");
		String cyberFileOrgName = CmmUtil.nvl(file.getOriginalFilename());
		log.info(" cyberFileOrgName : " + cyberFileOrgName);
		String cyberFileName = FileUtil.fileSave(file, cyberFileSavePath);
		
		CyberDTO cDTO = new CyberDTO();
		cDTO.setCyberTitle(cyberTitle);
		if(!"".equals(cyberContents))cDTO.setCyberContents(cyberContents);
		cDTO.setRegMemberNo(regMemberNo);
		cDTO.setCyberFileName(cyberFileName);
		cDTO.setCyberFilePath(cyberFileSavePath);
		cDTO.setCyberFileOrgName(cyberFileOrgName);
		
		int result = cyberService.insertCyber(cDTO);
		
		if(result != 0){
			model.addAttribute("msg", "사이버홍보 등록에 성공했습니다.");
		}else{
			model.addAttribute("msg", "사이버홍보 등록에 실패했습니다.");
		}
		model.addAttribute("url", "/Lmin/company/cyber.do");
		log.info(this.getClass() + ".cyberRegProc end!!!");
		return "/alert";
	}
	
	@RequestMapping(value="/Lmin/company/cyberDetail", method=RequestMethod.GET)
	public String cyberDetail(HttpServletRequest req, HttpServletResponse resp, Model model, HttpSession session) throws Exception{
		log.info(this.getClass() + ".cyberDetail start!!!");
		SessionUtil.sessionCheck(resp, session);
		String cyberNo = CmmUtil.nvl(req.getParameter("cyberNo"));
		log.info(" cyberNo : " + cyberNo);
		
		CyberDTO cDTO = cyberService.getCyberDetail(cyberNo);
		if(cDTO == null) cDTO= new CyberDTO();
		
		model.addAttribute("cDTO", cDTO);
		
		log.info(this.getClass() + ".cyberDetail end!!!");
		return "/Lmin/company/cyber_detail";
	}
	
	@RequestMapping(value="/Lmin/company/deleteCyber", method={RequestMethod.GET, RequestMethod.POST})
	public String deleteCyber(HttpServletRequest req, HttpServletResponse resp, Model model, HttpSession session) throws Exception{
		log.info(this.getClass() + ".deleteCyber start!!!");
		SessionUtil.sessionCheck(resp, session);
		String cyberNo = CmmUtil.nvl(req.getParameter("cyberNo"));
		log.info(" cyberNo : " + cyberNo);
		String cyberFileNo = CmmUtil.nvl(req.getParameter("cyberFileNo"));
		log.info(" cyberFileNo : " + cyberFileNo);
		String cyberFilePath = CmmUtil.nvl(req.getParameter("filePath"));
		log.info(" cyberFilePath : " + cyberFilePath);
		String cyberFileName = CmmUtil.nvl(req.getParameter("fileName"));
		log.info(" cyberFileName : " + cyberFileName);
		
		CyberDTO cDTO = new CyberDTO();
		cDTO.setCyberNo(cyberNo);
		cDTO.setCyberFileNo(cyberFileNo);
		
		int result = cyberService.deleteCyber(cDTO);
		if(result != 0){
			FileUtil.deleteFile(cyberFilePath, cyberFileName);
			model.addAttribute("msg", "사이버홍보 삭제에 성공했습니다.");
		}else{
			model.addAttribute("msg", "사이버홍보 삭제에 실패했습니다.");
		}
		model.addAttribute("url", "/Lmin/company/cyber.do");
		
		log.info(this.getClass() + ".deleteCyber end!!!");
		return "alert";
	}
	
	@RequestMapping(value="/Lmin/company/updateCyberView", method=RequestMethod.GET)
	public String updateCyberView(HttpServletRequest req, HttpServletResponse resp, Model model, HttpSession session) throws Exception{
		log.info(this.getClass() + ".updateCyberView start!!!");
		SessionUtil.sessionCheck(resp, session);
		String cyberNo = CmmUtil.nvl(req.getParameter("cyberNo"));
		log.info(" cyberNo : " + cyberNo);
		
		CyberDTO cDTO = cyberService.getCyberDetail(cyberNo);
		if(cDTO == null) cDTO = new CyberDTO();
		
		model.addAttribute("cDTO", cDTO);
		
		log.info(this.getClass() + ".updateCyberView end!!!");
		return "/Lmin/company/cyber_update_view";
	}
	
	@RequestMapping(value="/Lmin/company/cyberMovieUpdateView", method=RequestMethod.GET)
	public String cyberMovieUpdateView(HttpServletRequest req, HttpServletResponse resp, Model model, HttpSession session) throws Exception{
		log.info(this.getClass() + ".cyberMovieUpdateView start!!!");
		SessionUtil.sessionCheck(resp, session);
		String cyberNo = CmmUtil.nvl(req.getParameter("cyberNo"));
		log.info(" cyberNo : " + cyberNo);
		
		CyberDTO cDTO = cyberService.getCyberDetail(cyberNo);
		if(cDTO == null) cDTO = new CyberDTO();
		
		model.addAttribute("cDTO", cDTO);
		log.info(this.getClass() + ".cyberMovieUpdateView end!!!");
		return "/Lmin/company/cyber_movieUpdate_view";
	}
	
	@RequestMapping(value="/Lmin/company/cyberMovieUpdateProc", method=RequestMethod.POST)
	public void cyberMovieUpdateProc(MultipartHttpServletRequest mulReq, HttpServletRequest req, HttpServletResponse resp, Model model, HttpSession session) throws Exception{
		log.info(this.getClass() + ".cyberMovieUpdateProc start!!!");
		SessionUtil.sessionCheck(resp, session);
		String cyberNo = CmmUtil.nvl(req.getParameter("cyberNo"));
		log.info(" cyberNo : " + cyberNo);
		String preFileNo = CmmUtil.nvl(req.getParameter("preFileNo"));
		log.info(" preFileNo : " + preFileNo);
		String preFilePath = CmmUtil.nvl(req.getParameter("preFilePath"));
		log.info(" preFilePath : " + preFilePath);
		String preFileName = CmmUtil.nvl(req.getParameter("preFileName"));
		log.info(" preFileName : " + preFileName);
		String chgMemberNo = (String)session.getAttribute("ss_member_no");
		log.info(" chgMemberNo : " + chgMemberNo);
		
		MultipartFile file = mulReq.getFile("cyberFile");
		log.info(file.getOriginalFilename());
		String fileOrgName = "";
		String reFileName = "";
		if(file != null){
			fileOrgName = file.getOriginalFilename();
			reFileName = FileUtil.fileSave(file, cyberFileSavePath);
		}
		
		CyberDTO cDTO = new CyberDTO();
		cDTO.setCyberNo(cyberNo);
		cDTO.setCyberFileOrgName(fileOrgName);
		cDTO.setCyberFileName(reFileName);
		cDTO.setCyberFilePath(cyberFileSavePath);
		cDTO.setChgMemberNo(chgMemberNo);
		
		Map<String , Object> map = new HashMap<>();
		map.put("cDTO", cDTO);
		map.put("deleteFileNo", preFileNo);
		
		//�씠誘몄� 吏��슦怨� �씠誘몄� �꽔怨� �궗�씠踰� �뾽�뜲�씠�듃�븯怨� �솗�씤
		int result = cyberService.updateCyberMovie(map);
		if(result != 0){
			FileUtil.deleteFile(preFilePath, preFileName);
			resp.getWriter().println(reFileName);
		}else{
			resp.getWriter().println(0);
		}
		
		log.info(this.getClass() + ".cyberMovieUpdateProc end!!!");
	}
	
	@RequestMapping(value="/Lmin/company/cyberUpdateProc", method=RequestMethod.POST)
	public String cyberUpdateProc(HttpServletRequest req, HttpServletResponse resp, Model model, HttpSession session) throws Exception{
		log.info(this.getClass() + ".cyberUpdateProc start!!!");
		SessionUtil.sessionCheck(resp, session);
		String chgMemberNo = CmmUtil.nvl((String)session.getAttribute("ss_member_no"));
		log.info(" chgMemberNo : " + chgMemberNo);
		String cyberTitle = CmmUtil.nvl(req.getParameter("cyberTitle"));
		log.info(" cyberTitle : " + cyberTitle);
		String cyberContents = CmmUtil.nvl(req.getParameter("cyberContents"));
		log.info(" cyberContents : " + cyberContents);
		String cyberNo = CmmUtil.nvl(req.getParameter("cyberNo"));
		log.info(" cyberNo : " + cyberNo);
		
		CyberDTO cDTO = new CyberDTO();
		cDTO.setCyberNo(cyberNo);
		if(!"".equals(cyberContents)){
			cDTO.setCyberContents(cyberContents);
		}else{
			cDTO.setCyberContents(null);
		}
		cDTO.setChgMemberNo(chgMemberNo);
		cDTO.setCyberTitle(cyberTitle);
		
		int result = cyberService.updateCyber(cDTO);
		
		if(result != 0){
			model.addAttribute("msg", "�궗�씠踰� �솉蹂� �닔�젙�뿉 �꽦怨듯뻽�뒿�땲�떎.");
		}else{
			model.addAttribute("msg", "�궗�씠踰� �솉蹂� �닔�젙�뿉 �떎�뙣�뻽�뒿�땲�떎.");
		}
		model.addAttribute("url", "/Lmin/company/cyber.do");
		
		log.info(this.getClass() + ".cyberUpdateProc end!!!");
		
		return "alert";
	}
}
