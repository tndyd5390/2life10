package com.cl.util;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class SessionUtil {
	public static void sessionCheck(HttpServletResponse response, HttpSession session){
		try{
			if("".equals(CmmUtil.nvl((String)session.getAttribute("ss_member_no"))) || !"A".equals((String)session.getAttribute("ss_member_auth"))){
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
			}else if(!"".equals(CmmUtil.nvl((String)session.getAttribute("ss_member_no")))){
				response.sendRedirect("/main.do");
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	}

}
