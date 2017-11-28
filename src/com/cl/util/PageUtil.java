package com.cl.util;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

public class PageUtil {
	public static HashMap<String, Object> paging(HttpServletRequest req, int splitPage){
		int page;
		String nowPage = CmmUtil.nvl(req.getParameter("page"));
		// 현재 페이지 값
		String selBox = CmmUtil.nvl(req.getParameter("searchBox"));
		// 검색할 항목 값
		String search = CmmUtil.nvl(req.getParameter("search"));
		// 검색할 값
		
		if(!nowPage.equals("")){
			page = (Integer.parseInt(nowPage)-1) * splitPage;
			// 스플릿페이지로 페이지를 나누어서 (page=limit) 부터 출력할 것인지 판단 함 
		}else{
			nowPage = "1";
			// 첫 페이지로 초기화
			page = 0;
			// limit 값 0으로 초기화
		}
		
		HashMap<String, Object> hMap = new HashMap<>();
		
		hMap.put("page", page);
		hMap.put("nowPage", nowPage);
		hMap.put("splitPage", splitPage);
		
		if(!search.equals("")){
			// 검색 값이 있을때 해쉬맵에 값을 넣어 줌
			// 검색 값이 없으면 동적 SQL에 의해 WHERE 조건이 사라 짐
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
		// 서비스에서 추가해 놓은 총 게시글 갯수를 받아 옴
		String result = "";
		
		if(pageList!=0){
			// 게시글이 있을 때
			splitPage = (int) hMap.get("splitPage");
			nowPage = Integer.parseInt((String) hMap.get("nowPage"));
			pageList = (pageList / splitPage) + 1;
			// 최종 페이지 수를 계산 함
			pageBtn = 1;
			// 첫 페이지 값
			pageBtnLast = pageBtn+4;
			// 화면에 보이는 버튼의 갯수
			
			if((nowPage/(pageBtnSplit+1))<1){
				pageBtn = 1;
				// 버튼은 1부터 시작
				if(pageList<pageBtnSplit){
					pageBtnLast = pageList;
					// 버튼은 총 페이지 수 만큼 생성
				}
			}else{
				pageBtn = ((nowPage/(pageBtnSplit+1))*5)+1;
				pageBtnLast = pageBtn + 4;
				if(pageList<pageBtnLast){
					pageBtnLast = pageList;
				}
			}
		}
		
		if(nowPage!=1){
			result += "<a href='javascript:goPage(1,"+pageList+")' class='btnFirst'><span>처음</span></a>";
			result += "<a href='javascript:goPage("+(nowPage-1)+","+pageList+")' class='btnPrev'><span>이전</span></a>";
		}
		for(int i=pageBtn;i<=pageBtnLast;i++){
			if(i == nowPage){
				result += "<strong>"+i+"</strong>";
			}else{
				result += "<a href='javascript:goPage("+i+","+pageList+")'>"+i+"</a>";
			}
		}
		if(nowPage!=pageList){
			result += "<a href='javascript:goPage("+(nowPage+1)+","+pageList+")' class='btnNext'><span>다음</span></a>";
			result += "<a href='javascript:goPage("+pageList+","+pageList+")' class='btnLast'><span>마지막</span></a>";
		}
		
		return result;
	}
	
	
}
