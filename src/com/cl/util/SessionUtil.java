package com.cl.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

public class SessionUtil {
	public static void sessionCheck(HttpServletResponse response, HttpSession session){
		try{
			if("".equals(CmmUtil.nvl((String)session.getAttribute("ss_member_no"))) || !("A".equals((String)session.getAttribute("ss_member_auth")) || "CEO".equals((String)session.getAttribute("ss_member_auth")))){
				response.sendRedirect("/main.do");
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	public static void loginCheck(HttpServletResponse response, HttpSession session){
		try{
			if("A".equals(CmmUtil.nvl((String) session.getAttribute("ss_member_auth")))){
				response.sendRedirect("/Lmin/notice/noticeList.do");
			}else if("CEO".equals(CmmUtil.nvl((String) session.getAttribute("ss_member_auth")))){
				response.sendRedirect("/Lmin/notice/noticeList.do");
			}else if(!"".equals(CmmUtil.nvl((String)session.getAttribute("ss_member_no")))){
				response.sendRedirect("/main.do");
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	public static void memberCheck(HttpServletResponse response, HttpSession session){
		try{
			if("".equals(CmmUtil.nvl((String) session.getAttribute("ss_member_no")))){
				response.sendRedirect("/main.do");
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public static String getSessionInfo(String str){
		String result ="";

		ServletRequestAttributes sra = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
		HttpServletRequest req = sra.getRequest();
		HttpSession session = req.getSession();
		
		String memberNo = session.getAttribute("ss_member_no").toString();
		String memberId = session.getAttribute("ss_member_id").toString();
		String memberName = session.getAttribute("ss_member_name").toString();
		String memberAuth = session.getAttribute("ss_member_auth").toString();
		String memberPre = session.getAttribute("ss_member_pre").toString();
		
		if(str.equals("memberNo")){
			result = memberNo;
		}else if(str.equals("memberId")){
			result = memberId;
		}else if(str.equals("memberName")){
			result = memberName;
		}else if(str.equals("memberAuth")){
			result = memberAuth;
		}else if(str.equals("memberPre")){
			result = memberPre;
		}
		
		return result;
	}
}
