//��� ��Ʈ�ѷ�
package com.cl.controller.user;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;

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
import com.cl.dto.NoticeDTO;
import com.cl.service.IMemberService;
import com.cl.util.AES256Util;
import com.cl.util.CmmUtil;
import com.cl.util.PageUtil;
import com.cl.util.SHA256Util;

@Controller
public class UMemberController {
	
	private Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="MemberService")
	private IMemberService memberService;
	
}
