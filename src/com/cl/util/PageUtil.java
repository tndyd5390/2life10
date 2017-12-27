package com.cl.util;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

public class PageUtil {
	public static HashMap<String, Object> paging(HttpServletRequest req, int splitPage){
		int page;
		String nowPage = CmmUtil.nvl(req.getParameter("page"));
		// 占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙 占쏙옙
		String selBox = CmmUtil.nvl(req.getParameter("searchBox"));
		// 占싯삼옙占쏙옙 占쌓몌옙 占쏙옙
		String search = CmmUtil.nvl(req.getParameter("search"));
		// 占싯삼옙占쏙옙 占쏙옙
		
		if(!nowPage.equals("")){
			page = (Integer.parseInt(nowPage)-1) * splitPage;
			// 占쏙옙占시몌옙占쏙옙占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙占쏘서 (page=limit) 占쏙옙占쏙옙 占쏙옙占쏙옙占� 占쏙옙占쏙옙占쏙옙 占실댐옙 占쏙옙 
		}else{
			nowPage = "1";
			// 첫 占쏙옙占쏙옙占쏙옙占쏙옙 占십깍옙화
			page = 0;
			// limit 占쏙옙 0占쏙옙占쏙옙 占십깍옙화
		}
		
		HashMap<String, Object> hMap = new HashMap<>();
		
		hMap.put("page", page);
		hMap.put("nowPage", nowPage);
		hMap.put("splitPage", splitPage);
		
		if(!search.equals("")){
			// 占싯삼옙 占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙 占쌔쏙옙占십울옙 占쏙옙占쏙옙 占쌍억옙 占쏙옙
			// 占싯삼옙 占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙 SQL占쏙옙 占쏙옙占쏙옙 WHERE 占쏙옙占쏙옙占쏙옙 占쏙옙占� 占쏙옙
			hMap.put("searchBox", selBox);
			hMap.put("search", search);
		}
		
		return hMap;
	}
	
	public static String frontPaging(HashMap<String, Object> hMap, int pageBtnSplit){
		int splitPage=0;
		int nowPage=0;
		int pageBtn=0;
		int pageBtnLast=0;
		int pageList = (int) hMap.get("pageList");
		// 占쏙옙占쏟스울옙占쏙옙 占쌩곤옙占쏙옙 占쏙옙占쏙옙 占쏙옙 占쌉시깍옙 占쏙옙占쏙옙占쏙옙 占쌨억옙 占쏙옙
		String result = "";
		
		if(pageList!=0){
			// 占쌉시깍옙占쏙옙 占쏙옙占쏙옙 占쏙옙
			splitPage = (int) hMap.get("splitPage");
			nowPage = Integer.parseInt((String) hMap.get("nowPage"));
			
			if(pageList!=splitPage){
				pageList = (pageList / splitPage) + 1;
			}else{
				pageList = (pageList / splitPage);
			}
			pageBtn = 1;
			// 첫 占쏙옙占쏙옙占쏙옙 占쏙옙
			pageBtnLast = pageBtn+4;
			// 화占썽에 占쏙옙占싱댐옙 占쏙옙튼占쏙옙 占쏙옙占쏙옙
			
			if((nowPage/(pageBtnSplit+1))<1){
				pageBtn = 1;
				// 占쏙옙튼占쏙옙 1占쏙옙占쏙옙 占쏙옙占쏙옙
				if(pageList<pageBtnSplit){
					pageBtnLast = pageList;
					// 占쏙옙튼占쏙옙 占쏙옙 占쏙옙占쏙옙占쏙옙 占쏙옙 占쏙옙큼 占쏙옙占쏙옙
				}
			}else{
				pageBtn = ((nowPage/(pageBtnSplit+1))*5)+1;
				pageBtnLast = pageBtn + 4;
				if(pageList<=pageBtnLast){
					pageBtnLast = pageList;
				}
			}
		}
		
		if(nowPage!=1){
			result += "<a href='javascript:goPage(1,"+pageList+")' class='btnFirst'><span>처占쏙옙</span></a>";
			result += "<a href='javascript:goPage("+(nowPage-1)+","+pageList+")' class='btnPrev'><span>占쏙옙占쏙옙</span></a>";
		}
		for(int i=pageBtn;i<=pageBtnLast;i++){
			if(i == nowPage){
				result += "<strong>"+i+"</strong>";
			}else{
				result += "<a href='javascript:goPage("+i+","+pageList+")'>"+i+"</a>";
			}
		}
		if(nowPage!=pageList){
			result += "<a href='javascript:goPage("+(nowPage+1)+","+pageList+")' class='btnNext'><span>占쏙옙占쏙옙</span></a>";
			result += "<a href='javascript:goPage("+pageList+","+pageList+")' class='btnLast'><span>占쏙옙占쏙옙占쏙옙</span></a>";
		}
		return result;
	}
}
