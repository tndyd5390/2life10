package com.cl.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cl.dto.MsCustomDTO;
import com.cl.persistance.mapperForMS.MsCustomMapper;
import com.cl.service.IMsCustomService;

@Service("MsCustomService")
public class MsCustomService implements IMsCustomService{
	
	@Resource(name="MsCustomMapper")
	private MsCustomMapper msCustomMapper;

	@Override
	public MsCustomDTO getMemberYN(MsCustomDTO msDTO) throws Exception {
		
		List<MsCustomDTO> mList = msCustomMapper.getMemberYN(msDTO);
		
		if(mList.size()>0){
			System.out.println("true");
			msDTO = mList.get(0);
		}
		return msDTO;
	}

}
