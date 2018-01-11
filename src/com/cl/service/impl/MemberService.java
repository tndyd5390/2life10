package com.cl.service.impl;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cl.dto.MemberDTO;
import com.cl.dto.NoticeDTO;
import com.cl.persistance.mapper.MemberMapper;
import com.cl.service.IMemberService;

@Service("MemberService")
public class MemberService implements IMemberService{
	
	@Resource(name="MemberMapper")
	private MemberMapper memberMapper;

	@Override
	public int getIdCheck(MemberDTO mDTO) throws Exception {
		return memberMapper.getIdCheck(mDTO);
	}

	@Override
	public int insertMember(MemberDTO mDTO) throws Exception {
		return memberMapper.insertMember(mDTO);
	}

	@Override
	public MemberDTO getMemberLogin(MemberDTO mDTO) throws Exception {
		return memberMapper.getMemberLogin(mDTO);
	}
	
	@Override
	public HashMap<String, Object> getMemberList(HashMap<String, Object> hMap) throws Exception {
		List<MemberDTO> mList = memberMapper.getMemberList(hMap);
		hMap.put("list", mList);
		if(mList.size() > 0) {
			hMap.put("pageList", mList.get(0).getPage());
		} else {
			hMap.put("pageList", 1);
		}
		return hMap;
	}
	
	@Override
	public MemberDTO getMemberDetail(MemberDTO mDTO) throws Exception {		
		return memberMapper.getMemberDetail(mDTO);
	}
	
	@Override
	public int updateMember(MemberDTO mDTO) throws Exception {
		return memberMapper.updateMember(mDTO);
	}
	
	@Override
	public int deleteMember(String memberNo) throws Exception {
		return memberMapper.deleteMember(memberNo);
	}

	@Override
	public MemberDTO getMemberId(MemberDTO mDTO) throws Exception {
		return memberMapper.getMemberId(mDTO);
	}
}
