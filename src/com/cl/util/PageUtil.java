package com.cl.util;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

public class PageUtil {
	public static HashMap<String, Object> paging(HttpServletRequest req, int splitPage){
		int page;
		String nowPage = CmmUtil.nvl(req.getParameter("page"));
		// ���� ������ ��
		String selBox = CmmUtil.nvl(req.getParameter("searchBox"));
		// �˻��� �׸� ��
		String search = CmmUtil.nvl(req.getParameter("search"));
		// �˻��� ��
		
		if(!nowPage.equals("")){
			page = (Integer.parseInt(nowPage)-1) * splitPage;
			// ���ø��������� �������� ����� (page=limit) ���� ����� ������ �Ǵ� �� 
		}else{
			nowPage = "1";
			// ù �������� �ʱ�ȭ
			page = 0;
			// limit �� 0���� �ʱ�ȭ
		}
		
		HashMap<String, Object> hMap = new HashMap<>();
		
		hMap.put("page", page);
		hMap.put("nowPage", nowPage);
		hMap.put("splitPage", splitPage);
		
		if(!search.equals("")){
			// �˻� ���� ������ �ؽ��ʿ� ���� �־� ��
			// �˻� ���� ������ ���� SQL�� ���� WHERE ������ ��� ��
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
		// ���񽺿��� �߰��� ���� �� �Խñ� ������ �޾� ��
		String result = "";
		
		if(pageList!=0){
			// �Խñ��� ���� ��
			splitPage = (int) hMap.get("splitPage");
			nowPage = Integer.parseInt((String) hMap.get("nowPage"));
			pageList = (pageList / splitPage) + 1;
			// ���� ������ ���� ��� ��
			pageBtn = 1;
			// ù ������ ��
			pageBtnLast = pageBtn+4;
			// ȭ�鿡 ���̴� ��ư�� ����
			
			if((nowPage/(pageBtnSplit+1))<1){
				pageBtn = 1;
				// ��ư�� 1���� ����
				if(pageList<pageBtnSplit){
					pageBtnLast = pageList;
					// ��ư�� �� ������ �� ��ŭ ����
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
			result += "<a href='javascript:goPage(1,"+pageList+")' class='btnFirst'><span>ó��</span></a>";
			result += "<a href='javascript:goPage("+(nowPage-1)+","+pageList+")' class='btnPrev'><span>����</span></a>";
		}
		for(int i=pageBtn;i<=pageBtnLast;i++){
			if(i == nowPage){
				result += "<strong>"+i+"</strong>";
			}else{
				result += "<a href='javascript:goPage("+i+","+pageList+")'>"+i+"</a>";
			}
		}
		if(nowPage!=pageList){
			result += "<a href='javascript:goPage("+(nowPage+1)+","+pageList+")' class='btnNext'><span>����</span></a>";
			result += "<a href='javascript:goPage("+pageList+","+pageList+")' class='btnLast'><span>������</span></a>";
		}
		return result;
	}
	
	
}
