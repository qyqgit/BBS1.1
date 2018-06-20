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
         
        String encoding = filterConfig.getInitParameter("encoding");//�û��������������øò���
        if(encoding==null){
            encoding = "UTF-8";//Ĭ�ϱ���
        }
         
        request.setCharacterEncoding(encoding);//ֻ�ܽ��POST�����������������
        response.setCharacterEncoding(encoding);//���������
        response.setContentType("text/html;charset="+encoding);//��������룬֪ͨ�˿ͻ���Ӧ��ʹ�õı���
         
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
        //ֻ��get��ʽ
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
