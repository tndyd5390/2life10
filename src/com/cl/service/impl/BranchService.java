package com.cl.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cl.dto.BranchDTO;
import com.cl.persistance.mapper.BranchMapper;
import com.cl.service.IBranchService;

@Service("BranchService")
public class BranchService implements IBranchService{
	
	@Resource(name="BranchMapper")
	private BranchMapper branchMapper;

	@Override
	public List<BranchDTO> getBranchList() throws Exception {
		return branchMapper.getBranchList();
	}
	
	@Override
	public int insertBranch(BranchDTO bDTO) throws Exception {
		return branchMapper.insertBranch(bDTO);
	}

	@Override
	public BranchDTO getBranchDetail(String branchNo) throws Exception {
		return branchMapper.getBranchDetail(branchNo);
	}
}
