//납부조회 컨트롤러
package com.cl.controller.admin;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;

import com.cl.service.IInquiryService;

@Controller
public class InquiryController {
	
	private Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="InquiryService")
	private IInquiryService inquiryService;
	
	
}
