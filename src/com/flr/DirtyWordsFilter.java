package com.flr;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet Filter implementation class DirtyWordsFilter
 */
@WebFilter("/DirtyWordsFilter")
public class DirtyWordsFilter implements Filter {
	public void init(FilterConfig filterConfig) throws ServletException {
    }
 
    public void doFilter(ServletRequest req, ServletResponse resp,
            FilterChain chain) throws IOException, ServletException {
         
        HttpServletRequest request;
        HttpServletResponse response;
        try{
            request = (HttpServletRequest)req;
            response = (HttpServletResponse)resp;
        }catch(Exception e){
            throw new RuntimeException("non-http request or response");
        }
        DWHttpServletRequest dwrequest = new DWHttpServletRequest(request);
        chain.doFilter(dwrequest, response);
 
    }
 
    public void destroy() {
    }
 
}
class DWHttpServletRequest extends HttpServletRequestWrapper{
    private String[] strs = {"testWord","<",">","&","\"","\n"," ","£¼div£¾","£¼/div£¾","£¼p£¾","£¼/p£¾","£¼br£¾","£¼b£¾","£¼/b£¾","£¼i£¾","£¼/i£¾","£¼u£¾","£¼/u£¾","£¼sub£¾","£¼/sub£¾","£¼sup£¾","£¼/sup£¾","£¼strike£¾","£¼/strike£¾","£¼audio","£¼/audio","£¼video","£¼/video","£¼a","£¼/a","£¼img","£¾","£¦"};
    public DWHttpServletRequest(HttpServletRequest request){
        super(request);
    }
 
    public String getParameter(String name) {
        String value = super.getParameter(name);
        if(value==null || "password".equalsIgnoreCase(name) || "oldPassword".equalsIgnoreCase(name))
            return value;
         
        for(String s:strs){
        	switch (s) {
        	case "£¦":
        		value = value.replace(s, "&");
        		break;
        	case "£¾":
        		value = value.replace(s, ">");
        		break;
        	case "£¼img":
        		value = value.replace(s, "<img");
        		break;
        	case "£¼a":
        		value = value.replace(s, "<a");
        		break;
        	case "£¼/a":
        		value = value.replace(s, "</a");
        		break;
        	case "£¼video":
        		value = value.replace(s, "<video");
        		break;
        	case "£¼/video":
        		value = value.replace(s, "</video");
        		break;
        	case "£¼audio":
        		value = value.replace(s, "<audio");
        		break;
        	case "£¼/audio":
        		value = value.replace(s, "</audio");
        		break;
        	case "£¼strike£¾":
        		value = value.replace(s, "");
        		break;
        	case "£¼/strike£¾":
        		value = value.replace(s, "");
        		break;
        	case "£¼sup£¾":
        		value = value.replace(s, "");
        		break;
        	case "£¼/sup£¾":
        		value = value.replace(s, "");
        		break;
        	case "£¼sub£¾":
        		value = value.replace(s, "");
        		break;
        	case "£¼/sub£¾":
        		value = value.replace(s, "");
        		break;
        	case "£¼u£¾":
        		value = value.replace(s, "");
        		break;
        	case "£¼/u£¾":
        		value = value.replace(s, "");
        		break;
        	case "£¼i£¾":
        		value = value.replace(s, "");
        		break;
        	case "£¼/i£¾":
        		value = value.replace(s, "");
        		break;
        	case "£¼b£¾":
        		value = value.replace(s, "");
        		break;
        	case "£¼/b£¾":
        		value = value.replace(s, "");
        		break;
        	case "£¼br£¾":
        		value = value.replace(s, "<br>");
        		break;
        	case "£¼p£¾":
        		value = value.replace(s, "");
        		break;
        	case "£¼/p£¾":
        		value = value.replace(s, "<br>");
        		break;
        	case "£¼div£¾":
        		value = value.replace(s, "");
        		break;
        	case "£¼/div£¾":
        		value = value.replace(s, "<br>");
        		break;
        	case "\n":
        		value = value.replace(s, "<br>");
        		break;
        	case " ":
        		value = value.replace(s, " ");
        		break;
            case "<":
            	value = value.replace(s, "£¼");
                break;
            case ">":
            	value = value.replace(s, "£¾");
                break;
            case "&":
            	value = value.replace(s, "£¦");
                break;
            case "\"":
            	value = value.replace(s, "\"");
                break;
            default:
            	value = value.replace(s, "**");
            }
        }
        return value;
    }

}
