//���̹�ȫ�� ��Ʈ�ѷ�
package com.cl.controller.admin;

import java.util.HashMap;

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

@Controller
public class CyberController {
	
	private Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="CyberService")
	private ICyberService cyberService;
	
	String cyberFileSavePath = "C:\\Users\\Data3811-32\\git\\2life10\\WebContent\\cyberFile\\";
	
	@RequestMapping(value="/Lmin/company/cyber", method={RequestMethod.GET, RequestMethod.POST})
	public String cyberList(HttpServletRequest req, HttpServletResponse resp, Model model, HttpSession session) throws Exception{
		log.info(this.getClass() + ".cyberList Start!!");
		int splitPage = 10;
		
		HashMap<String, Object> hMap = new HashMap<>();
		hMap = PageUtil.paging(req, splitPage);
		hMap = cyberService.getCyberList(hMap);

		model.addAttribute("hMap", hMap);
		
		log.info(this.getClass() + ".cyberList End!!");
		return "/Lmin/company/cyber";
	}
	@RequestMapping(value="/Lmin/company/cyberWrite", method={RequestMethod.GET, RequestMethod.POST})
	public String cyberWrite() throws Exception{
		log.info(this.getClass() + ".cyberWrite Start!!");
		
		log.info(this.getClass() + ".cyberWrite End!!");
		return "/Lmin/company/cyber_write";
	}
	
	@RequestMapping(value="Lmin/company/cyberRegProc", method=RequestMethod.POST)
	public String cyberRegProd(MultipartHttpServletRequest mulReq, HttpServletRequest req, HttpServletResponse resp, Model model, HttpSession session) throws Exception{
		log.info(this.getClass() + ".cyberRegProc start!!!");
		
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
			model.addAttribute("msg", "사이버홍보글 등록에 성공했습니다.");
		}else{
			model.addAttribute("msg", "사이버홍보글 등록에 실패했습니다.");
		}
		model.addAttribute("url", "/Lmin/company/cyber.do");
		log.info(this.getClass() + ".cyberRegProc end!!!");
		return "/alert";
	}
}
