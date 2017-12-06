//��������ȳ� ��Ʈ�ѷ�
package com.cl.controller.user;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.cl.dto.BranchDTO;
import com.cl.service.IBranchService;
import com.cl.util.CmmUtil;
import com.cl.util.PageUtil;

@Controller
public class UBranchController {
	
	private Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="BranchService")
	private IBranchService branchService;
	
	@RequestMapping(value="/company/branchList")
	public String branchList(HttpServletRequest req, HttpServletResponse resp, Model model, HttpSession session) throws Exception{
		log.info(this.getClass() + ".branchView start!!!");
		int splitPage = 10;
		
		HashMap<String, Object> hMap = new HashMap<>();
		hMap = PageUtil.paging(req, splitPage);
		hMap = branchService.getBranchList(hMap);
		
		model.addAttribute("hMap", hMap);
		/*List<BranchDTO> bList = branchService.getBranchList();
		if(bList == null) bList = new ArrayList<>();
		model.addAttribute("bList", bList);
		bList = null;*/
		hMap = null;
		log.info(this.getClass() + ".branchView end!!!");
		return "/company/branch";
	}

}
