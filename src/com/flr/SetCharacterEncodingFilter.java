package com.flr;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

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
 * Servlet Filter implementation class SetCharacterEncodingFilter
 */
@WebFilter("/SetCharacterEncodingFilter")
public class SetCharacterEncodingFilter implements Filter {

	private FilterConfig filterConfig;
    public void init(FilterConfig filterConfig) throws ServletException {
        this.filterConfig = filterConfig;
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
         
        String encoding = filterConfig.getInitParameter("encoding");//用户可能忘记了配置该参数
        if(encoding==null){
            encoding = "UTF-8";//默认编码
        }
         
        request.setCharacterEncoding(encoding);//只能解决POST请求参数的中文问题
        response.setCharacterEncoding(encoding);//输出流编码
        response.setContentType("text/html;charset="+encoding);//输出流编码，通知了客户端应该使用的编码
         
        EncodingHttpServletRequest erequest = new EncodingHttpServletRequest(request);
         
        chain.doFilter(erequest, response);
    }
 
    public void destroy() {
 
    }
 
}
class EncodingHttpServletRequest extends HttpServletRequestWrapper{
    public EncodingHttpServletRequest(HttpServletRequest request){
        super(request);
    }
 
    public String getParameter(String name) {
        String value = super.getParameter(name);
        if(value==null)
            return value;
        //只管get方式
        if("get".equalsIgnoreCase(super.getMethod())){
            try {
                value = new String(value.getBytes("ISO-8859-1"),super.getCharacterEncoding());
            } catch (UnsupportedEncodingException e) {
                e.printStackTrace();
            }
        }
        return value;
    }

}
