//������ȸ ��Ʈ�ѷ�
package com.cl.controller.admin;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
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

import com.cl.dto.AdviceDTO;
import com.cl.service.IAdviceService;
import com.cl.util.AES256Util;
import com.cl.util.CmmUtil;
import com.cl.util.PageUtil;

@Controller
public class AdviceController {
	
	private Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="AdviceService")
	private IAdviceService adviceService;
	
	/**
	 * @param req
	 * @param resp
	 * @param model
	 * @param session
	 * @return
	 * @throws Exception
	 * 상담사 리스트 메소드
	 */
	@RequestMapping(value="Lmin/company/adviceList", method={RequestMethod.GET, RequestMethod.POST})
	public String adviceList(HttpServletRequest req, HttpServletResponse resp, Model model, HttpSession session) throws Exception{
		log.info(this.getClass() + ".adviceList start!!!");
		int splitPage = 10;
		
		HashMap<String, Object> hMap = new HashMap<>();
		
		hMap = PageUtil.paging(req, splitPage);
		hMap = adviceService.getAdviceList(hMap);
		model.addAttribute("hMap", hMap);
		
		log.info(this.getClass() + ".adviceList end!!!");
		return "/Lmin/company/advice";
	}
	
	/**
	 * @param req
	 * @param resp
	 * @param model
	 * @param session
	 * @return
	 * @throws Exception
	 * 상담사 등록화면 이동 메소드
	 */
	@RequestMapping(value="Lmin/company/adviceWriteView", method=RequestMethod.GET)
	public String adviceWriteView(HttpServletRequest req, HttpServletResponse resp, Model model, HttpSession session) throws Exception{
		log.info(this.getClass() + ".adviceWriteView start!!!");
		
		log.info(this.getClass() + ".acviceWriteView end!!!");
		return "/Lmin/company/advice_write";
	}
	
	/**
	 * @param req
	 * @param resp
	 * @param model
	 * @param session
	 * @return
	 * @throws Exception
	 * 상담사 등록 메소드
	 */
	@RequestMapping(value="Lmin/company/adviceRegProc", method=RequestMethod.POST)
	public String adviceRegProc(HttpServletRequest req, HttpServletResponse resp, Model model, HttpSession session) throws Exception{
		log.info(this.getClass() + ".adviceRegProc start!!!");
		
		//등록자 회원번호
		String regMemberNo = CmmUtil.nvl((String)session.getAttribute("ss_member_no"));
		log.info(" regMemberNo : " + regMemberNo);
		String adviceName = CmmUtil.nvl(req.getParameter("adviceName"));
		log.info(" adviceName : " + adviceName);
		String adviceTel1 = CmmUtil.nvl(req.getParameter("adviceTel1"));
		log.info(" adviceTel1 : " + adviceTel1);
		String adviceTel2 = CmmUtil.nvl(req.getParameter("adviceTel2"));
		log.info(" adviceTel2 : " + adviceTel2);
		String adviceTel3 = CmmUtil.nvl(req.getParameter("adviceTel3"));
		log.info(" adviceTel3 : " + adviceTel3);
		String advicePostNo = CmmUtil.nvl(req.getParameter("advicePostNo"));
		log.info(" advicePostNo : " + advicePostNo);
		String adviceAddress = CmmUtil.nvl(req.getParameter("adviceAddress"));
		log.info(" adviceAddress : " + adviceAddress);
		String adviceAddressDetail = CmmUtil.nvl(req.getParameter("adviceAddressDetail"));
		log.info(" adviceAddressDetail : " + adviceAddressDetail);
		
		AdviceDTO aDTO = new AdviceDTO();
		aDTO.setRegMemberNo(regMemberNo);
		aDTO.setAdviceName(adviceName);
		aDTO.setAdvicePhoneNo(adviceTel1 + "-" + adviceTel2 + "-" + adviceTel3);
		aDTO.setAdvicePostNo(advicePostNo);
		aDTO.setAdviceAddress(adviceAddress);
		aDTO.setAdviceAddressDetail(adviceAddressDetail);
		
		int result = adviceService.insertAdvice(aDTO);
		
		if(result != 0){
			model.addAttribute("msg", "상담사 등록에 성공했습니다.");
		}else{
			model.addAttribute("msg", "상담사 등록에 실패했습니다.");
		}
		model.addAttribute("url", "/Lmin/company/adviceList.do");
		
		regMemberNo = null;
		adviceName = null;
		adviceTel1 = null;
		adviceTel2 = null;
		adviceTel3 = null;
		advicePostNo = null;
		adviceAddress = null;
		adviceAddressDetail = null;
		
		log.info(this.getClass() + ".adviceRegProc end!!!");
		return "/alert";
	}
	
	@RequestMapping(value="Lmin/company/adviceDetail", method=RequestMethod.GET)
	public String adviceDetail(HttpServletRequest req, HttpServletResponse resp, Model model, HttpSession session) throws Exception{
		log.info(this.getClass() + ".adviceDetail start!!!");
		
		String adviceNo = CmmUtil.nvl(req.getParameter("adviceNo"));
		log.info(" adviceNo : " + adviceNo);
		
		AdviceDTO aDTO = adviceService.getAdviceDetail(adviceNo);
		if(aDTO == null) aDTO = new AdviceDTO();
		
		model.addAttribute("aDTO", aDTO);
		
		adviceNo = null;
		aDTO= null;
		
		log.info(this.getClass() + ".adviceDetail end!!!");
		return "/Lmin/company/advice_detail";
	}
	
	@RequestMapping(value="Lmin/company/adviceDelete", method=RequestMethod.GET)
	public String adviceDelete(HttpServletRequest req, HttpServletResponse resp, Model model, HttpSession session) throws Exception{
		log.info(this.getClass() + ".adviceDelete start!!!");
		
		String adviceNo = CmmUtil.nvl(req.getParameter("adviceNo"));
		log.info(" adviceNo : " + adviceNo);
		
		int result = adviceService.deleteAdvice(adviceNo);
		
		if(result != 0){
			model.addAttribute("msg", "상담사 삭제에 성공했습니다.");
		}else{
			model.addAttribute("msg", "상담사 삭제에 실패했습니다.");
		}
		
		model.addAttribute("url", "/Lmin/company/adviceList.do");
		
		adviceNo = null;
		
		log.info(this.getClass() + ".adviceDelete end!!!");
		return "/alert";
	}
	
	@RequestMapping(value="Lmin/company/adviceUpdateView", method=RequestMethod.GET)
	public String adviceUpdateView(HttpServletRequest req, HttpServletResponse resp, Model model, HttpSession session) throws Exception{
		log.info(this.getClass() + ".adviceUpdateView start!!!");
		
		String adviceNo = CmmUtil.nvl(req.getParameter("adviceNo"));
		log.info(" adviceNo : " + adviceNo);
		
		AdviceDTO aDTO = adviceService.getAdviceDetail(adviceNo);
		if(aDTO == null) aDTO = new AdviceDTO();
		
		model.addAttribute("aDTO", aDTO);
		
		adviceNo = null;
		
		log.info(this.getClass() + ".adviceUpdateView end!!!");
		return "/Lmin/company/advice_updateView";
	}
	
	@RequestMapping(value="Lmin/company/adviceUpdateProc", method=RequestMethod.POST)
	public String adviceUpdateProc(HttpServletRequest req, HttpServletResponse resp, Model model, HttpSession session) throws Exception{
		log.info(this.getClass() + ".adviceUpdatProc start!!!");
		
		String chgMemberNo = CmmUtil.nvl((String)session.getAttribute("ss_member_no"));
		log.info(" chgMemberNo : " + chgMemberNo);
		String adviceNo = CmmUtil.nvl(req.getParameter("adviceNo"));
		log.info(" adviceNo : " + adviceNo);
		String adviceName = CmmUtil.nvl(req.getParameter("adviceName"));
		log.info(" adviceName : " + adviceName);
		String adviceTel1 = CmmUtil.nvl(req.getParameter("adviceTel1"));
		log.info(" adviceTel1 : " + adviceTel1);
		String adviceTel2 = CmmUtil.nvl(req.getParameter("adviceTel2"));
		log.info(" adviceTel2 : " + adviceTel2);
		String adviceTel3 = CmmUtil.nvl(req.getParameter("adviceTel3"));
		log.info(" adviceTel3 : " + adviceTel3);
		String advicePostNo = CmmUtil.nvl(req.getParameter("advicePostNo"));
		log.info(" advicePostNo : " + advicePostNo);
		String adviceAddress = CmmUtil.nvl(req.getParameter("adviceAddress"));
		log.info(" adviceAddress : " + adviceAddress);
		String adviceAddressDetail = CmmUtil.nvl(req.getParameter("adviceAddressDetail"));
		log.info(" adviceAddressDetail : " + adviceAddressDetail);
		
		AdviceDTO aDTO = new AdviceDTO();
		aDTO.setChgMemberNo(chgMemberNo);
		aDTO.setAdviceNo(adviceNo);
		aDTO.setAdviceName(adviceName);
		aDTO.setAdvicePhoneNo(adviceTel1 + "-" + adviceTel2 + "-" + adviceTel3);
		aDTO.setAdvicePostNo(advicePostNo);
		aDTO.setAdviceAddress(adviceAddress);
		aDTO.setAdviceAddressDetail(adviceAddressDetail);
		
		int result = adviceService.updateAdvice(aDTO);
		
		if(result != 0){
			model.addAttribute("msg", "상담사 수정에 성공하였습니다.");
		}else{
			model.addAttribute("msg", "상담사 수정에 실패하였습니다.");
		}
		model.addAttribute("url", "/Lmin/company/adviceList.do");
		
		chgMemberNo = null;
		adviceNo = null;
		adviceName = null;
		adviceTel1 = null;
		adviceTel2 = null;
		adviceTel3 = null;
		advicePostNo = null;
		adviceAddress = null;;
		adviceAddressDetail = null;
		aDTO = null;
		
		log.info(this.getClass() + ".adviceUpdateProc end!!!");
		return "/alert";
	}
}