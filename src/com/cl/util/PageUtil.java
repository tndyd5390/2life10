package com.cl.util;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

public class PageUtil {
	// SQL문의 LIMIT , OFFSET을 구해주는 메소드
	public static HashMap<String, Object> paging(HttpServletRequest req, int splitPage){
		int page;
		String nowPage = CmmUtil.nvl(req.getParameter("page"));
		// 현재 페이지를 받음
		String selBox = CmmUtil.nvl(req.getParameter("searchBox"));
		// 검색조건 받음
		String search = CmmUtil.nvl(req.getParameter("search"));
		// 검색어 받음
		
		if(!nowPage.equals("")){
			page = (Integer.parseInt(nowPage)-1) * splitPage;
			// 페이지 갯수를 구함
		}else{
			nowPage = "1";
			// 첫 페이지로 초기화
			page = 0;
			// limit 를 0으로 초기화
		}
		
		HashMap<String, Object> hMap = new HashMap<>();
		
		hMap.put("page", page);
		hMap.put("nowPage", nowPage);
		hMap.put("splitPage", splitPage);
		
		if(!search.equals("")){
			// 검색어가 있을 때
			hMap.put("searchBox", selBox);
			hMap.put("search", search);
		}
		
		return hMap;
	}
	
	public static HashMap<String, Object> pagingForMember(HttpServletRequest req, int splitPage) throws Exception{
		int page;
		String nowPage = CmmUtil.nvl(req.getParameter("page"));
		// 현재 페이지를 받음
		String selBox = CmmUtil.nvl(req.getParameter("searchBox"));
		// 검색조건 받음
		String search = CmmUtil.nvl(req.getParameter("search"));
		// 검색어 받음
		
		System.out.println("search : " + search);
		System.out.println("selBox : " + selBox);
		if(!search.equals("") && selBox.equals("00")){
			search = AES256Util.strEncode(search);
			System.out.println("encode : " + search);
		}
		
		if(!nowPage.equals("")){
			page = (Integer.parseInt(nowPage)-1) * splitPage;
			// 페이지 갯수를 구함
		}else{
			nowPage = "1";
			// 첫 페이지로 초기화
			page = 0;
			// limit 를 0으로 초기화
		}
		
		HashMap<String, Object> hMap = new HashMap<>();
		
		hMap.put("page", page);
		hMap.put("nowPage", nowPage);
		hMap.put("splitPage", splitPage);
		
		if(!search.equals("")){
			// 검색어가 있을 때
			hMap.put("searchBox", selBox);
			hMap.put("search", search);
		}
		
		return hMap;
	}
	
	// JSP 하단의 페이징을 처리하는 메소드
	public static String frontPaging(HashMap<String, Object> hMap, int pageBtnSplit){
		int splitPage=0;
		int nowPage=0;
		int pageBtn=0;
		int pageBtnLast=0;
		int pageList = (int) hMap.get("pageList");
		// 필요한 변수를 선언하고, 해쉬맵에 담겨있는 pageList를 받음
		String result = "";
		// JSP에 뿌려줄 문자열 선언
		if(pageList!=0){
			splitPage = (int) hMap.get("splitPage");
			nowPage = Integer.parseInt((String) hMap.get("nowPage"));
			
			if(pageList!=splitPage){
				if((pageList%splitPage) == 0){
					// 페이지리스트가 자를페이지 수로 나누어 떨어질 때 마지막페이지 추가하지 않음
					pageList = (pageList / splitPage);
				}else{
					// 나누어 떨어지지 않으면, 마지막페이지를 추가하여 남은 항목을 마지막 페이지에 뿌려줌
					pageList = (pageList / splitPage)+1;
				}
			}else{
				pageList = (pageList / splitPage);
			}
			pageBtn = 1;
			// 첫 페이징 버튼을 1로 선언
			pageBtnLast = pageBtn+4;
			// 첫 버튼에 4을 더한 값을 마지막 버튼으로 선언
			
			if((nowPage/(pageBtnSplit+1))<1){
				// 자를 버튼의 수보다 페이지 수가 작을 때
				pageBtn = 1;
				// 첫 페이지이기 때문에 첫 버튼은 1로 초기화
				if(pageList<pageBtnSplit){
					pageBtnLast = pageList;
					// 마지막 페이지는 최종 페이지 갯수로 초기화
				}
			}else{
				// 자를 버튼의 수보다 페이지 수가 많을 때 ex) 5개의 버튼으로 나눌때, 6페이지 이상
				if((nowPage/pageBtnSplit)==0){
					// 현재페이지가 자를 버튼의 수보다 작을 때 ex) 5개의 버튼으로 나눌때, 현재페이지 1~4
					pageBtn = ((nowPage/(pageBtnSplit+1))*5)+1;
				}else if((nowPage%pageBtnSplit)==0){
					// 현재페이지를 자를 버튼의 수로 나눈 나머지가 0일때 ex) 5개의 버튼으로 나눌때, 현재페이지 5의 배수
					pageBtn = ((nowPage/pageBtnSplit)*5)-4;
				}else{
					pageBtn = ((nowPage/pageBtnSplit)*5)+1;
				}
				pageBtnLast = pageBtn + 4;
				// 마지막 버튼은 항상 생성할 첫 버튼의 4를 더한 값으로 초기화
				if(pageList<=pageBtnLast){
					pageBtnLast = pageList;
				}
			}
		}
		
		if(nowPage!=1){
			// 현재페이지가 첫페이지가 아니면 처음페이지, 이전페이지를 생성
			result += "<a href='javascript:goPage(1,"+pageList+")' class='btnFirst'><span>처음페이지</span></a>";
			result += "<a href='javascript:goPage("+(nowPage-1)+","+pageList+")' class='btnPrev'><span>이전페이지</span></a>";
		}
		for(int i=pageBtn;i<=pageBtnLast;i++){
			// 위에서 연산한 첫 버튼에서 마지막 버튼까지 버튼을 생성 함
			if(i == nowPage){
				// 현재페이지 일시 strong으로 버튼 색을 바꿔 줌
				result += "<strong>"+i+"</strong>";
			}else{
				result += "<a href='javascript:goPage("+i+","+pageList+")'>"+i+"</a>";
			}
		}
		if(nowPage!=pageList){
			// 현재페이지가 마지막페이지 아니면 처음페이지, 이전페이지를 생성
			result += "<a href='javascript:goPage("+(nowPage+1)+","+pageList+")' class='btnNext'><span>다음페이지</span></a>";
			result += "<a href='javascript:goPage("+pageList+","+pageList+")' class='btnLast'><span>마지막페이지</span></a>";
		}
		return result;
	}
}
