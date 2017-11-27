//��������ȳ� ��Ʈ�ѷ�
package com.cl.controller.admin;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.cl.dto.BranchDTO;
import com.cl.service.IBranchService;
import com.cl.util.CmmUtil;

@Controller
public class BranchController {
	
	private Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="BranchService")
	private IBranchService branchService;
	
	@RequestMapping(value="Lmin/company/branchList", method=RequestMethod.GET)
	public String branchList(HttpServletRequest req, HttpServletResponse resp, Model model, HttpSession session) throws Exception{
		log.info(this.getClass() + ".branchView start!!!");
		
		List<BranchDTO> bList = branchService.getBranchList();
		if(bList == null) bList = new ArrayList<>();
		model.addAttribute("bList", bList);
		bList = null;
		
		log.info(this.getClass() + ".branchView end!!!");
		return "/Lmin/company/branch";
	}
	
	@RequestMapping(value="Lmin/company/branchWriteView", method=RequestMethod.GET)
	public String branchWriteView(HttpServletRequest req, HttpServletResponse resp, Model model, HttpSession session) throws Exception{
		log.info(this.getClass() + ".branchWriteView start!!!");
		log.info(this.getClass() + ".branchWriteView end!!!");
		return "/Lmin/company/branch_write";
	}
	
	@RequestMapping(value="Lmin/company/branchRegProc", method=RequestMethod.POST)
	public String branchRegProc(HttpServletRequest req, HttpServletResponse resp, Model model, HttpSession session) throws Exception{
		log.info(this.getClass() + ".branchRegProc start!!!");

		String regMemberNo = CmmUtil.nvl((String)session.getAttribute("memberNo"));
		log.info(" regNo : " + regMemberNo);
		String branchAreaCode = CmmUtil.nvl(req.getParameter("branchAreaCode"));
		log.info(" branchAreaCode : " + branchAreaCode);
		String branchName = CmmUtil.nvl(req.getParameter("branchName"));
		log.info(" branchName : " + branchName);
		String branchOfficerName = CmmUtil.nvl(req.getParameter("branchOfficerName"));
		log.info(" branchOfficerName : " + branchOfficerName);
		String branchTel1 = CmmUtil.nvl(req.getParameter("branchTel1"));
		log.info(" branchTel1 : " + branchTel1);
		String branchTel2 = CmmUtil.nvl(req.getParameter("branchTel2"));
		log.info(" branchTel2 : " + branchTel2);
		String branchTel3 = CmmUtil.nvl(req.getParameter("branchTel3"));
		log.info(" branchTel3 : " + branchTel3);
		String branchPostNo = CmmUtil.nvl(req.getParameter("branchPostNo"));
		log.info(" branchPostNo : " + branchPostNo);
		String branchAddress = CmmUtil.nvl(req.getParameter("branchAddress"));
		log.info(" branchAddress : " + branchAddress);
		String branchAddressDetail = CmmUtil.nvl(req.getParameter("branchAddressDetail"));
		log.info(" branchAddressDetail : " + branchAddressDetail);
		
		BranchDTO bDTO = new BranchDTO();
		bDTO.setBranchAreaCode(branchAreaCode);
		bDTO.setBranchName(branchName);
		bDTO.setBranchOfficerName(branchOfficerName);
		bDTO.setBranchTelNo(branchTel1 + "-" + branchTel2 + "-" + branchTel3);
		bDTO.setBranchPostNo(branchPostNo);
		bDTO.setBranchAddress(branchAddress);
		bDTO.setBranchAddressDetail(branchAddressDetail);
		bDTO.setRegMemberNo(regMemberNo);
		
		int result = branchService.insertBranch(bDTO);
		if(result != 0){
			//성공
			model.addAttribute("msg", "지사등록에 성공했습니다.");
			model.addAttribute("url", "/Lmin/company/branchList.do");
		}else{
			//실패
			model.addAttribute("msg", "지사등록에 실패했습니다.");
			model.addAttribute("url", "/Lmin/company/branchList.do");
		}
		
		regMemberNo = null;
		branchAreaCode = null;
		branchName = null;
		branchOfficerName = null;
		branchTel1 = null;
		branchTel2 = null;
		branchTel3 = null;
		branchPostNo = null;
		branchAddress = null;
		branchAddressDetail = null;
		
		log.info(this.getClass() + ".branchRegProc end!!");
		return "/alert";
	}
	
	@RequestMapping(value="Lmin/company/branchDetail", method=RequestMethod.GET)
	public String branchDetailView(HttpServletRequest req, HttpServletResponse resp, Model model, HttpSession session) throws Exception{
		log.info(this.getClass() + ".branchDetailVeiw start!!!");
		
		String branchNo = CmmUtil.nvl(req.getParameter("branchNo"));
		log.info(" branchNo : " + branchNo);
		
		BranchDTO bDTO = branchService.getBranchDetailAddCnt(branchNo);
		if(bDTO == null) bDTO = new BranchDTO();
		
		model.addAttribute("bDTO", bDTO);
		
		branchNo = null;
		bDTO = null;
		
		log.info(this.getClass() + ".branchDetailView end!!!");
		return "/Lmin/company/branch_detail";
	}
	
	@RequestMapping(value="Lmin/company/branchDeleteProc", method=RequestMethod.GET)
	public String branchDeleteProc(HttpServletRequest req, HttpServletResponse resp, Model model, HttpSession session) throws Exception{
		log.info(this.getClass() + ".branchDeleteProc start!!!");
		
		String branchNo = CmmUtil.nvl(req.getParameter("branchNo"));
		log.info(" branchNo : " + branchNo);
		
		int result = branchService.deleteBranch(branchNo);
		
		if(result != 0){
			//성공
			model.addAttribute("msg", "삭제되었습니다.");
			model.addAttribute("url", "/Lmin/company/branchList.do");
		}else{
			//실패
			model.addAttribute("msg", "삭제에 실패했습니다.");
			model.addAttribute("url", "/Lmin/company/branchDetail.do?branchNo=" + branchNo);
		}
		log.info(this.getClass() + ".branchDeleteProc end!!!");
		return "/alert";
	}
	
	@RequestMapping(value="Lmin/company/branchUpdateView", method=RequestMethod.GET)
	public String branchUpdateView(HttpServletRequest req, HttpServletResponse resp, Model model, HttpSession session) throws Exception{
		log.info(this.getClass() + ".branchUpdateView start!!!");
		
		String branchNo = CmmUtil.nvl(req.getParameter("branchNo"));
		log.info(" branchNo : " + branchNo);
		
		BranchDTO bDTO = branchService.getBranchDetail(branchNo);
		if(bDTO == null) bDTO = new BranchDTO();
		
		model.addAttribute("bDTO", bDTO);
		
		branchNo = null;
		bDTO = null;
		
		log.info(this.getClass() + ".branchUpdateView end!!!");
		return "/Lmin/company/branch_updateView";
	}
	
	@RequestMapping(value="Lmin/company/branchUpdateProc", method=RequestMethod.POST)
	public String branchUpcateProc(HttpServletRequest req, HttpServletResponse resp, Model model, HttpSession session) throws Exception{
		log.info(this.getClass() + ".branchUpdateProc start!!!");
		
		String branchNo = CmmUtil.nvl(req.getParameter("branchNo"));
		log.info(" branchNo : " + branchNo);
		String chgMemberNo = CmmUtil.nvl((String)session.getAttribute("memberNo"));
		log.info(" regNo : " + chgMemberNo);
		String branchAreaCode = CmmUtil.nvl(req.getParameter("branchAreaCode"));
		log.info(" branchAreaCode : " + branchAreaCode);
		String branchName = CmmUtil.nvl(req.getParameter("branchName"));
		log.info(" branchName : " + branchName);
		String branchOfficerName = CmmUtil.nvl(req.getParameter("branchOfficerName"));
		log.info(" branchOfficerName : " + branchOfficerName);
		String branchTel1 = CmmUtil.nvl(req.getParameter("branchTel1"));
		log.info(" branchTel1 : " + branchTel1);
		String branchTel2 = CmmUtil.nvl(req.getParameter("branchTel2"));
		log.info(" branchTel2 : " + branchTel2);
		String branchTel3 = CmmUtil.nvl(req.getParameter("branchTel3"));
		log.info(" branchTel3 : " + branchTel3);
		String branchPostNo = CmmUtil.nvl(req.getParameter("branchPostNo"));
		log.info(" branchPostNo : " + branchPostNo);
		String branchAddress = CmmUtil.nvl(req.getParameter("branchAddress"));
		log.info(" branchAddress : " + branchAddress);
		String branchAddressDetail = CmmUtil.nvl(req.getParameter("branchAddressDetail"));
		log.info(" branchAddressDetail : " + branchAddressDetail);
		
		BranchDTO bDTO = new BranchDTO();
		bDTO.setBranchNo(branchNo);
		bDTO.setBranchAreaCode(branchAreaCode);
		bDTO.setBranchName(branchName);
		bDTO.setBranchOfficerName(branchOfficerName);
		bDTO.setBranchTelNo(branchTel1 + "-" + branchTel2 + "-" + branchTel3);
		bDTO.setBranchPostNo(branchPostNo);
		bDTO.setBranchAddress(branchAddress);
		bDTO.setBranchAddressDetail(branchAddressDetail);
		bDTO.setChgMemberNo(chgMemberNo);
		
		int result = branchService.updateBranch(bDTO);
		
		if(result != 0){
			model.addAttribute("msg", "수정에 성공했습니다.");
			model.addAttribute("url", "/Lmin/company/branchList.do");
		}else{
			model.addAttribute("msg", "수정에 실패했습니다.");
			model.addAttribute("url", "/Lmin/company/branchUpdateView.do?branchNo=" + branchNo);
		}
		
		branchNo = null;
		chgMemberNo = null;
		branchAreaCode = null;
		branchName = null;
		branchOfficerName = null;;
		branchTel1 = null;
		branchTel2 = null;
		branchTel3 = null;
		branchPostNo = null;
		branchAddress = null;
		branchAddressDetail = null;
		bDTO = null;
		log.info(this.getClass() + ".branchUpdateProc end!!!");
		return "/alert";
	}
	
	@RequestMapping(value="Lmin/company/branchSearch", method=RequestMethod.POST)
	public String branchSearch(HttpServletRequest req, HttpServletResponse resp, Model model, HttpSession session) throws Exception{
		log.info(this.getClass() + ".branchSearch start!!");
		
		String searchArea = CmmUtil.nvl(req.getParameter("searchArea"));
		log.info(" searchArea : " + searchArea);
		String searchWord = CmmUtil.nvl(req.getParameter("searchWord"));
		log.info(" searchWord : " + searchWord);
		
		HashMap<String, Object> sMap = new HashMap<String, Object>();
		sMap.put("searchArea", searchArea);
		sMap.put("searchWord", searchWord);
		
		List<BranchDTO> bList = branchService.getBranchSearch(sMap);
		if(bList == null) bList = new ArrayList<>();
		
		model.addAttribute("bList", bList);
		model.addAttribute("bySearch", "y");
		log.info(this.getClass() + ".branchSearch end!!!");
		return "/Lmin/company/branch";
	}
}
