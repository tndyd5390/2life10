//�ΰ�˸� ��Ʈ�ѷ�
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

import com.cl.dto.FuneralNoticeDTO;
import com.cl.service.IFuneralNoticeService;
import com.cl.util.CmmUtil;
import com.cl.util.PageUtil;
import com.cl.util.SessionUtil;

@Controller
public class FuneralNoticeController {
	
	private Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="FuneralNoticeService")
	private IFuneralNoticeService funeralNoticeService;
	
	@RequestMapping("/Lmin/funeral/funeralNoticeList")
	public String funeralNoticeList(HttpServletRequest req, Model model, HttpServletResponse resp, HttpSession session) throws Exception{
		log.info("Lmin:funeralNoticeList Start!!");
		SessionUtil.sessionCheck(resp, session);
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
	public String funeralNoticeWrite(HttpServletResponse resp, HttpSession session) throws Exception{
		log.info("Lmin:funeralNoticeWrite Start!!");
		SessionUtil.sessionCheck(resp, session);
		log.info("Lmin:funeralNoticeWrite End!!");
		return "/Lmin/funeral/funeral_notice_write";
	}
	
	@RequestMapping("/Lmin/funeral/funeralNoticeRegProc")
	public String funeralNoticeReg(HttpServletRequest req, Model model, HttpSession session, HttpServletResponse resp) throws Exception{
		log.info("Lmin:funeralInfoRegProc Start!!");
		SessionUtil.sessionCheck(resp, session);
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
			msg = "부고알림 등록에 실패하였습니다.";
		}else{
			msg = "부고알림 등록에 성공하였습니다.";
		}
		
		model.addAttribute("url", url);
		model.addAttribute("msg", msg);
		
		fDTO = null;
		url = null;
		msg = null;
		funeralNoticeName = null;
		funeralNoticeMember = null;
		funeralNoticePlace = null;
		funeralNoticeDay = null;
		regMemberNo = null;
		
		log.info("Lmin:funeralInfoRegProc End!!");
		return "/alert";
	}
	
	@RequestMapping("/Lmin/funeral/funeralNoticeDetail")
	public String funeralNoticeDetail(HttpServletRequest req, Model model, HttpServletResponse resp, HttpSession session) throws Exception{
		log.info("Lmin:funeralInfoDetail Start!!");
		SessionUtil.sessionCheck(resp, session);
		String funeralNoticeNo = CmmUtil.nvl(req.getParameter("fNo"));
		
		log.info("funeralNoticeNo : "+funeralNoticeNo);
		FuneralNoticeDTO fDTO = new FuneralNoticeDTO();
		fDTO.setFuneralNoticeNo(funeralNoticeNo);
		
		fDTO = funeralNoticeService.getFuneralNoticeDetail(fDTO);
		
		model.addAttribute("fDTO", fDTO);
		
		fDTO = null;
		funeralNoticeNo = null;
		
		log.info("Lmin:funeralInfoDetail End!!");
		return "/Lmin/funeral/funeral_notice_detail";
	}
	
	@RequestMapping("/Lmin/funeral/funeralNoticeUpdateProc")
	public String funeralNoticeUpdateProc(HttpServletRequest req, Model model, HttpSession session, HttpServletResponse resp) throws Exception{
		log.info("Lmin:funeralNoticeUpdateProc Start!!");
		SessionUtil.sessionCheck(resp, session);
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
			msg = "부고알림 수정에 실패했습니다.";
		}else{
			msg = "부고알림 수정에 성공했습니다.";
		}
		
		
		model.addAttribute("url", url);
		model.addAttribute("msg", msg);
		
		fDTO = null;
		url = null;
		msg = null;
		funeralNoticeNo = null;
		funeralNoticeName = null;
		funeralNoticeMember = null;
		funeralNoticePlace = null;
		funeralNoticeDay = null;
		chgMemberNo = null;
		
		log.info("Lmin:funeralNoticeUpdateProc End!!");
		return "/alert";
	}
	
	@RequestMapping("/Lmin/funeral/funeralNoticeDelete")
	public String funeralNoticeDelete(HttpServletRequest req, Model model, HttpServletResponse resp, HttpSession session) throws Exception{
		log.info("Lmin:funeralNoticeDelete Start!!");
		SessionUtil.sessionCheck(resp, session);
		String url = "";
		String msg = "";
		String funeralNoticeNo = CmmUtil.nvl(req.getParameter("fNo"));
		
		log.info("funeralNoticeNo : "+funeralNoticeNo);
		
		int result = funeralNoticeService.deleteFuneralNotice(funeralNoticeNo);
		
		url = "/Lmin/funeral/funeralNoticeList.do";
		if(result==0){
			msg = "부고알림 삭제에 실패했습니다.";
		}else{
			msg = "부고알림 삭제에 성공했습니다.";
		}
		
		model.addAttribute("url", url);
		model.addAttribute("msg", msg);
		
		url = null;
		msg = null;
		funeralNoticeNo = null;
		
		log.info("Lmin:funeralNoticeDelete End!!");
		return "/alert";
	}
}
