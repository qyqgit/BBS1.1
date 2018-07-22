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
    private String[] strs = {"testWord","<",">","&","\"","\n"," "};
    public DWHttpServletRequest(HttpServletRequest request){
        super(request);
    }
 
    public String getParameter(String name) {
        String value = super.getParameter(name);
        if(value==null || "password".equalsIgnoreCase(name) || "oldPassword".equalsIgnoreCase(name))
            return value;
         
        for(String s:strs){
        	switch (s) {
        	case "\n":
        		value = value.replace(s, "<br>");
        		break;
        	case " ":
        		value = value.replace(s, "&nbsp");
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
            	value = value.replace(s, "£¢");
                break;
            default:
            	value = value.replace(s, "**");
            }
        }
        return value;
    }

}
