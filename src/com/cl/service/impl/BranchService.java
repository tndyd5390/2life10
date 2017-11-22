package com.cl.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cl.persistance.mapper.BranchMapper;
import com.cl.service.IBranchService;

@Service("BranchService")
public class BranchService implements IBranchService{
	
	@Resource(name="BranchMapper")
	private BranchMapper branchMapper;
	
}
