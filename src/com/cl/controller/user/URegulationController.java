//���ù��� ��Ʈ�ѷ�
package com.cl.controller.user;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;

import com.cl.service.IRegulationService;

@Controller
public class URegulationController {
	
	private Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="RegulationService")
	private IRegulationService regulationService;
	private String regulationSavePath = "C:\\Users\\Data3811-32\\git\\2life10\\WebContent\\regulationFile\\";

}
