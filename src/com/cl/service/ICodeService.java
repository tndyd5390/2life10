package com.cl.service;

import java.util.HashMap;
import java.util.List;

import com.cl.dto.CodeDTO;

public interface ICodeService {

	HashMap<String, List<CodeDTO>> getCodeList() throws Exception;

}
