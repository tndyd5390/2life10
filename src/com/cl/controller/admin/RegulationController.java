//占쏙옙占시뱄옙占쏙옙 占쏙옙트占싼뤄옙
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
	
	//�씠誘몄� �뙆�씪�씠 ���옣�맆 寃쎈줈
	private String regulationSavePath = "/www/thunder-edu_com/file/regulation/img/";
	//private String regulationSavePath = "C:\\Users\\Data3811-32\\git\\2life10\\WebContent\\regulationFile\\";
	
	/**
	 * @param req
	 * @param resp
	 * @param model
	 * @param session
	 * @return
	 * @throws Exception
	 * �긽議곌��젴 踰뺢퇋 由ъ뒪�듃瑜� 遺덈윭�삤�뒗 硫붿냼�뱶
	 */
	@RequestMapping(value="Lmin/regulation/regulationList", method= {RequestMethod.GET, RequestMethod.POST})
	public String regulationList(HttpServletRequest req, HttpServletResponse resp, Model model, HttpSession session) throws Exception{
		log.info(this.getClass() + ".regulationList start!!!");
		//�솕硫댁뿉 蹂댁뿬以� �빆紐⑹쓽 媛��닔
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
	 * �긽議곌��젴踰뺢퇋�벑濡� �솕硫댁쑝濡� �씠�룞�븯�뒗 硫붿냼�뱶
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
	 * �긽議곌��젴踰뺢퇋 �벑濡� 硫붿냼�뱶
	 */
	@RequestMapping(value="Lmin/regulation/regulationRegProc", method=RequestMethod.POST)
	public String regulationRegProc(HttpServletRequest req, HttpServletResponse resp, Model model, HttpSession session, @RequestParam("regulationFile") MultipartFile regulationFile)throws Exception{
		log.info(this.getClass() + ".regulationRegProc start!!!");
		
		//�긽議곌��젴踰뺢퇋 �젣紐�
		String regulationTitle = CmmUtil.nvl(req.getParameter("regulationTitle"));
		log.info(" regulationTitle : " + regulationTitle);
		//�긽議곌��젴踰뺢퇋 �궡�슜 �궡�슜�� �뾾�쓣 �닔�룄 �엳�쓬
		String regulationContents = CmmUtil.nvl(req.getParameter("regulationContents"));
		log.info(" regulationContents : " + regulationContents);
		//�벑濡앹옄 �쉶�썝踰덊샇
		String regMemberNo = CmmUtil.nvl((String)session.getAttribute("ss_member_no"));
		log.info(" regMemberNo : " + regMemberNo);

		//DTO�꽭�똿
		RegulationDTO rDTO = new RegulationDTO();
		rDTO.setRegMemberNo(regMemberNo);
		rDTO.setRegulationTitle(regulationTitle);
		rDTO.setRegulationContents(regulationContents);
		
		//�씠誘몄� �뙆�씪�쓽 諛붾�� �씠由�
		String regulationFileName = null;
		//�씠誘몄� �뙆�씪�쓽 �썝�옒 �씠由�
		String regulationFileOrgName = null;
		
		//�씠誘몄� �뙆�씪�쓽 �썝�옒 �씠由꾩씠 怨듬갚�씠 �븘�땲�씪硫� �씠誘몄�瑜� �뾽濡쒕뱶�븯湲� 
		if(!CmmUtil.nvl(regulationFile.getOriginalFilename()).equals("")) {
			//�씠誘몄� �뙆�씪�쓽 �썝�옒 �씠由� 
			regulationFileOrgName = CmmUtil.nvl(regulationFile.getOriginalFilename());
			//�씠誘몄� �뙆�씪���옣�썑 諛붾�먯씠由�
			regulationFileName = FileUtil.fileSave(regulationFile, regulationSavePath);
			log.info(" regulationFileOrgName : " + regulationFileOrgName);
			log.info(" regulationFileName : " + regulationFileName);
			rDTO.setRegulationFilePath(regulationSavePath);
			rDTO.setRegulationFileOrgName(regulationFileOrgName);
			rDTO.setRegulationFileName(regulationFileName);
		}
		
		//�긽議곌��젴踰뺢퇋 �벑濡�
		int result = regulationService.insertRegulation(rDTO);
		
		if(result != 0) {
			model.addAttribute("msg", "�긽議곌��젴踰뺢퇋 �벑濡앹뿉 �꽦怨듯븯���뒿�땲�떎.");
		}else {
			model.addAttribute("msg", "�긽議곌��젴踰뺢퇋 �벑濡앹뿉 �떎�뙣�븯���뒿�땲�떎.");
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
	 * �긽議곌��젴踰뺢퇋 �긽�꽭蹂닿린 硫붿냼�뱶
	 */
	@RequestMapping(value="Lmin/regulation/regulationDetail", method=RequestMethod.GET)
	public String regulationDetail(HttpServletRequest req, HttpServletResponse resp, Model model, HttpSession sessino) throws Exception{
		log.info(this.getClass() + ".regulationDetail start!!!");
		
		//�긽議곌��젴踰뺢퇋 踰덊샇
		String regulationNo = CmmUtil.nvl(req.getParameter("regulationNo"));
		log.info(" regulationNo : " + regulationNo);
		
		//�긽議곌��젴踰뺢퇋 遺덈윭�삤湲�
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
	 * �긽議곌��젴踰뺢퇋 �궘�젣 硫붿냼�뱶
	 */
	@RequestMapping(value="Lmin/regulation/regulationDelete", method=RequestMethod.GET)
	public String regulationDeleteProc(HttpServletRequest req, HttpServletResponse resp, Model model, HttpSession session) throws Exception{
		log.info(this.getClass() + ".regulationDelete start!!!");
		
		//�긽議곌��젴踰뺢퇋 踰덊샇
		String regulationNo = CmmUtil.nvl(req.getParameter("regulationNo"));
		log.info(" regulationNo : " + regulationNo);
		
		//�긽議곌��젴踰뺢퇋瑜� �궘�젣�븯�뒗�뜲
		RegulationDTO rDTO = regulationService.deleteRegulation(regulationNo);
		
		//rDTO媛� null�씠 �븘�땲�씪硫� �긽議곌��젴踰뺢퇋 �궘�젣 �꽦怨�
		if(rDTO != null) {
			//湲곗〈�쓽 �긽議곌��젴踰뺢퇋 �씠誘몄� �궘�젣
			FileUtil.deleteFile(CmmUtil.nvl(rDTO.getRegulationFilePath()), CmmUtil.nvl(rDTO.getRegulationFileName()));
			model.addAttribute("msg", "�긽議곌��젴踰뺢퇋 �궘�젣�뿉 �꽦怨듯뻽�뒿�땲�떎.");
		}else {
			model.addAttribute("msg", "�긽議곌��젴踰뺢퇋 �궘�젣�뿉 �떎�뙣 �뻽�뒿�땲�떎.");
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
	 * �긽議곌��젴踰뺢퇋 �닔�젙�솕硫댁쑝濡� �씠�룞
	 */
	@RequestMapping(value="Lmin/regulation/regulationUpdateView", method=RequestMethod.GET)
	public String regulationUpdateView(HttpServletRequest req, HttpServletResponse resp, Model model, HttpSession session) throws Exception{
		log.info(this.getClass() + ".regulationUpdateView start!!!");
		
		//�긽議곌��젴踰뺢퇋 踰덊샇
		String regulationNo = CmmUtil.nvl(req.getParameter("regulationNo"));
		log.info(" regulationNo : " + regulationNo);
		
		//�긽議곌��젴踰뺢퇋 遺덈윭�삤湲�
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
	 * �긽議곌��젴踰뺢퇋 �닔�젙 �솕硫댁뿉�꽌 �씠誘몄� �궘�젣踰꾪듉 �겢由��떆 留ㅽ븨�맂 硫붿냼�뱶
	 */
	@RequestMapping(value="Lmin/regulation/regulationDeleteImg", method=RequestMethod.POST)
	public void regulationDeleteImg(HttpServletRequest req, HttpServletResponse resp, Model model, HttpSession session) throws Exception{
		log.info(this.getClass() + ".regulationDeleteImg start!!!");
		
		//�긽議곌��젴踰뺢퇋踰덊샇
		String regulationNo = CmmUtil.nvl(req.getParameter("regulationNo"));
		log.info(" regulationNo : " + regulationNo);
		//�긽議곌��젴踰뺢퇋 �씠誘몄� �뙆�씪�쓽 踰덊샇
		String regulationFileNo = CmmUtil.nvl(req.getParameter("regulationFileNo"));
		log.info(" regulationFileNo : " + regulationFileNo);
		//�닔�젙�옄 �쉶�썝踰덊샇
		String chgMemberNo = (String)session.getAttribute("ss_member_no");
		log.info(" memberNo : " + chgMemberNo);
		
		//service�뿉 �뿬�윭媛쒖쓽 �뙆�씪誘명꽣瑜� �꽆湲곌린�쐞�빐 map �깮�꽦
		Map<String, String> map = new HashMap<>();
		map.put("regulationNo", regulationNo);
		map.put("regulationFileNo", regulationFileNo);
		map.put("chgMemberNo", chgMemberNo);
		
		//�씠誘몄� �궘�젣
		int result = regulationService.updateRegulationImgNull(map);
		
		//�궘�젣 �꽦怨듭떆 �닽�옄 諛섑솚
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
	 * �긽議곌��젴踰뺢퇋�뿉�꽌 �씠誘몄� �닔�젙踰꾪듉�겢由��떆 硫붿냼�뱶
	 */
	@RequestMapping(value="Lmin/regulation/regulationImgChangeView")
	public String regulationImgChangeView(HttpServletRequest req, HttpServletResponse resp, Model model, HttpSession session) throws Exception{
		log.info(this.getClass() + ".regulationImgChangeView start!!");
		
		//�긽議곌��젴踰뺢퇋 踰덊샇
		String regulationNo = CmmUtil.nvl(req.getParameter("regulationNo"));
		log.info(" regulationNo : " + regulationNo);
		
		//�긽議곌��젴踰뺢퇋 遺덈윭�샂
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
	 * �긽議곌��젴踰뺢퇋 �씠誘몄� �닔�젙�떆 硫붿냼�뱶
	 */
	@RequestMapping(value="Lmin/regulation/regulationImgChange")
	public void regulationImgChange(MultipartHttpServletRequest mulReq, HttpServletRequest req, HttpServletResponse resp, Model model, HttpSession session) throws Exception{
		log.info(this.getClass() + ".regulationChangeImg start!!!");
		
		//�긽議곌��젴踰뺢퇋踰덊샇
		String regulationNo = CmmUtil.nvl(req.getParameter("regulationNo"));
		log.info(" regulationNo : " + regulationNo);
		//�닔�젙�븯湲� �쟾�쓽 �뙆�씪 踰덊샇
		String preFileNo = CmmUtil.nvl(req.getParameter("preFileNo"));
		log.info(" preFileNo : " + preFileNo);
		//�닔�젙�븯湲� �쟾�쓽 �뙆�씪 �씠由�
		String preFileName = CmmUtil.nvl(req.getParameter("preFileName"));;
		log.info(" preFileName : " + preFileName);
		//�닔�젙�븯湲� �쟾�쓽 �뙆�씪 寃쎈줈
		String preFilePath = CmmUtil.nvl(req.getParameter("preFilePath"));
		log.info(" proFilePath : " + preFilePath);
		//�닔�젙�옄 �쉶�썝踰덊샇
		String chgMemberNo = (String)session.getAttribute("ss_member_no");
		log.info(" memberNo : " + chgMemberNo);
		
		//�뙆�씪媛앹껜瑜� 媛��졇�샂
		MultipartFile file = mulReq.getFile("regulationFile");
		//�깉濡쒖��쓣 �뙆�씪 �씠由� 蹂��닔�꽑�뼵
		String reFileName = "";
		//�닔�젙�뙆�씪�쓽 �썝蹂몄씠由�
		String regulationFileOrgName = CmmUtil.nvl(file.getOriginalFilename());
		log.info(" regulationFileOrgName : " + regulationFileOrgName);
		//�닔�젙�븳 �뙆�씪�쓣 ���옣�썑 蹂�寃쎈맂 �뙆�씪 �씠由�
		reFileName = FileUtil.fileSave(file, regulationSavePath);
		
		//DTO�꽭�똿
		RegulationDTO rDTO = new RegulationDTO();
		rDTO.setRegulationNo(regulationNo);
		rDTO.setRegulationFileOrgName(regulationFileOrgName);
		rDTO.setRegulationFilePath(regulationSavePath);
		rDTO.setRegulationFileName(reFileName);
		rDTO.setChgMemberNo(chgMemberNo);
		
		//service�뿉 �뿬�윭媛쒖쓽 �뙆�씪誘명꽣瑜� �꽆湲곌린 �쐞�븳 map
		Map<String, Object> map = new HashMap<>();
		//�닔�젙�맂 �긽議곌��젴踰뺢퇋 �씠誘몄��쓽 DTO
		map.put("rDTO", rDTO);
		//�궘�젣�븷 �뙆�씪�쓽 踰덊샇
		map.put("deleteFileNo", preFileNo);
		
		//�긽議곌��젴踰뺢퇋 �씠誘몄� �닔�젙
		int result = regulationService.updateRegulationImg(map);
		
		if(result != 0) {
			//�뙆�씪 �궘�젣
			FileUtil.deleteFile(preFilePath, preFileName);
			//�닔�젙 �꽦怨듭떆 �닔�젙�맂 �뙆�씪�쓽 �씠由꾩쓣 ajax濡� �쟾�넚
			resp.getWriter().println(reFileName);
		}else {
			//�닔�젙�떎�뙣�떆 0�쟾�넚
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
	 * �긽議곌��젴踰뺢퇋 �닔�젙�솕硫댁뿉�꽌 理쒖쥌 �닔�젙�떆 硫붿냼�뱶
	 */
	@RequestMapping(value="Lmin/regulation/regulationUpdateProc", method=RequestMethod.POST)
	public String regulationUpdateProcWithoutImg(MultipartHttpServletRequest mulReq, HttpServletRequest req, HttpServletResponse resp, Model model, HttpSession session) throws Exception{
		log.info(this.getClass() + ".regulationUpdateProcWithoutImg start!!"); 
		
		//�긽議곌��젴踰뺢퇋 踰덊샇
		String regulationNo = CmmUtil.nvl(req.getParameter("regulationNo"));
		log.info(" regulationNo : " + regulationNo);
		//�긽議곌��젴踰뺢퇋 �젣紐�
		String regulationTitle = CmmUtil.nvl(req.getParameter("regulationTitle"));
		log.info(" regulationTitle : " + regulationTitle);
		//�궡�슜
		String regulationContents = CmmUtil.nvl(req.getParameter("regulationContents"));
		log.info(" regulationContents : " + regulationContents);
		//�닔�젙�옄 �쉶�썝踰덊샇
		String chgMemberNo = (String)session.getAttribute("ss_member_no");
		log.info(" memberNo : " + chgMemberNo);
		
		//�닔�젙�븷 DTO�꽭�똿
		RegulationDTO rDTO = new RegulationDTO();
		rDTO.setRegulationTitle(regulationTitle);
		rDTO.setRegulationContents(regulationContents);
		rDTO.setChgMemberNo(chgMemberNo);
		rDTO.setRegulationNo(regulationNo);
		
		//�뿬湲곕뒗 �긽議곌��젴踰뺢퇋 �씠誘몄�瑜� �닔�젙�씠 �븘�땶 �깉濡� �벑濡앹떆 �뙆�씪�쓣 媛��졇�삤怨�
		MultipartFile file = mulReq.getFile("regulationFile");
		//파일의 원본 이름 변수 선언
		String regulationFileOrgName = "";
		if(file != null){
			regulationFileOrgName = CmmUtil.nvl(file.getOriginalFilename());
		}
		
		if(!"".equals(regulationFileOrgName)) {
			//�뙆�씪�쓣 ���옣
			String regulationReFileName = FileUtil.fileSave(file, regulationSavePath);
			//�뙆�씪 �젙蹂� �꽭�똿
			rDTO.setRegulationFileName(regulationReFileName);
			rDTO.setRegulationFileOrgName(regulationFileOrgName);
			rDTO.setRegulationFilePath(regulationSavePath);
		}
		
		//�긽議곌��젴踰뺢퇋 update
		int result = regulationService.updateRegulation(rDTO);
		if(result != 0) {
			model.addAttribute("msg", "�긽議곌��젴踰뺢퇋 �닔�젙�뿉 �꽦怨듯뻽�뒿�땲�떎.");
		}else {
			model.addAttribute("msg", "�긽議곌��젴踰뺢퇋 �닔�젙�뿉 �떎�뙣�뻽�뒿�땲�떎.");
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
