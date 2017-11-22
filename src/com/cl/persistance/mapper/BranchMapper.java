package com.cl.persistance.mapper;

import java.util.List;

import com.cl.config.Mapper;
import com.cl.dto.BranchDTO;

@Mapper("BranchMapper")
public interface BranchMapper {
	public List<BranchDTO> getBranchList() throws Exception;
	public int insertBranch(BranchDTO bDTO) throws Exception;
	public BranchDTO getBranchDetail(String branchNo) throws Exception;
}
