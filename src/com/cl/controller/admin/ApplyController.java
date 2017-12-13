//���Խ�û ��Ʈ�ѷ�
package com.cl.controller.admin;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.cl.service.IApplyService;
import com.cl.util.CmmUtil;

@Controller
public class ApplyController {
	
	private Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="ApplyService")
	private IApplyService applyService;
	
	@RequestMapping(value="Lmin/appli/appliForm", method=RequestMethod.GET)
	public String applyForm(HttpServletRequest req, HttpServletResponse resp, Model model, HttpSession session) throws Exception{
		log.info(this.getClass() + ".applyForm start!!!");
		
		log.info(this.getClass() + ".applyForm end!!!");
		return "/Lmin/appli/appli_form";
	}
	
	@RequestMapping(value="Lmin/appli/appliProc", method=RequestMethod.POST)
	public String appliProc(HttpServletRequest req, HttpServletResponse resp, Model model, HttpSession session) throws Exception{
		log.info(this.getClass() + ".appliProc start!!!");
		String applyProdCode = CmmUtil.nvl(req.getParameter("applyProdCode"));
		log.info(" applyProdCode : " + applyProdCode);
		String applyContractCode = CmmUtil.nvl(req.getParameter("applyContractCode"));
		log.info(" applyContractCode : " + applyContractCode);
		String applyName = CmmUtil.nvl(req.getParameter("applyName"));
		log.info(" applyName : " + applyName);
		String tel1 = CmmUtil.nvl(req.getParameter("tel1"));
		log.info(" tel1 : " + tel1);
		String tel2 = CmmUtil.nvl(req.getParameter("tel2"));
		log.info(" tel2 : " + tel2);
		String tel3 = CmmUtil.nvl(req.getParameter("tel3"));
		log.info(" tel3 : " + tel3);
		String phoneTel1 = CmmUtil.nvl(req.getParameter("phoneTel1"));
		log.info(" phoneTel1 : " + phoneTel1);
		String phoneTel2 = CmmUtil.nvl(req.getParameter("phoneTel2"));
		log.info(" phoneTel2 : " + phoneTel2);
		String phoneTel3 = CmmUtil.nvl(req.getParameter("phoneTel3"));
		log.info(" phoneTel3 : " + phoneTel3);
		String applyRoute = CmmUtil.nvl(req.getParameter("applyRoute"));
		log.info(" applyRoute : " + applyRoute);
		
		log.info(this.getClass() + ".appliProc end!!!");
		return null;
	}
}
