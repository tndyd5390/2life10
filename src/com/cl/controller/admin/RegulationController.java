//���ù��� ��Ʈ�ѷ�
package com.cl.controller.admin;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.cl.dto.RegulationDTO;
import com.cl.service.IRegulationService;
import com.cl.util.CmmUtil;
import com.cl.util.FileUtil;
import com.cl.util.PageUtil;

@Controller
public class RegulationController {
	
	private Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="RegulationService")
	private IRegulationService regulationService;
	
	//이미지 파일이 저장될 경로
	private String regulationSavePath = "C:\\Users\\Data3811-32\\git\\2life10\\WebContent\\regulationFile\\";
	
	/**
	 * @param req
	 * @param resp
	 * @param model
	 * @param session
	 * @return
	 * @throws Exception
	 * 상조관련 법규 리스트를 불러오는 메소드
	 */
	@RequestMapping(value="Lmin/regulation/regulationList", method= {RequestMethod.GET, RequestMethod.POST})
	public String regulationList(HttpServletRequest req, HttpServletResponse resp, Model model, HttpSession session) throws Exception{
		log.info(this.getClass() + ".regulationList start!!!");
		//화면에 보여줄 항목의 갯수
		int splitPage = 10;
		
		HashMap<String, Object> hMap = new HashMap<>();
		hMap = PageUtil.paging(req, splitPage);
		hMap = regulationService.getRegulationList(hMap);
		model.addAttribute("hMap", hMap);
		
		hMap = null;
		log.info(this.getClass() + ".regulation end!!!");
		return "/Lmin/regulation/regulation_list";
	}
	
	/**
	 * @param req
	 * @param resp
	 * @param model
	 * @param session
	 * @return
	 * @throws Exception
	 * 상조관련법규등록 화면으로 이동하는 메소드
	 */
	@RequestMapping(value="Lmin/regulation/regulationRegView", method=RequestMethod.GET)
	public String regulationRegView(HttpServletRequest req, HttpServletResponse resp, Model model, HttpSession session) throws Exception{
		log.info(this.getClass() + ".regulationRegView start!!!");
		
		log.info(this.getClass() + ".regulationRegView end!!!");
		return "/Lmin/regulation/regulation_write";
	}
	
	/**
	 * @param req
	 * @param resp
	 * @param model
	 * @param session
	 * @param regulationFile
	 * @return
	 * @throws Exception
	 * 상조관련법규 등록 메소드
	 */
	@RequestMapping(value="Lmin/regulation/regulationRegProc", method=RequestMethod.POST)
	public String regulationRegProc(HttpServletRequest req, HttpServletResponse resp, Model model, HttpSession session, @RequestParam("regulationFile") MultipartFile regulationFile)throws Exception{
		log.info(this.getClass() + ".regulationRegProc start!!!");
		
		//상조관련법규 제목
		String regulationTitle = CmmUtil.nvl(req.getParameter("regulationTitle"));
		log.info(" regulationTitle : " + regulationTitle);
		//상조관련법규 내용 내용은 없을 수도 있음
		String regulationContents = CmmUtil.nvl(req.getParameter("regulationContents"));
		log.info(" regulationContents : " + regulationContents);
		//등록자 회원번호
		String regMemberNo = CmmUtil.nvl((String)session.getAttribute("ss_member_no"));
		log.info(" regMemberNo : " + regMemberNo);

		//DTO세팅
		RegulationDTO rDTO = new RegulationDTO();
		rDTO.setRegMemberNo(regMemberNo);
		rDTO.setRegulationTitle(regulationTitle);
		rDTO.setRegulationContents(regulationContents);
		
		//이미지 파일의 바뀔 이름
		String regulationFileName = null;
		//이미지 파일의 원래 이름
		String regulationFileOrgName = null;
		
		//이미지 파일의 원래 이름이 공백이 아니라면 이미지를 업로드하기 
		if(!CmmUtil.nvl(regulationFile.getOriginalFilename()).equals("")) {
			//이미지 파일의 원래 이름 
			regulationFileOrgName = CmmUtil.nvl(regulationFile.getOriginalFilename());
			//이미지 파일저장후 바뀐이름
			regulationFileName = FileUtil.fileSave(regulationFile, regulationSavePath);
			log.info(" regulationFileOrgName : " + regulationFileOrgName);
			log.info(" regulationFileName : " + regulationFileName);
			rDTO.setRegulationFilePath(regulationSavePath);
			rDTO.setRegulationFileOrgName(regulationFileOrgName);
			rDTO.setRegulationFileName(regulationFileName);
		}
		
		//상조관련법규 등록
		int result = regulationService.insertRegulation(rDTO);
		
		if(result != 0) {
			model.addAttribute("msg", "상조관련법규 등록에 성공하였습니다.");
		}else {
			model.addAttribute("msg", "상조관련법규 등록에 실패하였습니다.");
		}
		model.addAttribute("url", "/Lmin/regulation/regulationList.do");
		
		regulationTitle = null;
		regulationContents = null;
		regMemberNo = null;
		rDTO = null;
		regulationFileName = null;
		regulationFileOrgName = null;
		
		log.info(this.getClass() + ".regulationRegProc end!!!");
		return "alert";
	}
	
	/**
	 * @param req
	 * @param resp
	 * @param model
	 * @param sessino
	 * @return
	 * @throws Exception
	 * 상조관련법규 상세보기 메소드
	 */
	@RequestMapping(value="Lmin/regulation/regulationDetail", method=RequestMethod.GET)
	public String regulationDetail(HttpServletRequest req, HttpServletResponse resp, Model model, HttpSession sessino) throws Exception{
		log.info(this.getClass() + ".regulationDetail start!!!");
		
		//상조관련법규 번호
		String regulationNo = CmmUtil.nvl(req.getParameter("regulationNo"));
		log.info(" regulationNo : " + regulationNo);
		
		//상조관련법규 불러오기
		RegulationDTO rDTO = regulationService.getRegulationDetail(regulationNo);
		if(rDTO == null) rDTO = new RegulationDTO();
		
		model.addAttribute("rDTO", rDTO);
		
		regulationNo = null;
		rDTO = null;
		
		log.info(this.getClass() + ".regulationDetail end!!!");
		return "/Lmin/regulation/regulation_view";
	}
	
	/**
	 * @param req
	 * @param resp
	 * @param model
	 * @param session
	 * @return
	 * @throws Exception
	 * 상조관련법규 삭제 메소드
	 */
	@RequestMapping(value="Lmin/regulation/regulationDelete", method=RequestMethod.GET)
	public String regulationDeleteProc(HttpServletRequest req, HttpServletResponse resp, Model model, HttpSession session) throws Exception{
		log.info(this.getClass() + ".regulationDelete start!!!");
		
		//상조관련법규 번호
		String regulationNo = CmmUtil.nvl(req.getParameter("regulationNo"));
		log.info(" regulationNo : " + regulationNo);
		
		//상조관련법규를 삭제하는데
		RegulationDTO rDTO = regulationService.deleteRegulation(regulationNo);
		
		//rDTO가 null이 아니라면 상조관련법규 삭제 성공
		if(rDTO != null) {
			//기존의 상조관련법규 이미지 삭제
			FileUtil.deleteFile(CmmUtil.nvl(rDTO.getRegulationFilePath()), CmmUtil.nvl(rDTO.getRegulationFileName()));
			model.addAttribute("msg", "상조관련법규 삭제에 성공했습니다.");
		}else {
			model.addAttribute("msg", "상조관련법규 삭제에 실패 했습니다.");
		}
		model.addAttribute("url", "/Lmin/regulation/regulationList.do");
		
		regulationNo = null;
		rDTO = null;
		
		log.info(this.getClass() + ".regulationDelete end!!!");
		return "/alert";
	}
	
	/**
	 * @param req
	 * @param resp
	 * @param model
	 * @param session
	 * @return
	 * @throws Exception
	 * 상조관련법규 수정화면으로 이동
	 */
	@RequestMapping(value="Lmin/regulation/regulationUpdateView", method=RequestMethod.GET)
	public String regulationUpdateView(HttpServletRequest req, HttpServletResponse resp, Model model, HttpSession session) throws Exception{
		log.info(this.getClass() + ".regulationUpdateView start!!!");
		
		//상조관련법규 번호
		String regulationNo = CmmUtil.nvl(req.getParameter("regulationNo"));
		log.info(" regulationNo : " + regulationNo);
		
		//상조관련법규 불러오기
		RegulationDTO rDTO = regulationService.getRegulationDetail(regulationNo);
		if(rDTO == null) rDTO = new RegulationDTO();
		
		model.addAttribute("rDTO", rDTO);
		
		regulationNo = null;
		rDTO= null;
		
		log.info(this.getClass() + ".regulationUpdateView end!!!");
		return "/Lmin/regulation/regulation_update_view";
	}
	
	/**
	 * @param req
	 * @param resp
	 * @param model
	 * @param session
	 * @throws Exception
	 * 상조관련법규 수정 화면에서 이미지 삭제버튼 클릭시 매핑된 메소드
	 */
	@RequestMapping(value="Lmin/regulation/regulationDeleteImg", method=RequestMethod.POST)
	public void regulationDeleteImg(HttpServletRequest req, HttpServletResponse resp, Model model, HttpSession session) throws Exception{
		log.info(this.getClass() + ".regulationDeleteImg start!!!");
		
		//상조관련법규번호
		String regulationNo = CmmUtil.nvl(req.getParameter("regulationNo"));
		log.info(" regulationNo : " + regulationNo);
		//상조관련법규 이미지 파일의 번호
		String regulationFileNo = CmmUtil.nvl(req.getParameter("regulationFileNo"));
		log.info(" regulationFileNo : " + regulationFileNo);
		//수정자 회원번호
		String chgMemberNo = (String)session.getAttribute("ss_member_no");
		log.info(" memberNo : " + chgMemberNo);
		
		//service에 여러개의 파라미터를 넘기기위해 map 생성
		Map<String, String> map = new HashMap<>();
		map.put("regulationNo", regulationNo);
		map.put("regulationFileNo", regulationFileNo);
		map.put("chgMemberNo", chgMemberNo);
		
		//이미지 삭제
		int result = regulationService.updateRegulationImgNull(map);
		
		//삭제 성공시 숫자 반환
		resp.getWriter().println(result);
		
		regulationNo = null;
		regulationFileNo = null;
		chgMemberNo = null;
		map = null;
		
		log.info(this.getClass() + ".regulationDeleteImg end!!!");
	}
	
	/**
	 * @param req
	 * @param resp
	 * @param model
	 * @param session
	 * @return
	 * @throws Exception
	 * 상조관련법규에서 이미지 수정버튼클릭시 메소드
	 */
	@RequestMapping(value="Lmin/regulation/regulationImgChangeView")
	public String regulationImgChangeView(HttpServletRequest req, HttpServletResponse resp, Model model, HttpSession session) throws Exception{
		log.info(this.getClass() + ".regulationImgChangeView start!!");
		
		//상조관련법규 번호
		String regulationNo = CmmUtil.nvl(req.getParameter("regulationNo"));
		log.info(" regulationNo : " + regulationNo);
		
		//상조관련법규 불러옴
		RegulationDTO rDTO = regulationService.getRegulationDetail(regulationNo);
		if(rDTO == null) rDTO = new RegulationDTO();
		
		model.addAttribute("rDTO", rDTO);
		
		regulationNo = null;
		rDTO = null;
		
		log.info(this.getClass() + ".regulationImgChangeView end!!!");
		return "/Lmin/regulation/regulation_img_update";
	}
	
	/**
	 * @param mulReq
	 * @param req
	 * @param resp
	 * @param model
	 * @param session
	 * @throws Exception
	 * 상조관련법규 이미지 수정시 메소드
	 */
	@RequestMapping(value="Lmin/regulation/regulationImgChange")
	public void regulationImgChange(MultipartHttpServletRequest mulReq, HttpServletRequest req, HttpServletResponse resp, Model model, HttpSession session) throws Exception{
		log.info(this.getClass() + ".regulationChangeImg start!!!");
		
		//상조관련법규번호
		String regulationNo = CmmUtil.nvl(req.getParameter("regulationNo"));
		log.info(" regulationNo : " + regulationNo);
		//수정하기 전의 파일 번호
		String preFileNo = CmmUtil.nvl(req.getParameter("preFileNo"));
		log.info(" preFileNo : " + preFileNo);
		//수정하기 전의 파일 이름
		String preFileName = CmmUtil.nvl(req.getParameter("preFileName"));;
		log.info(" preFileName : " + preFileName);
		//수정하기 전의 파일 경로
		String preFilePath = CmmUtil.nvl(req.getParameter("preFilePath"));
		log.info(" proFilePath : " + preFilePath);
		//수정자 회원번호
		String chgMemberNo = (String)session.getAttribute("ss_member_no");
		log.info(" memberNo : " + chgMemberNo);
		
		//파일객체를 가져옴
		MultipartFile file = mulReq.getFile("regulationFile");
		//새로지을 파일 이름 변수선언
		String reFileName = "";
		//수정파일의 원본이름
		String regulationFileOrgName = CmmUtil.nvl(file.getOriginalFilename());
		log.info(" regulationFileOrgName : " + regulationFileOrgName);
		//수정한 파일을 저장후 변경된 파일 이름
		reFileName = FileUtil.fileSave(file, regulationSavePath);
		
		//DTO세팅
		RegulationDTO rDTO = new RegulationDTO();
		rDTO.setRegulationNo(regulationNo);
		rDTO.setRegulationFileOrgName(regulationFileOrgName);
		rDTO.setRegulationFilePath(regulationSavePath);
		rDTO.setRegulationFileName(reFileName);
		rDTO.setChgMemberNo(chgMemberNo);
		
		//service에 여러개의 파라미터를 넘기기 위한 map
		Map<String, Object> map = new HashMap<>();
		//수정된 상조관련법규 이미지의 DTO
		map.put("rDTO", rDTO);
		//삭제할 파일의 번호
		map.put("deleteFileNo", preFileNo);
		
		//상조관련법규 이미지 수정
		int result = regulationService.updateRegulationImg(map);
		
		if(result != 0) {
			//파일 삭제
			FileUtil.deleteFile(preFilePath, preFileName);
			//수정 성공시 수정된 파일의 이름을 ajax로 전송
			resp.getWriter().println(reFileName);
		}else {
			//수정실패시 0전송
			resp.getWriter().println(0);
		}
		
		regulationNo = null;
		preFileNo = null;
		preFileName = null;
		preFilePath = null;
		chgMemberNo = null;
		file = null;
		reFileName = null;
		regulationFileOrgName = null;
		map = null;
				
		
		log.info(this.getClass() + ".regualtionChangeImg end!!!");
	}
	
	/**
	 * @param mulReq
	 * @param req
	 * @param resp
	 * @param model
	 * @param session
	 * @return
	 * @throws Exception
	 * 상조관련법규 수정화면에서 최종 수정시 메소드
	 */
	@RequestMapping(value="Lmin/regulation/regulationUpdateProc", method=RequestMethod.POST)
	public String regulationUpdateProcWithoutImg(MultipartHttpServletRequest mulReq, HttpServletRequest req, HttpServletResponse resp, Model model, HttpSession session) throws Exception{
		log.info(this.getClass() + ".regulationUpdateProcWithoutImg start!!"); 
		
		//상조관련법규 번호
		String regulationNo = CmmUtil.nvl(req.getParameter("regulationNo"));
		log.info(" regulationNo : " + regulationNo);
		//상조관련법규 제목
		String regulationTitle = CmmUtil.nvl(req.getParameter("regulationTitle"));
		log.info(" regulationTitle : " + regulationTitle);
		//내용
		String regulationContents = CmmUtil.nvl(req.getParameter("regulationContents"));
		log.info(" regulationContents : " + regulationContents);
		//수정자 회원번호
		String chgMemberNo = (String)session.getAttribute("ss_member_no");
		log.info(" memberNo : " + chgMemberNo);
		
		//수정할 DTO세팅
		RegulationDTO rDTO = new RegulationDTO();
		rDTO.setRegulationTitle(regulationTitle);
		rDTO.setRegulationContents(regulationContents);
		rDTO.setChgMemberNo(chgMemberNo);
		rDTO.setRegulationNo(regulationNo);
		
		//여기는 상조관련법규 이미지를 수정이 아닌 새로 등록시 파일을 가져오고
		MultipartFile file = mulReq.getFile("regulationFile");
		//파일의 원본 이름 변수 선언
		String regulationFileOrgName = CmmUtil.nvl(file.getOriginalFilename());
		//파일이 있다면
		if(!"".equals(regulationFileOrgName)) {
			//파일을 저장
			String regulationReFileName = FileUtil.fileSave(file, regulationSavePath);
			//파일 정보 세팅
			rDTO.setRegulationFileName(regulationReFileName);
			rDTO.setRegulationFileOrgName(regulationFileOrgName);
			rDTO.setRegulationFilePath(regulationSavePath);
		}
		
		//상조관련법규 update
		int result = regulationService.updateRegulation(rDTO);
		if(result != 0) {
			model.addAttribute("msg", "상조관련법규 수정에 성공했습니다.");
		}else {
			model.addAttribute("msg", "상조관련법규 수정에 실패했습니다.");
		}
		model.addAttribute("url", "/Lmin/regulation/regulationList.do");
		
		regulationNo = null;
		regulationTitle = null;
		regulationContents = null;
		chgMemberNo= null;
		rDTO = null;
		
		log.info(this.getClass() + ".regulationUpdateProcWithoutImg end!!!");
		return "/alert";
	}
}
