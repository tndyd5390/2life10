//�������� ��Ʈ�ѷ�
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

import com.cl.dto.NoticeDTO;
import com.cl.persistance.mapper.NoticeMapper;
import com.cl.service.INoticeService;
import com.cl.util.CmmUtil;
import com.cl.util.FileUtil;
import com.cl.util.PageUtil;
import com.cl.util.SessionUtil;

@Controller
public class NoticeController {
	
	private Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="NoticeService")
	private INoticeService noticeService;
	
	//private String noticeFilePath = "C:\\Users\\Data3811-32\\git\\2life10\\WebContent\\noticeFile\\";
	private String noticeFilePath = "/www/thunder-edu_com/file/notice/img/";
	
	@RequestMapping("/Lmin/notice/noticeList")
	public String noticeList(HttpServletRequest req, Model model, HttpServletResponse resp, HttpSession session) throws Exception{
		log.info("Lmin:noticeList Start!!");
		SessionUtil.sessionCheck(resp, session);
		int splitPage = 10;
	
		HashMap<String, Object> hMap = new HashMap<>();
		
		hMap = PageUtil.paging(req, splitPage);
		
		hMap = noticeService.getNoticeList(hMap);
		
		model.addAttribute("hMap", hMap);
		
		log.info("Lmin:noticeList End!!");
		return "/Lmin/notice/notice_list";
	}
	@RequestMapping("/Lmin/notice/noticeWrite")
	public String noticeWrite(HttpServletResponse resp, HttpSession session)throws Exception{
		log.info("Lmin:noticeWrite Start!!");
		SessionUtil.sessionCheck(resp, session);
		log.info("Lmin:noticeWrite End!!");
		return "/Lmin/notice/notice_write";
	}
	@RequestMapping("/Lmin/notice/noticeRegProc")
	public String noticeRegProc(HttpServletRequest req, Model model, HttpSession session, HttpServletResponse resp, @RequestParam("noticeFile") MultipartFile file) throws Exception{
		log.info("Lmin:noticeRegProc Start!!");
		SessionUtil.sessionCheck(resp, session);
		String url = "";
		String msg = "";
		String title = CmmUtil.nvl(req.getParameter("title"));
		String contents = CmmUtil.nvl(req.getParameter("contents"));
		String regMemberNo = CmmUtil.nvl((String) session.getAttribute("ss_member_no"));
		
		log.info("title : "+title);
		log.info("contents : "+contents);
		log.info("regMemberNo : "+regMemberNo);
		
		
		NoticeDTO nDTO = new NoticeDTO();
		
		nDTO.setNoticeTitle(title);
		nDTO.setNoticeContents(contents);
		nDTO.setRegMemberNo(regMemberNo);
		
		String noticeFileOrgName = null;
		String noticeFileName = null;
		if(!"".equals(CmmUtil.nvl(file.getOriginalFilename()))){
			noticeFileOrgName = CmmUtil.nvl(file.getOriginalFilename());
			noticeFileName = FileUtil.fileSave(file, noticeFilePath);
			log.info(" noticeFileOrgName : " + noticeFileOrgName);
			log.info(" noticeFileName : " + noticeFileName);
			nDTO.setNoticeFilePath(noticeFilePath);
			nDTO.setNoticeFileName(noticeFileName);
			nDTO.setNoticeFileOrgName(noticeFileOrgName);
		}
		
		int result = noticeService.insertNotice(nDTO);
		
		url = "/Lmin/notice/noticeList.do";
		if(result==0){
			msg = "공지사항 등록에 실패했습니다.";
		}else{
			msg = "공지사항 등록에 성공했습니다.";
		}
		
		model.addAttribute("url", url);
		model.addAttribute("msg", msg);
		
		url = null;
		msg = null;
		title = null;
		contents = null;
		regMemberNo = null;
		nDTO = null;
		noticeFileOrgName = null;
		noticeFileName = null;
		log.info("Lmin:noticeRegProc End!!");
		return "/alert";
	}
	
	@RequestMapping("/Lmin/notice/noticeDetail")
	public String noticeDetail(HttpServletRequest req, Model model, HttpServletResponse resp, HttpSession session) throws Exception{
		log.info("Lmin:noticeDetail Start!!");
		SessionUtil.sessionCheck(resp, session);
		String noticeNo = CmmUtil.nvl(req.getParameter("nNo"));
		log.info("noticeNo : "+noticeNo);
		
		NoticeDTO nDTO = new NoticeDTO();
		nDTO.setNoticeNo(noticeNo);
		
		nDTO = noticeService.getNoticeDetail(nDTO);
		
		model.addAttribute("nDTO", nDTO);
		
		nDTO = null;
		noticeNo = null;
		log.info("Lmin:noticeDetail End!!");
		return "/Lmin/notice/notice_view";
	}
	@RequestMapping("/Lmin/notice/noticeUpdate")
	public String noticeUpdate(HttpServletRequest req, Model model, HttpServletResponse resp, HttpSession session) throws Exception{
		log.info("Lmin:noticeUpdate Start!!");
		SessionUtil.sessionCheck(resp, session);
		String noticeNo = CmmUtil.nvl(req.getParameter("nNo"));
		log.info("noticeNo : "+noticeNo);
		
		NoticeDTO nDTO = new NoticeDTO();
		
		nDTO.setNoticeNo(noticeNo);
		
		nDTO = noticeService.getNoticeDetail(nDTO);
		
		model.addAttribute("nDTO", nDTO);

		nDTO = null;
		noticeNo = null;

		log.info("Lmin:noticeUpdate End!!");
		return "/Lmin/notice/notice_update";
	}
	@RequestMapping("/Lmin/notice/noticeUpdateProc")
	public String noticeUpdateProc(MultipartHttpServletRequest mulReq, HttpServletRequest req, Model model, HttpSession session, HttpServletResponse resp) throws Exception{
		log.info("Lmin:noticeUpdateProc Start!!");
		SessionUtil.sessionCheck(resp, session);
		String url = "";
		String msg = "";
		String noticeNo = CmmUtil.nvl(req.getParameter("nNo"));
		String noticeTitle = CmmUtil.nvl(req.getParameter("title"));
		String noticeContents = CmmUtil.nvl(req.getParameter("contents"));
		String chgMemberNo = CmmUtil.nvl((String) session.getAttribute("ss_member_no"));
		
		log.info("noticeNo : "+noticeNo);
		log.info("noticeTitle : "+noticeTitle);
		log.info("noticeContents : "+noticeContents);
		
		NoticeDTO nDTO = new NoticeDTO();
		nDTO.setNoticeNo(noticeNo);
		nDTO.setNoticeTitle(noticeTitle);
		nDTO.setNoticeContents(noticeContents);
		nDTO.setChgMemberNo(chgMemberNo);
		
		MultipartFile file = mulReq.getFile("noticeFile");
		String noticeFileOrgName = "";
		if(file != null){
			noticeFileOrgName = CmmUtil.nvl(file.getOriginalFilename());
		}
		if(!"".equals(noticeFileOrgName)){
			String noticeFileName = FileUtil.fileSave(file, noticeFilePath);
			nDTO.setNoticeFileName(noticeFileName);
			nDTO.setNoticeFileOrgName(noticeFileOrgName);
			nDTO.setNoticeFilePath(noticeFilePath);
		}
		
		int result = noticeService.updateNoticeDetail(nDTO);
		
		url = "/Lmin/notice/noticeList.do";
		if(result==0){
			msg = "공지사항 수정에 실패했습니다.";
		}else{
			msg = "공지사항 수정에 성공했습니다.";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		msg = null;
		url = null;
		noticeNo = null;
		noticeTitle = null;
		noticeContents = null;
		chgMemberNo = null;
		nDTO = null;
		log.info("Lmin:noticeUpdateProc End!!");
		return "/alert";
	}
	
	@RequestMapping("/Lmin/notice/noticeDeleteProc")
	public String noticeDeleteProc(HttpServletRequest req, Model model, HttpServletResponse resp, HttpSession session) throws Exception{
		log.info("Lmin:noticeDeleteProc Start!!");
		SessionUtil.sessionCheck(resp, session);
		String url = "";
		String msg = "";
		String noticeNo = CmmUtil.nvl(req.getParameter("nNo"));
		
		int result = noticeService.deleteNotice(noticeNo);
		
		if(result == 0){
			msg = "공지사항 삭제에 실패했습니다.";
		}else{
			msg = "공지사항 삭제에 성공했습니다.";
		}
		url = "/Lmin/notice/noticeList.do";
		
		model.addAttribute("url", url);
		model.addAttribute("msg", msg);
		
		url = null;
		msg = null;
		noticeNo = null;
		
		log.info("Lmin:noticeDeleteProc End!!");
		return "/alert";
	}
	
	@RequestMapping(value="/Lmin/notice/noticeDeleteImg", method=RequestMethod.POST)
	public void noticeDeleteImg(HttpServletRequest req, HttpServletResponse resp, Model model, HttpSession session) throws Exception{
		log.info(this.getClass() + ".noticeDeleteImg start!!");
		
		SessionUtil.sessionCheck(resp, session);
		
		String noticeNo = CmmUtil.nvl(req.getParameter("noticeNo"));
		log.info(" noticeNo : " + noticeNo);
		String noticeFileNo = CmmUtil.nvl(req.getParameter("noticeFileNo"));
		log.info(" noticeFileNo : " + noticeFileNo);
		String chgMemberNo = CmmUtil.nvl((String)session.getAttribute("ss_member_no"));
		log.info(" chgMemberNo : " + chgMemberNo);
		
		Map<String, String> map = new HashMap<>();
		map.put("noticeNo", noticeNo);
		map.put("noticeFileNo", noticeFileNo);
		map.put("chgMemberNo", chgMemberNo);
		
		int result = noticeService.updateNoticeImgNull(map);
		
		resp.getWriter().println(result);
		
		noticeNo = null;
		noticeFileNo= null;
		chgMemberNo = null;
		map = null;
		
		log.info(this.getClass() + ".noticeDeleteImg end!!");
	}
	
	@RequestMapping(value="/Lmin/notice/noticeImgChangeView", method=RequestMethod.GET)
	public String noticeImgChangView(HttpServletRequest req, HttpServletResponse resp, Model model, HttpSession session) throws Exception{
		log.info(this.getClass() + ".noticeImgChangeView start!!!");
		SessionUtil.sessionCheck(resp, session);
		
		String noticeNo = CmmUtil.nvl(req.getParameter("noticeNo"));
		log.info(" noticeNo : " + noticeNo);
		
		NoticeDTO nDTO = new NoticeDTO();
		nDTO.setNoticeNo(noticeNo);
		
		nDTO = noticeService.getNoticeDetail(nDTO);
		
		model.addAttribute("nDTO", nDTO);
		
		noticeNo = null;
		nDTO = null;
		
		log.info(this.getClass() + ".noticeImgChangeView end");
		return "/Lmin/notice/notice_img_updateView";
	}
	
	@RequestMapping(value="/Lmin/notice/noticeImgChange", method=RequestMethod.POST)
	public void noticeImgChange(HttpServletRequest req, HttpServletResponse resp, Model model, HttpSession session, @RequestParam("noticeFile") MultipartFile file) throws Exception{
		log.info(this.getClass() + ".noticeImgChange start!!!");
		SessionUtil.sessionCheck(resp, session);
		String noticeNo = CmmUtil.nvl(req.getParameter("noticeNo"));
		log.info(" noticeNo : " + noticeNo);
		String preFileNo = CmmUtil.nvl(req.getParameter("preFileNo"));
		log.info(" preFileNo : " + preFileNo);
		String preFileName = CmmUtil.nvl(req.getParameter("preFileName"));;
		log.info(" preFileName : " + preFileName);
		String preFilePath = CmmUtil.nvl(req.getParameter("preFilePath"));
		log.info(" proFilePath : " + preFilePath);
		String chgMemberNo = (String)session.getAttribute("ss_member_no");
		log.info(" memberNo : " + chgMemberNo);
		
		String noticeFileName = null;
		String noticeFileOrgName = CmmUtil.nvl(file.getOriginalFilename());
		log.info(" noticeFileOrgName : " + noticeFileOrgName);
		noticeFileName = FileUtil.fileSave(file, noticeFilePath);
		
		NoticeDTO nDTO = new NoticeDTO();
		nDTO.setNoticeNo(noticeNo);
		nDTO.setNoticeFileOrgName(noticeFileOrgName);
		nDTO.setNoticeFilePath(noticeFilePath);
		nDTO.setNoticeFileName(noticeFileName);
		nDTO.setChgMemberNo(chgMemberNo);
		
		Map<String, Object> map = new HashMap<>();
		map.put("nDTO", nDTO);
		map.put("deleteFileNo", preFileNo);
		
		int result = noticeService.updateNoticeImg(map);
		
		if(result != 0) {
			FileUtil.deleteFile(preFilePath, preFileName);
			resp.getWriter().println(noticeFileName);
		}else {
			resp.getWriter().println(0);
		}
		
		noticeNo = null;
		preFileNo = null;
		preFileName = null;
		preFilePath = null;
		chgMemberNo = null;
		noticeFileName = null;
		noticeFileOrgName = null;
		nDTO = null;
		map = null;
		
		log.info(this.getClass() + ".noticeImgChange end!!!s");
	}
}
