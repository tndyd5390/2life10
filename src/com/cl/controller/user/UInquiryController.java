//������ȸ ��Ʈ�ѷ�
package com.cl.controller.user;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;

import com.cl.service.IInquiryService;

@Controller
public class UInquiryController {
	
	private Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="InquiryService")
	private IInquiryService inquiryService;
	
	
}
