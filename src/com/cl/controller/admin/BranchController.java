//전국지사안내 컨트롤러
package com.cl.controller.admin;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;

import com.cl.service.IBranchService;

@Controller
public class BranchController {
	
	private Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="BranchService")
	private IBranchService branchService;
	
	
}
