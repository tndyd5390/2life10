package com.cl.service;

import java.util.HashMap;
import java.util.List;

import com.cl.dto.BranchDTO;

public interface IBranchService {
	public HashMap<String, Object> getBranchList(HashMap<String, Object> hMap) throws Exception;
	public int insertBranch(BranchDTO bDTO) throws Exception;
	public BranchDTO getBranchDetailAddCnt(String branchNo) throws Exception;
	public BranchDTO getBranchDetail(String branchNo) throws Exception;
	public int deleteBranch(String branchNo) throws Exception;
	public int updateBranch(BranchDTO bDTO) throws Exception;
	public List<BranchDTO> getBranchSearch(HashMap<String, Object> sMap) throws Exception;
}
