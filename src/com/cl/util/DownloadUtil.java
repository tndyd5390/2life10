package com.cl.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.util.FileCopyUtils;
import org.springframework.web.servlet.view.AbstractView;

public class DownloadUtil extends AbstractView{
	public void Download(){
		setContentType("application/download; utf-8");
	}
	 @Override
	    protected void renderMergedOutputModel(Map<String, Object> model,
	            HttpServletRequest request, HttpServletResponse response) throws Exception {
	        File file = (File)model.get("downloadFile");
	        String fileName = CmmUtil.nvl((String)model.get("fileOrgName"));
	        response.setContentType(getContentType());
	        response.setContentLength((int)file.length());
	        String userAgent = request.getHeader("User-Agent");
	        boolean ie = userAgent.indexOf("MSIE") > -1;
	        String browser = getBrowser(request);
	        String encodedFileName = null; 
	        if (browser.equals("MSIE")) {
	        	encodedFileName = URLEncoder.encode(fileName, "UTF-8").replaceAll("\\+", "%20"); 
	        } else if (browser.equals("Firefox")) {
	        	encodedFileName = "\"" + new String(fileName.getBytes("UTF-8"), "8859_1") + "\""; 
	        } else if (browser.equals("Opera")) {
	        	encodedFileName = "\"" + new String(fileName.getBytes("UTF-8"), "8859_1") + "\""; 
	        } else if (browser.equals("Chrome")) { 
	        	StringBuffer sb = new StringBuffer(); 
	        	for (int i = 0; i < fileName.length(); i++) { 
	        		char c = fileName.charAt(i); 
	        		if (c > '~') { 
	        			sb.append(URLEncoder.encode("" + c, "UTF-8")); 
	        		} else { 
	        			sb.append(c); 
	        			} 
	        		} encodedFileName = sb.toString(); 
	        } else if(browser.equals("Trident")){
	        	encodedFileName = URLEncoder.encode(fileName, "UTF-8").replaceAll("\\+", "%20");
	        }else if(browser.equals("iPhone")){
	        	encodedFileName = "\"" + new String(fileName.getBytes("UTF-8"), "8859_1") + "\"";
	        }else if(browser.equals("Safari")){
	        	encodedFileName = "\"" + new String(fileName.getBytes("UTF-8"), "8859_1") + "\"";
	        }else { 
	        	throw new RuntimeException("Not supported browser"); 
	        }
	        
	        response.setHeader("Content-Type","application/pdf");
	        response.setHeader("Content-Disposition", "attachment; fileName=\"" + encodedFileName + "\";");
	        response.setHeader("Content-Transfer-Encoding", "binary");
	        OutputStream out = response.getOutputStream();
	        FileInputStream fis = null;
	         
	        try {
	            fis = new FileInputStream(file);
	            FileCopyUtils.copy(fis, out);
	        } catch(Exception e){
	            e.printStackTrace();
	        }finally{
	            if(fis != null){
	                try{
	                    fis.close();
	                }catch(Exception e){}
	            }
	        }// try end;
	        out.flush();
	    }// render() end;
	 
	private String getBrowser(HttpServletRequest request) { 
		String header = request.getHeader("User-Agent");
		System.out.println("header : " + header);
		String returnString = "";
		if (header.indexOf("MSIE") > -1) { 
			returnString ="MSIE"; 
		} else if (header.indexOf("Chrome") > -1) { 
			returnString ="Chrome";
		} else if (header.indexOf("Opera") > -1) { 
			returnString ="Opera"; 
		} else if (header.indexOf("Trident") > -1) {   // IE11 ¹®ÀÚ¿­ ±úÁü ¹æÁö
            returnString ="Trident";
		}else if(header.indexOf("Safari") > -1){
			returnString ="Safari";
		}else if(header.indexOf("iPhone") > -1){
			returnString ="iPhone";
		}else{
			returnString ="FireFox";
		}
		return returnString;
	}

	}