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

import com.obj.GetMd5;

/**
 * Servlet Filter implementation class DirtyWordsFilter
 */
@WebFilter("/DirtyWordsFilter")
public class EncryptPassword implements Filter {
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
        HttpServletRequestEncryptPassword dwrequest = new HttpServletRequestEncryptPassword(request);
        chain.doFilter(dwrequest, response);
 
    }
 
    public void destroy() {
    }
 
}
class HttpServletRequestEncryptPassword extends HttpServletRequestWrapper{
    public HttpServletRequestEncryptPassword(HttpServletRequest request){
        super(request);
    }
 
    public String getParameter(String name) {
        String value = super.getParameter(name);
        if(value==null)
            return value;
        if("password".equalsIgnoreCase(name) || "oldPassword".equalsIgnoreCase(name) || "addPassword".equalsIgnoreCase(name)) {
        	value = GetMd5.getMD5(value);
        }
        return value;
    }

}
