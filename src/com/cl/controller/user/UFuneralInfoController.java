//������ʽü��ȳ� ��Ʈ�ѷ�
package com.cl.controller.user;

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

import com.cl.dto.CodeDTO;
import com.cl.dto.FuneralInfoDTO;
import com.cl.service.ICodeService;
import com.cl.service.IFuneralInfoService;
import com.cl.util.CmmUtil;
import com.cl.util.PageUtil;

@Controller
public class UFuneralInfoController {
	
	private Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="FuneralInfoService")
	private IFuneralInfoService funeralInfoService;
	
	@Resource(name="CodeService")
	private ICodeService codeService;
	

	@RequestMapping("/funeral/funeralInfoList")
	public String funeralInfoList(HttpServletRequest req, Model model) throws Exception{
		log.info("funeralInfoList Start!!");
		int splitPage = 10;
		
		HashMap<String, Object> hMap = new HashMap<>();
		hMap = PageUtil.paging(req, splitPage);
		hMap = funeralInfoService.getFuneralInfoList(hMap);
		HashMap<String ,List<CodeDTO>> hashMap = new HashMap<>();
		hashMap = codeService.getCodeList();
		
		
		model.addAttribute("hashMap", hashMap);
		model.addAttribute("hMap", hMap);
		
		hashMap = null;
		hMap = null;
		log.info("funeralInfoList End!!");
		return "/funeral/funeral_info_list";
	}
}
