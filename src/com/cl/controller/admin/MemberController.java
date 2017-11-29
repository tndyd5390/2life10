//��� ��Ʈ�ѷ�
package com.cl.controller.admin;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cl.dto.MemberDTO;
import com.cl.service.IMemberService;
import com.cl.util.AES256Util;
import com.cl.util.CmmUtil;
import com.cl.util.SHA256Util;

@Controller
public class MemberController {
	
	private Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="MemberService")
	private IMemberService memberService;
	
	@RequestMapping("/main")
	public String main() throws Exception{
		log.info("main Start!!");
		
		log.info("main End!!");
		return "/index";
	}
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
		String memberPre = "";
		String memberName = "";
		
		log.info("memberId : "+memberId);
		MemberDTO mDTO = new MemberDTO();
		mDTO.setMemberId(memberId);
		mDTO.setMemberPassword(memberPassword);
		mDTO = memberService.getMemberLogin(mDTO);
		
		if(mDTO==null){
			url = "/member/login.do";
			msg = "���̵�� �н����带 Ȯ���ϼ���.";
		}else{
			memberNo = CmmUtil.nvl(mDTO.getMemberNo());
			memberId = CmmUtil.nvl(mDTO.getMemberId());
			memberName = AES256Util.strDecode(CmmUtil.nvl(mDTO.getMemberName()));
			memberPre = CmmUtil.nvl(mDTO.getMemberPre());
			long time = System.currentTimeMillis(); 
			SimpleDateFormat dayTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String timeStr = dayTime.format(new Date(time));
				
			log.info("login No : " +memberNo);
			log.info("login Id : " +memberId);
			log.info("login Name : " +memberName);
			log.info("login Pre : " +memberPre);
			log.info("login Time : "+timeStr);
			
			session.setAttribute("ss_member_no", memberNo);
			session.setAttribute("ss_member_id", memberId);
			session.setAttribute("ss_member_name", memberName);
			session.setAttribute("ss_member_pre", memberPre);
			url = "/main.do";
			msg = memberName+"�� ȯ���մϴ�.";
		}
		
		mDTO = null;
		model.addAttribute("url", url);
		model.addAttribute("msg", msg);
		log.info("loginProc End!!");
		return "/member/redirect";
	}
	
	@RequestMapping("/member/logout")
	public String logout(HttpSession session) throws Exception{
		log.info("logout Start!!");
		
		String memeberNo = CmmUtil.nvl((String)session.getAttribute("ss_member_no"));
		String memeberId = CmmUtil.nvl((String)session.getAttribute("ss_member_id"));
		String memeberName = CmmUtil.nvl((String)session.getAttribute("ss_member_name"));
		String memeberPre = CmmUtil.nvl((String)session.getAttribute("ss_member_pre"));
		long time = System.currentTimeMillis(); 
		SimpleDateFormat dayTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String timeStr = dayTime.format(new Date(time));

		log.info("logout No : "+memeberNo);
		log.info("logout Id : "+memeberId);
		log.info("logout Name : "+memeberName);
		log.info("logout Pre : "+memeberPre);
		log.info("logout Time : "+timeStr);
		
		session.setAttribute("ss_memeber_no", "");
		session.setAttribute("ss_memeber_id", "");
		session.setAttribute("ss_memeber_name", "");
		session.setAttribute("ss_memeber_pre", "");
		session.invalidate();
		
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
		String memberEmail1 = CmmUtil.nvl(req.getParameter("email1"));
		String memberEmail2 = CmmUtil.nvl(req.getParameter("email2"));
		
		log.info("memberName = "+memberName);
		log.info("memberEmail1 = "+memberEmail1);
		log.info("memberEmail2 = "+memberEmail2);
		log.info("memberEmail = "+ memberEmail1+"@"+memberEmail2);
		
		url = "/member/joinStep2.do";
		msg = "��ġ�ϴ� ȸ���� �����ϴ�. ������������ �̵��մϴ�.";
		
		model.addAttribute("url", url);
		model.addAttribute("msg", msg);
		
		log.info("joinCheckProc End!!");
		return "/member/redirect";
	}
	@RequestMapping("/member/joinStep2")
	public String joinStep2()throws Exception{
		log.info("joinStep2 Start!!");
		
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
		
		int result = memberService.insertMember(mDTO);
		
		if(result == 1){
			url = "/member/login.do";
			msg = "ȸ������ �Ϸ�";
		}else{
			url = "/member/joinStep.do";
			msg = "ȸ������ ����";
		}
		
		mDTO = null;
		model.addAttribute("url", url);
		model.addAttribute("msg", msg);
		
		log.info("joinProc Start!!");
		return "/member/redirect";
	}
}
