package com.cl.service;

import java.util.List;

import com.cl.dto.BranchDTO;

public interface IBranchService {
	public List<BranchDTO> getBranchList() throws Exception;
	public int insertBranch(BranchDTO bDTO) throws Exception;
	public BranchDTO getBranchDetail(String branchNo) throws Exception;
}
