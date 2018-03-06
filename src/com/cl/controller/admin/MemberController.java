//占쏙옙占� 占쏙옙트占싼뤄옙
package com.cl.controller.admin;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cl.dto.MemberDTO;
import com.cl.dto.MsCustomDTO;
import com.cl.service.IMemberService;
import com.cl.service.IMsCustomService;
import com.cl.util.AES256Util;
import com.cl.util.CmmUtil;
import com.cl.util.Email;
import com.cl.util.EmailSender;
import com.cl.util.PageUtil;
import com.cl.util.SHA256Util;
import com.cl.util.SessionUtil;

@Controller
public class MemberController {
	
	private Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="MemberService")
	private IMemberService memberService;
	@Resource(name="MsCustomService")
	private IMsCustomService msCustomService;
	
	@Autowired
	private EmailSender emailSender;
	
	@RequestMapping("/member/login")
	public String login() throws Exception{
		log.info("login Start!!");
		
		log.info("login End!!");
		return "/login/login";
	}
	@RequestMapping("/member/loginProc")
	public String loginProc(HttpServletRequest req, HttpSession session, Model model) throws Exception{
		log.info("loginProc Start!!");
		
		String url = "";
		String msg = "";
		String memberId = CmmUtil.nvl(req.getParameter("id"));
		String memberPassword = SHA256Util.sha256(CmmUtil.nvl(req.getParameter("password")));
		String memberNo = "";
		String memberAuth = "";
		String memberName = "";
		String memberPre = "";
		
		log.info("memberId : "+memberId);
		MemberDTO mDTO = new MemberDTO();
		mDTO.setMemberId(memberId);
		mDTO.setMemberPassword(memberPassword);
		mDTO = memberService.getMemberLogin(mDTO);
		
		if(mDTO==null){
			url = "/member/login.do";
			msg = "아이디, 패스워드를 확인하세요.";
		}else{
			memberNo = CmmUtil.nvl(mDTO.getMemberNo());
			memberId = CmmUtil.nvl(mDTO.getMemberId());
			memberName = AES256Util.strDecode(CmmUtil.nvl(mDTO.getMemberName()));
			memberAuth = CmmUtil.nvl(mDTO.getMemberAuth());
			memberPre = CmmUtil.nvl(mDTO.getMemberPre());
			long time = System.currentTimeMillis(); 
			SimpleDateFormat dayTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String timeStr = dayTime.format(new Date(time));
				
			log.info("login No : " +memberNo);
			log.info("login Id : " +memberId);
			log.info("login Name : " +memberName);
			log.info("login Auth : " +memberAuth);
			log.info("login Pre : " +memberPre);
			log.info("login Time : "+timeStr);
			
			session.setAttribute("ss_member_no", memberNo);
			session.setAttribute("ss_member_id", memberId);
			session.setAttribute("ss_member_name", memberName);
			session.setAttribute("ss_member_auth", memberAuth);
			session.setAttribute("ss_member_pre", memberPre);
			
			if(mDTO.getMemberAuth().equals("A") || mDTO.getMemberAuth().equals("CEO")){
				url = "/Lmin/notice/noticeList.do";
			}else{
				url = "/main.do";
			}
			msg = memberName+"님 환영합니다.";
		}
		
		mDTO = null;
		model.addAttribute("url", url);
		model.addAttribute("msg", msg);
		log.info("loginProc End!!");
		return "/member/redirect";
	}
	
	@RequestMapping("/member/logout")
	public String logout(HttpSession session, Model model) throws Exception{
		log.info("logout Start!!");
		
		String memeberNo = CmmUtil.nvl((String)session.getAttribute("ss_member_no"));
		String memeberId = CmmUtil.nvl((String)session.getAttribute("ss_member_id"));
		String memeberName = CmmUtil.nvl((String)session.getAttribute("ss_member_name"));
		String memeberAuth = CmmUtil.nvl((String)session.getAttribute("ss_member_auth"));
		String memeberPre = CmmUtil.nvl((String)session.getAttribute("ss_member_pre"));
		long time = System.currentTimeMillis(); 
		SimpleDateFormat dayTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String timeStr = dayTime.format(new Date(time));

		log.info("logout No : "+memeberNo);
		log.info("logout Id : "+memeberId);
		log.info("logout Name : "+memeberName);
		log.info("logout Auth : "+memeberAuth);
		log.info("logout Pre : "+memeberPre);
		log.info("logout Time : "+timeStr);
		
		session.setAttribute("ss_memeber_no", "");
		session.setAttribute("ss_memeber_id", "");
		session.setAttribute("ss_memeber_name", "");
		session.setAttribute("ss_memeber_auth", "");
		session.setAttribute("ss_memeber_pre", "");
		session.invalidate();
		
		model.addAttribute("msg", "로그아웃 성공");
		model.addAttribute("url", "/main.do");
		log.info("logout End!!");
		return "/member/redirect";
	}
	
	@RequestMapping("/member/joinStep")
	public String joinStep() throws Exception{
		log.info("joinStep Start!!");
		
		
		log.info("joinStep End!!");
		return "/member/join_step";
	}
	
	@RequestMapping("/member/joinCheckProc")
	public String joinCheckProc(HttpServletRequest req, Model model) throws Exception{
		log.info("joinCheckProc Start!!");
		
		String url = "";
		String msg = "";
		String memberName = CmmUtil.nvl(req.getParameter("name"));
		String memberBirthday = CmmUtil.nvl(req.getParameter("birthday"));
		String memberPhone = CmmUtil.nvl(req.getParameter("phone"));
		
		log.info("memberName = "+memberName);
		log.info("memberBirthday = "+memberBirthday);
		log.info("memberPhone = "+ memberPhone);
		
		
		MsCustomDTO msDTO = new MsCustomDTO();
		msDTO.setMemberName(memberName);
		msDTO.setMemberRrn(memberBirthday);
		msDTO.setPhoneNo(memberPhone);
		
		msDTO = msCustomService.getMemberYN(msDTO);
		
		if(msDTO != null){
			
			if(msDTO.getMemberNo() == null){
				model.addAttribute("memberNo", "N");
				msg = "일치하는 회원이 없습니다. 계속 진행하세요.";
				log.info("memberNo : N");
			}else{
				model.addAttribute("memberNo", msDTO.getMemberNo());
				log.info("memberNo : "+ msDTO.getMemberNo());
				msg = "회원정보가 확인 되었습니다. 계속 진행하세요.";
			}
		}
		url = "/member/joinStep2.do";
		
		model.addAttribute("url", url);
		model.addAttribute("msg", msg);
		
		log.info("joinCheckProc End!!");
		return "/member/redirectY";
	}
	@RequestMapping("/member/joinStep2")
	public String joinStep2(HttpServletRequest req, Model model)throws Exception{
		log.info("joinStep2 Start!!");
		
		String mNo = (String) CmmUtil.nvl(req.getParameter("mNo"));
		log.info("mNo = " + mNo);
		
		if(!mNo.equals("") || mNo != null){
			model.addAttribute("mNo", mNo);
		}
		
		log.info("joinStep2 End!!");
		return "/member/join_step_2";
	}
	
	@RequestMapping("/member/idCheck")
	public @ResponseBody int idCheck(@RequestParam("memberId") String memberId) throws Exception{
		log.info("idCheck Start!!");
		memberId = CmmUtil.nvl(memberId);
		log.info("checkId : "+memberId);
		MemberDTO mDTO = new MemberDTO();
		mDTO.setMemberId(memberId);
		int check = memberService.getIdCheck(mDTO);
		
		log.info("idCheck End!!");
		return check;
	}
	
	@RequestMapping("/member/joinProc")
	public String joinProc(HttpServletRequest req, Model model) throws Exception{
		log.info("joinProc Start!!");
		String url = "";
		String msg = "";
		
		String memberId = CmmUtil.nvl(req.getParameter("id"));
		String memberPassword = SHA256Util.sha256(CmmUtil.nvl(req.getParameter("password")));
		String memberName = CmmUtil.nvl(req.getParameter("name"));
		String memberSex = CmmUtil.nvl(req.getParameter("sex"));
		String memberHomeNo = CmmUtil.nvl(req.getParameter("tel1"))+"-"+CmmUtil.nvl(req.getParameter("tel2"))+"-"+CmmUtil.nvl(req.getParameter("tel3"));
		String memberPhoneNo = CmmUtil.nvl(req.getParameter("phone1"))+"-"+CmmUtil.nvl(req.getParameter("phone2"))+"-"+CmmUtil.nvl(req.getParameter("phone3"));
		String memberPostNo = CmmUtil.nvl(req.getParameter("postcode"));
		String memberAddress = CmmUtil.nvl(req.getParameter("address1"));
		String memberAddressDetail = CmmUtil.nvl(req.getParameter("address2"));
		String memberEmail1 = CmmUtil.nvl(req.getParameter("email1"));
		String memberEmail2 = CmmUtil.nvl(req.getParameter("email2"));
		String memberPre = CmmUtil.nvl(req.getParameter("pre"));
		
		log.info("id : "+ memberId);
		log.info("name : "+ memberName);
		log.info("sex : "+ memberSex);
		log.info("home : "+ memberHomeNo);
		log.info("phone : "+ memberPhoneNo);
		log.info("postNo : "+ memberPostNo);
		log.info("address : "+ memberAddress);
		log.info("addressDetail : "+ memberAddressDetail);
		log.info("email1 : "+ memberEmail1);
		log.info("email2 : "+ memberEmail2);
		log.info("memberPre : "+ memberPre);

		MemberDTO mDTO = new MemberDTO();
		
		mDTO.setMemberId(memberId);
		mDTO.setMemberPassword(memberPassword);
		mDTO.setMemberName(AES256Util.strEncode(memberName));
		mDTO.setMemberSex(memberSex);
		mDTO.setMemberHomeNo(AES256Util.strEncode(memberHomeNo));
		mDTO.setMemberPhoneNo(AES256Util.strEncode(memberPhoneNo));
		mDTO.setMemberPostNo(AES256Util.strEncode(memberPostNo));
		mDTO.setMemberAddress(AES256Util.strEncode(memberAddress));
		if(!memberAddressDetail.equals("")){
			mDTO.setMemberAddressDetail(AES256Util.strEncode(memberAddressDetail));
		}else{
			mDTO.setMemberAddressDetail("");
		}
		mDTO.setMemberEmail1(AES256Util.strEncode(memberEmail1));
		mDTO.setMemberEmail2(AES256Util.strEncode(memberEmail2));
		mDTO.setMemberPre(memberPre);
		mDTO.setMemberAuth("U");
		
		int result = memberService.insertMember(mDTO);
		
		if(result == 1){
			url = "/member/login.do";
			msg = "회원가입 성공";
		}else{
			url = "/member/joinStep.do";
			msg = "회원가입 실패";
		}
		
		model.addAttribute("url", url);
		model.addAttribute("msg", msg);
		mDTO = null;
		
		log.info("joinProc Start!!");
		return "/member/redirect";
	}
	
	@RequestMapping("/Lmin/member/memberList")
	public String memberList(HttpServletRequest req, Model model) throws Exception {
		log.info("Lmin:memberList Start!!");

		int splitPage = 10;
	
		HashMap<String, Object> hMap = new HashMap<>();
		
		hMap = PageUtil.paging(req, splitPage);
		
		hMap = memberService.getMemberList(hMap);
		
		model.addAttribute("hMap", hMap);
		hMap = null;
		log.info("Lmin:memberList End!!");					
		return "/Lmin/member/member_list";
	}
	
	@RequestMapping("/Lmin/member/memberDetail")
	public String memberDetail(HttpServletRequest req, Model model) throws Exception {
		log.info("Lmin:memberDetail Start!!");
		
		String memberNo = CmmUtil.nvl(req.getParameter("mNo"));
		log.info("memberNo : " + memberNo);
		
		MemberDTO mDTO = new MemberDTO();
		mDTO.setMemberNo(memberNo);
		
		mDTO = memberService.getMemberDetail(mDTO);
		
		model.addAttribute("mDTO", mDTO);
		
		mDTO = null;
		log.info("Lmin:memberDetail End!!");
		return "/Lmin/member/member_view";
	}
	
	@RequestMapping("/Lmin/member/memberUpdate")
	public String memberUpdate(HttpServletRequest req, Model model) throws Exception{
		log.info("Lmin:memberUpdate Start!!");
		
		String memberNo = CmmUtil.nvl(req.getParameter("mNo"));
		log.info("memberNo : " + memberNo);
		
		MemberDTO mDTO = new MemberDTO();
		
		mDTO.setMemberNo(memberNo);
		
		mDTO = memberService.getMemberDetail(mDTO);
		
		model.addAttribute("mDTO", mDTO);
		mDTO = null;
		log.info("Lmin:memberUpdate End!!");
		return "/Lmin/member/member_update";
	}
	
	@RequestMapping("/Lmin/member/memberUpdateProc")
	public String memberUpdateProc(HttpServletRequest req, Model model, HttpSession session) throws Exception{
		log.info("Lmin:memberUpdateProc Start!!");
		
		String url = "";
		String msg = "";
		String memberNo = CmmUtil.nvl(req.getParameter("mNo"));
		String memberPassword = CmmUtil.nvl(req.getParameter("password"));
		String memberName = CmmUtil.nvl(req.getParameter("name"));
		String memberSex = CmmUtil.nvl(req.getParameter("sex"));
		String memberHomeNo = CmmUtil.nvl(req.getParameter("tel1")) + "-" + CmmUtil.nvl(req.getParameter("tel2")) + "-" + CmmUtil.nvl(req.getParameter("tel3"));
		String memberPhoneNo = CmmUtil.nvl(req.getParameter("phone1")) + "-" + CmmUtil.nvl(req.getParameter("phone2")) + "-" + CmmUtil.nvl(req.getParameter("phone3"));
		String memberPostNo = CmmUtil.nvl(req.getParameter("postcode"));
		String memberAddress = CmmUtil.nvl(req.getParameter("address1"));
		String memberAddressDetail = CmmUtil.nvl(req.getParameter("address2"));
		String memberEmail1 = CmmUtil.nvl(req.getParameter("email1"));
		String memberEmail2 = CmmUtil.nvl(req.getParameter("email2"));
		String chgMemberNo = CmmUtil.nvl((String) session.getAttribute("ss_member_no"));
		
		log.info("memberNo : " + memberNo);
		log.info("memberName : " + memberName);
		log.info("memberSex : " + memberSex);
		log.info("memberHomeNo : " + memberHomeNo);
		log.info("memberPhoneNo : " + memberPhoneNo);
		log.info("memberPostNo : " + memberPostNo);
		log.info("memberAddress : " + memberAddress);
		log.info("memberAddressDetail : " + memberAddressDetail);
		log.info("memberEmail1 : " + memberEmail1);
		log.info("memberEmail2 : " + memberEmail2);
		log.info("chgMemberNo : " + chgMemberNo);
		
		MemberDTO mDTO = new MemberDTO();
		
		mDTO.setMemberNo(memberNo);
		mDTO.setMemberPassword(SHA256Util.sha256(memberPassword));
		mDTO.setMemberName(AES256Util.strEncode(memberName));
		mDTO.setMemberSex(memberSex);
		mDTO.setMemberHomeNo(AES256Util.strEncode(memberHomeNo));
		mDTO.setMemberPhoneNo(AES256Util.strEncode(memberPhoneNo));
		mDTO.setMemberPostNo(AES256Util.strEncode(memberPostNo));
		mDTO.setMemberAddress(AES256Util.strEncode(memberAddress));
		if(!memberAddressDetail.equals("")) {
			mDTO.setMemberAddressDetail(AES256Util.strEncode(memberAddressDetail));
		} else {
			mDTO.setMemberAddressDetail("");
		}
		mDTO.setMemberEmail1(AES256Util.strEncode(memberEmail1));
		mDTO.setMemberEmail2(AES256Util.strEncode(memberEmail2));
		mDTO.setChgMemberNo(chgMemberNo);
		
		int result = memberService.updateMember(mDTO);
		
		url = "/Lmin/member/memberList.do";
		
		if(result == 0) {
			msg = "수정실패.";
		} else {
			msg = "수정성공.";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		mDTO = null;
		
		log.info("Lmin:memberUpdateProc End!!");
		return "/alert";
	}
	
	@RequestMapping("/Lmin/member/memberDeleteProc")
	public String memberDeleteProc(HttpServletRequest req, Model model) throws Exception {
		log.info("Lmin:memberDeleteProc Start!!");
		
		String url = "";
		String msg = "";
		String memberNo = CmmUtil.nvl(req.getParameter("mNo"));
		log.info(" memberNo : " + memberNo);
		
		int result = memberService.deleteMember(memberNo);
		
		if(result == 0) {
			msg = "삭제성공.";
		} else {
			msg = "삭제실패.";
		}
		url = "/Lmin/member/memberList.do";
		
		model.addAttribute("url", url);
		model.addAttribute("msg", msg);
		
		log.info("Lmin:memberDeleteProc End!!");
		return "/alert";
	}
	
	@RequestMapping("/member/findId")
	public String findId(HttpServletRequest req, HttpServletResponse resp, HttpSession session) throws Exception{
		log.info("findId Start!!");
		
		log.info("findId End!!");
		return "/member/find_id";
	}
	@RequestMapping("/member/findIdProc")
	public String findIdProc(HttpServletRequest req, HttpServletResponse resp, HttpSession session,Model model) throws Exception{
		log.info("findIdProc Start!!");
		SessionUtil.memberCheck(resp, session);
		String msg = "";
		String url = "";
		String memberName = CmmUtil.nvl(req.getParameter("name"));
		String memberEmail1 = CmmUtil.nvl(req.getParameter("email1"));
		String memberEmail2 = CmmUtil.nvl(req.getParameter("email2"));
		log.info("memberName : "+memberName);
		log.info("memberEmail1 : "+memberEmail1);
		log.info("memberEmail2 : "+memberEmail2);
		
		MemberDTO mDTO = new MemberDTO();
		mDTO.setMemberName(AES256Util.strEncode(memberName));
		mDTO.setMemberEmail1(AES256Util.strEncode(memberEmail1));
		mDTO.setMemberEmail2(AES256Util.strEncode(memberEmail2));
		
		mDTO = memberService.getMemberId(mDTO);
		if(mDTO != null){
			msg = "회원님의 아이디는 "+mDTO.getMemberId()+" 입니다.";
			url = "/member/login.do";
		}else{
			msg = "일치하는 회원이 없습니다.";
			url = "/member/findId.do";
		};
		
		model.addAttribute("url" ,url);
		model.addAttribute("msg" ,msg);
		
		mDTO = null;
		log.info("findIdProc End!!");
		return "/member/redirect";
	}
	
	@RequestMapping("/member/findPass")
	public String findPass() throws Exception{
		log.info("findPass Start!!");

		log.info("findPass End!!");
		return "/member/find_pass";
	}
	
	@RequestMapping("/member/findPassProc")
	public String findPassProc(HttpServletRequest req, HttpServletResponse resp, HttpSession session,Model model) throws Exception{
		log.info("findPassProc Start!!");
		SessionUtil.loginCheck(resp, session);
		String msg = "";
		String url = "";
		String memberId = CmmUtil.nvl(req.getParameter("id"));
		String memberName = CmmUtil.nvl(req.getParameter("name"));
		String memberEmail1 = CmmUtil.nvl(req.getParameter("email1"));
		String memberEmail2 = CmmUtil.nvl(req.getParameter("email2"));
		Email sendEmail = new Email();
		
		log.info("memberId : "+memberId);
		log.info("memberName : "+memberName);
		log.info("memberEmail1 : "+memberEmail1);
		log.info("memberEmail2 : "+memberEmail2);
		
		MemberDTO mDTO = new MemberDTO();
		mDTO.setMemberId(memberId);
		mDTO.setMemberName(AES256Util.strEncode(memberName));
		mDTO.setMemberEmail1(AES256Util.strEncode(memberEmail1));
		mDTO.setMemberEmail2(AES256Util.strEncode(memberEmail2));
		
		HashMap<String, Object> hMap = new HashMap<>();
		hMap.put("mDTO", mDTO);
		
		hMap = memberService.updateTmpPass(hMap);
		
		int result = (int) hMap.get("result");
		if(result == 0){
			msg = "회원정보가 일치하지 않습니다.";
			url = "/member/findPass.do";
		}else{
			sendEmail.setReciver(memberEmail1+"@"+memberEmail2);
			sendEmail.setSubject(memberName+"님 크리스찬 상조 임시비밀번호");
			sendEmail.setContent(sendEmail.setContents(hMap));
			emailSender.SendEmail(sendEmail);
			msg = "가입하신 이메일로 임시비밀번호가 전송되었습니다.";
			url = "/member/login.do";
		}
		
		model.addAttribute("url", url);
		model.addAttribute("msg", msg);
		hMap = null;
		mDTO = null;
		log.info("findPassProc End!!");
		return "/member/redirect";
	}
	@RequestMapping("/member/chgPass")
	public String chgPass(HttpServletResponse resp, HttpSession session) throws Exception{
		log.info("chgPass Start!!");
		SessionUtil.memberCheck(resp, session);
		
		log.info("chgPass End!!");
		return "/member/change_pass";
	}
	
	@RequestMapping("/member/chgPassProc")
	public String chgPassProc(HttpServletRequest req, HttpSession session, Model model) throws Exception{
		log.info("chgPassProc Start!!");
		
		String url = "";
		String msg = "";
		String memberNo = CmmUtil.nvl((String) session.getAttribute("ss_member_no"));
		String exPassword = SHA256Util.sha256(CmmUtil.nvl(req.getParameter("exPassword")));
		String newPassword = SHA256Util.sha256(CmmUtil.nvl(req.getParameter("newPassword")));
		
		log.info("memberNo : "+memberNo);
		
		MemberDTO mDTO = new MemberDTO();
		
		mDTO.setMemberNo(memberNo);
		mDTO.setMemberPassword(exPassword);
		mDTO.setNewPassword(newPassword);
		
		int result = memberService.updateMemberPassword(mDTO);
		
		if(result == 0){
			msg = "회원정보가 일치하지 않습니다.";
			url = "/member/chgPass.do";
		}else{
			msg = "변경완료 되었습니다.";
			url = "/member/login.do";
			session.setAttribute("ss_memeber_no", "");
			session.setAttribute("ss_memeber_id", "");
			session.setAttribute("ss_memeber_name", "");
			session.setAttribute("ss_memeber_auth", "");
			session.setAttribute("ss_memeber_pre", "");
			session.invalidate();
		}
		
		model.addAttribute("url", url);
		model.addAttribute("msg", msg);
		mDTO = null;
		
		log.info("chgPassProc End!!");
		return "/member/redirect";
	}
}
