//�ΰ�˸� ��Ʈ�ѷ�
package com.cl.controller.admin;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cl.dto.FuneralNoticeDTO;
import com.cl.service.IFuneralNoticeService;
import com.cl.util.CmmUtil;
import com.cl.util.PageUtil;
import com.sun.xml.internal.ws.resources.HttpserverMessages;

@Controller
public class FuneralNoticeController {
	
	private Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="FuneralNoticeService")
	private IFuneralNoticeService funeralNoticeService;
	
	@RequestMapping("/Lmin/funeral/funeralNoticeList")
	public String funeralNoticeList(HttpServletRequest req, Model model) throws Exception{
		log.info("Lmin:funeralNoticeList Start!!");
		
		int splitPage = 10;
		
		HashMap<String, Object> hMap = new HashMap<>();
		
		hMap = PageUtil.paging(req, splitPage);
		hMap = funeralNoticeService.getFuneralNoticeList(hMap);
		
		model.addAttribute("hMap", hMap);
		
		hMap = null;
		log.info("Lmin:funeralNoticeList End!!");
		return "/Lmin/funeral/funeral_notice";
	}
	
	@RequestMapping("/Lmin/funeral/funeralNoticeWrite")
	public String funeralNoticeWrite() throws Exception{
		log.info("Lmin:funeralNoticeWrite Start!!");
		
		log.info("Lmin:funeralNoticeWrite End!!");
		return "/Lmin/funeral/funeral_notice_write";
	}
	
	@RequestMapping("/Lmin/funeral/funeralNoticeRegProc")
	public String funeralNoticeReg(HttpServletRequest req, Model model, HttpSession session) throws Exception{
		log.info("Lmin:funeralInfoRegProc Start!!");
		
		String url = "";
		String msg = "";
		String funeralNoticeName = CmmUtil.nvl(req.getParameter("name"));
		String funeralNoticeMember = CmmUtil.nvl(req.getParameter("member"));
		String funeralNoticePlace = CmmUtil.nvl(req.getParameter("place"));
		String funeralNoticeDay = CmmUtil.nvl(req.getParameter("date"));
		String regMemberNo = CmmUtil.nvl((String) session.getAttribute("ss_member_no"));
		
		log.info("funeralNoticeName : "+funeralNoticeName);
		log.info("funeralNoticeMember : "+funeralNoticeMember);
		log.info("funeralNoticePlace : "+funeralNoticePlace);
		log.info("funeralNoticeDay : "+funeralNoticeDay);
		log.info("regMemberNo : "+regMemberNo);
		
		FuneralNoticeDTO fDTO = new FuneralNoticeDTO();

		fDTO.setFuneralNoticeName(funeralNoticeName);
		fDTO.setFuneralNoticeMember(funeralNoticeMember);
		fDTO.setFuneralNoticePlace(funeralNoticePlace);
		fDTO.setFuneralNoticeDay(funeralNoticeDay);
		fDTO.setRegMemberNo(regMemberNo);
		
		int result = funeralNoticeService.insertFuneralNotice(fDTO);
		
		url = "/Lmin/funeral/funeralNoticeList.do";
		if(result == 0){
			msg = "등록성공";
		}else{
			msg = "등록실패";
		}
		
		fDTO = null;
		model.addAttribute("url", url);
		model.addAttribute("msg", msg);
		log.info("Lmin:funeralInfoRegProc End!!");
		return "/alert";
	}
	
	@RequestMapping("/Lmin/funeral/funeralNoticeDetail")
	public String funeralNoticeDetail(HttpServletRequest req, Model model) throws Exception{
		log.info("Lmin:funeralInfoDetail Start!!");
		
		String funeralNoticeNo = CmmUtil.nvl(req.getParameter("fNo"));
		
		log.info("funeralNoticeNo : "+funeralNoticeNo);
		FuneralNoticeDTO fDTO = new FuneralNoticeDTO();
		fDTO.setFuneralNoticeNo(funeralNoticeNo);
		
		fDTO = funeralNoticeService.getFuneralNoticeDetail(fDTO);
		
		model.addAttribute("fDTO", fDTO);
		fDTO = null;
		log.info("Lmin:funeralInfoDetail End!!");
		return "/Lmin/funeral/funeral_notice_detail";
	}
	
	@RequestMapping("/Lmin/funeral/funeralNoticeUpdateProc")
	public String funeralNoticeUpdateProc(HttpServletRequest req, Model model, HttpSession session) throws Exception{
		log.info("Lmin:funeralNoticeUpdateProc Start!!");
		
		String url = "";
		String msg = "";
		String funeralNoticeNo = CmmUtil.nvl(req.getParameter("fNo"));
		String funeralNoticeName = CmmUtil.nvl(req.getParameter("name"));
		String funeralNoticeMember = CmmUtil.nvl(req.getParameter("member"));
		String funeralNoticePlace = CmmUtil.nvl(req.getParameter("place"));
		String funeralNoticeDay = CmmUtil.nvl(req.getParameter("date"));
		String chgMemberNo = CmmUtil.nvl((String) session.getAttribute("ss_member_no"));
		
		log.info("funeralNoticeNo : "+ funeralNoticeNo);
		log.info("funeralNoticeName : "+ funeralNoticeName);
		log.info("funeralNoticeMember : "+ funeralNoticeMember);
		log.info("funeralNoticePlace : "+ funeralNoticePlace);
		log.info("funeralNoticeDay : "+ funeralNoticeDay);
		log.info("chgMemberNo : "+ chgMemberNo);
		
		FuneralNoticeDTO fDTO = new FuneralNoticeDTO();
		fDTO.setFuneralNoticeNo(funeralNoticeNo);
		fDTO.setFuneralNoticeName(funeralNoticeName);
		fDTO.setFuneralNoticeMember(funeralNoticeMember);
		fDTO.setFuneralNoticePlace(funeralNoticePlace);
		fDTO.setFuneralNoticeDay(funeralNoticeDay);
		fDTO.setChgMemberNo(chgMemberNo);
		
		int result = funeralNoticeService.updateFuneralNotice(fDTO);
		
		url = "/Lmin/funeral/funeralNoticeList.do";
		if(result==0){
			msg = "수정실패";
		}else{
			msg = "수정성공";
		}
		
		fDTO = null;
		
		model.addAttribute("url", url);
		model.addAttribute("msg", msg);
		log.info("Lmin:funeralNoticeUpdateProc End!!");
		return "/alert";
	}
	
	@RequestMapping("/Lmin/funeral/funeralNoticeDelete")
	public String funeralNoticeDelete(HttpServletRequest req, Model model) throws Exception{
		log.info("Lmin:funeralNoticeDelete Start!!");
		
		String url = "";
		String msg = "";
		String funeralNoticeNo = CmmUtil.nvl(req.getParameter("fNo"));
		
		log.info("funeralNoticeNo : "+funeralNoticeNo);
		
		int result = funeralNoticeService.deleteFuneralNotice(funeralNoticeNo);
		
		url = "/Lmin/funeral/funeralNoticeList.do";
		if(result==0){
			msg = "삭제성공";
		}else{
			msg = "삭제실패";
		}
		
		model.addAttribute("url", url);
		model.addAttribute("msg", msg);
		log.info("Lmin:funeralNoticeDelete End!!");
		return "/alert";
	}
}
